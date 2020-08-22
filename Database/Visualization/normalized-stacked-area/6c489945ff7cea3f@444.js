// https://observablehq.com/@d3/normalized-stacked-area-chart@444
export default function define(runtime, observer) {
  const main = runtime.module();
  const fileAttachments = new Map([["Fall2018Attendance_NormalizedStackChart.csv",new URL("./files/Fall2018Attendance_NormalizedStackChart.csv",import.meta.url)]]);
  main.builtin("FileAttachment", runtime.fileAttachments(name => fileAttachments.get(name)));
  main.variable(observer()).define(["md"], function(md){return(
md`# Normalized Stacked Area Chart`
)});
  main.variable(observer("legend")).define("legend", ["DOM","html","margin","color"], function(DOM,html,margin,color)
{
  const id = DOM.uid().id;
  return html`<style>

.${id} {
  display: block;
  columns: 140px auto;
  font: 10px sans-serif;
  margin-left: ${margin.left}px;
}

.${id}-item {
  break-inside: avoid;
  display: flex;
  align-items: center;
  padding-bottom: 1px;
}

.${id}-swatch {
  width: 20px;
  height: 20px;
  margin: 0 5px 0 0;
}

</style>
<div class="${id}">${color.domain().map(name => html`
  <div class="${id}-item">
    <div class="${id}-swatch" style="background:${color(name)};"></div>
    ${document.createTextNode(name)}
  </div>`)}
</div>`;
}
);
  main.variable(observer("chart")).define("chart", ["d3","width","height","series","color","area","xAxis","yAxis"], function(d3,width,height,series,color,area,xAxis,yAxis)
{  
  const svg = d3.create("svg")
      .attr("viewBox", [0, 0, width, height]);

  svg.append("g")
    .selectAll("path")
    .data(series)
    .join("path")
      .attr("fill", ({key}) => color(key))
      .attr("d", area)
    .append("title")
      .text(({key}) => key);

  svg.append("g")
      .call(xAxis);

  svg.append("g")
      .call(yAxis);

  return svg.node();
}
);
  main.variable("data").define("data", ["d3","FileAttachment"], async function(d3,FileAttachment){return(
d3.csvParse(await FileAttachment("Fall2018Attendance_NormalizedStackChart.csv").text(), d3.autoType)
)});
  main.variable("series").define("series", ["d3","data"], function(d3,data){return(
d3.stack()
    .keys(data.columns.slice(1))
    .offset(d3.stackOffsetExpand)
  (data)
)});
  main.variable("area").define("area", ["d3","x","y"], function(d3,x,y){return(
d3.area()
    .x(d => x(d.data.date))
    .y0(d => y(d[0]))
    .y1(d => y(d[1]))
)});
  main.variable("x").define("x", ["d3","data","margin","width"], function(d3,data,margin,width){return(
d3.scaleTime()
    .domain(d3.extent(data, d => d.date))
    .range([margin.left, width - margin.right])
)});
  main.variable("y").define("y", ["d3","height","margin"], function(d3,height,margin){return(
d3.scaleLinear()
    .range([height - margin.bottom, margin.top])
)});
  main.variable("color").define("color", ["d3","data"], function(d3,data){return(
d3.scaleOrdinal()
    .domain(data.columns.slice(1))
    .range(d3.schemeCategory10)
)});
  main.variable("xAxis").define("xAxis", ["height","margin","d3","x","width"], function(height,margin,d3,x,width){return(
g => g
    .attr("transform", `translate(0,${height - margin.bottom})`)
    .call(d3.axisBottom(x).ticks(width / 80).tickSizeOuter(0))
)});
  main.variable("yAxis").define("yAxis", ["margin","d3","y"], function(margin,d3,y){return(
g => g
    .attr("transform", `translate(${margin.left},0)`)
    .call(d3.axisLeft(y).ticks(10, "%"))
    .call(g => g.select(".domain").remove())
)});
  main.variable("height").define("height", function(){return(
500
)});
  main.variable("margin").define("margin", function(){return(
{top: 10, right: 20, bottom: 20, left: 40}
)});
  main.variable("d3").define("d3", ["require"], function(require){return(
require("d3@5")
)});
  return main;
}
