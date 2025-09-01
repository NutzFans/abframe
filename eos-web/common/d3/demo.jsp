<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>D3.js 折线图在柱状图上方</title>
<script src="https://d3js.org/d3.v7.min.js"></script>
<style>
.chart-container {
	width: 900px;
	height: 600px; /* 增加高度以容纳上移的折线图 */
	margin: 0 auto;
}

.bar-label {
	font-size: 12px;
	text-anchor: middle;
}

.rate-label {
	font-size: 12px;
	text-anchor: middle;
	fill: orange;
}
</style>
</head>
<body>
	<div class="chart-container" id="chart"></div>

	<script>
    // 1. 数据定义
    const categories = ['人力成本', '物料采购', '营销推广', '差旅费', '研发投入', '物流运输', '办公耗材', '其他费用'];
    const lightGreenData = [6439, 6574, 8761, 8019, 9273, 6865, 6953, 6533];
    const greenData = [2565, 2406, 2317, 3541, 4198, 4394, 2981, 3432];
    const rateData = [45, 42, 30, 48, 50, 70, 45, 55];

    // 2. 画布配置 - 增加高度并调整边距
    const width = 900;
    const height = 600;
    const margin = { top: 30, right: 80, bottom: 60, left: 60 };
    const innerWidth = width - margin.left - margin.right;
    const innerHeight = height - margin.top - margin.bottom;

    // 3. 创建 SVG 容器
    const svg = d3.select('#chart')
      .append('svg')
      .attr('width', width)
      .attr('height', height)
      .append('g')
      .attr('transform', `translate(${margin.left}, ${margin.top})`);

    // 4. 定义比例尺
    // X轴比例尺（共享）
    const xScale = d3.scaleBand()
      .domain(categories)
      .range([0, innerWidth])
      .padding(0.2);

    // 柱状图Y轴比例尺（占底部2/3高度）
    const maxLightGreen = d3.max(lightGreenData);
    const yScaleAmount = d3.scaleLinear()
      .domain([0, maxLightGreen * 1.2])
      .range([innerHeight * 0.7, 0]); // 柱状图只占底部70%高度

    // 折线图Y轴比例尺（占顶部3/3高度）
    const yScaleRate = d3.scaleLinear()
      .domain([0, 100])
      .range([innerHeight * 0.1, 0]); // 折线图使用顶部30%高度（0到20%区间）

    // 5. 绘制X轴
    svg.append('g')
      .attr('transform', `translate(0, ${innerHeight * 0.7})`) // X轴位置与柱状图底部对齐
      .call(d3.axisBottom(xScale))
      .selectAll('text')
      .attr('transform', 'rotate(30)')
      .style('text-anchor', 'start')
      .style('font-size', '12px');

    // 6. 绘制浅绿色柱（外层）
    svg.selectAll('.light-green-bar')
      .data(lightGreenData)
      .join('rect')
      .attr('class', 'light-green-bar')
      .attr('x', (d, i) => xScale(categories[i]))
      .attr('y', d => yScaleAmount(d))
      .attr('width', xScale.bandwidth())
      .attr('height', d => innerHeight * 0.7 - yScaleAmount(d)) // 高度限制在柱状图区域
      .attr('fill', 'rgba(180, 220, 180, 0.8)')
      .attr('stroke', '#999')
      .attr('stroke-dasharray', '4 2');

    // 7. 浅绿色柱顶部数值
    svg.selectAll('.light-green-label')
      .data(lightGreenData)
      .join('text')
      .attr('class', 'bar-label light-green-label')
      .attr('x', (d, i) => xScale(categories[i]) + xScale.bandwidth() / 2)
      .attr('y', d => yScaleAmount(d) - 8)
      .text(d => d);

    // 8. 绘制绿色柱（内层）
    svg.selectAll('.green-bar')
      .data(greenData)
      .join('rect')
      .attr('class', 'green-bar')
      .attr('x', (d, i) => xScale(categories[i]) + xScale.bandwidth() * 0.2)
      .attr('y', d => yScaleAmount(d))
      .attr('width', xScale.bandwidth() * 0.6)
      .attr('height', d => innerHeight * 0.7 - yScaleAmount(d))
      .attr('fill', 'rgba(0, 128, 0, 0.7)');

    // 9. 绿色柱顶部数值
    svg.selectAll('.green-label')
      .data(greenData)
      .join('text')
      .attr('class', 'bar-label green-label')
      .attr('x', (d, i) => xScale(categories[i]) + xScale.bandwidth() * 0.2 + xScale.bandwidth() * 0.6 / 2)
      .attr('y', d => yScaleAmount(d) - 8)
      .text(d => d);

    // 10. 绘制折线图（上移至柱状图上方）
    const lineGenerator = d3.line()
      .x((d, i) => xScale(categories[i]) + xScale.bandwidth() / 2)
      .y(d => yScaleRate(d)) // 使用折线图专用比例尺
      .curve(d3.curveMonotoneX);

    svg.append('path')
      .datum(rateData)
      .attr('stroke', 'orange')
      .attr('stroke-width', 2)
      .attr('fill', 'none')
      .attr('d', lineGenerator);

    // 11. 折线点及数值
    svg.selectAll('.rate-dot')
      .data(rateData)
      .join('circle')
      .attr('class', 'rate-dot')
      .attr('cx', (d, i) => xScale(categories[i]) + xScale.bandwidth() / 2)
      .attr('cy', d => yScaleRate(d))
      .attr('r', 4)
      .attr('fill', 'orange');

    svg.selectAll('.rate-label')
      .data(rateData)
      .join('text')
      .attr('class', 'rate-label')
      .attr('x', (d, i) => xScale(categories[i]) + xScale.bandwidth() / 2)
      .attr('y', d => yScaleRate(d) - 10)
      .text(d => d + '%');

    // 12. 可选：添加柱状图和折线图的分隔线
    svg.append('line')
      .attr('x1', 0)
      .attr('y1', innerHeight * 0.25) // 分隔线位置
      .attr('x2', innerWidth)
      .attr('y2', innerHeight * 0.25)
      .attr('stroke', '#ddd')
      .attr('stroke-width', 1);
  </script>
</body>
</html>
