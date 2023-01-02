<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="commonj.sdo.DataObject"%>
<%@ page import="java.util.Map" %>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="org.json.simple.JSONObject"%>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2020-08-22 13:29:35
  - Description:
-->
<head>
<title>补充请假记录</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
    }
     .myIndex{
        background:#FFF68F;
    }
</style>
</head>
<body>
<div class="nui-fit">
	<div class="nui-panel" title="请假记录" style="width: 100%;">
		<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;">
			<legend>请假信息</legend>
			<form id="form_leave" method="post">
			<input name="fileids" id="fileids1" class="nui-hidden"/>
			<input name="applydate" class="nui-hidden"/>
			<input name="status" class="nui-hidden"/>
			<input name="leaveid" id="leaveid" class="nui-hidden"/>
			<%--<input name="processinstid" class="nui-hidden"/>--%>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 80px">请假人：</td>
							<td>
								<input id="userid" name="userid" class="nui-buttonedit" <%--readonly="readonly"--%> onbuttonclick="selectOmLeave"  style="width: 110px" required="true"/>
								<%--<input id="userid" name="userid" class="nui-hidden"/>--%>
							</td>
							<td align="right" style="width: 80px">所在部门：</td>
							<td>
								<input id="orgname" name="orgname" class="nui-textbox" readonly="readonly" style="width: 110px"/>
								<input id="orgid" name="orgid" class="nui-hidden"/>
							</td>
							<td align="right" style="width: 80px">工号：</td>
							<td>
								<input id="empcode" name="empcode" class="nui-textbox" readonly="readonly" style="width: 110px"/>
							</td>
							<td align="right" style="width: 80px">性别：</td>
							<td>
								<input id="gender" name="gender" class="nui-textbox" readonly="readonly" style="width: 110px"/>
							</td>
							<td align="right" style="width: 80px">所属公司：</td>
							<td>
								<input id="company"  name="company" class="nui-textbox" readonly="readonly" style="width: 110px"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 80px">入职日期：</td>
							<td>
								<input id="indate" name="indate" class="nui-datepicker" style="width: 110px" readonly="readonly"/>
							</td>
							<td align="right" style="width: 80px">员工属性：</td>
							<td>
								<input id="emptype" name="emptype" class="nui-dictcombobox"  dictTypeId="EMP_TYPE" style="width: 110px" required="false" readonly="readonly"/>
							</td>
							<td align="right" style="width: 80px">请假类型：</td>
							<td>
								<input id="leavetype" name="leavetype" class="nui-combobox" url="com.primeton.eos.ame_permanage.ame_leavepro.getLeaveType.biz.ext" valueField="leavetypeid" textField="leavetype" dataField="leavetypes" style="width: 110px" required="true" onvaluechanged="changetype"/>
							</td>
							<td align="right" style="width: 80px">岗位代理人：</td>
							<td>
								<input id="postagent" name="postagent" class="nui-buttonedit" 
									onbuttonclick="selectOmEmployee" allowInput="false" style="width: 110px"/>
							</td>
							<td align="right" style="width: 80px">HR确认日期：</td>
							<td>
								<input id="confirdate" name="confirdate" class="nui-datepicker"style="width: 110px" />
							</td>
						</tr>
						<tr>
							<td align="right" valign="top" >请假事由：</td>
							<td colspan="9">
								<input name="reason" class="nui-textarea" vtype="maxLength:250" required = "true" style="width: 905px" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field11" style="border: solid 1px #aaa;padding: 3px;width: 97%">
			<legend>本次请假详情</legend>
			<div class="nui-toolbar" style="border-bottom: 0;padding: 0px;" id="button_inorgid1">
	            <table style="width: 100%;">
	            	<tr>
	                    <td style="width: 20%;">
	                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addRow('grid_leave')">增加</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeRow('grid_leave')">删除</a>
	                    </td>
	                </tr>
	             </table>           
	        </div>
	    	<div id="grid_leave" class="nui-datagrid" style="height: auto;" allowCellSelect="true" 
	    	url="com.primeton.eos.ame_permanage.ame_leavepro.queryLeaveDetail.biz.ext" dataField="leavedetail"
	    	showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="calDays" showSummaryRow="true" ondrawsummarycell="drawsum">
	            <div property="columns">
	            	<div type="checkcolumn" width="10">&nbsp;</div>
	                <div field="startdate" width="110" align="center" headerAlign="center" vtype="required:true" renderer="onDealDate" cellCls="myIndex">开始日期
	                	<input property="editor" class="nui-datepicker"  required="true"/>
	                </div>
	                <div field="sptype" width="60" renderer="dictype" align="center" vtype="required:true" headerAlign="center" cellCls="myIndex">开始时段
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_TIMEPERIOD" required="true"/>
	                </div>
	                <div field="enddate" width="110" align="center" headerAlign="center" vtype="required:true" renderer="onDealDate" cellCls="myIndex">结束日期
	                	<input property="editor" class="nui-datepicker"  required="true"/>
	                </div>
	                <div field="eptype" width="60" renderer="dictype" align="center" vtype="required:true" headerAlign="center" cellCls="myIndex">结束时段
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_TIMEPERIOD" required="true"/>
	                </div>
	                <div field="days" name="days" width="60" align="right" vtype="required:true" headerAlign="center" numberFormat="n1" summaryType="sum" cellCls="myIndex">请假天数
	                	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
	                </div> 
	            </div>
	        </div>
		</fieldset>
		
		<fieldset id="field_nj" style="border: solid 1px #aaa;padding: 3px;width: 1000px;">
			<legend>申请人年假信息</legend>
	    	<div id="grid_leave1" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    		 url="com.primeton.eos.ame_permanage.ame_leavepro.getEmpVac.biz.ext" dataField="vacs"
	    		 showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="doCal_EmpVac">
	            <div property="columns">
	                <div field="indate" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" >入职日期 </div>
	                <div field="socialstart" dateFormat="yyyy-MM-dd" width="100" align="center" headerAlign="center" >社会工作起始时间 </div>
	                <div field="workyears" width="50" align="center" headerAlign="center" >社会工龄 </div>
	                <div field="comyears" width="40" align="center" headerAlign="center" >司龄 </div>
	                <div field="workingdays" width="80" align="center" headerAlign="center" >当年在职天数</div>
	                <div field="standvac" width="80" align="center" headerAlign="center" >标准年假天数 </div>
	                <div field="bonusvac" width="80" align="center" headerAlign="center" >奖励年假天数 </div>
	                <div field="vacdays" width="50" align="center" headerAlign="center" >当年可用</div>
	                <div field="lastrest" width="50" align="center" headerAlign="center" >上年剩余 </div>
	                <div field="overvac" width="90" align="center" headerAlign="center" >当年春节统筹休假</div> 
	                <div field="daysoff" width="80" align="center" headerAlign="center" cellCls="myIndex">当年已休
	                	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
	                </div> 
	                <div field="restbonus" width="90" align="center" headerAlign="center" >当年奖励剩余</div> 
	                <div field="nowrestvac" width="80" align="center" headerAlign="center" >当前可请年假 </div> 
	            </div>
	        </div>
		</fieldset>
		
		<fieldset style="border: solid 1px #aaa;padding: 3px;width: 97%" id = "yearvac">
			<legend>申请人本年度请假记录</legend>
	    	<div id="grid_leaves" class="nui-datagrid" style="height: auto;" allowCellSelect="true" 
	    	url="com.primeton.eos.ame_permanage.ame_leavepro.queryDetail.biz.ext" dataField="leavedetail"
	    	showPager="false" showSummaryRow="true" ondrawsummarycell="drawsum">
	            <div property="columns">
	                <div field="leavetype" width="40" displayField="leavetypename" align="center" headerAlign="center">请假类型</div>
	                <div field="starts" width="60" align="center" headerAlign="center">开始时间</div>
	                <div field="ends" width="60" align="center" headerAlign="center">结束时间</div>
	                <div field="status" width="40" renderer="leavestatus" align="center" headerAlign="center">状态</div>
	                <div field="days" name="days" width="40" align="right" headerAlign="center" numberFormat="n1" summaryType="sum">请假天数</div> 
	                <div field="reason" width="200" align="left" headerAlign="center">请假事由</div> 
	            </div>
	        </div>
		</fieldset>
		
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;width: 97%">
			<legend>请假附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
	</div>
</div>

<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" id="creatLeave" style="width: 80px;margin-right: 20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;margin-right: 100px;" id="canelButton">关闭</a>
</div>
</body>
<script type="text/javascript">
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var nowuserid='<%=nowuserid %>';
	var nowusername='<%=nowusername%>';
	nui.parse();
	var form_leave = new nui.Form("form_leave");//请假申请信息
  	var grid_leave = nui.get("grid_leave");//请假明细
  	var grid_leaves = nui.get("grid_leaves");//当年请假明细
  	var grid_leave1 = nui.get("grid_leave1");//年假记录
  	
  	var leaverule;//请假天数计算规则
	var filetips;//附件提示
	var limitdays;//最高请假天数
	var isreg;//是否常规请假
  	
  	function SetData(data){
  		var json = {"leaveid": data.leaveid};
  		if(data.leaveid == null || data.leaveid == ''){
  		}else{
	  		nui.ajax({//获取差旅信息
	      		url: "com.primeton.eos.ame_permanage.ame_leavepro.getLeaveByHrEdit.biz.ext",
		      	type: 'POST',
	          	data: json,
	      		success: function (o){
	       	  		form_leave.setData(o.leaveinfo);
	  				<%--var processInstID = o.leaveinfo.processinstid;--%>
	  				nui.get("postagent").setText(o.leaveinfo.agentname);//岗位代理人
	  				nui.get("leavetype").setText(o.leaveinfo.leavetypename);//请假类型
	  				nui.get("userid").setValue(o.leaveinfo.userid);
	  				nui.get("userid").setText(o.leaveinfo.username);
	  				leaverule = o.leaveinfo.leaverule;
	  				
					var json = {leaveid: o.leaveinfo.leaveid};
	  				grid_leave.load(json);//加载本次请假详情
	  				//加载附件
	  				var grid_0 = nui.get("grid_0");
	  				grid_0.load({"groupid":"ameLeave","relationid":o.leaveinfo.leaveid});
					grid_0.sortBy("fileTime","desc");
	  				//grid_spr.load({processinstid: processInstID})//加载部门审批人列表
	  				var json1 = {"criteria": 
	  								{"_expr[0]":
	  									{"_property":"leaveid","_op":"in","_ref":"1"}
	  								,
	  								"_ref[0]":
	  									{"_id":"1","_entity":"com.primeton.eos.ame_permanage.ame_permanage.AmeLeaveinfo",
	  										"_expr[0]":
	  										{"_property":"userid","_value":o.leaveinfo.userid},
	  										"_expr[1]":
	  										{"_property":"status","_op":"<>","_value":"-2"},
	  										"_select":{"_field[0]":"leaveid"}
	  									},
  									"_expr[1]":{"_property":"leaveid","_op":"<>","_value":o.leaveinfo.leaveid},
  									"_or[0]":
  										{
	  										"_expr[0]":{
	  											"_property":"startdate","_op":"between","_min":new Date().getFullYear()+"-01-01","_max":new Date().getFullYear()+"-12-31"
	  										},
	  										"_expr[1]":{
	  											"_property":"enddate","_op":"between","_min":new Date().getFullYear()+"-01-01","_max":new Date().getFullYear()+"-12-31"
	  										}
  										}
	  								}
	  							};
	  				grid_leaves.sortBy("startdate","desc")
	  				grid_leaves.load(json1);//加载本年度请假详情
	  				
	  				
	  				
	  				if(o.leaveinfo.leavetype=="1"){
						grid_leave1.load({userid:nui.get("userid").getValue()});
					}else{
					}
					
	          	},
		      	error: function (jqXHR, textStatus, errorThrown) {
		        	alert(jqXHR.responseText);
		      	}
	    	});
    	}
  	}
  	
  	function onCancel(e) {
        CloseWindow("cancel");
    }
    //标准方法接口定义
    function CloseWindow(action) {           
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
    
    //增加请假明细
    function addRow(gridTemp){
    	var grid = nui.get(gridTemp);
    	var rowS = {name: "New Row"} 
		grid.addRow(rowS);
    }
    
    function onOk(){
    	var leaveinfo = form_leave.getData();//请假信息
    	var leavedetail = grid_leave.getData();//请假记录
    	if(!form_leave.validate()){
			nui.alert("表单信息填写不完整，请确认必输项是否填写!");
			return;
		}
		if(leavedetail.length == 0){
			nui.alert("请填写请假记录！");
			return false;
		}
		grid_leave.validate();
		if(grid_leave.isValid()==false){
			nui.alert("请假详情填写不完整，请确认必输项是否填写!");
			return;
		}
			
		var totaldays = $(grid_leave.getSummaryCellEl("days")).find("b").text();//总天数
	    	
    	if(limitdays!=null&&limitdays!=""&limitdays!=0){
    		if(totaldays>limitdays){
	    		nui.alert("该类型请假总天数不能超过"+limitdays+"天，请检查并修改！");
				return;
    		}
    	}
	    	
    	if(leaveinfo.leavetype=="1"){//如果是年假
	    	//年假信息
	    	var vacs = grid_leave1.getData();
	    	if(vacs.length==0){
	    		nui.alert("年假信息未初始化，请联系HR添加！");
	    		return;
	    	}else{
	    		if(vacs[0].nowrestvac<0){
	    			nui.alert("申请休得年假天数超过当前剩余年假，请检查并修改！");
	    			return;
	    		}
	    	}
    	}
		
		for(var i=0;i<leavedetail.length;i++){
			for(var j=0;j<leavedetail.length;j++){
				if(i!=j){
					if(judgeDate(leavedetail[i],leavedetail[j])==false){
						nui.alert("日期区间有重复，请检查并修改！");
						return;
					}
				}
			}
		}
		
		nui.confirm("是否保存？","操作提示",function(o){
        	if("ok" == o){
        		type = 1;
				document.getElementById("fileCatalog1").value="ameLeave";
	        	form4.submit();
        	}
        });
    }
    
    //附件提交后触发
    function SaveData1(){
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '操作中...'
        });
        var leaveinfo = form_leave.getData();//请假信息
    	var leavedetail = grid_leave.getChanges();//请假记录
		leaveinfo.applydate = new Date();//申请日期，默认当前日期
		leaveinfo.totaldays = $(grid_leave.getSummaryCellEl("days")).find("b").text();
		
		leaveinfo.leavetypename = nui.get("leavetype").getText();//请假类型
		
		var empVac = grid_leave1.getChanges();
		var daysoff = null;
		if(empVac.length>0){
			daysoff = empVac[0].daysoff;
		}
		leaveinfo.status = '3';
		var json = {leaveinfo:leaveinfo,leavedetail:leavedetail,"daysoff":daysoff};
    	//按钮禁用
    	nui.get("creatLeave").disable();
    	nui.ajax({	
      		url: "com.primeton.eos.ame_permanage.ame_leavepro.saveempvacByHr.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (text) {
      			nui.unmask();
      			if(text.result == "1"){
                   	nui.alert("保存成功！","系统提示",function (){
                   		CloseWindow("ok");
                   	});
      			}else {
      				nui.get("creatLeave").enable();
    				nui.alert("保存失败！");
      			}
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
    }
    
	//删除请假明细
	function removeRow(gridTemp){
		var grid = nui.get(gridTemp);
		var rows = grid.getSelecteds();
        if (rows.length>0) {
            grid.removeRows(rows, true);
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
    
	//日期格式化
	function onDealDate(e){
		if(e.value){
			return e.value.substring(0,10);
		}
	}
	
	
	//业务字典  订票方式  订票区域 交通方式
	function dictype(e){
		return nui.getDictText('AME_TIMEPERIOD',e.value);
	}
	function leavestatus(e){
		return nui.getDictText('AME_LEAVESTATUS',e.value);
	}
    //汇总行
	function drawsum(e){
		if(e.field == "days"){
        	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	//计算请假天数
	function calDays(e){
		var record=e.record;
		var field = e.field;
		var row = grid_leave.getRowByUID(record._uid);
		if(e.field=="startdate" || e.field=="sptype" ||e.field=="enddate" ||e.field=="eptype"){
			if(record.startdate && record.sptype && record.enddate && record.eptype){
				calLeaveDays(record.startdate,record.sptype,record.enddate,record.eptype,record._uid);
			}
		}
		//开始日期不能大于结束日期
		if(e.field=="startdate"){
			if(record.enddate){
				if(record.startdate>record.enddate){
					nui.alert("开始日期不能大于结束日期，请重新填写!")
					var rowData={startdate:null};
					grid_leave.updateRow(row,rowData);
				}else if(record.startdate==record.enddate){
					if(record.sptype=="pm"  && record.eptype=="am"){
						nui.alert("开始日期不能大于结束日期，请重新填写!")
						var rowData={startdate:null};
						grid_leave.updateRow(row,rowData);
					}
				}
			}
		}
		if(e.field=="enddate"){
			if(record.startdate){
				if(record.startdate>record.enddate){
					nui.alert("开始日期不能大于结束日期，请重新填写!")
					var rowData={enddate:null};
					grid_leave.updateRow(row,rowData);
				}else if(record.startdate==record.enddate){
					if(record.sptype=="pm"  && record.eptype=="am"){
						nui.alert("开始日期不能大于结束日期，请重新填写!")
						var rowData={enddate:null};
						grid_leave.updateRow(row,rowData);
					}
				}
			}
		}
		if(e.field=="sptype"){
			if(record.startdate==record.enddate&&record.sptype=="pm"  && record.eptype=="am"){
				nui.alert("开始日期不能大于结束日期，请重新填写!")
				var rowData={sptype:null};
				grid_leave.updateRow(row,rowData);
			}
		}
		if(e.field=="eptype"){
			if(record.startdate==record.enddate&&record.sptype=="pm"  && record.eptype=="am"){
				nui.alert("开始日期不能大于结束日期，请重新填写!")
				var rowData={eptype:null};
				grid_leave.updateRow(row,rowData);
			}
		}
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
	
	//计算请假天数
	function calLeaveDays(startdate,sptype,enddate,eptype,uid){
		var json = {startdate:startdate,sptype:sptype,enddate:enddate,eptype:eptype,leaverule:leaverule};
  		nui.ajax({	
	    	url: "com.primeton.eos.ame_permanage.ame_leavepro.getDays.biz.ext",
            type: 'POST',
            data: json,
            success: function (text) {
            	var row = grid_leave.getRowByUID(uid);
            	var rowData={days:text.days};
				grid_leave.updateRow(row,rowData);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
	}
	
	/**
         *	选择岗位代理人
         */
    function selectOmEmployee(){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择岗位代理人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                    }
                }
            }
        });
    }
    
    function selectOmLeave(){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择请假人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    console.log(data);
                    if (data) {
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                        console.log(data);
                        nui.get("orgname").setValue(data.orgname);
                        nui.get("orgid").setValue(data.orgid);
                        nui.get("gender").setValue(data.gender == null ?"":nui.getDictText('ABF_GENDER',data.gender));
                        nui.get("company").setValue(data.company == null ?"":nui.getDictText('company',data.company));
                        nui.get("indate").setValue(data.indate);
                        nui.get("emptype").setValue(data.emptype);
                        nui.get("empcode").setValue(data.empcode);
                        if(data.userid){
                        	grid_leave1.load({userid:nui.get("userid").getValue()});
			  				var json1 = {"criteria": 
			  								{"_expr[0]":
			  									{"_property":"leaveid","_op":"in","_ref":"1"}
			  								,
			  								"_ref[0]":
			  									{"_id":"1","_entity":"com.primeton.eos.ame_permanage.ame_permanage.AmeLeaveinfo",
			  										"_expr[0]":
			  										{"_property":"userid","_value":data.userid},
			  										"_expr[1]":
			  										{"_property":"status","_op":"<>","_value":"-2"},
			  										"_select":{"_field[0]":"leaveid"}
			  									},
		  									"_expr[1]":{"_property":"leaveid","_op":"<>","_value":nui.get("leaveid").getValue()},
		  									"_or[0]":
		  										{
			  										"_expr[0]":{
			  											"_property":"startdate","_op":"between","_min":new Date().getFullYear()+"-01-01","_max":new Date().getFullYear()+"-12-31"
			  										},
			  										"_expr[1]":{
			  											"_property":"enddate","_op":"between","_min":new Date().getFullYear()+"-01-01","_max":new Date().getFullYear()+"-12-31"
			  										}
		  										}
			  								}
			  							};
			  				grid_leaves.sortBy("startdate","desc")
			  				grid_leaves.load(json1);//加载本年度请假详情
                        }
                    }
                }
            }
        });
    }
	
	function doCal_EmpVac(e){
		var rows1 = e.record;
		//vacdays+lastrest-overvac-daysoff-leavetotaldays=nowrestvac
		var vacdays = 0.00;
		var lastrest = 0.00;
		var overvac = 0.00;
		var daysoff = 0.00;
		var leavetotaldays = 0.00;
		var nowrestvac = 0.00;
		
		if(rows1.vacdays != "" && rows1.vacdays != null){
			vacdays = parseFloat(rows1.vacdays);
		}
		if(rows1.lastrest != "" && rows1.lastrest != null){
			lastrest = parseFloat(rows1.lastrest);
		}
		if(rows1.overvac != "" && rows1.overvac != null){
			overvac = parseFloat(rows1.overvac);
		}
		if(rows1.daysoff != "" && rows1.daysoff != null){
			daysoff = parseFloat(rows1.daysoff);
		}
		if(rows1.leavetotaldays != "" && rows1.leavetotaldays != null){
			leavetotaldays = parseFloat(rows1.leavetotaldays);
		}
		
		nowrestvac = vacdays+lastrest-overvac-daysoff-leavetotaldays
		
		var rowData_x = {"nowrestvac":nowrestvac};
		grid_leave1.updateRow(rows1,rowData_x);
	}
</script>
</html>