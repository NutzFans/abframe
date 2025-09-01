class D3ComboChart {
	
    /**
	 * 构造函数
	 * 
	 * @param {String}
	 *            containerId - 容器元素ID
	 * @param {Object}
	 *            options - 配置选项
	 */
	constructor(container, options = {}) {
		this.container = container;
        if (!this.container) {
            return;
        }
        
        // 默认配置
        this.defaultOptions = {
            margin: { top: 40, right: 15, bottom: 50, left: 10 },
            barColors: {
            	outside: '#e8f5e9',
            	inside: '#43a047',
                stroke: '#43a047'
            },
            lineColor: '#fac858',
            tooltip: {
                backgroundColor: '#fff',
                color: '#2f3542',
                padding: '8px 12px',
                borderRadius: '4px',
                fontSize: '18px',
                pointerEvents: 'none',
                border: '1px solid #43a047',
                fontFamily: 'Microsoft YaHei, PingFang SC, Hiragino Sans GB, Arial, sans-serif'
            },
            legend: {
                fontSize: '14px',
                fontFamily: 'Microsoft YaHei, PingFang SC, Hiragino Sans GB, Arial, sans-serif',
                color: '#333'
            }
        };
        
        // 合并配置
        this.options = { ...this.defaultOptions, ...options };
        
        // 初始化图表
        this.init();
	}
	
    /**
	 * 初始化图表容器
	 */
    init() {
        // 获取容器尺寸
        this.width = this.container.clientWidth;
        this.height = this.container.clientHeight;
        
        // 关键：设置容器为相对定位，确保tooltip基于容器定位
        d3.select(this.container).style('position', 'relative');
        
        // 计算内部尺寸
        this.innerWidth = this.width - this.options.margin.left - this.options.margin.right;
        this.innerHeight = this.height - this.options.margin.top - this.options.margin.bottom;
        
        // 创建SVG容器
        this.svg = d3.select(this.container)
            .append('svg')
            .attr('width', this.width)
            .attr('height', this.height)
            .append('g')
            .attr('transform', `translate(${this.options.margin.left}, ${this.options.margin.top + 20})`);     
        
        // 创建tooltip元素
        this.createTooltip();
    }
    
    /**
     * 创建tooltip元素
     */
    createTooltip() {
    	// 1. 生成唯一类名（基于容器ID，确保每个图表的tooltip不重复）
    	const uniqueTooltipClass = `d3-tooltip-${this.container.id}`;
    	
        // 2. 移除当前容器内已存在的tooltip（仅删除自己的，不影响其他图表）
        d3.select(this.container).selectAll(`.${uniqueTooltipClass}`).remove();    	
        
        // 创建tooltip
        this.tooltip = d3.select(this.container)
            .append('div')
            .attr('class', `${uniqueTooltipClass}`) // 唯一类名
            .style('position', 'absolute') // 容器需相对定位，后续步骤设置
            .style('background-color', this.options.tooltip.backgroundColor)
            .style('color', this.options.tooltip.color)
            .style('padding', this.options.tooltip.padding)
            .style('border-radius', this.options.tooltip.borderRadius)
            .style('font-size', this.options.tooltip.fontSize)
            .style('pointer-events', this.options.tooltip.pointerEvents)
            .style('opacity', 0)
            .style('transition', 'opacity 0.3s')
            .style('border', this.options.tooltip.border)
            .style('font-family', this.options.tooltip.fontFamily)
            .style('z-index', 1000); // 确保tooltip在图表上层显示
    }
    
    /**
     * 添加顶部图例
     */
    drawLegend() {
        // 图例数据
        const legendItems = [
            { label: '开票金额', color: this.options.barColors.outside, type: 'rect' },
            { label: '回款金额', color: this.options.barColors.inside, type: 'rect' },
            { label: '回款率', color: this.options.lineColor, type: 'rect' }
        ];
        
        // 创建图例组
        const legendGroup = this.svg.append('g')
            .attr('class', 'chart-legend')
            .attr('transform', `translate(${this.innerWidth / 2}, -45)`); // 居中放置在顶部
        
        // 创建每个图例项
        const legendItemsGroup = legendGroup.selectAll('.legend-item')
            .data(legendItems)
            .join('g')
            .attr('class', 'legend-item')
            .attr('transform', (d, i) => `translate(${(i - (legendItems.length - 1) / 2) * 180}, 0)`); // 均匀分布
        
        // 添加图例标记
        legendItemsGroup.append('rect')
            .filter(d => d.type === 'rect')
            .attr('width', 12)
            .attr('height', 12)
            .attr('fill', d => d.color)
            .attr('stroke', '#636e72')
            .attr('stroke-width', 1);
        
        // 添加图例文本
        legendItemsGroup.append('text')
            .attr('x', 18)
            .attr('y', 6)
            .attr('dy', '0.3em')
            .attr('font-size', this.options.legend.fontSize)
            .attr('font-family', this.options.legend.fontFamily)
            .attr('fill', this.options.legend.color)
            .text(d => d.label);
    }    
	
    /**
	 * 绘制图表
	 * 
	 * @param {Object}
	 *            data - 图表数据
	 */
    render(data) {
        if (!data || !data.categories) {
            console.error('缺少必要的图表数据');
            return;
        }
        
        // 存储数据
        this.data = data;
        
        // 清除已有内容
        this.svg.selectAll('*').remove();
        
        // 绘制图例
        this.drawLegend();
        
        // 创建比例尺
        this.createScales();
        
        // 绘制坐标轴
        this.drawAxes();
        
        // 绘制柱状图
        this.drawBars();
        
        // 绘制折线图
        this.drawLineChart();
        
        // 添加tooltip事件
        this.addTooltipEvents();
    }
    
    /**
     * 添加tooltip事件监听
     */
    addTooltipEvents() {
        const self = this;
        const { categories, outsideData, insideData, rateData, tjTitle } = this.data;
        
        // 千分位格式化函数
        const formatNumber = (num) => {
        	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        };
       
        // 获取当前图表容器的位置信息（用于计算相对坐标）
        const containerRect = this.container.getBoundingClientRect();
        
        // 关键：仅选择当前图表SVG内的元素（this.svg限定范围）
        this.svg.selectAll('.light-green-bar, .green-bar, .rate-dot')
            .on('mouseenter', function (event, d) {
                // 获取当前元素在对应选择集中的索引（限定当前SVG内）
                const element = d3.select(this);
                let index;
                
                // 内层选择也限定在当前SVG内（this.svg.selectAll）
                if (element.classed('light-green-bar')) {
                    index = Array.from(self.svg.selectAll('.light-green-bar').nodes()).indexOf(this);
                } else if (element.classed('green-bar')) {
                    index = Array.from(self.svg.selectAll('.green-bar').nodes()).indexOf(this);
                } else {
                    index = Array.from(self.svg.selectAll('.rate-dot').nodes()).indexOf(this);
                }
                
                if (index !== -1 && categories[index]) { // 增加安全校验，避免索引越界
                    const category = categories[index];
                    const lightGreen = formatNumber(outsideData[index] || 0); // 空值处理
                    const green = formatNumber(insideData[index] || 0);
                    const rate = rateData[index] || 0;
                    
                    // 修复：实时获取容器位置（解决页面滚动后定位偏移）
                    const containerRect = self.container.getBoundingClientRect();
                    const relativeX = event.clientX - containerRect.left;
                    const relativeY = event.clientY - containerRect.top;
                    
                    // 生成tooltip内容（用于计算尺寸）
                    const tooltipHTML = `
                        【${category}】-（${tjTitle}）<br/>
                        开票金额：${lightGreen}万元<br/>
                        回款金额：${green}万元<br/>
                        回款率：${rate}%
                    `;
                    self.tooltip.html(tooltipHTML);
                    
                    // 获取tooltip实际尺寸（需先设置内容，再获取offsetWidth/Height）
                    const tooltipWidth = self.tooltip.node().offsetWidth;
                    const tooltipHeight = self.tooltip.node().offsetHeight;
                    
                    // 校准位置
                    const { left, top } = self.adjustTooltipPosition(
                        containerRect, tooltipWidth, tooltipHeight, relativeX, relativeY
                    );
                    
                    // 设置校准后的位置
                    self.tooltip
                        .style('left', `${left}px`) 
                        .style('top', `${top}px`)
                        .style('opacity', 1);  
                }
            })
	        .on('mousemove', function(event) {
	            // 补全：与mouseenter一致的索引获取逻辑
	            const element = d3.select(this);
	            let index;
	            
	            if (element.classed('light-green-bar')) {
	                index = Array.from(self.svg.selectAll('.light-green-bar').nodes()).indexOf(this);
	            } else if (element.classed('green-bar')) {
	                index = Array.from(self.svg.selectAll('.green-bar').nodes()).indexOf(this);
	            } else {
	                index = Array.from(self.svg.selectAll('.rate-dot').nodes()).indexOf(this);
	            }
	
	            if (index !== -1 && categories[index]) {
	                const containerRect = self.container.getBoundingClientRect();
	                const relativeX = event.clientX - containerRect.left;
	                const relativeY = event.clientY - containerRect.top;
	                
	                const category = categories[index];
	                const lightGreen = formatNumber(outsideData[index] || 0);
	                const green = formatNumber(insideData[index] || 0);
	                const rate = rateData[index] || 0;
	                
	                const tooltipHTML = `
	                    【${category}】-（${tjTitle}）<br/>
	                    开票金额：${lightGreen}万元<br/>
	                    回款金额：${green}万元<br/>
	                    回款率：${rate}%
	                `;
	                self.tooltip.html(tooltipHTML);
	                
	                const tooltipWidth = self.tooltip.node().offsetWidth;
	                const tooltipHeight = self.tooltip.node().offsetHeight;
	                
	                const { left, top } = self.adjustTooltipPosition(
	                    containerRect, tooltipWidth, tooltipHeight, relativeX, relativeY
	                );
	                
	                self.tooltip
	                    .style('left', `${left}px`)
	                    .style('top', `${top}px`);                
	            }
	        })
            .on('mouseleave', function () {
                self.tooltip.style('opacity', 0);
            });
    }    
    
    /**
	 * 创建比例尺
	 */
    createScales() {
        // X轴比例尺
        this.xScale = d3.scaleBand()
            .domain(this.data.categories)
            .range([0, this.innerWidth])
            .padding(0.2);
        
        // 柱状图Y轴比例尺
        const maxLightGreen = d3.max(this.data.outsideData);
        this.yScaleAmount = d3.scaleLinear()
            .domain([0, maxLightGreen * 1.2])
            .range([this.innerHeight * 0.9, this.innerHeight * 0.1]);
        
        // 折线图Y轴比例尺
        this.yScaleRate = d3.scaleLinear()
            .domain([0, 100])
            .range([this.innerHeight * 0.1, 0]);
    }
    
    /**
	 * 绘制坐标轴
	 */
    drawAxes() {
        // X轴
        this.svg.append('g')
        	.attr('class', 'x-axis') // 明确类名，便于update时选择
            .attr('transform', `translate(0, ${this.innerHeight})`)
            .call(d3.axisBottom(this.xScale))
            .selectAll('text')
            .attr('transform', 'rotate(0)')
            .style('text-anchor', 'middle')
            .style('font-size', '16px')
            .style('font-family', 'Microsoft YaHei, PingFang SC, Hiragino Sans GB, Arial, sans-serif')
            .text(function(d) {
                const text = d.toString();
                // 匹配中文字符
                const chineseChars = text.match(/[\u4e00-\u9fa5]/g) || [];
                // 如果中文字符超过5个，进行截断处理
                if (chineseChars.length > 5) {
                    let count = 0;
                    let result = '';
                    for (let i = 0; i < text.length; i++) {
                        if (/[\u4e00-\u9fa5]/.test(text[i])) {
                            count++;
                            if (count > 5) break;
                        }
                        result += text[i];
                    }
                    return result + '..';
                }
                return text;
            });
    }
    
    /**
	 * 绘制柱状图
	 */
    drawBars() {
        const { outsideData, insideData, categories } = this.data;
        const { outside, inside, stroke } = this.options.barColors;
        
        // 千分位格式化函数
        const formatNumber = (num) => {
        	return Math.floor(num).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        };
        
        // 绘制色柱（外层）
        this.svg.selectAll('.light-green-bar')
            .data(outsideData)
            .join('rect')
            .attr('class', 'light-green-bar')
            .attr('x', (d, i) => this.xScale(categories[i]))
            .attr('y', d => this.yScaleAmount(d))
            .attr('width', this.xScale.bandwidth())
            .attr('height', d => this.innerHeight - this.yScaleAmount(d))
            .attr('fill', outside)
            .attr('stroke', stroke)
            .attr('stroke-dasharray', '10 5');
        
        // 柱顶部数值（外层）
        this.svg.selectAll('.light-green-label')
            .data(outsideData)
            .join('text')
            .attr('class', 'bar-label light-green-label')
            .attr('x', (d, i) => this.xScale(categories[i]) + this.xScale.bandwidth() / 2)
            .attr('y', d => this.yScaleAmount(d) - 5)
            .attr('text-anchor', 'middle')  // 水平居中
            .style('font-size', '16px')
            .style('font-family', 'Microsoft YaHei, PingFang SC, Hiragino Sans GB, Arial, sans-serif')
            .text(d => formatNumber(d));
        
        // 绘制柱（内层）
        this.svg.selectAll('.green-bar')
            .data(insideData)
            .join('rect')
            .attr('class', 'green-bar')
            .attr('x', (d, i) => this.xScale(categories[i]) + this.xScale.bandwidth() * 0.2)
            .attr('y', d => d == 0 ? this.innerHeight : this.yScaleAmount(d))
            .attr('width', this.xScale.bandwidth() * 0.6)
            .attr('height', d => d == 0 ? 0 : this.innerHeight - this.yScaleAmount(d))
            .attr('fill', inside);
        
        // 柱顶部数值（内层）
        this.svg.selectAll('.green-label')
            .data(insideData)
            .join('text')
            .attr('class', 'bar-label green-label')
            .attr('x', (d, i) => this.xScale(categories[i]) + this.xScale.bandwidth() * 0.2 + this.xScale.bandwidth() * 0.6 / 2)
            .attr('y', d => d === 0 ? this.innerHeight - 5 : this.yScaleAmount(d) + 20)
            .attr('text-anchor', 'middle')  // 水平居中
            .attr('fill', '#fff')  // 设置字体颜色为白色
            .style('font-size', '16px')
            .style('font-family', 'Microsoft YaHei, PingFang SC, Hiragino Sans GB, Arial, sans-serif')
            .text(d => formatNumber(d));
    }    
    
    /**
	 * 绘制折线图
	 */
    drawLineChart() {
        const { rateData, categories } = this.data;
        
        // 折线生成器
        const lineGenerator = d3.line()
            .x((d, i) => this.xScale(categories[i]) + this.xScale.bandwidth() / 2)
            .y(d => this.yScaleRate(d))
            .curve(d3.curveMonotoneX);
        
        // 绘制折线
        this.svg.append('path')
            .datum(rateData)
            .attr('stroke', this.options.lineColor)
            .attr('stroke-width', 2)
            .attr('fill', 'none')
            .attr('d', lineGenerator);
        
        // 绘制折点
        this.svg.selectAll('.rate-dot')
            .data(rateData)
            .join('circle')
            .attr('class', 'rate-dot')
            .attr('cx', (d, i) => this.xScale(categories[i]) + this.xScale.bandwidth() / 2)
            .attr('cy', d => this.yScaleRate(d))
            .attr('r', 4)
            .attr('fill', this.options.lineColor);
        
        // 折点数值
        this.svg.selectAll('.rate-label')
            .data(rateData)
            .join('text')
            .attr('class', 'rate-label')
            .attr('x', (d, i) => this.xScale(categories[i]) + this.xScale.bandwidth() / 2)
            .attr('y', d => this.yScaleRate(d) - 10)
            .attr('text-anchor', 'middle')  // 水平居中
            .style('font-size', '16px')
            .style('font-family', 'Microsoft YaHei, PingFang SC, Hiragino Sans GB, Arial, sans-serif')
            .text(d => d + '%');
    }    
    
    update(newData, duration = 1000) {
    	if (!newData || !newData.categories) {
            console.error('缺少必要的图表数据');
            return;
        }
    	
        // 更新数据存储
        this.data = newData;
        
        // 1. 清除已有内容（包括旧图例、坐标轴、图表元素）
        this.svg.selectAll('*').remove();
        
        // 2. 重新创建tooltip（确保独立）
        this.createTooltip();  
        
        // 3. 重新绘制图例（清除后再画，避免重复）
        this.drawLegend();         
        
        // 4. 更新比例尺（必须在绘制坐标轴前）
        this.xScale.domain(newData.categories);
        const maxLightGreen = d3.max(newData.outsideData) || 0;
        this.yScaleAmount.domain([0, maxLightGreen * 1.2]);
        
        // 5. 绘制新坐标轴（修复：明确选择“坐标轴g”，避免操作图例g）
        // 先创建坐标轴g，再绑定事件
        const xAxisGroup = this.svg.append('g')
            .attr('class', 'x-axis') // 给坐标轴g加类名，便于后续选择
            .attr('transform', `translate(0, ${this.innerHeight})`);
        
        xAxisGroup.transition()
        	.duration(duration)
        	.call(d3.axisBottom(this.xScale))
        	.selectAll('text')
            .attr('transform', 'rotate(0)')
            .style('text-anchor', 'middle')
            .style('font-size', '16px')
            .style('font-family', 'Microsoft YaHei, PingFang SC, Hiragino Sans GB, Arial, sans-serif')
            .text(function(d) {
                const text = d.toString();
                // 匹配中文字符
                const chineseChars = text.match(/[\u4e00-\u9fa5]/g) || [];
                // 如果中文字符超过5个，进行截断处理
                if (chineseChars.length > 5) {
                    let count = 0;
                    let result = '';
                    for (let i = 0; i < text.length; i++) {
                        if (/[\u4e00-\u9fa5]/.test(text[i])) {
                            count++;
                            if (count > 5) break;
                        }
                        result += text[i];
                    }
                    return result + '..';
                }
                return text;
            });
        
        // 6. 更新柱状图（外层）
        this.svg.selectAll('.light-green-bar')
            .data(newData.outsideData)
            .join('rect')
            .attr('class', 'light-green-bar')
            .attr('x', (d, i) => this.xScale(newData.categories[i]))
            .attr('width', this.xScale.bandwidth())
            .transition()
            .duration(duration)
            .ease(d3.easeCubic) // 新增：添加缓动函数
            .attr('y', d => this.yScaleAmount(d || 0))
            .attr('height', d => this.innerHeight - this.yScaleAmount(d || 0))
            .attr('fill', this.options.barColors.outside)
            .attr('stroke', this.options.barColors.stroke)
            .attr('stroke-dasharray', '10 5');
        
        // 7. 更新外层柱标签（千分位格式化）
        this.svg.selectAll('.light-green-label')
            .data(newData.outsideData)
            .join('text')
            .attr('class', 'bar-label light-green-label')
            .attr('x', (d, i) => this.xScale(newData.categories[i]) + this.xScale.bandwidth() / 2)
            .style('text-anchor', 'middle')
            .style('font-size', '16px')
            .style('font-family', 'Microsoft YaHei, PingFang SC, Hiragino Sans GB, Arial, sans-serif')
            .transition()
            .duration(duration)
            .attr('y', d => this.yScaleAmount(d || 0) - 5)
            .text(d => d ? Math.floor(d).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") : '0');
        
        // 8. 更新柱状图（内层）
        this.svg.selectAll('.green-bar')
            .data(newData.insideData)
            .join('rect')
            .attr('class', 'green-bar')
            .attr('x', (d, i) => this.xScale(newData.categories[i]) + this.xScale.bandwidth() * 0.2)
            .attr('width', this.xScale.bandwidth() * 0.6)
            .transition()
            .duration(duration)
            .ease(d3.easeQuadInOut) // 新增：添加缓动函数
            .attr('y', d => d ? this.yScaleAmount(d) : this.innerHeight)
            .attr('height', d => d ? this.innerHeight - this.yScaleAmount(d) : 0)
            .attr('fill', this.options.barColors.inside);
        
        // 9. 更新内层柱标签（千分位格式化 + 白色字体）
        this.svg.selectAll('.green-label')
            .data(newData.insideData)
            .join('text')
            .attr('class', 'bar-label green-label')
            .attr('x', (d, i) => this.xScale(newData.categories[i]) + this.xScale.bandwidth() * 0.2 + this.xScale.bandwidth() * 0.6 / 2)
            .style('text-anchor', 'middle')
            .style('fill', '#fff')
            .style('font-size', '16px')
            .style('font-family', 'Microsoft YaHei, PingFang SC, Hiragino Sans GB, Arial, sans-serif')
            .transition()
            .duration(duration)
            .attr('y', d => d ? this.yScaleAmount(d) + 20 : this.innerHeight - 5)
            .text(d => d ? Math.floor(d).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") : '0');
        
        // 10. 更新折线图
        const lineGenerator = d3.line()
            .x((d, i) => this.xScale(newData.categories[i]) + this.xScale.bandwidth() / 2)
            .y(d => this.yScaleRate(d || 0))
            .curve(d3.curveMonotoneX);        
        
        this.svg.append('path') // 重新创建折线（清除后需重新append）
            .datum(newData.rateData)
            .attr('stroke', this.options.lineColor)
            .attr('stroke-width', 2)
            .attr('fill', 'none')
            .transition()
            .duration(duration)
            .ease(d3.easeLinear) // 新增：添加缓动函数
            .attr('d', lineGenerator);    
        
        // 11. 更新折线点
        this.svg.selectAll('.rate-dot')
            .data(newData.rateData)
            .join('circle')
            .attr('class', 'rate-dot')
            .attr('cx', (d, i) => this.xScale(newData.categories[i]) + this.xScale.bandwidth() / 2)
            .attr('r', 4)
            .attr('fill', this.options.lineColor)
            .transition()
            .duration(duration)
            .ease(d3.easeElastic) // 新增：添加缓动函数
            .attr('cy', d => this.yScaleRate(d || 0));
        
        // 12. 更新折线点标签
        this.svg.selectAll('.rate-label')
            .data(newData.rateData)
            .join('text')
            .attr('class', 'rate-label')
            .attr('x', (d, i) => this.xScale(newData.categories[i]) + this.xScale.bandwidth() / 2)
            .style('text-anchor', 'middle')
            .style('font-size', '16px')
            .style('font-family', 'Microsoft YaHei, PingFang SC, Hiragino Sans GB, Arial, sans-serif')
            .transition()
            .duration(duration)
            .attr('y', d => this.yScaleRate(d || 0) - 10)
            .text(d => `${d || 0}%`);
        
        // 13. 重新绑定当前图表的tooltip事件
        this.addTooltipEvents();         
    }
    
    /**
     * 校准tooltip位置，确保在容器内可见
     * @param {DOMRect} containerRect - 容器位置信息
     * @param {number} tooltipWidth - tooltip宽度
     * @param {number} tooltipHeight - tooltip高度
     * @param {number} relativeX - 鼠标相对容器的X坐标
     * @param {number} relativeY - 鼠标相对容器的Y坐标
     * @returns {Object} 校准后的left和top
     */
    adjustTooltipPosition(containerRect, tooltipWidth, tooltipHeight, relativeX, relativeY) {
        let left = relativeX + 10;
        let top = relativeY - 30;
        
        // 右侧超出容器：向左偏移（保证tooltip右边缘不超出容器）
        if (left + tooltipWidth > containerRect.width) {
            left = relativeX - tooltipWidth - 10;
        }
        
        // 底部超出容器：向上偏移（保证tooltip下边缘不超出容器）
        if (top + tooltipHeight > containerRect.height) {
            top = relativeY - tooltipHeight - 10;
        }
        
        // 左侧超出容器：强制左边缘为0
        if (left < 0) {
            left = 0;
        }
        
        // 顶部超出容器：强制上边缘为0
        if (top < 0) {
            top = 0;
        }
        
        return { left, top };
    }    
    
}