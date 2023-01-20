var aAllChz = []; // 所有的参会人员  会议室
var aChryData = []; // 参会人员数据
var aChr = [];

// 当前选择的会议人员
var aSelectFqry=[]; // 发起人
var aSelectChr = []; // 参会人

$(function(){
	// 页面加载时加载表单信息
	hysqBeforeBindEvent();
	nui.get("sfhyqtx").setValue(0);
	$(".select_clear").click(function(){
		// 删除最后一个参会人员
		var name=$(this).attr("cord");
		var nui_select = nui.getbyName(name);
		var nui_value = nui_select.value;
		var nui_text = nui_select.text;
		nui.getbyName(name).setText(deleteLastName(nui_text));
		nui.getbyName(name).setValue(deleteLastName(nui_value));
	});
});
/**
 * 删除最后一个";"之后的字符串
 * */
function deleteLastName(strData){
	var arrData = strData.split(";");
	var returnData='';
	for(var i=0;i<arrData.length-2;i++){
		returnData = returnData + arrData[i] + ";";
	}
	return returnData;
}

function loadData(oParam){
	if(oParam){
		$.ajax({
			url: "com.primeton.eos.ame_dailyoffice.Hysxx.queryHysqdata.biz.ext", // 逻辑流
			type: 'POST',
			data: nui.encode({hysq:oParam}),
			cache: false,
			async: false,
			contentType: 'text/json',
			success: function(text) {
				
				if(text.data.wechatreturnid){
					$(".bottonCon").remove();
					form.setEnabled(false);
				}
				if(text.data){
					var data={hysq:text.data};
					loadTableData(data);
					setTrime(data.hysq.cronexpress)
					console.log("aaa:"+data.hysq.wechatreturnid);
				}
			}
		});
	}
}

function setData(data) {
	
	data.hysq.hylx = "BMHY";
	form.setData(data);
	//zhangyuan 2018-4-9 新增会议申请时间的获取赋值
	var sDate = new Date();
	var date_format = nui.formatDate(sDate, "yyyy-MM-dd HH:mm");
	nui.getbyName("hysq.hysqsj").setValue(date_format);
	formData = form.getData();

	if(typeof(data.hysq.hykssj) == "undefined") {
		$("td.time_select input").attr("placeholder", "请输入正确的时间格式如：08:30");
	}

	// 发起人、会议室名称，参会人员，参会部门
	nui.getbyName("hysq.fqrmc").setValue(data.hysq.fqrmc);
	nui.getbyName("hysq.fqrid").setValue(data.hysq.fqrid);
	nui.getbyName("hysq.hysid").setValue(data.hysq.hysid);
}

//初始化表单数据
function loadTableData(text) {
	
	text.hysq.hyrq = text.hysq.hykssj.toString().substring(0, 10);
	text.hysq.hykssj = text.hysq.hykssj.toString().substring(11, 16);
	text.hysq.hyjssj = text.hysq.hyjssj.toString().substring(11, 16);
	// 保存表单数据
	form.setData(text);
	nui.getbyName("hysq.zcrid").setText(text.hysq.zcrmc);
	if(text.hysq.sfzq == "true"){
		$(".cfzqTr").show();
	}else{
		$(".cfzqTr").hide();
	}
	var nui_sfzq = nui.getbyName("sfzq");
	nui_sfzq.setReadOnly(true);
	nui_sfzq.setValue(text.hysq.sfzq);
//	var nui_zqlx = nui.getbyName("zqlx");
//	nui_zqlx.setValue(text.hysq.zqlx);
//	nui_zqlx.setReadOnly(true);
	var nui_zqkssj = nui.getbyName("zqkssj");
	nui_zqkssj.setValue(text.hysq.zqkssj);
	nui_zqkssj.setReadOnly(true);
	var nui_zqjssj = nui.getbyName("zqjssj");
	nui_zqjssj.setValue(text.hysq.zqjssj);
	nui_zqjssj.setReadOnly(true);
	
	var arrCyzid = [];
	var arrCyzmc = [];
	if(text.hysq.hycys) {
		$.each(text.hysq.hycys, function(i, item) {
			arrCyzid.push(item.cyzid);
			arrCyzmc.push(item.cyzmc);
		});
	}
	
	var strCyzid = '';
	var strCyzmc = '';
	if(arrCyzid.length > 0 ){
	
			/*var strCyzid = arrCyzid.join(";")+";";
			var strCyzmc = arrCyzmc.join(";")+";";*/

			var strCyzid = arrCyzid.join(";");
			var strCyzmc = arrCyzmc.join(";");
	
	}
/*	nui.getbyName("hysq.chryid").setValue(strCyzid);
	nui.getbyName("hysq.chryid").setText(strCyzmc);*/
	
    nui.get("chryid1").setValue(strCyzid);
    nui.get("chryid1").setText(strCyzmc);
}



// 保存表单数据
function onOk(type){
		var isok = true;
		var form = new nui.Form("#hysqSealUse");
		var nui_zqhy = nui.getbyName("sfzq");
		if(type == "0" && nui_zqhy.value == "true"){
			alert("周期会议不能【暂时保存】，请确保数据无误后【提交】！");
			return;
		}
		form.validate();
		if(form.isValid() == false) {
			return;
		}
		
		var formData = form.getData();
		// 验证会议时间是否有效
		var idValidTime = rangTime(formData.hysq.hykssj,formData.hysq.hyjssj);
		if(!idValidTime){
			nui.alert("会议结束时间必须大于会议开始时间");
			return;
		}
		
		var zqlx;
		var cronExpression;
		var time;
		cronExpression = getCronExpression();
		time = nui.get("hykssj").getValue();
		var action_day=nui.get("action_day").getValue();
		var action_week=nui.get("action_week").getValue();
		var week=nui.get("week").getText();

		var action_twoweek=nui.get("action_twoweek").getValue();
		var week2=nui.get("week2").getText();

		var action_month=nui.get("action_month").getValue();
	//	var month=nui.get("month1").getText();
		var month1=nui.get("month_day").getText();
	//	var month2=nui.get("month2").getValue();
		var month3=nui.get("month_weekOrder").getText();

		var month4=nui.get("month_week").getText();

		if(action_day){
			zqlx=action_day
		}else if(action_week){
			zqlx="每周"+week;
			
		}else if(action_twoweek){
			zqlx="每两周"+week2;
		}else if(action_month){
			if(document.getElementById("month1").checked){
				zqlx="每月"+month1
				
			}else if(document.getElementById("month2").checked){
				zqlx="每月"+month3+month4
			}
		}
		
		

		
		

		var sfhyqtx=nui.get("sfhyqtx").getValue();
		if(sfhyqtx=="1"){
			var tqfz=nui.get("tqfz").getValue();
			formData.hysq.tqfz = tqfz;//提前分钟数
		}else{
			 sfhyqtx="0";
		}
			
		var tzfs=nui.get("tzfs").getValue();
		var hykssj = formData.hysq.hyrq.toString().substring(0, 10)+" " + nui.getbyName("hysq.hykssj").getText();
		var hyjssj = formData.hysq.hyrq.toString().substring(0, 10)+" " + nui.getbyName("hysq.hyjssj").getText();
		formData.hysq.hykssj = hykssj;//会议开始时间
		formData.hysq.hyjssj = hyjssj;//会议结束时间
		formData.hysq.sfhyqtx = sfhyqtx;//是否提前提醒
		formData.hysq.tzfs = tzfs;//通知方式
		formData.hysq.hysmc = nui.getbyName("hysq.hysid").getText();//会议室名称
		formData.hysq.spzt = type;//
		formData.hysq.chrymc =  nui.get("chryid1").getText();/*nui.getbyName("hysq.chryid").getText()*///参会人员名称
		formData.hysq.zcrmc = nui.getbyName("hysq.zcrid").getText();//主持人名称
		formData.hysq.zcrid=nui.getbyName("hysq.zcrid").getValue()//主持人id
	//	var zqlxmc = "";
	//	var selectZqlx = nui.getbyName("zqlx").getSelected();
	//	if(selectZqlx) zqlxmc = selectZqlx.text;
	//	formData.hysq.zqlxmc = zqlxmc;
		formData.hysq.sfzq = nui.getbyName("sfzq").value;//是否周期会议
		formData.hysq.zqkssj = nui.formatDate(nui.getbyName("zqkssj").value,"yyyy-MM-dd");//周期开始时间
		formData.hysq.zqjssj = nui.formatDate(nui.getbyName("zqjssj").value,"yyyy-MM-dd");//周期结束时间
	//	formData.hysq.zqlx = nui.getbyName("zqlx").value;
		var json = {
				hysq: formData.hysq,
				sfzq: formData.sfzq,
				zqlx: zqlx,
				zqkssj: formData.zqkssj,
				zqjssj: formData.zqjssj,
				cronExpression:cronExpression
			
			};
		form.loading("操作中...");
		$.ajax({
			url: "com.primeton.eos.ame_dailyoffice.Hysxx.handleHysq.biz.ext", // 逻辑流
			type: 'POST',
			data: nui.encode(json),
			cache: false,
			contentType: 'text/json',
			success: function(text) {
				form.unmask();
				if(text.exception) {
					nui.alert(text.exception.message);
				} else {
					if(text.result=="提交失败"){
						nui.alert("提交失败");
					}else{
						nui.alert(text.result,"操作提示",function(){
							// 关闭当前页面 刷新父页面
							CloseWindow("ok");
						});
					}
				}
	 		},
			error:function(jqXHR, textStatus, errorThrown){
				form.unmask();
				nui.alert("error:" + jqXHR.responseText);
			}
		});
}

//表单保存或者提交之前进入，初始化表单信息
function hysqBeforeBindEvent() {
	setInitInfo();
	
	/*// 加载会议准备
	var sHyzb = '部门会议:'+'\n'
	+'1、桌牌请会议申请人自行准备，V型会议台卡请找前台借用；'+'\n'
	+'2、茶水请找行政部门（208室）准备，矿泉水请找行政部（208室）领用，联系方式：8067'+'\n'
	+'3、照相请联系市场部，联系方式：8021'+'\n'
	+'4、电脑、投影仪、翻页笔、录音笔请找行政部（208室）借用，联系方式：8067'+'\n'
	+'公司会议:'+'\n'
	+'1、桌牌及V型会议台卡请前台准备；'+'\n'
	+'2、茶水请找行政部（208室）准备，矿泉水请找行政部（208室）领用，联系方式：8067'+'\n'
	+'3、照相请联系市场部，联系方式：8021'+'\n'
	+'4、电脑、投影仪、翻页笔、录音笔请找行政部（208室）借用，联系方式：8067';
	nui.getbyName("hysq.hyzbsm").setValue(sHyzb);*/

}

//表单信息保存或者提交后，从各种链接（如草稿、待办、办结等）打开页面，加载数据
function hysqAfterBindEvent(oParam) {
	loadData(oParam);
}

function setInitInfo(){
	// 如果URL链接地址json有数据
	var sJson = getQueryString("json");
	var hysqid = getQueryString("hysqid");
	if(sJson != false) {
		var oData = JSON.parse(sJson);
		// 判断会议开始时间是否存在 不存在则默认当前时间
		var hykssj=oData.hysq.hykssj;
		if(!hykssj && hykssj!=""){
			var date=new Date();
			hykssj=date.getHours()+":"+date.getMinutes();
		}
		
		oData.hysq.hykssj = hykssj;
		oData.hysq.fqrmc = username;
		oData.hysq.fqrid = userid;
		oData.hysq.fqrjgmc = orgname;
		oData.hysq.fqrjgid =orgid;
		setData(oData);
	}else{
		var oParam={};
		if(hysqid&&hysqid!="") {
			oParam={hysqid:hysqid};
		}else if(processInstId&&processInstId!=""){
			oParam={processInstId:processInstId};
		}else if(workItemID&&workItemID!=""){
			oParam={workItemID:workItemID};
		}
		
		hysqAfterBindEvent(oParam);
	}
}

	function zqhychange(e){
		if(!e.checked){
			$(".cfzqTr").hide();
		}else{
			$(".cfzqTr").show();
		}
	}


function sfhyqtxchange(e){
	if(e.text=="是"){
		$(".hyqtx").show();
		$(".hyqtx1").show();

	}else{
		
		$(".hyqtx").hide();
		$(".hyqtx1").hide();


	}
	
	
}
//获取URL参数值
function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if(r != null) return decodeURI(r[2]);
	return false;
}

/*
 * 描   述：对表单上的会议开始时间做校验，当会议开始时间小于当前时间的时候提示
 */
function validTime(e){
	var aKssj = []; //用来放页面填写的会议开始时间
	var aJssj = []; //用来放页面填写的会议结束时间
	var sHyrq = nui.getbyName("hysq.hyrq").text; //获取到页面填写的会议日期
	var sKssj = nui.getbyName("hysq.hykssj").text; //获取到页面填写的会议开始时间		
	
	if(sKssj){
		aKssj = sKssj.split(":"); //将获取到的时间用"："分隔放到数组中
		var nKssj = aKssj[0] * 60 + aKssj[1] * 1; //将获取到的时间转换成分钟数
		
		var sHysj = sHyrq+" "+sKssj; //将会议日期和会议开始时间拼成会议时间
		var sHysjForIE = sHysj.replace(/-/g, "/"); //会议时间格式以'-'拼接，将格式改成以'/'拼接
		var dHysj = new Date(sHysjForIE); //将拼成的会议时间转成日期类型时间
		var dDqsj = new Date(); //获取当前的时间
		var isValid_kssj=rangTime(dDqsj,sHysj);
		if(nKssj < 540 || nKssj > 1320){
			e.errorText = "会议开始时间应在9点到22点之间！";
			e.isValid = false;
		}else if(!isValid_kssj){
			e.errorText = "会议开始时间不能小于系统当前时间！";
			e.isValid = false;
		}
		else{
			e.isValid = true;
		}		
	}else{
		e.errorText = "开始时间不能为空！";
		e.isValid = false;
	}
}

/*
 * 描   述：对表单上的会议开始时间做校验，会议结束时间要在9点到22点之间
 * 参数信息：
 * 返回数据：
 * 作   者：wuguang(wuguang@geostar.com.cn)
 * 创建日期：2017-11-18
 */
function validJsTime(e){
	var sHyrq = nui.getbyName("hysq.hyrq").text; //获取到页面填写的会议日期
	var sJssj = sHyrq+" "+nui.getbyName("hysq.hyjssj").text; //获取到页面填写的会议结束时间
	var sKssj = sHyrq+" "+nui.getbyName("hysq.hykssj").text; //获取到页面填写的会议结束时间
	//时间存在判断
	if(sJssj){
		aJssj = sJssj.split(":"); //将获取到的时间用"："分隔放到数组中
		var nJssj = aJssj[0] * 60 + aJssj[1] * 1; //将获取到的时间转换成分钟数
		
		var isValid_jssj=rangTime(sKssj,sJssj);
		if(nJssj < 540 || nJssj > 1320){
			e.errorText = "会议结束时间应在9点到22点之间！";
			e.isValid = false;
		}else if(!isValid_jssj){
			e.errorText = "会议结束时间必须大于会议开始时间！";
			e.isValid = false;
		}else{
			e.isValid = true;
		}
	}else{
		e.errorText = "结束时间不能为空！";
		e.isValid = false;
	}
}

function validHySj(){
	nui.getbyName("hysq.hykssj").validate();
	nui.getbyName("hysq.hyjssj").validate();
}

function validDate(e){
	var ksrq=nui.getbyName("zqkssj").getValue();
	var jsrq=nui.getbyName("zqjssj").getValue();
	
	var isValidDate=rangTime(ksrq,jsrq);
	if(!isValidDate){
		e.isValid = false;
	}else{
		nui.getbyName("zqkssj").setIsValid(true);
		nui.getbyName("zqjssj").setIsValid(true);
	}
}

function onDrawDate(e) {
	var date = e.date;
	var toDay = nui.parseDate(nui.formatDate(new Date(), 'yyyy-MM-dd'), 'yyyy-MM-dd');
	if(date.getTime() < toDay.getTime()) {
		e.allowSelect = false;
	}
}


/*
 * 描   述：当会议结束时间小于开始时间，或者会议开始时间小于当前时间时，弹出提示
 * 参数信息：hykssj ：会议开始时间
 *        hyjssj ：会议结束时间
 * 返回数据：提示信息内容
 * 作   者：wusiru(wusiru@geostar.com.cn)
 * 修改记录：wusiru(wusiru@geostar.com.cn)
 *        调整命名规范，添加注释，解决ie创建new Date()对象时候，不识别'2017-11-13'格式时间问题，将格式改为'2017/11/13'
 */
function rangTime(hykssj,hyjssj) {
	if(typeof(hykssj)=="string"){
		hykssj=hykssj.replace(/-/g, '/');
	}
	if(typeof(hyjssj)=="string"){
		hyjssj=hyjssj.replace(/-/g, '/');
	}
	var dKsTime = new Date(hykssj).getTime();
	var dJsTime = new Date(hyjssj).getTime();
	if(dJsTime <= dKsTime){
		return false;
	}else if(dJsTime > dKsTime){
		return true;
	}
}

/**
 * 生成guid
 * @returns
 */
function guid() {
	var s = [];
    var hexDigits = "0123456789abcdefghjklmnopqrstuvwxyz";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
    s[8] = s[13] = s[18] = s[23] ;
 
    var uuid = s.join("");
    return uuid;
}

function CloseWindow(action) {
    if (window.CloseOwnerWindow) {
   	 return window.CloseOwnerWindow(action);
    }
    else {
   	 window.close();
    }
}








function getCronExpression(){
	//	var triggerType = nui.get("triggerType").getValue();
		var cronExpression;
	//	if(triggerType=='2'){
			var time = nui.get("hykssj").getValue();
			if(time !=null&&time!=""){
				var times = nui.formatDate (time,"HH:mm:ss");
				var t = times.split(":");
				var a = t[1][1];
				var b = t[0][1];
				var a1 = t[1]<10? a:t[1];
				var b1 = t[0]<10? b:t[0];
				cronExpression = "0 " + a1 + " " + b1;
			}
			var action_day = nui.get("action_day").getValue();
			var action_week = nui.get("action_week").getValue();
			var action_month = nui.get("action_month").getValue();
			var action_twoweek = nui.get("action_twoweek").getValue();
			if(action_day=='day'){
				cronExpression = cronExpression +" * * ? *";
			}else if(action_week == 'week'){
				var week = nui.get("week").getValue();
				cronExpression = cronExpression +" ? * " + week + " *";
			}else if(action_twoweek == 'week2'){
				var week = nui.get("week2").getValue();
				cronExpression = cronExpression +" ? * " + week + " *";
			}
			else if(action_month == 'month'){
				var month1 = $('input[name=month]').get(0).checked;
				if(month1){
					var month_day = nui.get("month_day").getValue();
					cronExpression = cronExpression +" " + month_day + " * ? *";
				}else{
					var month_weekOrder = nui.get("month_weekOrder").getValue();
					var month_week = nui.get("month_week").getValue();
					if(month_weekOrder=='-1'){
						cronExpression = cronExpression +" ? * " + month_week + "L *";
					}else{
						cronExpression = cronExpression +" ? * " + month_week + "#" + month_weekOrder + " *";

					}
				}
			}
		
		return cronExpression;
	}
    

	function setTrime(cronExpression){
		var times = cronExpression.split(/\s+/);
		console.log(times);
		var time = times[2]+":"+times[1]+":"+times[0];

	//	nui.get("time").setValue(time);
		var day =  times[3];
		var month =  times[4];
		var week =  times[5];

		var typeTrime ="";
		var radios1 = document.getElementsByName("month");

		if(times.length==7){
			console.log("caocaocacaocaocoaoca1"+day)

			if((day=="*"||day=="?")&&(month=="*"||month=="?")&&(week=="*"||week=="?")){
	    		nui.get("action_day").setValue("day");
	    		typeTrime = "day";
	    		console.log("1")
	    	}else if(day!="*"&&day!="?"){
	    		if((month=="*"||month=="?")&&(week=="*"||week=="?")){
	    			nui.get("action_month").setValue("month");
	    			typeTrime = "month";
	    			radios1[0].checked = true;
	    			nui.get("month_day").setValue(day);
		    		console.log("2")

	    		}
	    	}else if(week!="*"&&week!="?"){
	    		console.log("8")

	    		if((day=="*"||day=="?")&&(month=="*"||month=="?")){
	    			if(week.indexOf(",") != -1){
	    				nui.get("action_week").setValue("week");
	    				typeTrime = "week";
	    				console.log("4")

	    				nui.get("week").setValue(week);
	    			}else if(week.indexOf("#") != -1){
	    				var tw = week.substring(0,1);
	    				var tm = week.substring(2,3);
	    				nui.get("action_month").setValue("month");
	    				typeTrime = "month";
	    				radios1[1].checked = true;
	    				nui.get("month_weekOrder").setValue(tm);
	    				nui.get("month_week").setValue(tw);
	    				console.log("5")

	    			}else if(week.indexOf("L") != -1){
	    				var tw = week.substring(0,1);
	    				nui.get("action_month").setValue("month");
	    				typeTrime = "month";
	    				radios1[1].checked = true;
	    				nui.get("month_weekOrder").setValue("-1");
	    				nui.get("month_week").setValue(tw);
	    				console.log("6")

	    			}else{
	    				nui.get("action_week").setValue("week");
	    				typeTrime = "week";
	    				nui.get("week").setValue(week);
	    				console.log("7")



	    			}
	    		}
	    	}
		}
		var e = {"value":typeTrime};
		triggerChanged(e);
	}