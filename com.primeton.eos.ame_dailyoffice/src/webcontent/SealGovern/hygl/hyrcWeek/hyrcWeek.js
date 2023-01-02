/*
 * 描         述：日程日历.
 * 版权所有：武大吉奥信息技术有限公司
 * 修  改  者：yangtingting
 * 联系方式：yangtingting@geostar.com.cn 
 */

$(function () {
    $("td").css("padding", "0");

    var nWindowH = $(window).height() - 40;
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
    oMeetting.loadAllSchedule();
});

var mouseDownFlag = false;
var sCurSelect_date = new Date();
var aCurDate_week; // 当前周日期
var sClickDate=new Date(); // 当前选中的日期

// 第一行所有的事件
function loadHead() {
    // 设置日期插件样式
    $(".mini-buttonedit").css("width", "auto");
    $(".mini-buttonedit-border").css({"border": "none", "background": "none", "top": "-2px"});
    $("span.mini-popupedit").css("margin-left", "15px");


    // 日期样式
//    $(".date-show").css("left", "calc(50% - 280px)");

    // 获取本周日期
    aCurDate_week=oWeekDate.setDate(sCurSelect_date);
    $("span.now-date").html(aCurDate_week[0].date+" - "+aCurDate_week[6].date);

    // 左 定位
    var nContent_left = $(".hysq-title").offset().left; // 容器
    var nOffset_left = $(".date-show").offset().left;  // 中
    var nWidth = $(".title-left").width();
    $(".title-right").css("right", (nOffset_left - nWidth) / 2 - nContent_left + "px");
//    $(".title-left").css("left", (nOffset_left - nWidth) / 2 + "px");

    // 定位logo 左
    var _offsetLeft_left = $(".title-left").offset().left;
    var _offsetTop = $(".title-left").offset().top;
    var _offsetLeft = $(".title-right").offset().left;
    var _nWidth = $(".title-right").width();
//    $(".logo_left").offset({left: _offsetLeft_left - 70, top: _offsetTop - 30});
//    $(".logo_right").offset({left: _offsetLeft + _nWidth + 20, top: _offsetTop - 30});
    $(".logo_left").offset({top: _offsetTop - 30});
    $(".logo_right").offset({top: _offsetTop - 30});

    // 会议室选项
    var nLeft_dateShow=$(".date-show").offset().left;

    //$("#hys").css({"left": nLeft_dateShow+285+"px","width":_offsetLeft-nLeft_dateShow-355+"px"});
//    $("#hys").css({"left": nLeft_dateShow+285+"px"});

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

        // 展现会议日程
        oMeetting.loadAllSchedule();
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

        // 展现会议日程
        oMeetting.loadAllSchedule();
    });

    // 切换到本周日期
    $("div.title-today").click(function () {
        sCurSelect_date = new Date();

        // 获取本周日期
        aCurDate_week=oWeekDate.setDate(sCurSelect_date);
        $("span.now-date").html(aCurDate_week[0].date+" - "+aCurDate_week[6].date);
        $(this).addClass("active");

        // 单元格
        oCell.init();

        // 加载时间节点
        loadTimeNode();

        // 根据当前日期设置单元格是否可选
        oCell.setTdStyle();

        // 展现会议日程
        oMeetting.loadAllSchedule();
    });

    // 增加会议
    $("div.addMetting").click(function () {
        var formData = {};
        // 会议数据
        formData.hysq = {};
        formData.hysq.hyrq = sClickDate;
        formData.chry = sUserName;
        formData.hysq.fqrmc = sUserName;
        formData.hysq.fqrid = sUserId;
        formData.hysq.fqrjgmc = sFqrbm;

        // 跳转到新窗口
        var sUrl = contextPath + "/ame_dailyoffice/SealGovern/hygl/hysq/hysqb.jsp";
        var sJson = JSON.stringify(formData);

        sUrl = sUrl + "?json=" + sJson;
        window.open(sUrl);
    });

    // 点击切换日页面
    $("div.title-sjx").click(function(){
    	$("div.day_week").removeClass("active");
        $(this).addClass("active");
        window.location.href=contextPath+"/ame_dailyoffice/SealGovern/hygl/hyrc/hyrc.jsp";
    });

    $("body").click(function(){
        $("#hys .div_ul").hide();
        bClick=true;
    });

    $("body div.div_ul").click(function(e){
        e.stopPropagation();
    });

    // 选择会议室
    var bClick=true;

    // 展开会议室信息
    $("#hys .hys_msg div.clear").click(function (e) {
       if(bClick){
           $("#hys .div_ul").show();

           if($("#hys ul li").length==1){
               // 获取所有会议室信息
               nui.ajax({
                   url: 'com.primeton.eos.ame_dailyoffice.Hysxx.queryHysxxList', // 逻辑流
                   type: 'POST',
                   data : {hyszt : "true"},
                   cache: false,
                   async: false,
                   contentType: 'text/json',
                   success: function (text) {
                       if (text.hysxxList && text.hysxxList.length > 0) {
                           var aRoom = text.hysxxList;
                           var sStr='';
                           var oHysData;

                           // 加载单元格
                           for (var i = 0; i < aRoom.length; i++) {
                               oHysData=aRoom[i];
                               sStr='<li class="clear hys"><input type="checkbox" checked hysmc="'+oHysData.hysmc+'" hysid="'+oHysData.hysid+'" dz="'+oHysData.dz+'"/><div>'+oHysData.hysmc+'</div></li>';

                               $("#hys ul").append(sStr);
                           }

                           // 选中所有会议室按钮 input
                           $("#hys ul li.allHys input").click(function (e) {
                               // 勾选情况
                               var bChecked=$(this).prop("checked");

                               if(bChecked==false){
                                   $("#hys ul li.hys input:checkbox:checked").click();
                               }else{
                                   $("#hys ul li.hys input:checkbox:not(:checked)").click();
                               }

                               e.stopPropagation();
                           });

                           // 选中所有会议室行 li
                           $("#hys ul li.allHys").click(function () {
                               $(this).find("input").click();
                           });

                           // 选择会议室信息行 li
                           $("#hys ul li.hys input").click(function (e) {
                               // 获取所有选中的会议室
                               var nLength=$("#hys ul li.hys input:checkbox:checked").length;

                               if(nLength==aRoom.length){
                                   $("#hys ul li.allHys input").prop("checked",true);
                               }else{
                                   $("#hys ul li.allHys input").prop("checked",false);
                               }

                               e.stopPropagation();
                           });

                           // 选择会议室信息行 li
                           $("#hys ul li.hys").click(function () {
                               $(this).find("input").click();
                           });

                           // 点击搜索会议信息
                           $("div.yes").click(function (e) {
                               var sHysId="";
                               var sTitle="";
                               var $li=$("#hys ul li.hys");
                               var $checked=$("#hys ul li.hys input:checkbox:checked");

                               // 获取所有选中的会议室id
                               $checked.each(function (i) {
                                   if(i==0){
                                       sHysId=$(this).attr("hysid");
                                       sTitle=$(this).attr("hysmc");
                                   }else if(i==$li.length-1){
                                       sHysId+=","+$(this).attr("hysid");
                                       sTitle="全部";
                                   }else{
                                       sHysId+=","+$(this).attr("hysid");
                                       sTitle+=","+$(this).attr("hysmc");
                                   }
                               });

                               // 加载对应的日程
                               oMeetting.loadAllSchedule(sHysId);

                               // 加载对应的会议室信息
                               $("span.hysmc").html(sTitle);
                               $("span.hysmc").attr("title",sTitle);

                               // 隐藏会议室选项
                               $("#hys .div_ul").hide();
                               bClick=true;

                               e.stopPropagation();
                           });

                           $("div.cancel").click(function(e){
                               // 影藏会议室选项
                               $("#hys .div_ul").hide();
                               bClick=true;

                               e.stopPropagation();
                           });
                       }
                   }
               });
           }
       }else{
           $("#hys .div_ul").hide();
       }

        e.stopPropagation();
        bClick=!bClick;
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

        for (var i = 0; i < 2; i++) {
            // 计算当前单元格代表的时间

            if (i == 0) {
                sName="上午</br>08:00</br>-</br>12:00";
                sTime="08:00-12:00";
            } else {
                sName="下午</br>14:00</br>-</br>18:00";
                sTime="14:00-18:00";
            }

            that.loadTd(sName,sTime);
        }

        // 设置单元格的样式
        var nWidth_content = $(".mettingContent").width();
        var nWidth_td = (nWidth_content - 101) / 7;

        $(".td_time").css("width", nWidth_td-5 + "px");

        // 自定义选择日程
        that.selectTd();
    },
    
    // 生成一行单元格
    loadTd:function (sName,sTime) {
        var sStr = '';
        var sDate;
        var sWeek;
        var nHour=sCurSelect_date.getHours();
        var sClass;

        for (var i=0;i<7;i++){
            sDate=aCurDate_week[i].date;
            sWeek=aCurDate_week[i].week;

            if(formatDate(new Date(), true)==sDate){
              sClass="border";
            }else{
              sClass="";
            }

            sStr += '<div class="td_time '+sClass+'" id="td_' + i + '" week="'+sWeek+'" date="'+sDate+'" name="' + sTime + '"><div class="td_time_div"></div></div>';
        }

        var sHtml = '<div class="meeting_eq clear">' +
            '<div class="first_td"><b>' + sName+ '</b></div>' + sStr +
            '</div>';

        $(".mettingContent").append(sHtml);

        if($(".border").length==2){
            if(nHour<12){
              $(".border").eq(1).removeClass("border");
            }else{
              $(".border").eq(0).removeClass("border");
            }
        }
        
    },

    // 根据当前日期设置单元格样式
    setTdStyle: function () {
        var _date = new Date(formatDate(new Date(), true));

        // 判断一周的日期
        for(var i=0;i<aCurDate_week.length;i++){
            var _sCurSelect_date = new Date(aCurDate_week[i].date);

            // 系统当前日期超过选中日期
            if (_date.getTime() > _sCurSelect_date.getTime()) {
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

        var bNow = true; // 当前时间段有效

        // 鼠标点击单元格
        $(".td_time").click(function(e){
        	if($(this).hasClass("failTime")){

          }else{
            $(".td_time").removeClass("border");
            $(this).addClass("border");

            // 当前日期
            sClickDate=new Date($(this).attr("date"));
          }

          e.stopPropagation();
        });

        // 鼠标按下事件
        $(".td_time").dblclick(function (e) {
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

                    // 如果当前单元格有日程信息
                    if($(this).find(".msg_1").length>0){
                        nY_start=$(this).find(".msg_1").last().offset().top+74;
                    }

                    $("#addMeeting").remove();
                    // 创建会议日程
                   // var sStr_div = '<div class="msg_1" id="addMeeting">新建会议日程</div>';

                    sCurSelect_date=$(this).attr("date");
                    //$(".mettingMsg").append(sStr_div);
                    //$("#addMeeting").offset({top: nY_start, left: nX_start});
                   // $("#addMeeting").css({"width":($(this).width() - 1) + "px"});

                    // 申请会议表单
                    sEndTime=new Date($(this).attr("date"));

                    // 设置会议信息样式
                    var sName = $(this).attr("name");
                    var formData = {};

                    formData.hysq = {};
                    formData.hysq.hyrq =sEndTime ;
                    formData.hysq.hykssj = sName.substring(0, 5);
                    formData.hysq.hyjssj = sName.substring(6, 11);
                    formData.chry = sUserName;
                    formData.hysq.fqrmc = sUserName;
                    formData.hysq.fqrid = sUserId;
                    formData.hysq.fqrjgmc = sFqrbm;

                    // 跳转到新窗口
                    var sUrl=contextPath + "/ame_dailyoffice/SealGovern/hygl/hysq/hysqb.jsp";
                    var sJson=JSON.stringify(formData);
                    sUrl=sUrl+"?json="+sJson;

                    window.open(sUrl);
                }
            }
        });

        // 选中区域
        /*$(".td_time").mouseover(function () {
            if (mouseDownFlag == true) {
                // 设置新建会议日程的样式
                var nOffset_y = $(this).offset().top;
                var nOffset_x = $(this).offset().left;

                if($(this).find(".msg_1").length>0){
                    nOffset_y=$(this).find(".msg_1").last().offset().top+74;
                }

                $("#addMeeting").offset({top: nOffset_y, left: nOffset_x});
            }
        });*/

        /*$(".td_time").mouseup(function (e) {
            if(e.which==1&&mouseDownFlag==true){
                var bSelect = true;
                $(".msg_1").removeClass("msg_select");

                if ($(this).hasClass("failTime")) {
                    mouseDownFlag = false;

                    if (bNow == true) {
                        alert("请选择正确的时间段");
                        $("#addMeeting").remove();
                    }
                } else {
                    mouseDownFlag = false;
                    sEndTime=new Date($(this).attr("date"));

                    // 设置会议信息样式
                    var sName = $(this).attr("name");

                    // 设置新建会议日程的样式
                    var nOffset_y = $(this).offset().top;
                    var nOffset_x = $(this).offset().left;

                    // 定位新建会议信息
                    if($(this).find(".msg_1").length>0){
                        nOffset_y=$(this).find(".msg_1").last().offset().top+74;
                    }

                    $("#addMeeting").offset({top: nOffset_y, left: nOffset_x});

                    if (bSelect == true) {
                        // 当前时间单元格的信息
                        nY_start = $(this).offset().top;

                        // 申请会议表单
                        var formData = {};

                        formData.hysq = {};
                        formData.hysq.hyrq =sEndTime ;
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
        });*/
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
    loadMeetingMsg: function (data, $td) {
        var sStartTime=data.hykssj.substring(11,16);
        var sEndTime=data.hyjssj.substring(11,16);
        var sTime = sStartTime+"-"+sEndTime;
        var sClass_spzt;
        var sClass_click;

        // 是否审批
        if (data.spzt == "1") {
            sClass_spzt = "msg_ypz";
        } else {
            sClass_spzt = "";
        }

        // 过滤当前日程 参会者可查看会议详细内容
        if(data.chry&&data.chry.indexOf(sUserId)>-1){
            sClass_click="msg_click";
        }else{
            sClass_click="";
        }

        // 生成会议信息
        var sId = randomstring(5);
        var sMsgStr='<div>主题：'+data.hyzt+'</div><div>时间：'+sTime+'</div><div>地点：'+data.hysmc+'</div>';
        var sStr = '<div class="msg_1 ' + sClass_spzt +" "+sClass_click+ '" id="' + sId + '" chryid="'+data.chry+'" hysqid="' + data.hysqid + '">'+sMsgStr+'</div>';

        // 判断时间段位上午还是下午
        var bMorning=time_range("00:00","12:00",sStartTime);
        var bAfter=time_range("14:00","24:00",sEndTime);

        // 开始时间是上午时间段
        var nIndex=$td.index()+6;

        if(bMorning==true&&bAfter==true){
            $(".td_time").eq(nIndex).find(".td_time_div").append(sStr);
            $td.find(".td_time_div").append(sStr);
        }else if(bMorning==true&&bAfter==false){
            $td.find(".td_time_div").append(sStr);
        }else if(bMorning==false&&bAfter==true){
            $(".td_time").eq(nIndex).find(".td_time_div").append(sStr);
        }else{
            $(".td_time").eq(nIndex).find(".td_time_div").append(sStr);
        }

        // 处理点击事件
        $("#" + sId).mousedown(function (e) {
           if(e.which==1){
               mouseDownFlag = false;
               var _that = $(this);

               if(_that.hasClass("msg_click")){
                   // 跳转到新窗口
                   var sUrl=contextPath + "/ame_dailyoffice/SealGovern/hygl/hysq/hysqb.jsp";
                   var sHysqid=_that.attr("hysqid");

                   sUrl=sUrl+"?hysqid="+sHysqid+"&pageHandleType=view";
                   window.open(sUrl);
               }

               e.stopPropagation();
           }
        });
    },

    // 根据数据当前页面 生成所有的会议日程
    loadAllSchedule: function (hysid) {
        // 清空当前页面会议内容
        $(".td_time .td_time_div").html("");

        var that = this;
        var sAfterDate="";
        var jsonData = {};

        // 结束日期参数处理
        sAfterDate=aCurDate_week[6].date;
        sAfterDate=new Date(sAfterDate);
        sAfterDate.setDate(sAfterDate.getDate() + 1);

        jsonData.startTime = aCurDate_week[0].date;
        jsonData.endTime = formatDate(sAfterDate, true);

        // 是否过滤会议室信息
        if(hysid){
            jsonData.hysid=hysid;
        }

        // 展现会议日程
        $.ajax({
            url: "com.geostar.gtgh.oa.officeaffairs.Hysq.queryHysq.biz.ext",  //请求地址
            data: nui.decode(jsonData),
            async: false,
            type: "POST",      //请求方式
            dataType: "json",
            success: function (msg) {
                console.log(msg);
                var sDate;

                if (msg.data && msg.data != null && msg.data.length > 0 && msg.data[0] != null) {
                    var data = msg.data;

                    for (var i = 0; i < data.length; i++) {
                        if (data[i] != null) {
                            sDate=data[i].hykssj.substring(0,10);

                            // 获取对应单元格位置
                            $(".td_time").each(function () {
                                // 日期、时间段
                                if($(this).attr("date")==sDate){
                                    that.loadMeetingMsg(data[i],$(this));

                                    return false;
                                }
                            });
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

    $(".time_node").append("<div class='time_name'>日期</div>");

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

    // 展现会议日程
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

    if (n.getTime() - b.getTime() >= 0 && n.getTime() - e.getTime() <0) {
        return true;
    } else {
        return false;
    }
}