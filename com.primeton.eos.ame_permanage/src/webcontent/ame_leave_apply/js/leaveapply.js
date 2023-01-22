	 function ondrawqueryLeave(e){
    	var record = e.record;
    	var xjdate = Date.parse(record.minstartdate);
    	var qjdate = Date.parse(record.applydate);
    	if(xjdate && qjdate){
    	  if(qjdate > xjdate){
    		e.rowStyle = "background-color: #FF99CC";
    	   }
    	}
    }
	
	function changeIsBaoMi(e){
		var  isbaomi = e.value;
		if("1" == isbaomi){checklist
			document.getElementById("checklist").style.display="";
		}else{
			document.getElementById("checklist").style.display="none";
		}
	}

	function changeMoneyToChinese(money){
    	var cnNums = new Array("零","壹","贰","叁","肆","伍","陆","柒","捌","玖"); //汉字的数字
	    var cnIntRadice = new Array("","拾","佰","仟"); //基本单位
	    var cnIntUnits = new Array("","万","亿","兆"); //对应整数部分扩展单位
	    var cnDecUnits = new Array("角","分","毫","厘"); //对应小数部分单位
	    //var cnInteger = "整"; //整数金额时后面跟的字符
	    var cnIntLast = "元"; //整型完以后的单位
	    var maxNum = 999999999999999.9999; //最大处理的数字
	    
	    var IntegerNum; //金额整数部分
	    var DecimalNum; //金额小数部分
	    var ChineseStr=""; //输出的中文金额字符串
	    var parts; //分离金额后用的数组，预定义
	    if( money == "" ){
	        return "";
	    }
	    money = parseFloat(money);
	    if( money >= maxNum ){
	        $.alert('超出最大处理数字');
	        return "";
	    }
	    if( money == 0 ){
	        //ChineseStr = cnNums[0]+cnIntLast+cnInteger;
	        ChineseStr = cnNums[0]+cnIntLast
	        //document.getElementById("show").value=ChineseStr;
	        return ChineseStr;
	    }
	    money = money.toString(); //转换为字符串
	    if( money.indexOf(".") == -1 ){
	        IntegerNum = money;
	        DecimalNum = '';
	    }else{
	        parts = money.split(".");
	        IntegerNum = parts[0];
	        DecimalNum = parts[1].substr(0,4);
	    }
	    if( parseInt(IntegerNum,10) > 0 ){//获取整型部分转换
	        zeroCount = 0;
	        IntLen = IntegerNum.length;
	        for( i=0;i<IntLen;i++ ){
	            n = IntegerNum.substr(i,1);
	            p = IntLen - i - 1;
	            q = p / 4;
	            m = p % 4;
	            if( n == "0" ){
	                zeroCount++;
	            }else{
	                if( zeroCount > 0 ){
	                    ChineseStr += cnNums[0];
	                }
	                zeroCount = 0; //归零
	                ChineseStr += cnNums[parseInt(n)]+cnIntRadice[m];
	            }
	            if( m==0 && zeroCount<4 ){
	                ChineseStr += cnIntUnits[q];
	            }
	        }
	        ChineseStr += cnIntLast;
	        //整型部分处理完毕
	    }
	    if( DecimalNum!= '' ){//小数部分
	        decLen = DecimalNum.length;
	        for( i=0; i<decLen; i++ ){
	            n = DecimalNum.substr(i,1);
	            if( n != '0' ){
	                ChineseStr += cnNums[Number(n)]+cnDecUnits[i];
	            }
	        }
	    }
	    if( ChineseStr == '' ){
	        //ChineseStr += cnNums[0]+cnIntLast+cnInteger;
	        ChineseStr += cnNums[0]+cnIntLast;
	    }/* else if( DecimalNum == '' ){
	        ChineseStr += cnInteger;
	        ChineseStr += cnInteger;
	    } */
	    return ChineseStr;
	}
    
	$("#outoffsetmon input").bind("input propertychange",function(){
		setCost();
	})
	
	function setCost(){
		var cost = $("#outoffsetmon input").val();
		if(cost!=null&&cost!=""){
			cost = cost.replace(/,/g, "");
	    	var num = changeMoneyToChinese(cost);
	    	$('#cost').text(num);
		}else{
			$('#cost').text("");
		}
	}


	function changeoutdate(e){
		nui.get("oldoutdate").setValue(e.value);
	}

	//年假校验
	function checkleave(userid,leavedetail){
		//判断是否已请过假
		var isleaves=false;
		var json1 = {"criteria": 
								{"_expr[0]":
									{"_property":"leaveid","_op":"in","_ref":"1"}
								,
								"_ref[0]":
									{"_id":"1","_entity":"com.primeton.eos.ame_permanage.ame_permanage.AmeLeaveinfo",
										"_expr[0]":
										{"_property":"userid","_value":userid},
										"_select":{"_field[0]":"leaveid"}
										,
									"_expr[1]":{"_property":"status","_op":"<>","_value":"-2"}
									}
								}
								
							,"sortOrder":"desc","sortField":"startdate"
							,"t":new Date()};
		nui.ajax({//获取请假记录	
      		url: "com.primeton.eos.ame_permanage.ame_leavepro.queryDetail.biz.ext",
	      	type: 'POST',
          	data: json1,
          	async:false,
      		success: function (text) {
      			var leavedetail1 = text.leavedetail;
      			for(var i=0;i<leavedetail1.length;i++){
					if(judgeDate(leavedetail1[i],leavedetail)==false){
						isleaves=true;
					}
				}
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
    	
		return isleaves;
	}
	
	//年假校验
	function checkleaveNotLeaveid(userid,leavedetail){
		//debugger;
		//判断是否已请过假
		var isleaves=false;
		var json1 = {"criteria": 
						{"_expr[0]":
							{"_property":"leaveid","_op":"in","_ref":"1"}
						,
						"_ref[0]":
							{"_id":"1","_entity":"com.primeton.eos.ame_permanage.ame_permanage.AmeLeaveinfo",
								"_expr[0]":
								{"_property":"userid","_value":userid},
								"_select":{"_field[0]":"leaveid"},
						"_expr[1]":{"_property":"status","_op":"<>","_value":"-2"}
							},
							"_expr[1]":{"_property":"leaveid","_op":"<>","_value":leavedetail.leaveid}
						
						}
						
					,"sortOrder":"desc","sortField":"startdate","t":new Date()};
		nui.ajax({//获取请假记录	
      		url: "com.primeton.eos.ame_permanage.ame_leavepro.queryDetail.biz.ext",
	      	type: 'POST',
          	data: json1,
          	async:false,
      		success: function (text) {
      			var leavedetail1 = text.leavedetail;
      			for(var i=0;i<leavedetail1.length;i++){
					if(judgeDate(leavedetail1[i],leavedetail)==false){
						isleaves=true;
					}
				}
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
		return isleaves;
	}
	//判断日期区间是否有重复
	function judgeDate(data1,data2){
		var startdate1=data1.startdate;
		var startdate2=data2.startdate;
		var enddate1=data1.enddate;
		var enddate2=data2.enddate;
		if(typeof(startdate1)=="string"){
			startdate1 = startdate1.substring(0,10);
		}
		if(typeof(startdate2)=="string"){
			startdate2 = startdate2.substring(0,10);
		}
		if(typeof(enddate1)=="string"){
			enddate1 = enddate1.substring(0,10);
		}
		if(typeof(enddate2)=="string"){
			enddate2 = enddate2.substring(0,10);
		}
		var date1s = new Date(startdate1).getTime();
		var date2s = new Date(startdate2).getTime();
		var date1e = new Date(enddate1).getTime();
		var date2e = new Date(enddate2).getTime();
		if((date2s<date1s&&date1s<date2e) || (date2s<date1e&&date1e<date2e) ||(date1s<date2s&&date2s<date1e) || (date1s<date2e&&date2e<date1e)){
			return false;
		}else{
			if((date1s==date2s)||(date1e==date2e)){
				if((date1e==date2s && data1.eptype=="am" && data2.sptype=="pm")||(date2e==date1s && data2.eptype=="am" && data1.sptype=="pm")){
					return true;
				}else{
					return false;
				}
			}else{
				if((date1s == date2e&&(data1.sptype=="am"||data2.eptype=="pm"))||(date2s == date1e&&(data2.sptype=="am"||data1.eptype=="pm"))){
					return false;
				}else{
					return true;
				}
			}
		}
	}
	
	function setReadOnly(){
		nui.get("hopeoutdate").setReadOnly(true);
		nui.get("outplace").setReadOnly(true);
		nui.get("hopedealoutdate").setReadOnly(true);
		nui.get("outtype").setReadOnly(true);
		nui.get("outreason").setReadOnly(true);
		nui.get("vacdealtype").setReadOnly(true);
		nui.get("outoffsetmon").setReadOnly(true);
		nui.get("remark").setReadOnly(true);
		nui.get("handuserid").setReadOnly(true);
		nui.get("handrequire").setReadOnly(true);
		nui.get("mailretain").setReadOnly(true);
		nui.get("mailretaindate").setReadOnly(true);
		nui.get("isbaomi").setReadOnly(true);
		nui.get("outagent").setReadOnly(true);
		nui.get("isreturnvisit").setReadOnly(true);
		nui.get("issignconf").setReadOnly(true);
	}
	
	function checkvac(){
		var vacs = vaction_grid.getData();
		var nowrestvac = parseFloat(vacs[0].nowrestvac);
		var days = parseFloat(nui.get("days").getValue());
		if(nowrestvac >= days){
			return true;
		}else{
			nui.alert("当年可请年假不等于请假天数,请确认！");
			return false;
		}
	}

	//年假处理方式修改处理
	function changevactype(e,type){
		var value;
		if(type){
			value =type;
		}else{
			value =e.value;
		}
		if(value =="1"){
			document.getElementById("formvac").style.display="";
		}else{
			document.getElementById("formvac").style.display="none";
		}
	}
	//获取年假天数
	function changgevac(e){
		var sender =e.sender;
		var startdate = nui.get("startdate").getValue();
		var enddate = nui.get("enddate").getValue();
		var sptype = nui.get("sptype").getValue();
		var eptype = nui.get("eptype").getValue();
		if(startdate !=null && startdate !="" && enddate != null && 
		   enddate != "" && sptype !=null && sptype !="" && eptype !=null && eptype !=""){
			calLeaveDays(startdate,sptype,enddate,eptype);
		}
		//开始日期不能大于结束日期
		if(sender.id=="startdate"){
			if(enddate){
				if(startdate>enddate){
					nui.alert("开始日期不能大于结束日期，请重新填写!");
					nui.get("startdate").setValue(null);
				}else if(startdate==enddate){
					if(sptype=="pm"  && eptype=="am"){
						nui.alert("开始日期不能大于结束日期，请重新填写!");
						nui.get("startdate").setValue(null);
					}
				}
			}
		}
		if(sender.id=="enddate"){
			if(startdate){
				if(startdate>enddate){
					nui.alert("开始日期不能大于结束日期，请重新填写!");
					nui.get("enddate").setValue(null);
				}else if(startdate==enddate){
					if(sptype=="pm"  && eptype=="am"){
						nui.alert("开始日期不能大于结束日期，请重新填写!");
						nui.get("enddate").setValue(null);
					}
				}
			}
			if(enddate){
				var outdate =nui.get("oldoutdate").getValue();
				var outdateTime = new Date(outdate.substring(0,10)).getTime();
				var enddateTime = new Date(enddate.substring(0,10)).getTime();
				if(enddateTime > outdateTime){
					nui.get("actoutdate").setValue(enddate);
					nui.get("hopeoutdate").setValue(enddate);
				}else{
					nui.get("actoutdate").setValue(outdate);
					nui.get("hopeoutdate").setValue(outdate);
				}
			}
		}
		if(sender.id=="sptype"){
			if(startdate==enddate&&sptype=="pm"  && eptype=="am"){
				nui.alert("开始日期不能大于结束日期，请重新填写!");
				nui.get("sptype").setValue(null);
			}
		}
		if(sender.id=="eptype"){
			if(startdate==enddate&&sptype=="pm"  && eptype=="am"){
				nui.alert("开始日期不能大于结束日期，请重新填写!");
				nui.get("eptype").setValue(null);
			}
		}	
	}
	//计算请假天数
	function calLeaveDays(startdate,sptype,enddate,eptype){
		var json = {startdate:startdate,sptype:sptype,enddate:enddate,eptype:eptype,leaverule:"2"};
  		nui.ajax({	
	    	url: "com.primeton.eos.ame_permanage.ame_leavepro.getDays.biz.ext",
            type: 'POST',
            data: json,
            success: function (text) {
            	nui.get("days").setValue(text.days);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
	}
	function changemailretain(e,type){
		var mailretain;
		if(e){
			mailretain =e.value;
		}else{
			mailretain =type;
		}
		if(mailretain=="1"){
			document.getElementById("maildeal").style.display="";
			document.getElementById("maildeal1").style.display="";
			document.getElementById("maildeal2").style.display="";
			document.getElementById("maildeal3").style.display="";
		}else{
			document.getElementById("maildeal").style.display="none";
			document.getElementById("maildeal1").style.display="none";
			document.getElementById("maildeal2").style.display="none";
			document.getElementById("maildeal3").style.display="none";
		}
	}
	function changemail(e){
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
	
	//选择交接人
	function changeHand(e){
        var length = e.value.split(",").length;
        if (length > 1) {
        
            var text = e.sender.getText().split(",")[0];
            var value = e.sender.getValue().split(",")[0];
            setTimeout(function () {
                
                e.sender.setValue(value);
                e.sender.setText(text);
            }, 200)
        }else{
    		var empname = e.sender.text;
    		nui.get("handusername").setValue(empname);
        }
	}
	//选择经办人
	function changeOutagent(e){
		var length = e.value.split(",").length;
	    if (length > 1) {
	        var text = e.sender.getText().split(",")[0];
	        var value = e.sender.getValue().split(",")[0];
	        setTimeout(function () {
	            
	            e.sender.setValue(value);
	            e.sender.setText(text);
	        }, 200)
	    }else{
			var empname = e.sender.text;
			nui.get("outagentname").setValue(empname);
		}
	}
	//选择HR处理人
	function changgeadmindeal(e){
		var length = e.value.split(",").length;
	    if (length > 1) {
	        var text = e.sender.getText().split(",")[0];
	        var value = e.sender.getValue().split(",")[0];
	        setTimeout(function () {
	            
	            e.sender.setValue(value);
	            e.sender.setText(text);
	        }, 200)
	    }else{
			var empname = e.sender.text;
			nui.get("admindeal").setValue(empname);
		}
	}
	
	function getEmpRole(userid){
		var json = nui.encode({"userid":userid});
		nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_leave_apply.queryEmpRole.biz.ext",
        	data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
        	success: function (o) {
        		emproles = o.emproles;
        		if(emproles!==null && emproles.length>0){
	        		nui.get("operatorid").setValue(emproles[0].operatorid);
	        		nui.get("operaRole").setValue(emproles[0].roleid);
	        		nui.get("operaRole").setText(emproles[0].rolename);
        		}
 			},
			error: function () {
    			alert("error");
    		}
    	});
	}
	
	function onOkRole(gridid){
		var operatorid = nui.get("operatorid").getValue();
		var roleid = nui.get("operaRole").getValue();
		var rolename = nui.get("operaRole").getText();
		var json = nui.encode({"roleOp":{operatorid:operatorid,roleid:roleid,rolename:rolename}});
		nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_leave_apply.deleteOpRole.biz.ext",
        	data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
        	success: function (o) {
        		if(o.retCode == "0"){
					nui.alert("保存失败！");
 					return;
 				}else{
 					nui.alert("保存成功！","提示",function(){
 					});
 				}
 			},
			error: function () {
    			alert("error");
    		}
    	});
	}
	/**
    *验证
    */
    function onOkCheck(){
    	var filePaths1 = document.getElementsByName("uploadfile2").length;
    	for(var j=0;j<filePaths1;j++){
    		var a=document.getElementsByName("remarkList2")[j].value;
    		if(a==null||a==""){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
       return true;
    }
    
    function getworkday(dat,itervalByDay){
		var str=dat.split("-");
		var date=new Date(); 
		date.setUTCFullYear(str[0], str[1] - 1, str[2]); 
		date.setUTCHours(0, 0, 0, 0); 
		var millisceonds =date.getTime();
		for(var i=1;i<=itervalByDay;i++){
		millisceonds +=24*60*60*1000;
		date.setTime(millisceonds);
		if(date.getDay()==0||date.getDay()==6) i--;
		}
	
		var year = date.getFullYear(); 
		var month = date.getMonth() + 1; 
		var day = date.getDate(); 
		var rq = year + "-" + formatTen(month) + "-" + formatTen(day);
	
		return rq;
	}
    
    function formatTen(f){
	  if (parseInt(f,10)<10){
	      return '0'+f;
	  }
	  return f;
	}
    
    //离职性质设置
	function changeReason(e,type){
		var outtype;
		if(type){
			outtype=type;
		}else{
			outtype = nui.get("outtype").getValue();
		}
		if(outtype == null || outtype == ""){
			nui.get("outreason").setData(null);
		}else{
			if(outtype=="1"){
				nui.get("isreturnvisit").setValue("1");
  				document.getElementById("bdleave").style.display="none";
  				document.getElementById("rec").style.display="";
			}else if(outtype=="3"){
				nui.get("isreturnvisit").setValue("0");
  				document.getElementById("bdleave").style.display="none";
  				document.getElementById("rec").style.display="none";
			}else{
  				document.getElementById("bdleave").style.display="";
  				document.getElementById("rec").style.display="none";
				nui.get("isreturnvisit").setValue("0");
			}
			var json = nui.encode({"dictid":outtype});
			nui.ajax({
        		url: "org.gocom.abframe.org.employee.EmpManager.changeOutReason.biz.ext",
        		data: json,
        		type: 'POST',
    			cache: false,
                async:false,
    			contentType: 'text/json',
    			success: function(text){
    				nui.get("outreason").setData(text.data);
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    			}
        	});
		}
	}
	function changeIsreturn(e){
		if(e.value == "1"){
			document.getElementById("rec").style.display="";
		}else{
			document.getElementById("rec").style.display="none";
		}
	}
	function changeOutPlace(e){
		var json = nui.encode({"machineApply":{area:e.value}});
		nui.ajax({
    		url: "com.primeton.eos.machine.machineProcess.setAdmin.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
            async:false,
			contentType: 'text/json',
			success: function(text){
				var adminPur= text.adminPur;
				var admindealValue = "";
    			var admindealText = "";
				for(var i = 0;i < adminPur.length;i ++){
	    			if(admindealValue == null || admindealValue == ""){
	                    admindealValue = adminPur[i].id
	                    admindealText = adminPur[i].name;
	                }else{
	                	admindealValue = admindealValue+","+adminPur[i].id;
	     				admindealText = admindealText+","+adminPur[i].name;
	                }
				}
                nui.get("admindeal").setValue(admindealValue);
                nui.get("admindeal").setText(admindealText);
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	})
	}
	//离职回访，离职性质设置
	function setLeaveReason(id,type){
		var json = nui.encode({"dictid":"1",type:type});
		nui.ajax({
    		url: "org.gocom.abframe.org.employee.EmpManager.changeOutReason.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
            async:false,
			contentType: 'text/json',
			success: function(text){
				nui.get(id).setData(text.data);
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	})
	}
	//设置年假处理方式
	function setVacdealtype(){
		nui.ajax({
    		url: "com.primeton.eos.ame_permanage.ame_leave_apply.getVacDealType.biz.ext",
    		type: 'POST',
			cache: false,
            async:false,
			contentType: 'text/json',
			success: function(text){
				nui.get("vacdealtype").setData(text.vactype);
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	})
	}
	
    function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:paths+"/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.userid);
		                btnEdit.setText(data.empname);
		                nui.get("empname").setValue(data.empname);
						document.getElementById("indate").innerHTML= data.indate == null ?"":data.indate;
						document.getElementById("positionname").innerHTML= data.positioncall == null ?"":data.positioncall;
					}
				}
			}
		});
	}

	function updateOrg(grid){
    	var rows;
    	if(grid =="org_grid"){
    		rows = org_grid.getSelecteds();
    	}else{
    		rows = emp_grid.getSelecteds();
    	}
		if(rows.length>0){
        	chooseRows=rows;
        	chooseType=grid;
        	showAtPos();
		}else{
			nui.alert("请至少选中一条记录");
		}
    }

	function changeName(e){
		var length = e.value.split(",").length;
	    if (length > 1) {
	        var text = e.sender.getText().split(",")[0];
	        var value = e.sender.getValue().split(",")[0];
	        setTimeout(function () {
	            
	            e.sender.setValue(value);
	            e.sender.setText(text);
	        }, 200)
	    }else{
			var empid = e.source.data[0].EMPID;
			nui.get("empid").setValue(empid);
		}
	}
    function showAtPos() {
        var win = nui.get("win1");
        win.showAtPos("center", "middle");
    } 
    function hideWindow() {
        var win = nui.get("win1");
        win.hide();
    }
    function sureDate(){
    	hideWindow();
    	sureChoose(chooseRows,chooseType);
    }
    function sureChoose(rows,chooseType){
    	var msg="";
    	if(chooseType=="org_grid"){
    		msg="机构主管";
    	}else{
    		msg="员工直属主管";
    	}
    	if (confirm("确定修改"+msg+"？")) {
			var json;	
			if(chooseType=="org_grid"){
	            json = nui.encode({orgs: rows,emp:{empid:nui.get("empid").getValue()},type:"org"});
	    	}else{
	            json = nui.encode({emps: rows,emp:{userid:nui.get("lookup2").getValue()},type:"emp"});
	    	}
	        nui.ajax({//进行批量记账修改
				url:"com.primeton.eos.ame_permanage.ame_leave_apply.updateOrgOrEmp.biz.ext",
				data: json,
				type:"post",
				contentType:"text/json",
				success:function(result){
					if(result.iRtn==0){
	            		if(result.wxresult){
    						nui.alert("修改成功,但机构微信企业号未能成功同步,错误原因："+result.wxresult,"提示",function(){
    							if(chooseType=="org_grid"){
    			  					org_grid.reload();
    			  		    	}else{
    			  		    		emp_grid.reload();
    			  		    	}
    						});
    					}else{
    						nui.alert("修改成功。","提示",function(){
    							if(chooseType=="org_grid"){
    			  					org_grid.reload();
    			  		    	}else{
    			  		    		emp_grid.reload();
    			  		    	}
    						});
    					}
	            	}else{
	            		nui.alert("修改失败啦，请联系信息技术部。");
	            	}
				},
			    error: function (jqXHR, textStatus, errorThrown) {
			       alert(jqXHR.responseText);
			    }
				
			});  
	     }
    }
    var editor1 = null;
	 KindEditor.ready(function(K) {
			editor1 = K.create('textarea[name="content1"]', {
			cssPath : paths+'/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : paths+'/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : paths+'/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			},
			 afterChange : function() {
		     $('.word_count1').html(this.count()); //字数统计包含HTML代码
		     var a = this.count();
		     var limitNum = 2000;  //设定限制字数
		     var pattern = '还可以输入' + limitNum + '字'; 
		     $('.word_surplus').html(pattern); //输入显示
		     if(a > limitNum) {
		      pattern = ('字数超过限制，请适当删除部分内容');
		      //超过字数限制自动截取
		      var strValue = editor1.text();
		      strValue = strValue.substring(0,limitNum);
		      editor1.text(strValue);      
		     } else {
		      //计算剩余字数
		      var result = limitNum - this.count(); 
		      pattern = '还可以输入' +  result + '字'; 
		      }
		      $('.word_surplus').html(pattern); //输入显示
    		} 
		});
		prettyPrint();
	});
	function getExpRei(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkExpNo("+ e.value +");' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function checkExpNo(reiid){
		var executeUrl = paths+"/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
		window.open(executeUrl);
    }
	function getDetail(e){
		if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkDetailpay();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function checkDetailpay(){
 		var selectRow = expBeiList_grid.getSelected();
		var executeUrl = "/default/ame_fee/PaymentApply/PayApplyDetail.jsp?expid=" + selectRow.expid;
		window.open(executeUrl, "付款申请明细", "fullscreen=1");
    }
	function getProjectNameDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkProjectName();' title='点击编辑'>" + e.value + "</a>";
    	}
    }
    function checkProjectName(){
    	var selectRow = rdProject_grid.getSelected();
		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
		window.open(executeUrl, "项目详细信息", "fullscreen=1");
    }

    function onTitleRenderer(e) {//给合同标号加链接
		return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
	}
	function doView(){//查看合同明细
		var selectRow = csContract_grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条合同数据!");
			return;
		}
		var executeUrl = paths+"/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
		window.open(executeUrl);
	}
	function onMachinRenderer(e) {
 		return "<a href='javascript:void(0)' onclick='doViewMachine();' title='点击查看'>" + e.value + "</a>";
 	}
 
 	function doViewMachine(){
 		var selectRow = misMachine_grid.getSelected();
		var executeUrl = "/default/machine/machineDetail.jsp?id=" + selectRow.id;
		window.open(executeUrl, "机器详细信息", "fullscreen=1");
    }
    //将中国标准时间格式化为“yyyy-MM-dd HH:mm:ss”
	function ondealdate(e){
		if(e.value){
		  var now  = e.value;
		  var   year=now.getFullYear();     
          var   month=now.getMonth()+1;
          var   day=now.getDate();     
          var   hours=now.getHours();     
          var   minutes=now.getMinutes();     
          var   seconds=now.getSeconds();
          var curDateTime = year;
          if(month>9){
			curDateTime = curDateTime +"-" + month;
		  }else{
		  	curDateTime = curDateTime+"-" + "0" + month;
		  }
    	if(day>9){
			curDateTime = curDateTime+"-" + day;
		}else{
			curDateTime = curDateTime+"-" + "0" + day;
			}
		if(hours>9){
			curDateTime = curDateTime+"   " + hours;
		}else{
			curDateTime = curDateTime+"   " + "0" + hours;
			}
		if(minutes>9){
			curDateTime = curDateTime+":" + minutes;
		}else{
			curDateTime = curDateTime+":" + "0" + minutes;
			}
		if(seconds>9){
			curDateTime = curDateTime+":" + seconds;
		}else{
			curDateTime = curDateTime+":" + "0" + seconds;
			}     
          return   curDateTime;     
		}
	}

	function dictGetType(e){
		return nui.getDictText('EXP_EXPTYPE',e.value);
	}
	function dictGetStatus(e){
		return nui.getDictText('EXP_CHECKFLAG',e.value);
	}
    function getHxStatus(e){
    	return nui.getDictText('AME_HXSTATUS',e.value);//设置业务字典值
    }
	function dictProType(e){
		return nui.getDictText('PROJECT_TYPE',e.value);
	}
	function dictprojectStatus(e){
		return nui.getDictText('MIS_PROJSTATUS',e.value);
	}
	function dictGetOutStatus(e){
		return nui.getDictText('MIS_PROJOUTSTATUS',e.value);
	}
	function dictGetDeStatus(e){
		return nui.getDictText('MIS_PROJDESTATUS',e.value);
	}
	function onGenderRenderer(e) {//部门业务字典
        return nui.getDictText('CONT_ORG',e.value);
    }
    
    function onGender1Renderer(e) {//合同状态
        return nui.getDictText('CS_CONTRACTTYPE',e.value);
    }
	
	function dictType(e){
		return nui.getDictText("MIS_MA_TYPE",e.value);
	}
	function dictIsGuoteng(e){
		return nui.getDictText("MIS_MA_GUOTENG",e.value);
	}
	
	function dictSecType(e){
		return nui.getDictText("MIS_MA_SECTYPE",e.value);
	}
	
	function dictStorageType(e){
		return nui.getDictText("MIS_MA_STORAGE",e.value);
	}
	
	function dictStatus(e){
		return nui.getDictText("MIS_MA_STATUS",e.value);
	}
	//结构类型
	function orgtype(e){
		return nui.getDictText('ABF_ORGTYPE',e.value);
	}
	//机构状态
	function orgstatus(e){
		return nui.getDictText('ABF_ORGSTATUS',e.value);
	}
	//机构等级
	function orgdegree(e){
		return nui.getDictText('ABF_ORGDEGREE',e.value);
	}
    function getOpStatus(e) {
        return nui.getDictText('ABF_OPERSTATUS',e.value);
    }

	function dictArea(e){
		return nui.getDictText("EXP_REGION",e.value);
	}
	//人员状态
	function empstatus(e){
		return nui.getDictText('ABF_EMPSTATUS',e.value);
	}
	//性别
	function gender(e){
		return nui.getDictText('ABF_GENDER',e.value);
	}
	//合同属性
	function getConttype(e){
		return nui.getDictText('CONT_TYPE',e.value);
	}
	//合同性质
	function getContprop(e){
		return nui.getDictText('CONT_PROP',e.value);
	}
	//请假审批状态
	function getleaveStatus(e){
		return nui.getDictText('AME_LEAVESTATUS',e.value);
	}
    //操作
	function onActionRenderer(e) {
        var s = "";
        	s = s +  '<a class="dgBtn" href="javascript:doReassign(' + e.rowIndex + ', true)">改派</a> ';
	        s = s + '<a class="dgBtn"  href="javascript:doOperate(' + e.rowIndex + ', true)">查看</a> ';
        return s;
    }

    //改派
    function doReassign(rowIndex, isShowDetail) {
    	var row = taskList_grid.getRow(rowIndex);
    	nui.open({
			url: paths + "/ame_common/selectEmp.jsp",
			title: "指定改派人员",
			width: 400,
			height: 150,
			onload: function () {
				//var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data.userid) {			//data.userid  data.empname
						var json = {workItemID:row.workItemID ,personID:data.userid, catalogName:row.catalogName, currentActName:row.workItemName};
						nui.ajax({
				    		url: "org.gocom.bps.wfclient.task.business.task.reassign.biz.ext",
				            data: json,
				            type: 'POST',
				            cache: false,
				            showModal: false,
				            contentType: 'text/json',
				            success: function (o) {
				            	alert("改派成功！");
				            	taskList_grid.reload();
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				                alert(jqXHR.responseText);
				            }
				    	});
					}else{
						//alert("至少选择一条记录！");
					}
				}
			}
		});
    }
	//执行操作
    function doOperate(rowIndex, isShowDetail) {
    	var row = taskList_grid.getRow(rowIndex);
    	var width=1000;
    		url = paths + "/bps/wfclient/task/task.jsp";
	    	title = "工作项详细信息"+"-"+row.workItemName;
		    nui.open({
		    	allowResize: true,
				url: url,
				title: title,
				width: width,
				height: 600,
				enableDragProxy: false,
				onload: function () {
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						iframe.contentWindow.initData(row, "self", isShowDetail);
					}	
				},
				ondestroy: function (action){
					if (action == "ok") {
						taskList_grid.load();
					} else if (action == "execute") {  
						doOperate(rowIndex, false);					
					}
				}
			});
    }
    
    //打印pdf
	function exportPDF(filename){
		pdfjson.filename = filename;
		nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_entry.createLaborContractByPDFTemplate.biz.ext",
	        type: "post",
	        data: pdfjson,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		var filePath = o.downloadFile;
	     		var fileName = "保密承诺书";
	     		if(filename == "leaveapply2"){
		        	fileName = "离职申请";
	     		}else if(filename == "leaveProveprint"){
	     			fileName = "离职证明";
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
	
	//关闭
	function onCancel(){
		CloseWindow("cancel");
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}