/*
 * 描        述：日程日历.
 * 版权所有：武大吉奥信息技术有限公司
 * 修  改  者：yangtingting
 * 联系方式：yangtingting@geostar.com.cn 
 */

$(function () {
    // 设置容器的高度
    $("td").css("padding", "0");
    var nWindowH = $(window).height() - 100;
    if (nWindowH < 550) {
        nWindowH = 600 - 40;//2019-4-30 最少设置高度。
        $(".hysq-content").addClass("hysq-content_1366");
    }
    $(".hysq-content").css("height", nWindowH + "px");

    // 加载第一行
    loadHead();

    // 加载单元格
    oCell.init();

    // 加载时间节点
    loadTimeNode();

    // 展现会议日程
    oMeetting.loadAllSchedule();
    
    //20167-12-19 wuguang 隐藏会议日程上"日"、"周"的选择
    $(".day_week").hide();
    
    
    // 窗口大小发生变化后重新渲染表格元素
    window.onresize = function(){
    	window.location.reload();
    }
    
});

// 是否支持拖拽选择
var mouseDownFlag = false;
// 系统当前日期
var sCurSelect_date = new Date();

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
//    $(".date-show").css("left", "calc(50% - 143px)");
    $("span.now-date").html(formatDate(sCurSelect_date));

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

//    $(".logo_left").offset({left: _offsetLeft_left - 70, top: _offsetTop - 30});
//    $(".logo_right").offset({left: _offsetLeft + _nWidth + 20, top: _offsetTop - 30});
    $(".logo_left").offset({top: _offsetTop - 30});
    $(".logo_right").offset({top: _offsetTop - 30});

    // 切换到前一天
    $("#prev-day").bind("click", function () {
        // 获取前一天日期
        sCurSelect_date.setDate(sCurSelect_date.getDate() - 1);
        $("span.now-date").html(formatDate(sCurSelect_date));

        // 是否是今天
        var _date = new Date();

        if (sCurSelect_date.getDate() == _date.getDate()) {
            $(".title-today").addClass("active");
        } else {
            $(".title-today").removeClass("active");
        }

        // 单元格
        oCell.init();

        // 根据当前日期设置单元格是否可选
        oCell.setTdStyle();

        // 加载当前日期所有的日程
        oMeetting.loadAllSchedule();
    });

    // 切换到后一天
    $("#next-day").bind("click", function () {
        // 获取前一天日期
        sCurSelect_date.setDate(sCurSelect_date.getDate() + 1);
        $("span.now-date").html(formatDate(sCurSelect_date));

        var _date = new Date();
        // 是否是今天
        if (sCurSelect_date.getDate() == _date.getDate()) {
            $(".title-today").addClass("active");
        } else {
            $(".title-today").removeClass("active");
        }

        // 单元格
        oCell.init();

        // 根据当前日期设置单元格是否可选
        oCell.setTdStyle();

        // 加载当前日期所有的日程
        oMeetting.loadAllSchedule();
    });

    // 切换到今天日期
    $(".title-today").click(function () {
        sCurSelect_date = new Date();

        $(this).addClass("active");
        $("span.now-date").html(formatDate(sCurSelect_date));

        // 单元格
        oCell.init();

        // 根据当前日期设置单元格是否可选
        oCell.setTdStyle();

        // 加载当前日期所有的日程
        oMeetting.loadAllSchedule();
    });

    // 增加会议
    $("div.addMetting").click(function () {
        var formData = {};
        // 会议数据
        formData.hysq = {};
        formData.hysq.hyrq = sCurSelect_date;
        //formData.chry = sUserName;
        //formData.hysq.fqrmc = sUserName;
        //formData.hysq.fqrid = sUserId;
        //formData.hysq.fqrjgmc = sFqrbm;

        // 跳转到新窗口
        var sUrl = contextPath + "/ame_dailyoffice/SealGovern/hygl/hysq/hysp.jsp";
        var sJson = JSON.stringify(formData);

        sUrl = sUrl + "?json=" + sJson;
        oMeetting.addMeetingData(sUrl);
        //window.open(sUrl);

    });

    // 点击切换周页面
    $("div.title-week").click(function(){
        window.location.href=contextPath+"/ame_dailyoffice/SealGovern/hygl/hyrcWeek/hyrcWeek.jsp";
    });
}

// 时间单元格
var oCell = {
    // 初始化
    init: function () {
        // 初始化div容器
        $(".mettingContent").html("");

        var that = this;
        // 获取所有会议室信息
        nui.ajax({
            url: 'com.primeton.eos.ame_dailyoffice.Hysxx.queryHysxxList.biz.ext', // 逻辑流
            type: 'POST',
            cache: false,
            async: false,
            data : {hyszt : "true"},
            contentType: 'text/json',
            success: function (text) {
                if (text.hysxxList && text.hysxxList.length > 0) {
                    var aRoom = text.hysxxList;

                    // 加载单元格
                    for (var i = 0; i < aRoom.length; i++) {
                        that.loadTd(i, aRoom[i]);
                    }

                    // 设置单元格的样式
                    var nWidth_content = $(".mettingContent").width();
                    var nWidth_td = (nWidth_content - 101) / 23;

                    $(".td_time").css("width", nWidth_td + "px");

                    // 不合理的时间单元格背景做处理
                    that.formatTd();

                    // 选中单元格区域
                    that.selectTd();
                } else {
                    $(".time_node").html("没有会议室信息");
                }
            }
        });
    },

    // 生成一行单元格
    loadTd: function (index, room) {
        var sStr = '';
        var sName;
        var sTime;
        var sClassName;

        for (var i = 0; i < 23; i++) {
            // 计算当前单元格代表的时间
            sTime = 9 + parseInt(i / 2);

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

            sStr += '<div class="td_time ' + sClassName + '" id="td_' + i + '" name="' + sName + '"></div>';
        }

        // 生成html
        var sHtml = '<div class="meeting_eq clear" id="room_' + index + '">' +
        '<div class="first_td" hydd="' + room.dz + '" hysbh="' + room.hysbh + '" name="' + room.hysid + '" onClick="addOrEdit(\'' + room.hysid + '\')">' + room.hysmc + '</div>' + sStr +
            '</div>';

        $(".mettingContent").append(sHtml);
    },

    // 不合理的单元格样式处理
    formatTd: function () {
        // 获取系统当前时间
        var cur_date = new Date();
        var sCur_hour = cur_date.getHours();
        var sCur_minute = cur_date.getMinutes();
        var sTd_hour,sTd_minute;

        $(".mettingContent .meeting_eq .td_time").each(function () {
            sTd_hour = $(this).attr("name").substring(6, 8);
            sTd_minute = $(this).attr("name").substring(9);
            // 当前时间大于单元格时间则背景为灰
            sTd_hour = Number(sTd_hour);
            sCur_hour = Number(sCur_hour);
            if(Number(sTd_minute) == 0 && Number(sCur_minute) >= 30){
            	sTd_hour = Number(sTd_hour) - 1; 
            }
            if (sCur_hour >= sTd_hour) {
                $(this).addClass("failTime");
            }
        });
    },

    // 选取会议时间段
    selectTd: function () {
        var sId_hys;      //选择当前会议室的id
        var sStartTime; // 会议开始时间
        var sEndTime;  // 会议结束时间

        var nX_start; // 当前会议信息left偏移量
        var nY_start; // 当前会议信息top偏移量
        var nX_end;   // 选取结束的时间节点

        var sRoomName;
        var sHysid;   // 会议室id
        var bNow = true; // 当前时间段有效

        // 鼠标按下事件
        $(".td_time").mousedown(function (e) {
            if (e.which == 1) { // 左键
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

                    // 创建会议日程
                    $("#addMeeting").remove();
                    var sStr_div = '<div class="msg_1" id="addMeeting">新建会议日程</div>';
                    $(".mettingMsg").append(sStr_div);

                    $("#addMeeting").offset({top: nY_start + 12, left: nX_start});
                    $("#addMeeting").css("width", $(this).width() + "px");
                }
            }
        });

        // 选中区域 鼠标经过
        $(".td_time").mouseover(function () {
            if (mouseDownFlag == true) {
                // 获取当前单元格代表的时间
                var sName = $(this).attr("name");

                // 设置新建会议日程的样式
                var nOffset_y = $(this).offset().top;
                var nOffset_x = $(this).offset().left;

                if (nOffset_x <= nX_start) {
                    $("#addMeeting").offset({top: nOffset_y + 12, left: nOffset_x});
                    $("#addMeeting").css("width", nX_start - nOffset_x + $(this).width() + "px");
                } else {
                    $("#addMeeting").offset({top: nOffset_y + 12, left: nX_start});
                    $("#addMeeting").css("width", nOffset_x - nX_start + $(this).width() + "px");
                }
            }
        });

        // 结束选中时间段
        $(".td_time").mouseup(function (e) {
            
        	if (e.which == 1) {
                var bSelect = true;
                // 鼠标左键
                $(".msg_1").removeClass("msg_select");

                if ($(this).hasClass("failTime")) {
                    mouseDownFlag = false;

                    if (bNow == true) {
                        alert("请选择正确的时间段");
                        $("#addMeeting").remove();
                    }
                } else {
                    nX_end = $(this).offset().left;
                    sEndTime = $(this).attr("name");
                    mouseDownFlag = false;
                   if(nX_start==nX_end){//如果是某一个时间点的话则不触发事件
                	   return;
                   }
                    // 设置会议信息样式
                    var nWidth;
                    var sName;
                    var nStartIndex;
                    var nEndIndex
                    var nLeft;
                    var sHysdd;

                    // 右往左选中单元格
                    if (nX_start > nX_end) {
                        nStartIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sEndTime + "']").index();
                        nEndIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sStartTime + "']").index();

                        // 设置开始时间、结束时间
                        nWidth = nX_start - nX_end;
                        nLeft = nX_end;
                        sName = sEndTime.substring(0, 5) + "-" + sStartTime.substring(6, 11);
                    } else {
                        nStartIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sStartTime + "']").index();
                        nEndIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sEndTime + "']").index();

                        // 设置开始时间、结束时间
                        nWidth = nX_end - nX_start;
                        nLeft = nX_start;
                        sName = sStartTime.substring(0, 5) + '-' + sEndTime.substring(6, 11);
                    }

                    // 设置选中单元格样式
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
                        sRoomName = $(this).parent(".meeting_eq").find(".first_td").html();
                        // 当前会议室信息id
                        sHysid = $(this).parent(".meeting_eq").find(".first_td").attr("name");
                        sHysdd = $(this).parent(".meeting_eq").find(".first_td").attr("hydd");

                        // 当前时间单元格的信息
                        nY_start = $(this).offset().top;

                        var _that = $(this);
                        // 申请会议表单
                        var formData = {};

                        // 会议数据
                        formData.hysq = {};
                        formData.hysq.hysid = sHysid;
                        formData.hysq.hysmc = sRoomName;
                        formData.hysq.hyrq = sCurSelect_date;

                        //2017-12-28 wuguang 根据需求,修改申请会议时默认将会议时长更改为三小时
                        var sHykssj = sName.substring(0, 5);         //会议开始时间
                        var aHykssj = sHykssj.split(":");
                        //var nHykssj = aHykssj[0]*60 + aHykssj[1]*1;
                        
                        var sHyjssj = sName.substring(6, 11);        //会议结束时间
                        var aHyjssj = sHyjssj.split(":");
                        //var nHyjssj = aHyjssj[0]*60 + aHyjssj[1]*1;
                        
                        /*var sHysc = nHyjssj - nHykssj;				 //会议时长
                        //如果会议时长不超过三个小时,默认将持续时间改成三个小时
                        if(sHysc < 180){
                        	var sHyksHour = sName.substring(0, 2);   //会议开始时间，小时数
                        	var sHyjsHour = Number(sHyksHour) + 3;
                        	
                        	var sHyksMin = sName.substring(3, 5);    //会议开始时间，分钟数
                        	var sHyjsMin = sHyksMin;
                        	
                        	if(sHyjsHour * 60 + sHyjsMin * 1 >= 1050){
                        		sHyjsHour = 17;
                        		sHyjsMin = "30";
                        	}
                        	sHyjssj = sHyjsHour + ":" + sHyjsMin;    //拼成会议结束时间
                        }*/
                        
                        formData.hysq.hykssj = sHykssj;
                        formData.hysq.hyjssj = sHyjssj;
                        //formData.chry = sUserName;
                        //formData.hysq.hydd = sHysdd;
                        //formData.hysq.fqrmc = sUserName;
                        //formData.hysq.fqrid = sUserId;
                        //formData.hysq.fqrjgmc = sFqrbm;

                        // 跳转到新窗口
                        var sUrl = contextPath + "/ame_dailyoffice/SealGovern/hygl/hysq/hysp.jsp";
                        var sJson = JSON.stringify(formData);
                        sUrl = sUrl + "?json=" + sJson;

                        oMeetting.addMeetingData(sUrl);
                        //window.open(sUrl);
                    }
                }
            }
        });
        
        // 结束选中时间段
        $(".td_time").dblclick(function (e) {
            
        	if (e.which == 1) {
                var bSelect = true;
                // 鼠标左键
                $(".msg_1").removeClass("msg_select");

                if ($(this).hasClass("failTime")) {
                    mouseDownFlag = false;

                    if (bNow == true) {
                        alert("请选择正确的时间段");
                        $("#addMeeting").remove();
                    }
                } else {
                    nX_end = $(this).offset().left;
                    sEndTime = $(this).attr("name");
                    mouseDownFlag = false;
                    // 设置会议信息样式
                    var nWidth;
                    var sName;
                    var nStartIndex;
                    var nEndIndex
                    var nLeft;
                    var sHysdd;

                    // 右往左选中单元格
                    if (nX_start > nX_end) {
                        nStartIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sEndTime + "']").index();
                        nEndIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sStartTime + "']").index();

                        // 设置开始时间、结束时间
                        nWidth = nX_start - nX_end;
                        nLeft = nX_end;
                        sName = sEndTime.substring(0, 5) + "-" + sStartTime.substring(6, 11);
                    } else {
                        nStartIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sStartTime + "']").index();
                        nEndIndex = $(this).parent(".meeting_eq").find(".td_time[name='" + sEndTime + "']").index();

                        // 设置开始时间、结束时间
                        nWidth = nX_end - nX_start;
                        nLeft = nX_start;
                        sName = sStartTime.substring(0, 5) + '-' + sEndTime.substring(6, 11);
                    }

                    // 设置选中单元格样式
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
                        sRoomName = $(this).parent(".meeting_eq").find(".first_td").html();
                        // 当前会议室信息id
                        sHysid = $(this).parent(".meeting_eq").find(".first_td").attr("name");
                        sHysdd = $(this).parent(".meeting_eq").find(".first_td").attr("hydd");

                        // 当前时间单元格的信息
                        nY_start = $(this).offset().top;

                        var _that = $(this);
                        // 申请会议表单
                        var formData = {};

                        // 会议数据
                        formData.hysq = {};
                        formData.hysq.hysid = sHysid;
                        formData.hysq.hysmc = sRoomName;
                        formData.hysq.hyrq = sCurSelect_date;

                        //2017-12-28 wuguang 根据需求,修改申请会议时默认将会议时长更改为三小时
                        var sHykssj = sName.substring(0, 5);         //会议开始时间
                        var aHykssj = sHykssj.split(":");
                        //var nHykssj = aHykssj[0]*60 + aHykssj[1]*1;
                        
                        var sHyjssj = sName.substring(6, 11);        //会议结束时间
                        var aHyjssj = sHyjssj.split(":");
                        //var nHyjssj = aHyjssj[0]*60 + aHyjssj[1]*1;
                        
                        /*var sHysc = nHyjssj - nHykssj;				 //会议时长
                        //如果会议时长不超过三个小时,默认将持续时间改成三个小时
                        if(sHysc < 180){
                        	var sHyksHour = sName.substring(0, 2);   //会议开始时间，小时数
                        	var sHyjsHour = Number(sHyksHour) + 3;
                        	
                        	var sHyksMin = sName.substring(3, 5);    //会议开始时间，分钟数
                        	var sHyjsMin = sHyksMin;
                        	
                        	if(sHyjsHour * 60 + sHyjsMin * 1 >= 1050){
                        		sHyjsHour = 17;
                        		sHyjsMin = "30";
                        	}
                        	sHyjssj = sHyjsHour + ":" + sHyjsMin;    //拼成会议结束时间
                        }*/
                        
                        formData.hysq.hykssj = sHykssj;
                        formData.hysq.hyjssj = sHyjssj;
                        //formData.chry = sUserName;
                        //formData.hysq.hydd = sHysdd;
                        //formData.hysq.fqrmc = sUserName;
                        //formData.hysq.fqrid = sUserId;
                        //formData.hysq.fqrjgmc = sFqrbm;

                        // 跳转到新窗口
                        var sUrl = contextPath + "/ame_dailyoffice/SealGovern/hygl/hysq/hysp.jsp";
                        var sJson = JSON.stringify(formData);
                        sUrl = sUrl + "?json=" + sJson;

                        oMeetting.addMeetingData(sUrl);
                        //window.open(sUrl);
                    }
                }
            }
        });
    },

    // 根据当前日期设置单元格样式
    setTdStyle: function () {
        // 系统当前日期
        var _date = new Date(formatDate(new Date(), true));
        // 选中当前日期
        var _sCurSelect_date = new Date(formatDate(sCurSelect_date, true));

        // 系统当前日期超过选中日期
        if (_date.getTime() > _sCurSelect_date.getTime()) {
            $(".mettingContent .meeting_eq .td_time").each(function () {
                $(this).addClass("failTime");
            });

            // 系统当前日期没有超过选中日期
        } else if (_date.getTime() < _sCurSelect_date.getTime()) {
            $(".mettingContent .meeting_eq .td_time").each(function () {
                $(this).removeClass("failTime");
            });
        } else if (_date.getTime() == _sCurSelect_date.getTime()) {
            $(".mettingContent .meeting_eq .td_time").removeClass("failTime");

            // 处理时间单元格样式
            this.formatTd();
        }
    }
};

// 会议日程
var oMeetting = {
    init: function (data, sName, nWidth, nY_start, nLeft) {
        var that = this;
        // 加载会议信息
        that.loadMeetingMsg(data, sName, nWidth, nY_start, nLeft);
    },

    // 增加会议信息
    loadMeetingMsg: function (data, sName, nWidth, nY_start, nLeft) {
    	var that=this;
        var sWeekDay = formatWeek();
    //    var _sDate = formatDate(new Date(data.hykssj.substring(11, 21)), true);
        var _sDate=data.hykssj.substring(11, 21);//会议开始时间
        var sDate = _sDate.substring(0, 5);//会议结束时间
        var _jDate=data.hyjssj.substring(11, 21);//会议结束时间
        var jDate = _jDate.substring(0, 5);//会议结束时间

        //查会议室信息
        
        
        
        var sTitle = '会议主题：' + data.hyzt + '#会议室：' + data.hysmc + '#会议时间：' + sDate + '(' + sWeekDay + ')' + sName;
        var sClass_spzt;
        var sClass_click;
        var sFqrid = data.fqrid;

        if (data.spzt == "1") {
            sClass_spzt = "msg_ypz";
        } else {
            sClass_spzt = "";
        }
        
        
        //2017-12-19 wuguang 让会议发起人、会议申请人、参会人员、会议准备者都能从会议日程中点进会议的表单查看
//        var sHyxgry;                //会议相关人员
//        var sFqrid = data.fqrid;    //会议发起人
//        var sSqrid = data.sqrid;    //会议申请人
//        var sChryid = data.chry     //参会人员（包括会议准备人）
//        sHyxgry = sFqrid + "," + sSqrid + "," + sChryid;
//        if (sHyxgry && sHyxgry.indexOf(sUserId) > -1) {
//            sClass_click = "msg_click";
//        } else {
//            sClass_click = "";
//        }

        sClass_click = "msg_click";
        
        // 生成会议信息
        var sId = randomstring(5);
        var sStr = '<div style="overflow: hidden;text-overflow: ellipsis;" class="msg_1 ' + sClass_spzt + " " + sClass_click + '" id="' + sId + '"chryid="' + data.chry + '" hysqid="' + data.hysqid + '" name="' + sName + '">' + data.hyzt + '</div>';

        $(".mettingMsg").append(sStr);
        var _tdWidth = $(".td_time").eq(0).width();

        $("#" + sId).css("width", nWidth + _tdWidth + "px");
        $("#" + sId).offset({top: nY_start + 12, left: nLeft});

        // 悬浮
        $("#" + sId).hover(
        	function () {
            $("b.zt").html(data.hyzt);
            $("b.zt").attr("title",data.hyzt);
            $("b.sj").html(sDate+"-"+jDate + '(' + sWeekDay + ')');
            $("b.dd").html(data.hysmc);
            //wuguang,2017-11-24,会议日程上会议信息的悬浮窗应该显示的是申请人
            $("b.ry").html(data.fqrmc);
           

//            $("#hyHover").css({"opacity":1,"z-index":15});
//            $("#hyHover").fadeIn();
            $("#hyHover").css({"z-index":15});
        	$("#hyHover").show();
            
            //弹框填充内容后的高度
        	var hyHoverHeight = $("#hyHover").height();
        	
        	//yangtingting,2017-11-20,1024分辨率和其他分辨率下日程提示弹框位置调整
        	if(screen.width > 1024){
        		if(nLeft > 950){
            		$("#hyHover").css("left",(nLeft - 220)+"px");
            	}else{
            		$("#hyHover").css("left",(nLeft + 30)+"px");
            	}

            	if(nY_start < 306){
        			$("#hyHover").css("top",(nY_start + 30)+"px");
        		}else{
        			$("#hyHover").css("top",(nY_start - hyHoverHeight - 5)+"px");
        		}
        	}else{
        		if(nLeft > 500){
            		$("#hyHover").css("left",(nLeft - $("body").scrollLeft() - 200)+"px");
            	}else{
            		$("#hyHover").css("left",(nLeft - $("body").scrollLeft() + 30)+"px");
            	}
        		
        		if(nY_start < 306){
        			$("#hyHover").css("top",(nY_start + 30)+"px");
        		}else{
        			$("#hyHover").css("top",(nY_start - hyHoverHeight - 10)+"px");
        		}
        	}
        },function(){
//            $("#hyHover").css({"opacity":0,"z-index":-1});
//        	$("#hyHover").fadeOut();
        	$("#hyHover").css({"z-index":-1});
        	$("#hyHover").hide();
        },function(){
			
	    	var hysid1=data.hysid;
	    	var json ={hysid1:hysid1}
	    	 nui.ajax({
	            url : "com.primeton.eos.ame_dailyoffice.Hysxx.queryHys.biz.ext", // 逻辑流
	            type : 'POST',
	            data : json,
	            cache : false,
	            async : false,
	            contentType : 'text/json',
	            success : function(text) {
	            	var data1=text.hysxx;
	            	 $("b.rs").html(data1.rnrs);
	                 $("b.sb").html(data1.sbms);
	            }
	    	        });
			
			
			
		});

        $("#hyHover").hover(function(){
//            $("#hyHover").css({"opacity":1,"z-index":15});
//        	$(this).fadeIn();
        	$("#hyHover").css({"z-index":15});
        	$(this).show();
        },function(){
//            $("#hyHover").css({"opacity":0,"z-index":-1});
//        	$(this).fadeOut();
        	$("#hyHover").css({"z-index":-1});
        	$(this).hide();
        });

        // 处理点击事件
        $("#" + sId).click(function (e) {
            mouseDownFlag = false;
            var _that = $(this);

            e.stopPropagation();

            if (_that.hasClass("msg_click")) {
                // 打开会议申请表
                // 跳转到新窗口
                var sUrl = contextPath + "/ame_dailyoffice/SealGovern/hygl/hysq/hysp.jsp";
                var sHysqid = _that.attr("hysqid");
                sUrl = sUrl + "?hysqid=" + sHysqid + "&pageHandleType=view";
                
                // 发起人id和登录人员的id不一样则打开的会议不可编辑
                if(sFqrid!=sUserId){
                	sUrl = sUrl + "?hysqid=" + sHysqid + "&pageHandleType=view&type=1";
                }

                that.addMeetingData(sUrl);
                //window.open(sUrl);
            }
        });

    },

    // 根据数据当前页面 生成所有的会议日程
    loadAllSchedule: function () {
        // 清空当前页面会议内容
        $("div.mettingMsg").html("");
        //清空所有带有"hasSelect"类
        $(".mettingContent").find(".hasSelect").removeClass("hasSelect");
        // 定义会议参数
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
            url: "com.primeton.eos.ame_dailyoffice.Hysxx.queryHyssy.biz.ext",  //请求地址
            data: nui.decode(jsonData),
            async: false,
            type: "POST",      //请求方式
            dataType: "json",
            success: function (msg) {
                var $divMeeting;
                var _startIndex;
                var _endIndex;

                if (msg.hygl && msg.hygl != null && msg.hygl.length > 0 && msg.hygl[0] != null) {
                    var data = msg.hygl;

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
                            
                            // 判断会议时间是否有效9:00-20:00之间是有效的
                            var nHou = parseInt(data[i].hykssj.substring(11, 13));
                            if(nHou<9||nHou>20){
                            	continue; // 结束本次循环
                            }

                            // 开始时间
                            $divMeeting.find(".td_time").each(function () {
                                sStart_time = data[i].hykssj.substring(11, 16);
                                
                                var nMin = parseInt(sStart_time.substring(3, 5));
                                var sTime = sStart_time.substring(0, 3);
                                var _startDate;
                                
                                // 判断时间是否是整点 不是整点则做处理
                                if (nMin != 0 && nMin != 30) {
                                    if (nMin < 30) {
                                        sTime = sTime + "00";
                                    } else if (nMin > 30 && nMin < 60) {
                                        sTime = sTime + "30";
                                    }

                                    _startDate = sTime
                                } else {
                                    _startDate = sStart_time
                                }

                                if ($(this).attr("name").toString().substring(0, 5) == _startDate) {
                                    nOffset_left = $(this).offset().left;

                                    _startIndex = $(this).index();
                                    return false;
                                }
                            });

                            $divMeeting.find(".td_time").each(function () {
                                sEnd_time = data[i].hyjssj.substring(11, 16);
                                
                                var nMin = parseInt(sEnd_time.substring(3, 5));
                                var sTime = sEnd_time.substring(0, 3);
                                var _endDate;
                                
                                // 判断时间是否是整点 不是整点则做处理
                                if (nMin != 0 && nMin != 30) {
                                    if (nMin < 30) {
                                        sTime = sTime + "30";
                                    } else if (nMin > 30 && nMin < 60) {
                                        sTime = (parseInt(sTime.substring(0, 2)) + 1) + ":00";
                                    }

                                    _endDate = sTime
                                } else {
                                    _endDate = sEnd_time
                                }

                                // 结束时间
                                if ($(this).attr("name").toString().substring(6, 11) == _endDate) {
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
    },
    
    addMeetingData:function(url){
    	nui.open({
            url: url,
            title: "新增会议", 
			width: 1100,
            height: 600,
            onload: function () {
            },
            ondestroy: function (action) {
            	if(action=="ok"){
            		window.location.reload();
            	}
            }
        });
    }
}

// 加载时间节点
function loadTimeNode() {
    var sStr = '';
    var sTime;

    for (var i = 9; i < 21; i++) {
        if (i < 10) {
            sTime = "0" + i + " : 00";
        } else {
            sTime = i + " : 00";
        }

        sStr = '<div class="time_eq" name="' + sTime + '">' + sTime + '</div>';

        $(".time_node").append(sStr);
    }
    
    if(!document.getElementById("td_0")){
    	return;
    }
    var nWidth_td = parseFloat(document.getElementById("td_0").style.width);

    $(".time_eq").css("width", nWidth_td * 2 + "px");
    $(".time_eq").eq(0).css("margin-left", 98 - nWidth_td + "px");
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

    $("span.now-date").html(formatDate(sCurSelect_date));

    // 根据当前日期设置单元格是否可选
    oCell.setTdStyle();
    
    // 加载当前日期所有的日程
    oMeetting.loadAllSchedule();
}

// 判断当前时间在不在某个时间段里  调用例子：time_range ("21:30", "23:30", "23:30");
function time_range(beginTime, endTime, nowTime) {
    var strb = beginTime.split(":");
    if (strb.length != 2) {
        return false;
    }

    var stre = endTime.split(":");
    if (stre.length != 2) {
        return false;
    }

    var strn = nowTime.split(":");
    if (stre.length != 2) {
        return false;
    }
    var b = new Date();
    var e = new Date();
    var n = new Date();

    b.setHours(strb[0]);
    b.setMinutes(strb[1]);
    e.setHours(stre[0]);
    e.setMinutes(stre[1]);
    n.setHours(strn[0]);
    n.setMinutes(strn[1]);

    if (n.getTime() - b.getTime() > 0 && n.getTime() - e.getTime() < 0) {
        return true;
    } else {
        alert("当前时间是：" + n.getHours() + ":" + n.getMinutes() + "，不在该时间范围内！");
        return false;
    }
}

function addOrEdit(hysid) {
	var executeUrl = contextPath + "/ame_dailyoffice/SealGovern/hygl/hysGoernor/meetingRoomDetail.jsp?hysid=" + hysid;
	nui.open({
		url: executeUrl,
		title: "详细信息",
		width: "750px",
		height: "430px",
		allowResize: false,
		onload: function() {
			var iframe = this.getIFrameEl().contentWindow;
			iframe.type = "view";
			iframe.init();
		},
		ondestroy: function(action) {
			if(action == "ok") {}
		}
	});};
	
	
	
	