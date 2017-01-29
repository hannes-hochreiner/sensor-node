import { default as parse } from "xml-parser";
import { default as fs } from "fs";

function _getComponent(id) {
  return JSON.parse(fs.readFileSync(`../components/${id}.json`, "utf8"));
}

function getComponents(id) {
  let res = [];

  try {
    let comp = _getComponent(id);

    res.push(comp);

    if (comp.additionalComponents) {
      comp.additionalComponents.map(c => getComponents(c)).forEach(c => {
        c.forEach(ic => res.push(ic));
      });
    }
  } catch(e) {
    res.push({id: id});
  }

  return res;
}

function componentToLine(c) {
  let out = [];

  out.push(`${c.count}`);

  if (c.description) {
    if (c.suppliers[0].supplierLink) {
      out.push(`[${c.description}](${c.suppliers[0].supplierLink})`);
    } else {
      out.push(`${c.description}`);
    }
  } else {
    out.push(c.id);
  }

  if (c.manufacturer) {
    out.push(`${c.manufacturer}`);
  } else {
    out.push("");
  }

  if (c.suppliers) {
    out.push(`${c.suppliers[0].price.value}`);
  } else {
    out.push("");
  }

  return out.join("|") + "\n";
}

let xml = parse(fs.readFileSync("../kicad/sensor-node.xml", "utf8"));
let components = xml.root.children.filter((c) => c.name === "components");

if (components.length !== 1) {
  throw new Error("Error finding components");
}

let comps = components[0].children.map(c => {
  let value = c.children.find(child => child.name === "value").content;
  let lib = c.children.find(child => child.name === "libsource").attributes.lib;
  let part = c.children.find(child => child.name === "libsource").attributes.part;
  let id = `${lib}_${part}`;

  if (part !== value) {
    id += `_${value}`;
  }

  return getComponents(id);
}).reduce((l, c) => {
  return l.concat(c);
}, []).reduce((l, c) => {
  if (l[c.id]) {
    l[c.id].count += 1;
  } else {
    c.count = 1;
    l[c.id] = c;
  }

  return l;
}, {});

let out = "# BOM\n\n";

out += "amount|description|manufacturer|price per unit / EUR\n";
out += "------|-----------|------------|--------------------\n";

let total = 0;

Object.keys(comps).forEach(k => {
  let c = comps[k];

  out += componentToLine(c);

  if (c.suppliers) {
    total += c.suppliers[0].price.value * c.count;
  }
});

out += `|**total**||**${Math.round(total * 100) / 100}**`

fs.writeFileSync("../bom.md", out);
