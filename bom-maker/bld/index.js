"use strict";

var _xmlParser = require("xml-parser");

var _xmlParser2 = _interopRequireDefault(_xmlParser);

var _fs = require("fs");

var _fs2 = _interopRequireDefault(_fs);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var xml = (0, _xmlParser2.default)(_fs2.default.readFileSync("../kicad/sensor-node.xml", "utf8"));
var components = xml.root.children.filter(function (c) {
  return c.name === "components";
});

if (components.length !== 1) {
  throw new Error("Error finding components");
}

var comps = components[0].children.reduce(function (l, c) {
  var value = c.children.find(function (child) {
    return child.name === "value";
  }).content;
  var lib = c.children.find(function (child) {
    return child.name === "libsource";
  }).attributes.lib;
  var part = c.children.find(function (child) {
    return child.name === "libsource";
  }).attributes.part;
  var id = lib + "_" + part;

  if (part !== value) {
    id += "_" + value;
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
      footprint: c.children.find(function (child) {
        return child.name === "footprint";
      }).content
    };
  }

  return l;
}, {});

var out = "# BOM\n\n";

out += "amount|description|manufacturer|price per unit / EUR\n";
out += "------|-----------|------------|--------------------\n";

Object.keys(comps).forEach(function (k) {
  var c = comps[k];

  out += "" + c.count;

  try {
    var comp = JSON.parse(_fs2.default.readFileSync("../components/" + c.id + ".json", "utf8"));

    out += "|[" + comp.description + "](" + comp.suppliers[0].supplierLink + ")|" + comp.manufacturer + "|" + comp.suppliers[0].price.value;
  } catch (e) {
    out += "|" + c.id + "|n/a|n/a";
  }

  out += "\n";
});

_fs2.default.writeFileSync("../bom.md", out);