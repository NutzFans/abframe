(function() {
    var d = document;
    var includeCss = function(url) {
        var link = d.createElement("link");
        link.rel = "stylesheet";
        link.type = "text/css";
        link.href = url;
        d.getElementsByTagName("head")[0].appendChild(link)
    };
    includeCss("Mdate/needcss/Mdate.css");
    var dateopts = {
        beginYear: 2000,
        beginMonth: 1,
        beginDay: 1,
        endYear: new Date().getFullYear(),
        endMonth: new Date().getMonth() + 1,
        endDay: new Date().getDate(),
        format: "YMD",
        show:"",
        showYear:new Date().getFullYear(),
        showMonth:new Date().getMonth() + 1,
        showQuoter:getSeason(new Date().getMonth() + 1)
    };
    var MdSelectId = "";
    var MdAcceptId = "";
    var dateContentBox = "";
    var datePlugs = "";
    var yearTag = "";
    var monthTag = "";
    var dayTag = "";
    var quarterTag = "";
    var indexY = 1;
    var indexM = 1;
    var indexD = 1;
    var initM = null;
    var initD = null;
    var yearScroll = null;
    var monthScroll = null;
    var dayScroll = null;
    //获取当前季度
    function getSeason(n){
		if(n  < 3) {
			return 1;
		}else if(n < 6) {
			return 2;
		}else if(n <9) {
			return 3;
		}else if(n <12){
			return 4;
		}
    };
    var Mdate = function(el, opts) {
        if (!opts) {
            opts = {}
        }
        this.id = el;
        this.selectorId = d.getElementById(this.id);
        this.acceptId = d.getElementById(opts.acceptId) || d.getElementById(this.id);
        this.beginYear = opts.beginYear || dateopts.beginYear;
        this.beginMonth = opts.beginMonth || dateopts.beginMonth;
        this.beginDay = opts.beginDay || dateopts.beginDay;
        this.endYear = opts.endYear || dateopts.endYear;
        this.endMonth = opts.endMonth || dateopts.endMonth;
        this.endDay = opts.endDay || dateopts.endDay;
        this.format = opts.format || dateopts.format;
        this.show = opts.show || dateopts.show;
        this.showYear = opts.showYear || dateopts.showYear;
        this.showMonth = opts.showMonth || dateopts.showMonth;
        this.showQuoter = opts.showQuoter || dateopts.showQuoter;
        this.dateBoxShow()
    };
    Mdate.prototype = {
        constructor: Mdate,
        dateBoxShow: function() {
            var that = this;
            that.selectorId.onclick = function() {
                that.createDateBox();
                that.dateSure()
            }
        },
        createDateBox: function() {
        	var that = this;
            MdatePlugin = d.getElementById("MdatePlugin");
            if (!MdatePlugin) {
                dateContentBox = d.createElement("div");
                dateContentBox.id = "MdatePlugin";
                d.body.appendChild(dateContentBox);
                MdatePlugin = d.getElementById("MdatePlugin")
            }
            MdatePlugin.setAttribute("class", "slideIn");
            that.createDateUi();
            if(that.show == "year"){
            	var yearUl = d.getElementById("yearUl");
        	}else if(that.show == "month"){
        		var yearUl = d.getElementById("yearUl");
        		var monthUl = d.getElementById("monthUl");
        	}else if(that.show == "day"){
        		var yearUl = d.getElementById("yearUl");
        		var monthUl = d.getElementById("monthUl");
        		var dayUl = d.getElementById("dayUl");
        	}else if(that.show == "quarter"){
        		var yearUl = d.getElementById("yearUl");
        		var quarterUl = d.getElementById("quarterUl");
        	}
            yearUl.innerHTML = that.createDateYMD("year");
            that.initScroll();
            that.refreshScroll()
        },
        createDateUi: function() {
        	if(this.show == "year"){
                var str = "" + '<section class="getDateBg"></section>' + '<section class="getDateBox" id="getDateBox">' + '<div class="choiceDateTitle">' + '<button id="dateCancel">取消</button>' + '<button id="dateSure" class="fr">确定</button>' + "</div>" + '<div class="dateContent">' + '<div class="checkeDate"></div>' + '<div id="yearwrapper">' + '<ul id="yearUl"></ul>' + "</div>" + "</div>" + "</section>";
        	}else if(this.show == "month"){
                var str = "" + '<section class="getDateBg"></section>' + '<section class="getDateBox" id="getDateBox">' + '<div class="choiceDateTitle">' + '<button id="dateCancel">取消</button>' + '<button id="dateSure" class="fr">确定</button>' + "</div>" + '<div class="dateContent">' + '<div class="checkeDate"></div>' + '<div id="yearwrapper">' + '<ul id="yearUl"></ul>' + "</div>" + '<div id="monthwrapper">' + '<ul id="monthUl"></ul>' + "</div>"  + "</div>" + "</section>";
        	}else if(this.show == "day"){
                var str = "" + '<section class="getDateBg"></section>' + '<section class="getDateBox" id="getDateBox">' + '<div class="choiceDateTitle">' + '<button id="dateCancel">取消</button>' + '<button id="dateSure" class="fr">确定</button>' + "</div>" + '<div class="dateContent">' + '<div class="checkeDate"></div>' + '<div id="yearwrapper">' + '<ul id="yearUl"></ul>' + "</div>" + '<div id="monthwrapper">' + '<ul id="monthUl"></ul>' + "</div>" + '<div id="daywrapper">' + '<ul id="dayUl"></ul>' + "</div>" + "</div>" + "</section>";
        	}else if(this.show == "quarter"){
        		var str = "" + '<section class="getDateBg"></section>' + '<section class="getDateBox" id="getDateBox">' + '<div class="choiceDateTitle">' + '<button id="dateCancel">取消</button>' + '<button id="dateSure" class="fr">确定</button>' + "</div>" + '<div class="dateContent">' + '<div class="checkeDate"></div>' + '<div id="yearwrapper">' + '<ul id="yearUl"></ul>' + "</div>" + '<div id="quarterwrapper">' + '<ul id="quarterUl"></ul>' + "</div>"  + "</div>" + "</section>";
        	}
            MdatePlugin.innerHTML = str
        },
        createDateYMD: function(type) {
            var that = this;
            var str = "<li>&nbsp;</li>";
            var beginNum = null,
            endNum = null,
            unitName = "年",
            dataStyle = "data-year";
            if (type == "year") {
                beginNum = that.beginYear;
                endNum = that.endYear
            }
            if(type == "quarter"){
            	unitName = "季度";
            	dataStyle = "data-quarter";
            	beginNum = 1;
                endNum = 4
            }
            if (type == "month") {
                unitName = "月";
                dataStyle = "data-month";
                beginNum = that.beginMonth;
                endNum = 12;
                if (yearTag != that.beginYear) {
                    beginNum = 1
                }
                if (yearTag == dateopts.endYear) {
                    endNum = that.endMonth
                }
            }
            if (type == "day") {
                unitName = "日";
                dataStyle = "data-day";
                beginNum = 1;
                endNum = new Date(yearTag, monthTag, 0).getDate();
                if (yearTag == that.beginYear && monthTag == that.beginMonth) {
                    beginNum = that.beginDay
                }
                if (yearTag == that.endYear && monthTag == that.endMonth) {
                    endNum = that.endDay
                }
            }
            for (var i = beginNum; i <= endNum; i++) {
                str += "<li " + dataStyle + "=" + i + ">" + that.dateForTen(i) + unitName + "</li>"
            }
            return str + "<li>&nbsp;</li>"
        },
        initScroll: function() {
            var that = this;
        	if(that.show == "quarter"){
        		quarterScroll = new iScroll("quarterwrapper", {
                    snap: "li",
                    vScrollbar: false,
                    onScrollEnd: function() {
                    	indexQ = Math.ceil(this.y / 40 * -1 + 1);
                        if(that.show =="quarter"){
                        	quarterScroll.refresh();
                        }
                        if (indexQ == 1 && yearTag != that.beginYear) {
                        	quarterTag = 1
                        } else {
                        	quarterTag = quarterUl.getElementsByTagName("li")[indexQ].getAttribute("data-quarter")
                        }
                        
                        try {
                        	quarterTag = quarterUl.getElementsByTagName("li")[indexQ].getAttribute("data-quarter")
                        } catch(err) {
                            return true
                        }
                    }
                });
        	}
            yearScroll = new iScroll("yearwrapper", {
                snap: "li",
                vScrollbar: false,
                onScrollEnd: function() {
                    indexY = Math.ceil(this.y / 40 * -1 + 1);
                    yearTag = yearUl.getElementsByTagName("li")[indexY].getAttribute("data-year");
                    if(that.show =="month" || that.show =="day"){
                    	monthUl.innerHTML = that.createDateYMD("month");
                    	monthScroll.refresh();
                    }else if(that.show == "quarter"){
                    	quarterUl.innerHTML = that.createDateYMD("quarter");
                    	quarterScroll.refresh();
                    }
                    try {
                        monthTag = monthUl.getElementsByTagName("li")[indexM].getAttribute("data-month")
                    } catch(err) {
                        return true
                    }
                    if(that.show =="day"){
                    	 dayUl.innerHTML = that.createDateYMD("day");
                         dayScroll.refresh();
                    }
                   
                    try {
                        dayTag = dayUl.getElementsByTagName("li")[indexD].getAttribute("data-day")
                    } catch(err) {
                        return true
                    }
                }
            });
            if(that.show=="year"||that.show=="quarter"){
            	return;
            }
            monthScroll = new iScroll("monthwrapper", {
                snap: "li",
                vScrollbar: false,
                onScrollEnd: function() {
                    indexM = Math.ceil(this.y / 40 * -1 + 1);
                    if (indexM == 1 && yearTag != that.beginYear) {
                        monthTag = 1
                    } else {
                        monthTag = monthUl.getElementsByTagName("li")[indexM].getAttribute("data-month")
                    }
                    if(that.show=="day"){
                    	 dayUl.innerHTML = that.createDateYMD("day");
                         dayScroll.refresh();
                    }
                    try {
                        dayTag = dayUl.getElementsByTagName("li")[indexD].getAttribute("data-day")
                    } catch(err) {
                        return true
                    }
                }
            });
            if(that.show=="month"){
            	return;
            }
            dayScroll = new iScroll("daywrapper", {
                snap: "li",
                vScrollbar: false,
                onScrollEnd: function() {
                    indexD = Math.ceil(this.y / 40 * -1 + 1);
                    if (indexD == 1 && monthTag != that.beginMonth) {
                        dayTag = 1
                    } else {
                        dayTag = dayUl.getElementsByTagName("li")[indexD].getAttribute("data-day")
                    }
                }
            })
        },
        refreshScroll: function() {
            var that = this;
//            var inputYear = that.acceptId.getAttribute("data-year");
//            var inputMonth = that.acceptId.getAttribute("data-month");
//            var inputDay = that.acceptId.getAttribute("data-day");
//            var inputquarter = that.acceptId.getAttribute("data-quarter");
//            inputYear = inputYear || that.showYear;
//            inputMonth = inputMonth || that.showMonth;
//            inputDay = inputDay || that.beginDay;
//            inputquarter = inputquarter || that.showQuoter;
//            initM = that.beginMonth;
//            initD = that.beginDay;
//            if (inputYear != that.beginYear && initM != 1) {
//                initM = 1
//            }
//            if (inputMonth != that.beginMonth && initD != 1) {
//                initD = 1
//            }
//            inputYear -= that.beginYear;
//            inputMonth -= initM;
//            inputDay -= initD;
//            inputquarter -= 1;
//            inputquarter = parseInt(inputquarter);
            var inputYear = that.showYear;
            inputYear -= that.beginYear;
            var inputMonth = that.showMonth-1;
            var inputquarter = that.showQuoter-1;
            yearScroll.refresh();
            if(that.show == "year"){
            	yearScroll.scrollTo(0, inputYear * 40, 300, true);
            }else if(that.show == "month"){
            	yearScroll.scrollTo(0, inputYear * 40, 300, true);
            	monthScroll.scrollTo(0, inputMonth * 40, 300, true);
            }else if(that.show == "day"){
            	yearScroll.scrollTo(0, inputYear * 40, 300, true);
            	monthScroll.scrollTo(0, inputMonth * 40, 300, true);
            	dayScroll.scrollTo(0, inputDay * 40, 300, true);
            }else if(that.show == "quarter"){
            	yearScroll.scrollTo(0, inputYear * 40, 300 , true);
            	quarterScroll.scrollTo(0, inputquarter * 40 , 300, true);
            }
        },
        dateSure: function() {
            var that = this;
            var sureBtn = d.getElementById("dateSure");
            var cancelBtn = d.getElementById("dateCancel");
            sureBtn.onclick = function() {
                if (that.format == "YMD") {
                    if(that.show == "year"){
                    	that.acceptId.value = yearTag + "年";
                    }else if(that.show == "month"){
                    	that.acceptId.value = yearTag + "年" + monthTag + "月";
                    }else if(that.show == "day"){
                    	that.acceptId.value = yearTag + "年" + monthTag + "月" + dayTag + "日";
                    }
                } else {
                	if(that.show == "year"){
                        that.acceptId.value = yearTag;
                        sessionStorage.setItem("beginDate",yearTag+"-01-01");
                        sessionStorage.setItem("endDate",yearTag+"-12-31");
                    }else if(that.show == "month"){
                        that.acceptId.value = yearTag + that.format + that.dateForTen(monthTag);
                        var day = that.getLastDay(yearTag,monthTag);
                        sessionStorage.setItem("beginDate",yearTag + that.format + that.dateForTen(monthTag)+"-01");
                        sessionStorage.setItem("endDate",yearTag + that.format + that.dateForTen(monthTag)+"-"+day);
                    }else if(that.show == "day"){
                        that.acceptId.value = yearTag + that.format + that.dateForTen(monthTag) + that.format + that.dateForTen(dayTag);
                    }else if(that.show == "quarter"){
                    	var beginDate = that.getQuarterStartDate(yearTag,quarterTag);
                    	var endDate = that.getQuarterEndDate(yearTag,quarterTag);
                    	sessionStorage.setItem("beginDate",beginDate);
                        sessionStorage.setItem("endDate",endDate);
                    	that.acceptId.value = yearTag + that.format + quarterTag + "季度";
                    }
                }
                $("#myTab li").each(function(){
                	if($(this).hasClass("active")){
                		var tabName = $(this).find("a").attr("href");
                	    $(tabName).tab('show');
                	    if(tabName == '#panel_tab2_1'){
                	    	$(tabName).load("workCollect.jsp");
                	    }else if(tabName == '#panel_tab2_2'){
                	    	$(tabName).load("workStream.jsp");
                	    }else if(tabName == '#panel_tab2_3'){
                	    	$(tabName).load("workWarn.jsp");
                	    }
                	}
                })
                that.showYear = yearTag;
                that.showMonth = monthTag;
            	that.showQuoter = quarterTag;
                that.acceptId.setAttribute("data-year", yearTag);
                that.acceptId.setAttribute("data-month", monthTag);
                that.acceptId.setAttribute("data-day", dayTag);
                that.acceptId.setAttribute("data-quarter", quarterTag);
                that.dateCancel()
            };
            cancelBtn.onclick = function() {
                that.dateCancel()
            }
        },
        dateForTen: function(n) {
            if (n < 10) {
                return "0" + n
            } else {
                return n
            }
        },
        getLastDay: function(year,month){   //获取某年某月的最后一天
        	var new_year = year;  //取当前的年份   
        	var new_month = month++;//取下一个月的第一天，方便计算（最后一天不固定）   
        	if(month>12){      //如果当前大于12月，则年份转到下一年   
        		new_month -=12;    //月份减   
        		new_year++;      //年份增   
        	}   
        	var new_date = new Date(new_year,new_month,1);        //取当年当月中的第一天   
        	return (new Date(new_date.getTime()-1000*60*60*24)).getDate();//获取当月最后一天日期   
        },
        //获得某季度的开始日期　　 
        getQuarterStartDate:function(paraYear,paraSeason){　　 
　 			switch (paraSeason){　　 
		　　　	case '1' : return paraYear+"-01-01";
		　　　	case '2' : return paraYear+"-04-01";
		　　　	case '3' : return paraYear+"-07-01";
		　　　	case '4' : return paraYear+"-10-01";
　 			}
        },　 
        //获得某季度的结束日期　　 
        getQuarterEndDate:function(paraYear,paraSeason){　　 
		　	switch (paraSeason){　　 
		　 		case '1' : return paraYear+"-03-31";
		　		case '2' : return paraYear+"-06-30";
		　 		case '3' : return paraYear+"-09-30";
		　		case '4' : return paraYear+"-12-31";
　 			}　 
        },
        dateCancel: function() {
            MdatePlugin.setAttribute("class", "slideOut");
            setTimeout(function() {
                MdatePlugin.innerHTML = ""
            },
            400)
        }
    };
    if (typeof exports !== "undefined") {
        exports.Mdate = Mdate
    } else {
        window.Mdate = Mdate
    }
})();