/**
 * Created by wusiru on 2017/8/9.
 */
$(function () {
    $("td").css("padding", "0");

    var nWindowH = $(window).height() - 100;
    $(".hysq-content").css("height", nWindowH + "px");

    // 加载第一行
    loadHead();

    // 加载单元格
    oCell.init();

    // 加载时间节点
    loadTimeNode();

    // 设置时间单元格是都有效
    oCell.setTdStyle();

    // 展现会议日程
   // oMeetting.loadAllSchedule();
});

var mouseDownFlag = false;
var sCurSelect_date = new Date();
var aCurDate_week; // 当前周日期

// 第一行所有的事件
function loadHead() {
    // 设置日期插件样式
    $(".mini-buttonedit").css("width", "auto");
    $(".mini-buttonedit-border").css({"border": "none", "background": "none", "top": "-2px"});
    $("span.mini-popupedit").css("margin-left", "15px");

    // 切换日、周
    $("div.title-left div.day_week").click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    });

    // 日期样式
    $(".date-show").css("left", "calc(50% - 143px)");

    // 获取本周日期
    aCurDate_week=oWeekDate.setDate(sCurSelect_date);
    $("span.now-date").html(aCurDate_week[0].date+" - "+aCurDate_week[6].date);

    // 左 定位
    var nContent_left = $(".hysq-title").offset().left; // 容器
    var nOffset_left = $(".date-show").offset().left;  // 中
    var nWidth = $(".title-left").width();
    $(".title-right").css("right", (nOffset_left - nWidth) / 2 - nContent_left + "px");
    $(".title-left").css("left", (nOffset_left - nWidth) / 2 + "px");

    // 定位logo 左
    var _offsetLeft_left = $(".title-left").offset().left;
    var _offsetTop = $(".title-left").offset().top;
    var _offsetLeft = $(".title-right").offset().left;
    var _nWidth = $(".title-right").width();
    $(".logo_left").offset({left: _offsetLeft_left - 70, top: _offsetTop - 30});
    $(".logo_right").offset({left: _offsetLeft + _nWidth + 20, top: _offsetTop - 30});

    // 切换到前一周
    $("#prev-day").bind("click", function () {
        // 获取前一周的日期
        aCurDate_week=oWeekDate.setDate(oWeekDate.addDate(sCurSelect_date,-7));
        $("span.now-date").html(aCurDate_week[0].date+" - "+aCurDate_week[6].date);

        // 单元格
        oCell.init();

        // 加载时间节点
        loadTimeNode();

        // 根据当前日期设置单元格是否可选
        oCell.setTdStyle();
    });

    // 切换到后一周
    $("#next-day").bind("click", function () {
        // 获取前一周的日期
        aCurDate_week=oWeekDate.setDate(oWeekDate.addDate(sCurSelect_date,7));
        $("span.now-date").html(aCurDate_week[0].date+" - "+aCurDate_week[6].date);

        // 单元格
        oCell.init();

        // 加载时间节点
        loadTimeNode();

        // 根据当前日期设置单元格是否可选
        oCell.setTdStyle();
    });

    // 切换到今天日期
    $(".title-today").click(function () {
        sCurSelect_date = new Date();

        // 获取本周日期
        aCurDate_week=setDate(sCurSelect_date);
        $("span.now-date").html(aCurDate_week[0].date+" - "+aCurDate_week[6].date);
        $(this).addClass("active");

        // 单元格
        oCell.init();

        // 加载时间节点
        loadTimeNode();

        // 根据当前日期设置单元格是否可选
        oCell.setTdStyle();
    });

    // 增加会议
    $("div.addMetting").click(function () {
        nui.open({
            url: contextPath + "/officeaffairs/hygl/hysq/hysqb.jsp",
            title: "申请会议表单",
            width: "880px",
            height: "650px",
            onload: function () {
                var formData = {};

                formData.hysq = {};
                formData.hysq.hyrq = sCurSelect_date;
                formData.chry = sUserName;
                formData.hysq.fqrmc = sUserName;
                formData.hysq.fqrid = sUserId;
                formData.hysq.fqrjgmc = sFqrbm;

                var iframe = this.getIFrameEl();
                iframe.contentWindow.setData(formData);
            },
            ondestroy: function (action) {
                var iframe = this.getIFrameEl();
                var oFrameData = iframe.contentWindow.getData();

                if (action == "ok") {
                    console.log(oFrameData);

                    oFrameData.hysq.hykssj = nui.formatDate(oFrameData.hysq.hyrq, "yyyy-MM-dd") + " " + oFrameData.hysq.hykssj + ":00";
                    oFrameData.hysq.hyjssj = nui.formatDate(oFrameData.hysq.hyrq, "yyyy-MM-dd") + " " + oFrameData.hysq.hyjssj + ":00";

                    var $divMeeting;
                    var _startIndex;
                    var _endIndex;
                    var nWidth;
                    var nOffset_top;
                    var nOffset_left;
                    var sTime;
                    var sStart_time;
                    var sEnd_time;

                    // 获取对应会议室位置
                    $(".first_td").each(function () {
                        if ($(this).attr("name") == oFrameData.hysq.hysid) {
                            nOffset_top = $(this).offset().top;

                            $divMeeting = $(this).parent(".meeting_eq");
                            return false;
                        }
                    });

                    $divMeeting.find(".td_time").each(function () {
                        sStart_time = oFrameData.hysq.hykssj.substring(11, 16);

                        if ($(this).attr("name").toString().substring(0, 5) == sStart_time) {
                            nOffset_left = $(this).offset().left;

                            _startIndex = $(this).index();
                            return false;
                        }
                    });

                    $divMeeting.find(".td_time").each(function () {
                        sEnd_time = oFrameData.hysq.hyjssj.substring(11, 16);
                        ;

                        if ($(this).attr("name").toString().substring(6, 11) == sEnd_time) {
                            nWidth = $(this).offset().left - nOffset_left;

                            _endIndex = $(this).index();
                            return false;
                        }
                    });

                    for (var j = _startIndex; j < _endIndex + 1; j++) {
                        $divMeeting.find(".td_time").eq(j).addClass("hasSelect");
                    }

                    sTime = sStart_time + "-" + sEnd_time;

                    oMeetting.init(oFrameData.hysq, sTime, nWidth, nOffset_top, nOffset_left);
                }
            }
        });
    });
}

// 获取一周的日期
var oWeekDate={
    formatDate : function(date){
        var year = date.getFullYear()+'-';
        var month = (date.getMonth()+1)+'-';
        var day = date.getDate();
        var week = ['星期天','星期一','星期二','星期三','星期四','星期五','星期六'][date.getDay()];

        // 月的格式
        if(month.length<3){
            month="0"+month;
        }

        // 日的格式
        if(day<10){
            day="0"+day;
        }

        var oDate={
            date: year+month+day,
            week:week
        };

        return oDate;
    },

    addDate : function(date,n){
        date.setDate(date.getDate()+n);
        return date;
    },

    setDate : function(date){
        var aDate=[];
        var week = date.getDay()-1;
        date = this.addDate(date,week*-1);
        sCurSelect_date = new Date(date);

        for(var i = 0;i<7;i++){
            aDate.push(this.formatDate(i==0 ? date : this.addDate(date,1)));
        }

        return aDate;
    }
};

// 单元格
var oCell={
    init:function () {
        // 初始化div容器
        $(".mettingContent").html("");

        var that = this;
        var sName;
        var sTime;
        var sClassName;

        for (var i = 0; i < 29; i++) {
            // 计算当前单元格代表的时间
            sTime = 8 + parseInt(i / 2);

            if (i % 2 == 0) {
                sClassName = "dotted";

                if (sTime < 10) {
                    sName = "0" + sTime + ":00-" + "0" + sTime + ":30";
                } else {
                    sName = sTime + ":00-" + sTime + ":30";
                }
            } else {
                sClassName = "";

                if (sTime == 8) {
                    sName = "0" + sTime + ":30-" + "0" + (parseInt(sTime) + 1) + ":00";
                } else if (sTime == 9) {
                    sName = "0" + sTime + ":30-" + (parseInt(sTime) + 1) + ":00";
                } else {
                    sName = sTime + ":30-" + (parseInt(sTime) + 1) + ":00";
                }
            }

            that.loadTd(sClassName,sName);
        }

        // 设置单元格的样式
        var nWidth_content = $(".mettingContent").width();
        var nWidth_td = (nWidth_content - 101) / 7;

        $(".td_time").css("width", nWidth_td-5 + "px");

        // 自定义选择日程
        that.selectTd();
    },
    
    // 生成一行单元格
    loadTd:function (sClassName,sName) {
        var sStr = '';
        var sDate;
        var sWeek;

        for (var i=0;i<7;i++){
            sDate=aCurDate_week[i].date;
            sWeek=aCurDate_week[i].week;

            sStr += '<div class="td_time ' + sClassName + '" id="td_' + i + '" week="'+sWeek+'" date="'+sDate+'" name="' + sName + '"></div>';
        }

        var sHtml = '<div class="meeting_eq clear">' +
            '<div class="first_td">' + sName.substring(0,5) + '</div>' + sStr +
            '</div>';

        $(".mettingContent").append(sHtml);
    },

    // 根据当前日期设置单元格样式
    setTdStyle: function () {
        var _date = new Date(formatDate(new Date(), true));

        // 判断一周的日期
        for(var i=0;i<aCurDate_week.length;i++){
            var _sCurSelect_date = new Date(aCurDate_week[i].date);

            // 系统当前日期超过选中日期
            if (_date.getTime() > _sCurSelect_date.getTime()) {
               /* $(".mettingContent .meeting_eq .td_time").each(function () {
                    $(this).addClass("failTime");
                });*/

                $(".mettingContent .meeting_eq .td_time[date='"+aCurDate_week[i].date+"']").addClass("failTime");

                // 系统当前日期没有超过选中日期
            } else if (_date.getTime() < _sCurSelect_date.getTime()) {
                /*$(".mettingContent .meeting_eq .td_time").each(function () {
                    $(this).removeClass("failTime");
                });*/
            } else if (_date.getTime() == _sCurSelect_date.getTime()) {
                // 处理时间单元格样式
                this.formatTd(aCurDate_week[i].date);
            }
        }
    },

    // 选取会议时间段
    selectTd: function () {
        var sStartTime; // 会议开始时间
        var sEndTime;  // 会议结束时间

        var nX_start; // 当前会议信息left偏移量
        var nY_start; // 当前会议信息top偏移量
        var nY_end;   // 选取结束的时间节点

        var bNow = true; // 当前时间段有效

        // 鼠标按下事件
        $(".td_time").mousedown(function (e) {
            if(e.which==1){ // 左键
                mouseDownFlag = true;

                $(".msg_1").addClass("msg_select");

                // 选择正确的时间段才可申请会议
                if ($(this).hasClass("failTime")) {
                    mouseDownFlag = false;
                    bNow = false;
                } else {
                    bNow = true;
                    sStartTime = $(this).attr("name");

                    nX_start = $(this).offset().left;
                    nY_start = $(this).offset().top;

                    $("#addMeeting").remove();
                    // 创建会议日程
                    var sStr_div = '<div class="msg_1" id="addMeeting">新建会议日程</div>';
                    $(".mettingMsg").append(sStr_div);

                    $("#addMeeting").offset({top: nY_start, left: nX_start+12});
                    $("#addMeeting").css({"height": $(this).height() + "px","width":$(this).width()-24 + "px"});
                }
            }
        });

        // 选中区域
        $(".td_time").mouseover(function () {
            if (mouseDownFlag == true) {
                // 设置新建会议日程的样式
                var nOffset_y = $(this).offset().top;
                var nOffset_x = $(this).offset().left;

                if (nOffset_y <= nY_start) {
                    $("#addMeeting").offset({top: nOffset_y, left: nOffset_x+12});
                    $("#addMeeting").css("height", nY_start - nOffset_y + $(this).height() + "px");
                } else {
                    $("#addMeeting").offset({top: nY_start, left: nOffset_x+12});
                    $("#addMeeting").css("height", nOffset_y - nY_start + $(this).height() + "px");
                }
            }
        });

        $(".td_time").mouseup(function (e) {
            if(e.which==1){
                var bSelect = true;
                $(".msg_1").removeClass("msg_select");

                if ($(this).hasClass("failTime")) {
                    mouseDownFlag = false;

                    if (bNow == true) {
                        alert("请选择正确的时间段");
                        $("#addMeeting").remove();
                    }
                } else {
                    nY_end = $(this).offset().top;
                    sEndTime = $(this).attr("name");
                    mouseDownFlag = false;

                    // 设置会议信息样式
                    var sName;
                    var nStartIndex;
                    var nEndIndex

                    // 右往左选中单元格
                    if (nY_start > nY_end) {
                        nStartIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sEndTime + "']").index();
                        nEndIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sStartTime + "']").index();

                        sName = sEndTime.substring(0, 5) + "-" + sStartTime.substring(6, 11);
                    } else {
                        nStartIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sStartTime + "']").index();
                        nEndIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sEndTime + "']").index();

                        sName = sStartTime.substring(0, 5) + '-' + sEndTime.substring(6, 11);
                    }

                    for (var i = nStartIndex; i < nEndIndex + 1; i++) {
                        if ($(this).parent(".meeting_eq").find(".td_time").eq(i).hasClass("hasSelect")) {
                            mouseDownFlag = false;
                            bSelect = false;

                            alert("请选择正确的时间段");
                            $("#addMeeting").remove();

                            return false;
                        }
                    }

                    if (bSelect == true) {
                        // 当前时间单元格的信息
                        nY_start = $(this).offset().top;

                        // 申请会议表单
                        var formData = {};

                        formData.hysq = {};
                        formData.hysq.hyrq = sCurSelect_date;
                        formData.hysq.hykssj = sName.substring(0, 5);
                        formData.hysq.hyjssj = sName.substring(6, 11);
                        formData.chry = sUserName;
                        formData.hysq.fqrmc = sUserName;
                        formData.hysq.fqrid = sUserId;
                        formData.hysq.fqrjgmc = sFqrbm;

                        // 跳转到新窗口
                        var sUrl=contextPath + "/officeaffairs/hygl/hysq/hysqb.jsp";
                        var sJson=JSON.stringify(formData);
                        sUrl=sUrl+"?json="+sJson;

                        window.open(sUrl);
                    }
                }
            }
        });
    },

    // 不合理的单元格样式处理
    formatTd: function (today) {
        // 获取系统当前时间
        var cur_date = new Date();
        var sCur_hour = cur_date.getHours();
        var sTd_hour;
        var _date = new Date(formatDate(new Date(), true));
        var _tdDate;

        $(".mettingContent .meeting_eq .td_time[date='"+today+"']").each(function () {
            sTd_hour = $(this).attr("name").substring(6, 8);
            _tdDate = new Date(formatDate(new Date($(this).attr("date")), true));

            // 当前时间大于单元格时间则背景为灰
            if (Number(sCur_hour) >= Number(sTd_hour)&&_tdDate.getTime()<=_date.getTime()) {
                $(this).addClass("failTime");
            }
        });
    }
}

// 会议日程
var oMeetting = {
    init: function (data, sName, nWidth, nY_start, nLeft) {
        var that = this;

        // 加载会议信息
        that.loadMeetingMsg(data, sName, nWidth, nY_start, nLeft);
    },

    // 增加会议信息
    loadMeetingMsg: function (data, sName, nWidth, nY_start, nLeft) {
        var sWeekDay = formatWeek();
        var _sDate = formatDate(new Date(data.hykssj.substring(0, 11)), true);
        var sDate = _sDate.substring(5, 11);
        var sTitle = '会议主题：' + data.hyzt + '#会议室：' + data.hysmc + '#会议时间：' + sDate + '(' + sWeekDay + ')' + sName;
        var sClass_spzt;
        var sClass_click;

        if (data.spzt == "1") {
            sClass_spzt = "msg_ypz";
        } else {
            sClass_spzt = "";
        }

        if(data.chry&&data.chry.indexOf(sUserId)>-1){
            sClass_click="msg_click";
        }else{
            sClass_click="";
        }

        // 生成会议信息
        var sId = randomstring(5);
        var sStr = '<div class="msg_1 ' + sClass_spzt +" "+sClass_click+ '" id="' + sId + '" title="' + sTitle + '" chryid="'+data.chry+'" hysqid="' + data.hysqid + '" name="' + sName + '">' + data.hyzt + '</div>';

        $(".mettingMsg").append(sStr);
        var _tdWidth = $(".td_time").eq(0).width();

        $("#" + sId).css("width", nWidth + _tdWidth + "px");
        $("#" + sId).offset({top: nY_start + 12, left: nLeft});

        // 处理点击事件
        $("#" + sId).click(function (e) {
            mouseDownFlag = false;
            var _that = $(this);

            e.stopPropagation();

            if(_that.hasClass("msg_click")){
                // 打开会议申请表
                // 跳转到新窗口
                var sUrl=contextPath + "/officeaffairs/hygl/hysq/hysqb.jsp";
                var sHysqid=_that.attr("hysqid");
                sUrl=sUrl+"?hysqid="+sHysqid+"&pageHandleType=view";

                window.open(sUrl);
            }

        });
    },

    // 根据数据当前页面 生成所有的会议日程
    loadAllSchedule: function () {
        // 清空当前页面会议内容
        $("div.mettingMsg").html("");

        var sStart_time;
        var sEnd_time;
        var nWidth;
        var nOffset_top;
        var nOffset_left;
        var sTime;
        var that = this;

        var jsonData = {};
        jsonData.startTime = formatDate(sCurSelect_date, true);
        // 结束日期
        sCurSelect_date.setDate(sCurSelect_date.getDate() + 1);
        jsonData.endTime = formatDate(sCurSelect_date, true);
        // 回复当前日期
        sCurSelect_date.setDate(sCurSelect_date.getDate() - 1);

        // 展现会议日程
        $.ajax({
            url: "com.geostar.gtgh.oa.officeaffairs.Hysq.queryHysq.biz.ext",  //请求地址
            data: nui.decode(jsonData),
            async: false,
            type: "POST",      //请求方式
            dataType: "json",
            success: function (msg) {
                console.log(msg);

                var $divMeeting;
                var _startIndex;
                var _endIndex;

                if (msg.data && msg.data != null && msg.data.length > 0 && msg.data[0] != null) {
                    var data = msg.data;
                    for (var i = 0; i < data.length; i++) {
                        if (data[i] != null) {
                        	//会议室是否存在
                        	var isHysExist = false;
                            // 获取对应会议室位置
                            $(".first_td").each(function () {
                                if ($(this).attr("name") == data[i].hysid) {
                                    nOffset_top = $(this).offset().top;

                                    $divMeeting = $(this).parent(".meeting_eq");
                                    isHysExist = true;
                                    return false;
                                }
                            });
                            //会议室不存在
                            if(!isHysExist){
                            	continue;
                            }

                            $divMeeting.find(".td_time").each(function () {
                                sStart_time = data[i].hykssj.substring(11, 16);

                                if ($(this).attr("name").toString().substring(0, 5) == sStart_time) {
                                    nOffset_left = $(this).offset().left;

                                    _startIndex = $(this).index();
                                    return false;
                                }
                            });

                            $divMeeting.find(".td_time").each(function () {
                                sEnd_time = data[i].hyjssj.substring(11, 16);

                                if ($(this).attr("name").toString().substring(6, 11) == sEnd_time) {
                                    nWidth = $(this).offset().left - nOffset_left;

                                    _endIndex = $(this).index();
                                    return false;
                                }
                            });

                            for (var j = _startIndex; j < _endIndex + 1; j++) {
                                $divMeeting.find(".td_time").eq(j).addClass("hasSelect");
                            }

                            sTime = sStart_time + "-" + sEnd_time;
                            that.loadMeetingMsg(data[i], sTime, nWidth, nOffset_top, nOffset_left);
                        }
                    }
                }
            }
        });
    }
}

// 加载时间节点
function loadTimeNode() {
    // 初始化div容器
    $(".time_node").html("");

    var sStr = '';
    var sDate;
    var sWeek;

    for (var i = 0; i < 7; i++) {
        sDate=aCurDate_week[i].date;
        sWeek=aCurDate_week[i].week;

        sStr = '<div class="time_eq" week="'+sWeek+'" date="'+sDate+'">' + sDate.substring(5,10)+'('+sWeek+')' + '</div>';

        $(".time_node").append(sStr);
    }

    var nWidth_td = parseFloat(document.getElementById("td_0").style.width);

    $(".time_eq").css("width", nWidth_td  + "px");
}

// 日期格式化 cur_date-日期
function formatDate(cur_date, format) {
    var cur_year = cur_date.getFullYear();
    var cur_month = cur_date.getMonth() + 1;
    var real_date = cur_date.getDate();

    // 字段为1 用0补齐
    if (cur_month.toString().length == 1) {
        cur_month = "0" + cur_month;
    }

    // 字段为1 用0补齐
    if (real_date.toString().length == 1) {
        real_date = "0" + real_date;
    }

    if (format) {
        return cur_year + "-" + cur_month + "-" + real_date;
    } else {
        return cur_year + "年" + cur_month + "月" + real_date + "日" + "  " + formatWeek();
    }
}

// 格式化星期
function formatWeek() {
    var nIndex = sCurSelect_date.getDay();
    var aDay = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];

    return aDay[nIndex];
}

// 随即生成字符串
function randomstring(L) {
    var s = '';
    var randomchar = function () {
        var n = Math.floor(Math.random() * 62);
        if (n < 10) return n; //1-10
        if (n < 36) return String.fromCharCode(n + 55); //A-Z
        return String.fromCharCode(n + 61); //a-z
    };

    while (s.length < L) s += randomchar();
    return s;
}

// 日期选择器切换日期
function changeDate() {
    // 页面当前日期
    sCurSelect_date = new Date(this.getFormValue());

    // 获取本周日期
    aCurDate_week=oWeekDate.setDate(sCurSelect_date);
    $("span.now-date").html(aCurDate_week[0].date+" - "+aCurDate_week[6].date);

    // 初始化单元格
    oCell.init();

    // 加载时间节点
    loadTimeNode();

    // 根据当前日期设置单元格是否可选
    oCell.setTdStyle();
}
