import { default as parse } from "xml-parser";
import { default as fs } from "fs";

function _getComponent(id) {
  return JSON.parse(fs.readFileSync(`../components/${id}.json`, "utf8"));
}

function getSupplier(id) {
  return JSON.parse(fs.readFileSync(`../suppliers/${id}.json`, "utf8"));
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

let total = {};

Object.keys(comps).forEach(k => {
  let c = comps[k];

  out += componentToLine(c);

  if (c.suppliers) {
    if (total[c.suppliers[0].supplierId]) {
      total[c.suppliers[0].supplierId] += c.suppliers[0].price.value * c.count;
    } else {
      total[c.suppliers[0].supplierId] = c.suppliers[0].price.value * c.count;
    }
  }
});

out += `|**total**||**${Math.round(Object.keys(total).reduce((t, k) => t + total[k], 0) * 100) / 100}**`;

let sensorCount = 3;

total = {};
out += `\n\n## Cost for ${sensorCount} sensors\n`;

Object.keys(comps).forEach(k => {
  let c = comps[k];
  let price = c.suppliers[0].price.value * Math.ceil((c.count * sensorCount) / c.suppliers[0].packageSize) * c.suppliers[0].packageSize;

  if (c.suppliers) {
    if (total[c.suppliers[0].supplierId]) {
      total[c.suppliers[0].supplierId] += price;
    } else {
      total[c.suppliers[0].supplierId] = price;
    }
  }
});

out += "supplier|price of goods|shipping|total\n";
out += "--------|--------------|--------|-----\n";

let sum = 0;

Object.keys(total).forEach(k => {
  let sup = getSupplier(k);
  let price = total[k];
  let idx = sup.shippingFee.valueFee.findIndex(f => f.value > price);
  let shipping = idx < 1 ? sup.shippingFee.valueFee[0].fee : sup.shippingFee.valueFee[idx - 1].fee;

  out += `${sup.name}|${price}|${shipping}|${price + shipping}\n`;
  sum += price + shipping;
});

out += `**total**|||${sum}\n`;

fs.writeFileSync("../bom.md", out);
