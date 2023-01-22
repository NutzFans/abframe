<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2017-01-04 14:11:44
  - Description:
-->
<head>
	<title>外包人员信息变更</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<!-- 
	显示外包人员基本信息以及项目关系列表（显示服务项目、所属客户、服务开始日期、预计结束日期、投入比重、服务状态、实际结束日期），
	允许变更内容：状态（已离场人员不允许变更）、离场日期（状态为离场时允许编辑）、汇报对象，
	保存时通过微信告知PMO（微信内容包含变更前后信息），写操作日志 
	-->
	
	<div class="nui-fit">
		<form id="form1" method="post">
			<input name="purOutperson.outperno" id="outperno" class="nui-hidden" />
			<input name="purOutperson.ryzjglsuppliersname" id="suppliersname" class="nui-hidden" />
			<input name="purOutperson.ryzjglcustname"class="nui-hidden" />
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包人员基本信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" width="100px">姓名：</td>
							<td id="outpername" style="width:100px"></td>
							<td align="right" style="width:100px;">身份证号码：</td>
							<td id="outpercartno" style="width:170px"></td>
							<td align="right" style="width:100px;">性别：</td>
							<td id="gender" style="width:100px"></td>
							<td align="right" style="width:100px;">学历：</td>
							<td id="degree" style="width:100px"></td>
						</tr>
						<tr><td align="right" style="width:100px;">毕业时间：</td>
							<td id="gradudate" style="width:100px"></td>
							<td align="right" style="width:100px;">联系电话：</td>
							<td id="linktel" style="width:170px"></td>
							<td align="right" style="width:100px;">供应商：</td>
							<td colspan="3" id="custid" style="width:340px"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">联系邮箱：</td>
							<td colspan="3" id="linkemail" style="width:308px"></td>
							<td align="right" style="width:100px;">备注：</td>
							<td colspan="3" id="memo" style="width:340px;height: 22px;"></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<!-- 外包人员归属项目列表 -->
		<fieldset style="border: solid 1px #aaa;padding: 3px;" id="purProjOutperlist">
			<legend>参与的项目列表</legend>
			<div id="purProjOutper_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="purProjOutper" 
				 showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
				 url="com.primeton.eos.ame_pur.outperson.queryProjByReport.biz.ext" 
				showFooter="false" oncellbeginedit="cellbeginedit" oncellendedit="cellendclick">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="projoutid" visible="false" align="center" headerAlign="center">编号</div>
					<div field="custid" visible="false" align="center" headerAlign="center">服务客户编号</div>
					<div field="projectname" width="200" align="left" headerAlign="center" >服务项目
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
					<div field="custname" width="auto" align="left" headerAlign="center">服务客户
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
					<div field="expenddate" width="80" align="center" renderer="onDealDate" headerAlign="center">预计结束日期</div>
					<div field="startdate" width="80" align="center" renderer="onDealDate" headerAlign="center">服务开始日期</div>
					<div field="currentstatus" width="90" align="center" headerAlign="center" renderer="dictGetStatus">服务状态
						<input property="editor" class="nui-dictcombobox" dictTypeId="AME_OUTPERSTATUS" required="false"/>
					</div>
					<div field="actenddate" width="80" align="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" headerAlign="center">实际结束日期
						<input property="editor" class="nui-datepicker" inputStyle="text-align: left" />
					</div>
					<div field="inputratio" width="60" align="center" headerAlign="center">投入比重</div>
					<div field="manager" width="80" align="center" headerAlign="center" displayField="managername">汇报对象
						<input property="editor" class="nui-buttonedit" onbuttonclick="selectOrgname" 
							allowInput="false"/>
					</div>
				</div>
			</div>
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	
	<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
	  	//外包人员归属项目
	  	var purProjOutper_grid = nui.get("purProjOutper_grid");
	  	//修改保存逻辑流路径
        var updateURL = "com.primeton.eos.ame_pur.outperson.changePurOutperson.biz.ext";
    	//修改前的数据
    	var updateBeforeData;
    	//修改后的数据
    	var updateEndData;
    	<%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		
	    %>
	    function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "editChange"){
		    	var json = nui.encode({purOutperson: {outperno: data.outperno}});
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_pur.outperson.getPurOutpersonDetail.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                    form.setData(o);
	                    document.getElementById("outpername").innerHTML= o.purOutperson.outpername == null ? "" : o.purOutperson.outpername;
	                    document.getElementById("outpercartno").innerHTML= o.purOutperson.outpercartno == null ? "" : o.purOutperson.outpercartno;
	                    document.getElementById("gender").innerHTML= o.purOutperson.gender == null ? "" : nui.getDictText("ABF_GENDER",o.purOutperson.gender);
	                    document.getElementById("degree").innerHTML= o.purOutperson.degree == null ? "" : nui.getDictText("DEGREE",o.purOutperson.degree);
	                    document.getElementById("gradudate").innerHTML= o.purOutperson.gradudate == null ? "" : o.purOutperson.gradudate;
	                    document.getElementById("linktel").innerHTML= o.purOutperson.linktel == null ? "" : o.purOutperson.linktel;
	                    document.getElementById("custid").innerHTML= o.purOutperson.ryzjglcustname == null ? "" : o.purOutperson.ryzjglcustname;
	                    document.getElementById("linkemail").innerHTML= o.purOutperson.linkemail == null ? "" : o.purOutperson.linkemail;
	                    document.getElementById("memo").innerHTML= o.purOutperson.memo == null ? "" : o.purOutperson.memo;
	                    //nui.get("suppliersname").setValue(o.purOutperson.ryzjglsuppliersname);
	                    form.isChanged(false);
	                	//编辑时,加载外包人员归属项目列表
	                	var outperno = nui.get("outperno").getValue();
	                	purProjOutper_grid.sortBy("startdate","desc");
	                	purProjOutper_grid.load({"purOutperson": {"outperno": outperno,"iden": "PurOutpersonChange"}},function(){
	                		//修改前的数据
	                		updateBeforeData = purProjOutper_grid.getData();
	                		updateBeforeData = nui.clone(updateBeforeData);
	                	});
	                	
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}
    	}
    	
    	purProjOutper_grid.on("drawcell", function (e) {
	        var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
	        //状态为已离场的，可以设置实际结束日期，设置行样式
	    	if(record.currentstatus != "0"){
	    		if(field=="currentstatus" || field=="manager"){
		        	e.cellStyle = "background-color: cyan";
	    		}
	    	}
	    	if(record.currentstatus == "0"){
	    		if(record.currentstatusOld != "0"){
		    		if(field=="currentstatus" || field=="actenddate"){
			        	e.cellStyle = "background-color: cyan";
		    		}
		    	}else{
		    		if(field=="actenddate"){
			        	e.cellStyle = "background-color: cyan";
		    		}
		    	}
	        }
		});
		
		function cellbeginedit(e){
			var record = e.record;
			var field = e.field;
			if (field == "manager" && record.currentstatus == "0"){
                e.cancel = true;    //如果已离场，则不允许编辑汇报对象
            }else if (field == "actenddate" && record.currentstatus != "0"){
            	e.cancel = true;	//如果不是已离场，则不允许编辑实际结束日期
            }
			/* if(e.record.currentstatus == "0"){	//已离场
				if(e.record.currentstatusOld != "0"){
					if(e.column.field == "actenddate"){	//实际结束日期
						e.column.readOnly = false;
					}
					if(e.column.field == "currentstatus"){	//
						e.column.readOnly = false;
					}
					if(e.column.field == "manager"){	//
						e.column.readOnly = true;
					}
				}else{
					if(e.column.field == "actenddate"){	//实际结束日期
						e.column.readOnly = false;
					}
					if(e.column.field == "currentstatus"){	//
						e.column.readOnly = true;
					}
					if(e.column.field == "manager"){	//
						e.column.readOnly = true;
					}
				}
			}else{
				if(e.column.field == "actenddate"){	//实际结束日期
					e.column.readOnly = true;
				}
				if(e.column.field == "currentstatus"){	//
					e.column.readOnly = false;
				}
				if(e.column.field == "manager"){	//
					e.column.readOnly = false;
				}
			} */
		}
		
		function cellendclick(e){
		}
    	
        function SaveData() {
        	var outperno = nui.get("outperno").getValue();
        	var updateData = "";
			if(outperno){
				updateData = "update";
			}
			var o = form.getData();
			//修改后的数据
			updateEndData = purProjOutper_grid.getChanges();
			//变更信息拼接
			var updateMessage;
			//供应商名称
			var suppliersname = nui.get("suppliersname").getValue();
			//外包人员姓名
			var outpername = document.getElementById("outpername").innerHTML;
			for(var i = 0;i < updateBeforeData.length;i++){
				for(var j = 0;j < updateEndData.length;j++){
					if(updateBeforeData[i].projoutid == updateEndData[j].projoutid){
						if(updateBeforeData[i].currentstatus != updateEndData[j].currentstatus && updateEndData[j].currentstatus == '0'){
							updateEndData[j].isSendMail = '1';
						}else{
							updateEndData[j].isSendMail = '0';
						}
						if(!updateMessage){
							updateMessage = "合作伙伴【"+ suppliersname +"】的外包人员【" + outpername + "】在【" + 
								updateBeforeData[i].projectname + "】中变更前状态：" 
								+ nui.getDictText('AME_OUTPERSTATUS',updateBeforeData[i].currentstatus) 
							if(null != updateBeforeData[i].actenddate){
								updateMessage += "，实际结束日期：" + updateBeforeData[i].actenddate;
							}else{
								updateMessage += "，实际结束日期为空";
							}
							updateMessage += "，汇报对象：" + updateBeforeData[i].managername;
							updateMessage += "，变更后状态：" + nui.getDictText('AME_OUTPERSTATUS',updateEndData[j].currentstatus);
							if(updateEndData[j].actenddate != null){
								if(typeof(updateEndData[j].actenddate) == "object"){
									updateMessage += "，实际结束日期：" + updateEndData[j].actenddate.getFullYear() + "-" 
										+ ((updateEndData[j].actenddate.getMonth() + 1) < 10 ? "0" + (updateEndData[j].actenddate.getMonth() + 1) : (updateEndData[j].actenddate.getMonth() + 1)) + "-" 
										+ (updateEndData[j].actenddate.getDate() < 10 ? "0" + (updateEndData[j].actenddate.getDate()) : (updateEndData[j].actenddate.getDate()));
								}else{
									updateMessage += "，实际结束日期：" + updateEndData[j].actenddate.substring(0,10);
								}
							}else{
								updateMessage += "，实际结束日期为空";
							}
							updateMessage += "，汇报对象：" + updateEndData[j].managername;
						}else{
							updateMessage += "；在【" + updateBeforeData[i].projectname + "】中变更前状态：" 
								+ nui.getDictText('AME_OUTPERSTATUS',updateBeforeData[i].currentstatus);
							if(null != updateBeforeData[i].actenddate){
								updateMessage += "，实际结束日期：" + updateBeforeData[i].actenddate;
							}else{
								updateMessage += "，实际结束日期为空";
							}
							updateMessage += "，汇报对象：" + updateBeforeData[i].managername;
							updateMessage += "，变更后状态：" + nui.getDictText('AME_OUTPERSTATUS',updateEndData[j].currentstatus)
							if(updateEndData[j].actenddate != null){
								if(typeof(updateEndData[j].actenddate) == "object"){
									updateMessage += "，实际结束日期：" + updateEndData[j].actenddate.getFullYear() + "-" 
										+ ((updateEndData[j].actenddate.getMonth() + 1) < 10 ? "0" + (updateEndData[j].actenddate.getMonth() + 1) : (updateEndData[j].actenddate.getMonth() + 1)) + "-" 
										+ (updateEndData[j].actenddate.getDate() < 10 ? "0" + (updateEndData[j].actenddate.getDate()) : (updateEndData[j].actenddate.getDate()));
								}else{
									updateMessage += "，实际结束日期：" + updateEndData[j].actenddate.substring(0,10);
								}
							}else{
								updateMessage += "，实际结束日期为空";
							}
							updateMessage += "，汇报对象：" + updateEndData[j].managername;
						}
					}
				}
			}
			updateMessage += "。操作者是" + "<%=username %>" + "。";
			var changeData = updateEndData;
            var json = {"purProjOutpers": changeData,"updateMessage": updateMessage,"outperno": outperno,"outpername": outpername,"purOutperson":form.getData().purOutperson};
            nui.ajax({
                url: updateURL,
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
					var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						nui.alert("保存成功",null,function(){
		              		CloseWindow("ok");
		              		/* if(updateData == "new"){
		              			CloseWindow("ok");
		              		}
		              		purProjOutper_grid.reload({purOutperson: {outperno: outperno}}); */
						});
	              	}else{
	                	nui.alert("保存失败", "系统提示", function(action){
		                  	if(action == "ok" || action == "close"){
		                  	}
	                  	});
	                }    
				},
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
	    }
	
        //标准方法接口定义
        function CloseWindow(action) {
            if (action == "close" && purProjOutper_grid.isChanged()) {
            	if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
		function onOk(e){
    		var rows = purProjOutper_grid.getChanges();
    		if(rows.length > 0){
    		
    			//actenddate
    			for(var i = 0;i < rows.length;i ++){
    				if(rows[i].actenddate < rows[i].startdate){
    					nui.alert("实际结束日期不能小于服务开始日期！");
    					return;
    				}
    				//如果人员状态为已离场（0），则必须录入实际结束日期
    				if(rows[i].currentstatus == "0" && (rows[i].actenddate == "" || rows[i].actenddate == null)){
    					nui.alert("人员服务状态为已离场，必须录入实际结束日期！");
    					return;
    				}
    			}
        		nui.confirm("确认保存吗？", "系统提示",
	            	function (action) {            
		                if (action == "ok") {
		                	SaveData();
				        }
			    	}
			    );
    		}else{
    			nui.alert("数据未作修改，无需保存！");
    		}
	    }
    
        function onCancel(e) {
        	var rows = purProjOutper_grid.getChanges();
        	if(rows.length > 0){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
        
        
        //外包人员归属项目列表-选择项目,级联得到所属订单，合同
        function selectProjectList(){
        	//var allpurProj = purProjOutper_grid.getData();
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp?preSettle=preSettle",
                title: "选择项目",
                width: 850,
                height: 420,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.projectno);
                            btnEdit.setText(data.projectName);
                            //连带出项目服务客户
                            var row = purProjOutper_grid.getSelected();
                            var rowData = {custid:data.custid,custname:data.custname};
                            purProjOutper_grid.updateRow(row,rowData); 
                        }
                    }
                }
            });
        }
        
        //身份证号码验证
        function isIdCard(e) {
        	var cardid = nui.get("outpercartno").getValue();
        	if (e.isValid) {
				//身份证正则表达式(18位) 
				var isIdCard2 = /^[1-9]\d{5}(19\d{2}|[2-9]\d{3})((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])(\d{4}|\d{3}X)$/i;
				var stard = "10X98765432"; //最后一位身份证的号码
				var first = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2]; //1-17系数
				var sum = 0;
				if (!isIdCard2.test(cardid)) {
					e.errorText = "身份证号码格式不符合要求";
					e.isValid = false;
					return;
				}else{
					e.isValid = true;
				}
				var year = cardid.substr(6, 4);
				var month = cardid.substr(10, 2);
				var day = cardid.substr(12, 2);
				var birthday = cardid.substr(6, 8);
				
				if (birthday != dateToString(new Date(year + '/' + month + '/' + day))) { //校验日期是否合法
					e.errorText = "身份证号码出生年月日不符合要求";
					e.isValid = false;
					return;
				}else{
					e.isValid = true;
				}
				var cardids = [];
				for(var i = 0;i < cardid.length;i++) {
					cardids[i] = cardid.substr(i,1);
				}
				for(var i = 0;i < cardids.length - 1;i++) {
					sum += cardids[i] * first[i];
				}
				var result = sum % 11;
				var stards = [];
				for(var i = 0;i < stard.length;i++){
					stards[i] = stard.substr(i,1);
				}
				var last = stards[result]; //计算出来的最后一位身份证号码
				if (cardids[cardids.length - 1].toUpperCase() == last) {
					e.isValid = true;
					return;
				} else {
					<%--nui.alert("身份证号码校验码不符合要求");
					e.errorText = "身份证号码校验码不符合要求";--%>
					e.isValid = true;
					return;
				}
			}
		}
		
		//日期转字符串 返回日期格式20080808
		function dateToString(date) {
			if (date instanceof Date) {
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				month = month < 10 ? '0' + month: month;
				var day = date.getDate();
				day = day < 10 ? '0' + day: day;
				return year + "" + month + "" + day;
			}
			return '';
		}
		
		//设置业务字典值-人员状态
		function dictGetStatus(e){
			return nui.getDictText('AME_OUTPERSTATUS',e.value);
		}
		
		//设置日期格式
		function onDealDate(e){
			if(e.cellHtml){
				return e.cellHtml.substring(0,10);
			}
		}
		
	    function checkInputratio(){
	    	var inputration = nui.get("inputratio").getValue();
	    	if(inputration < 0 || inputration >1){
	    		nui.alert("投入比重不能大于1,或小于0");
	    		//清空该文本框
	    		nui.get("inputratio").setValue();
	    	}
	    }
	    
	    function selectOrgname(){
	    	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择汇报对象",
                width: 850,
                height: 420,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                            //连带出项目服务客户
                            var row = purProjOutper_grid.getSelected();
                            var rowData = {manager: data.userid,managername: data.empname};
                            purProjOutper_grid.updateRow(row,rowData); 
                        }
                    }
                }
            });
	    }
    </script>
</body>
</html>