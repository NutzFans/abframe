	//领导意见
	function changeleader(e,type){
		var value;
		if(type){
			value =type;
		}else{
			value =e.value;
		}
		if("manualActivity1" == activityDefID){
			auditopinion = nui.getDictText('MIS_DEPT',value);
			if(value=="0"){
				document.getElementById("tips").style.display="";
				var tip="提示：不续签请慎重选择，请把不续签的情况告知员工关系邮件组（guanxi@primeton.com），以获得相关建议。<br/>";
				tip=tip+emp.empname+"的劳动合同于"+oldcontend+"日到期，您已确认放弃续签，请与员工沟通好离职事项。员工需要于"+oldcontend+"日前办理好离职手续。";
				document.getElementById("tip").innerHTML=tip;
			}else{
				document.getElementById("tips").style.display="none";
			}
			nui.get("auditopinion").setValue(auditopinion);
		}
	}

	//员工意见
	function changeEmpAdv(e,type){
		var value;
		if(type){
			value =type;
		}else{
			value =e.value;
		}
		if("manualActivity3" == activityDefID){
			auditopinion = nui.getDictText('MIS_EMP',value);
			if("1" == value){
				document.getElementById("field3").style.display="";
				document.getElementById("contProve").style.display="";
   				nui.get("recipient").setRequired(true);
   				nui.get("telephone").setRequired(true);
   				nui.get("address").setRequired(true);
				contdownload();
			}else{
				document.getElementById("field3").style.display="none";
				document.getElementById("contProve").style.display="none";
   				nui.get("recipient").setRequired(false);
   				nui.get("telephone").setRequired(false);
   				nui.get("address").setRequired(false);
			}
			nui.get("auditopinion").setValue(auditopinion);
		}
	}
	function changeContCompany(e){
		var contcompany = e.value;
		if("2" == contcompany){
			document.getElementById("PrimetonSmart_LaborContractAgain").style.display="";
			document.getElementById("PrimetonNingbo_LaborContractAgain").style.display="none";
			document.getElementById("Primeton_LaborContractAgain").style.display="none";
		}else if("3" == contcompany){
			document.getElementById("PrimetonNingbo_LaborContractAgain").style.display="";
			document.getElementById("PrimetonSmart_LaborContractAgain").style.display="none";
			document.getElementById("Primeton_LaborContractAgain").style.display="none";
		}else{
			document.getElementById("Primeton_LaborContractAgain").style.display="";
			document.getElementById("PrimetonSmart_LaborContractAgain").style.display="none";
			document.getElementById("PrimetonNingbo_LaborContractAgain").style.display="none";
		}
	}
	function contdownload(){
		if("2" == contcompany){
			document.getElementById("PrimetonSmart_LaborContractAgain").style.display="";
			document.getElementById("PrimetonNingbo_LaborContractAgain").style.display="none";
			document.getElementById("Primeton_LaborContractAgain").style.display="none";
		}else if("3" == contcompany){
			document.getElementById("PrimetonNingbo_LaborContractAgain").style.display="";
			document.getElementById("PrimetonSmart_LaborContractAgain").style.display="none";
			document.getElementById("Primeton_LaborContractAgain").style.display="none";
		}else{
			document.getElementById("Primeton_LaborContractAgain").style.display="";
			document.getElementById("PrimetonSmart_LaborContractAgain").style.display="none";
			document.getElementById("PrimetonNingbo_LaborContractAgain").style.display="none";
		}
	}
	function changecontprop(e,type){
		var value;
		if(type){
			value =type;
		}else{
			value =e.value;
		}
		if(value=="2"){
			nui.get("conttime").setValue("");
			nui.get("contend").setValue("");
			nui.get("contend").setRequired(false);
		}else{
			nui.get("conttime").setValue(conttime);
			nui.get("contend").setValue(contend);
			nui.get("contend").setRequired(true);
		}
	}
	//验证合同期限
	function validate(){  
		var reg = new RegExp("^[0-9]*[1-9][0-9]*$");  
		var obj = nui.get("conttime").getValue();
		if(obj){
			if(!reg.test(obj)){  
				alert("请输入数字!");
				nui.get("conttime").setValue("");    
			}else{
				conttime=parseInt(obj);
				var contstart = nui.get("contstart").getValue();
				var oldcontend2 =new Date(contstart);
				oldcontend2 = DateAdd("y", conttime, oldcontend2);//n年后日期
				oldcontend2 = DateAdd("d", -1, oldcontend2);
				nui.get("contend").setValue(oldcontend2);
				contend=oldcontend2;
			}
		}
    }
	
	function changecontstart(e){
		var oldcontend2 =new Date(e.value);
		var obj = nui.get("conttime").getValue();
		conttime=parseInt(obj);
		oldcontend2 = DateAdd("y", conttime, oldcontend2);//n年后日期
		oldcontend2 = DateAdd("d", -1, oldcontend2);
		nui.get("contend").setValue(oldcontend2);
		contend=oldcontend2;
	}
	
	function changeissm(e){
		if(e.value=="1"){
			nui.get("company").setValue("2");
		}
	}
	
	//导出合同
	function exportPDFContract(filename){
		//导出PDF信息
		var contstart = nui.get("contstart").getValue();
		var contend = nui.get("contend").getValue();
		var contuserid = nui.get("contuserid").getValue();
		var position = nui.get("position").getValue();
		var positionname = nui.get("positionname").getValue();
		var contworkplace = nui.get("contworkplace").getValue();
		var contprop = nui.get("contprop").getValue();
		var contcompany = nui.get("contcompany").getValue();
		var worktype = nui.get("worktype").getValue();
		var contempname = nui.get("contempname").getValue();
		var nature = emp.nature;//人员性质
		var oldcontend1 = oldcontend;
		var oldcontend2 = oldcontend;
		var hrconfirmdate1 = hrconfirmdate;
		var contcompanyname;
		var contcompanyname = selectContractType(contcompany);
		contstart = new Date(contstart);
		var contstartyear = contstart.getFullYear();
		var contstartmonth = contstart.getMonth()+1;
		var contstartday = contstart.getDate();
		if(contend){
			contend = new Date(contend);
		}
		if(oldcontend){
			oldcontend1 = new Date(oldcontend1);
			oldcontend2 = new Date(oldcontend2);
			oldcontend2 = DateAdd("d", -2, oldcontend2);//前一条合同到期日前两天
		}
		if(hrconfirmdate){
			hrconfirmdate1 = new Date(hrconfirmdate1);
		}else{
			hrconfirmdate1 = new Date();
		}
		pdfjson = ({"filename":filename,"emp":{
					"empname":contempname,
					"empcode":contuserid,
					"startyear":contstartyear,
					"startmonth":contstartmonth,
					"startday":contstartday,
					"startyear2":contprop == "2"?"/":contstartyear,
					"startmonth2":contprop == "2"?"/":contstartmonth,
					"startday2":contprop == "2"?"/":contstartday,
					"endyear":contprop == "2"?"/":contend.getFullYear(),
					"endmonth":contprop == "2"?"/":contend.getMonth()+1,
					"endday":contprop == "2"?"/":contend.getDate(),
					"startyear1":contprop == "1"?"/":contstartyear,
					"startmonth1":contprop == "1"?"/":contstartmonth,
					"startday1":contprop == "1"?"/":contstartday,
					"starttrialyear":"/",
					"starttrialmonth":"/",
					"starttrialday":"/",
					"endtrialyear":"/",
					"endtrialmonth":"/",
					"endtrialday":"/",
					"positionname":position == null ? "":nui.getDictText("AME_POSITION_MEMO",position),
					"positionmemo":position == null ? "":getDictfile("AME_POSITION_MEMO",position),
					"workplace":contworkplace == null ?"":nui.getDictText("AREA4CLRY",contworkplace),
					"worktype":worktype == null ? (nature == "0" || nature == "4"?'1':'2'):worktype,
					"nowyear":contstart.getFullYear(),
					"nowmonth":contstart.getMonth()+1,
					"nowdate":contstart.getDate(),
					"nowday":contstart.getFullYear()+'-'+(contstart.getMonth()+1)+'-'+contstart.getDate(),
					"oldendyear":oldcontend1.getFullYear(),
					"oldendmonth":oldcontend1.getMonth()+1,
					"oldendday":oldcontend1.getDate(),
					"oldbeforeyear":oldcontend2.getFullYear(),
					"oldbeforemonth":oldcontend2.getMonth()+1,
					"oldbeforeday":oldcontend2.getDate(),
					"hrconfyear":hrconfirmdate1.getFullYear(),
					"hrconfmonth":hrconfirmdate1.getMonth()+1,
					"hrconfday":hrconfirmdate1.getDate(),
					"contprop":contprop,
					"contcompanyname":contcompanyname
					}});
		nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_entry.createLaborContractByPDFTemplate.biz.ext",
	        type: "post",
	        data: pdfjson,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		var filePath = o.downloadFile;
	     		var fileName ;
	     		if(filename =="Primeton_IntentAgain.pdf"){
	     			fileName="续签合同意向书";
	     		}else{
	     			fileName= "劳动合同";
	     		}
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
	        	var month = myDate.getMonth()+1;
	        	var day = myDate.getDate();
	        	var hours = myDate.getHours();
	        	var minutes = myDate.getMinutes();
	        	var seconds = myDate.getSeconds();
	        	var curDateTime = year;
	        	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
					}
	        	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
					}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
					}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
				}
				fileName = fileName + "_" + curDateTime + ".pdf";
				var frm = document.getElementById("viewlist1");
	        	frm.elements["downloadFile"].value = filePath;
	        	frm.elements["fileName"].value = fileName;
			    frm.submit();
	        },
	        error: function () {
	        	alert("error");
	        }
		});
	}
	//获取公司名称
	function selectContractType(contcompany){
		var json = nui.encode({"dictid":contcompany,"dicttypeid":"company"});
		var contcompanyname;
    	nui.ajax({
            url: "org.gocom.abframe.tools.newDict.queryDictEntry.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            async:false,
            contentType: 'text/json',
            success: function (text) {
        		var returnJson = nui.decode(text);
        		if(returnJson){
            		var entry = returnJson.EosDictEntry;
            		contcompanyname = entry.filter1;
        		}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
            }
        });
    	return contcompanyname;
	}
	
	function getDictfile(dicttypeid,dictid){
		var json = ({"eocDictEntry":{"eosDictType":{"dicttypeid":dicttypeid},"dictid":dictid}});
		var dictname = '';
		nui.ajax({
            url: "org.gocom.abframe.tools.DictManager.queryDictEntry.biz.ext",
			type: 'POST',
			data: json,	
            async:false,
			contentType: 'text/json',
            success: function (o) {
            	if(o.eocDictEntry != null && o.eocDictEntry != ''){
	                dictname = o.eocDictEntry.filter1;
                }
            }
        });
        return dictname;
	}
	
	function setEmp(){
		document.getElementById("empname").innerHTML = emp.empname == null ?"": emp.empname;
		document.getElementById("empcode").innerHTML = emp.empcode == null ?"": emp.empcode;
		document.getElementById("orgname").innerHTML = emp.orgname == null ?"": emp.sybname;
		document.getElementById("userid").innerHTML = emp.userid == null ?"": emp.userid;
        document.getElementById("gender").innerHTML = emp.gender == null ?"":  nui.getDictText('ABF_GENDER',emp.gender);
		document.getElementById("mobileno").innerHTML = emp.mobileno == null ?"": emp.mobileno;
        document.getElementById("emptype").innerHTML = emp.emptype == null ?"":  nui.getDictText('EMP_TYPE',emp.emptype);
        document.getElementById("nature").innerHTML = emp.nature == null ?"":  nui.getDictText('AME_EMPTYPE2',emp.nature);
        document.getElementById("company").innerHTML = emp.company == null ?"":  nui.getDictText('company',emp.company);
        document.getElementById("positionname").innerHTML = emp.positionname == null ?"":  nui.getDictText('AME_POSITION_MEMO',emp.positionname);
		document.getElementById("positioncall").innerHTML = emp.positioncall == null ?"": emp.positioncall;
		document.getElementById("oemail").innerHTML = emp.oemail == null ?"": emp.oemail;
        document.getElementById("workplace").innerHTML = emp.workplace == null ?"":  nui.getDictText('AREA4CLRY',emp.workplace);
        nui.get("empid").setValue(emp.empid);
        nui.get("userid").setValue(emp.userid);
        nui.get("empname").setValue(emp.empname);
        nui.get("orgid").setValue(emp.orgid);
        nui.get("major").setValue(emp.major);
        nui.get("orgname").setValue(emp.orgname);
        nui.get("syqname").setValue(emp.syqname);
        nui.get("sybname").setValue(emp.sybname);
	}
	
	function setEmpCont(){
		document.getElementById("contuserid").innerHTML = empCont.contuserid == null ?"": empCont.contuserid;
        document.getElementById("conttype").innerHTML = empCont.conttype == null ?"":  nui.getDictText('CONT_TYPE',empCont.conttype);
        document.getElementById("contprop").innerHTML = empCont.contprop == null ?"":  nui.getDictText('CONT_PROP',empCont.contprop);
        document.getElementById("position").innerHTML = empCont.position == null ?"":  nui.getDictText('AME_POSITION_MEMO',empCont.position);
		document.getElementById("conttime").innerHTML = empCont.conttime == null ?"": empCont.conttime;
		document.getElementById("contstart").innerHTML = empCont.contstart == null ?"": empCont.contstart;
		document.getElementById("contend").innerHTML = empCont.contend == null ?"": empCont.contend;
		document.getElementById("positionname1").innerHTML = empCont.positionname == null ?"": empCont.positionname;
        document.getElementById("contcompany").innerHTML = empCont.contcompany == null ?"":  nui.getDictText('company',empCont.contcompany);
        document.getElementById("contworkplace").innerHTML = empCont.contworkplace == null ?"":  nui.getDictText('AREA4CLRY',empCont.contworkplace);
		document.getElementById("agent").innerHTML = empCont.agentname == null ?"": empCont.agentname;
		document.getElementById("remark").innerHTML = empCont.remark == null ?"": empCont.remark;
	}
	//选择经办人
	function changeAgent(e){
        var length = e.value.split(",").length;
        if (length > 1) {
        
            var text = e.sender.getText().split(",")[0];
            var value = e.sender.getValue().split(",")[0];
            setTimeout(function () {
                
                e.sender.setValue(value);
                e.sender.setText(text);
            }, 200)
        }
	}
	//人员状态
	function empstatus(e){
		return nui.getDictText('ABF_EMPSTATUS',e.value);
	}
	//性别
	function gender(e){
		return nui.getDictText('ABF_GENDER',e.value);
	}
    //所属公司
	function company(e){
		return nui.getDictText('company',e.value);
	}
	//工作地
	function workplace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	//合同状态
	function contstatus(e){
		return nui.getDictText('EMP_CONT_STATUS',e.value);
	}
	//职位类型
	function getPosition(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);
	}
	//合同属性
	function getConttype(e){
		return nui.getDictText('CONT_TYPE',e.value);
	}
	//合同性质
	function getContprop(e){
		return nui.getDictText('CONT_PROP',e.value);
	}
	//关闭
	function onCancel(){
		CloseWindow("cancel");
	}
	
	/*
	 *   功能:实现VBScript的DateAdd功能.
	 *   参数:interval,字符串表达式，表示要添加的时间间隔.
	 *   参数:number,数值表达式，表示要添加的时间间隔的个数.
	 *   参数:date,时间对象.
	 *   返回:新的时间对象.
	 *   var now = new Date();
	 *   var newDate = DateAdd( "d", 5, now);
	 *---------------   DateAdd(interval,number,date)   -----------------
	 */
	function DateAdd(interval, number, date) {
	    switch (interval) {
	    case "y": {
	        date.setFullYear(date.getFullYear() + number);
	        return date;
	        break;
	    }
	    case "q": {
	        date.setMonth(date.getMonth() + number * 3);
	        return date;
	        break;
	    }
	    case "m": {
	        date.setMonth(date.getMonth() + number);
	        return date;
	        break;
	    }
	    case "w": {
	        date.setDate(date.getDate() + number * 7);
	        return date;
	        break;
	    }
	    case "d": {
	        date.setDate(date.getDate() + number);
	        return date;
	        break;
	    }
	    case "h": {
	        date.setHours(date.getHours() + number);
	        return date;
	        break;
	    }
	    case "mm": {
	        date.setMinutes(date.getMinutes() + number);
	        return date;
	        break;
	    }
	    case "s": {
	        date.setSeconds(date.getSeconds() + number);
	        return date;
	        break;
	    }
	    default: {
	        date.setDate(d.getDate() + number);
	        return date;
	        break;
	    }
	    }
	}
	
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}