import { default as parse } from "xml-parser";
import { default as fs } from "fs";

let xml = parse(fs.readFileSync("../kicad/sensor-node.xml", "utf8"));
let components = xml.root.children.filter((c) => c.name === "components");

if (components.length !== 1) {
  throw new Error("Error finding components");
}

let comps = components[0].children.reduce((l, c) => {
  let value = c.children.find(child => child.name === "value").content;
  let lib = c.children.find(child => child.name === "libsource").attributes.lib;
  let part = c.children.find(child => child.name === "libsource").attributes.part;
  let id = `${lib}_${part}`;

  if (part !== value) {
    id += `_${value}`;
  }

  if (l[id]) {
    l[id].count += 1;
  } else {
    l[id] = {
      value: value,
      lib: lib,
      part: part,
      id: id,
      count: 1,
      footprint: c.children.find(child => child.name === "footprint").content
    }
  }

  return l;
}, {});

let out = "# BOM\n\n";

out += "amount|description|manufacturer|price per unit / EUR\n";
out += "------|-----------|------------|--------------------\n";

Object.keys(comps).forEach(k => {
  let c = comps[k];

  out += `${c.count}`;

  try {
    let comp = JSON.parse(fs.readFileSync(`../components/${c.id}.json`, "utf8"));

    out += `|[${comp.description}](${comp.suppliers[0].supplierLink})|${comp.manufacturer}|${comp.suppliers[0].price.value}`;
  } catch (e) {
    out += `|${c.id}|n/a|n/a`;
  }

  out += "\n";
});

fs.writeFileSync("../bom.md", out);
