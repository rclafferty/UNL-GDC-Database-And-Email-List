// https://observablehq.com/@d3/inline-labels@70
export default function define(runtime, observer) {
  const main = runtime.module();
  const fileAttachments = new Map([["Fall2018Attendance.txt",new URL("./files/Fall2018Attendance.txt",import.meta.url)]]);
  main.builtin("FileAttachment", runtime.fileAttachments(name => fileAttachments.get(name)));
  main.variable(observer()).define(["md"], function(md){return(
md`### Fall 2018`
)});
  main.variable(observer("chart")).define("chart", ["d3","width","height","xAxis","series","z","x","y"], function(d3,width,height,xAxis,series,z,x,y)
{

  const svg = d3.create("svg")
      .attr("viewBox", [0, 0, width, height]);

  svg.append("g")
      .call(xAxis);

  const serie = svg.append("g")
    .selectAll("g")
    .data(series)
    .join("g");

  serie.append("path")
      .attr("fill", "none")
      .attr("stroke", "#41ab5d")
      .attr("stroke-width", 2)
      .attr("d", d3.line()
          .x(d => x(d.date))
          .y(d => y(d.value)));

  serie.append("g")
      .attr("font-family", "sans-serif")
      .attr("font-size", 14)
      .attr("stroke-linecap", "round")
      .attr("stroke-linejoin", "round")
      .attr("text-anchor", "middle")
    .selectAll("text")
    .data(d => d)
    .join("text")
      .text(d => d.value)
      .attr("dy", "0.4em")
      .attr("x", d => x(d.date))
      .attr("y", d => y(d.value))
      .call(text => text.filter((d, i, data) => i === data.length - 1)
        .append("tspan")
          .attr("font-weight", "bold")
          .text(d => ` ${d.key}`))
    .clone(true).lower()
      .attr("fill", "none")
      .attr("stroke", "white")
      .attr("stroke-width", 6);

  return svg.node();
}
);



  main.variable("data").define("data", ["d3","FileAttachment"], async function(d3,FileAttachment){return(
d3.tsvParse(await FileAttachment("Fall2018Attendance.txt").text(), d => (d3.autoType(d).date = new Date(d.date), d))
)});
  main.variable("series").define("series", ["data"], function(data){return(
data.columns.slice(1).map(key => data.map(({[key]: value, date}) => ({key, date, value})))
)});
  main.variable("xAxis").define("xAxis", ["height","margin","d3","x","width"], function(height,margin,d3,x,width){return(
g => g
    .attr("transform", `translate(0,${height - margin.bottom})`)
    .call(d3.axisBottom(x).ticks(width / 80).tickSizeOuter(0))
)});
  main.variable("x").define("x", ["d3","data","margin","width"], function(d3,data,margin,width){return(
d3.scaleUtc()
    .domain([data[0].date, data[data.length - 1].date])
    .range([margin.left, width - margin.right])
)});
  main.variable("y").define("y", ["d3","series","height","margin"], function(d3,series,height,margin){return(
d3.scaleLinear()
    .domain([0, d3.max(series, s => d3.max(s, d => d.value))])
    .range([height - margin.bottom, margin.top])
)});
  main.variable("z").define("z", ["d3","data"], function(d3,data){return(
d3.scaleOrdinal(data.columns.slice(1), d3.schemeCategory10)
)});
  main.variable("labelPadding").define("labelPadding", function(){return(
3
)});
  main.variable("margin").define("margin", function(){return(
{top: 30, right: 50, bottom: 30, left: 30}
)});
  main.variable("height").define("height", function(){return(
500
)});
  main.variable("d3").define("d3", ["require"], function(require){return(
require("d3@5")
)});
  return main;
}
