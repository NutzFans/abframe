<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-06-02 10:10:25
  - Description:
-->
<head>
	<title>新增、编辑外包人员信息</title>
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
	<div class="nui-fit">
		<div style="width: 1000px;">
		<form id="form1" method="post">
			<input name="purOutperson.outperno" id="outperno" class="nui-hidden" />
			<!-- 附件需要 v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v -->
			<input name="purOutperson.fileids" id="fileids"  class="nui-hidden"/>
			<!-- 附件需要 ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ -->
			<input name="purOutperson.purorderid" id="purorderid" class="nui-hidden" />
<!-- 			<!-- 插入订单关系表数据 --> 
<!-- 			<input name="purOutperson.purorderoutper" id="purorderoutper" class="nui-hidden" /> -->
			<input id="getpersonform" class="nui-hidden" />
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<!-- 
					显示外包人员基本信息，附件信息
					显示外包人员相关的工作协议书列表信息和结算记录列表信息
				 -->
				<legend>外包人员基本信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" width="100px">姓名：</td>
							<td><input name="purOutperson.outpername" id="outpername" onblur="checkName" class="nui-textbox" required="true" style="width:100px" /></td>
							<td align="right" style="width:100px;">身份证号码：</td>
							<td><input name="purOutperson.outpercartno" id="outpercartno" onblur="blurOutpercartno()" class="nui-textbox" vtype="rangeLength:18" required="false" style="width:170px" /></td> <!-- onvalidation="isIdCard" -->
							<td align="right" style="width:100px;">性别：</td>
							<td style="width:132px;"><input name="purOutperson.gender" showNullItem="true" id="gender" class="nui-dictcombobox" required="false" style="width:100px" dictTypeId="ABF_GENDER" /></td>
							<td align="right" style="width:100px;">学历：</td>
							<td><input name="purOutperson.degree" id="degree" showNullItem="true" class="nui-dictcombobox" dictTypeId="DEGREE" style="width:100px" required="false" /></td>
						</tr>
						<tr><td align="right" style="width:100px;">毕业时间：</td>
							<td><input name="purOutperson.gradudate" id="gradudate" class="nui-datepicker" required="false" style="width:100px" /></td>
							<td align="right" style="width:100px;">联系电话：</td>
							<td><input name="purOutperson.linktel" id="linktel" onblur="blurLinktel()" class="nui-textbox" required="false" style="width:170px" /></td>
							<td align="right" style="width:100px;">供应商：</td>
							<td colspan="3"><input name="purOutperson.custid" id="custid" onbuttonclick="selectSupplier" class="nui-buttonedit" required="true" style="width:340px" emptyText="请选择供应商" allowInput="false"/></td>
						</tr>
						<tr id="tr1">
							<td align="right" style="width:100px;" id="tr3">工作量单位：</td>
							<td id="tr4" ><input name="purOutperson.workunit" id="workunit" readOnly="readOnly" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" required="false" style="width:100px" /></td>
							<td align="right" style="width:100px;" id="tr7">价格(元)：</td>
							<td id="tr8" ><input name="purOutperson.price" id="price" readOnly="readOnly" class="nui-textbox" inputStyle="text-align:right;" required="false" style="width:100px" /></td>	
							<td align="right" style="width:100px;">订单状态：</td>
							<td><input name="purOutperson.currentstatus" id="currentstatus" class="nui-dictcombobox" dictTypeId="AME_OUTPERSTATUS" showNullItem="true" required="false" style="width:100px" /></td>
							<td align="right" style="width:100px;" >电脑提供方式：</td>
							<td><input name="purOutperson.pcprotype" id="pcprotype" class="nui-dictcombobox" showNullItem="true" dictTypeId="AME_PCPROTYPE" required="false" style="width:100px" /></td>
							<!-- <td align="right" style="width:100px;">预计结束日期：</td>
							<td><input name="purOutperson.expenddate" id="expenddate" class="nui-datepicker" required="false" style="width:100px" /></td>
							<td align="right" style="width:120px;">实际结束日期：</td>
							<td style="width:132px;"><input name="purOutperson.actenddate" id="actenddate" class="nui-datepicker" required="false" style="width:100px" /></td> -->
						</tr>
						<!-- 
						<tr id="tr2">
							<td align="right" style="width:100px;">服务项目：</td>
							<td colspan="3"><input name="purOutperson.projectno" id="projectno" onbuttonclick="selectProject" class="nui-buttonedit" required="false" style="width:308px" allowInput="false"/></td>
							<td align="right" style="width:120px;">服务客户：</td>
							<td colspan="3"><input id="miscustname" readOnly="readOnly" class="nui-textbox" required="false" style="width:290px" allowInput="true"/>
							<input name="purOutperson.miscustid" id="miscustid" readOnly="readOnly" class="nui-hidden" required="false" style="width:290px" allowInput="true"/>
							</td>
						</tr>
						 -->
						
						<tr>
							<td align="right" style="width:100px;">联系邮箱：</td>
							<td colspan="3"><input name="purOutperson.linkemail" id="linkemail" class="nui-textbox" required="false" emailErrorText="请输入正确的邮件格式" vtype="email" style="width:308px" /></td>
							<td align="right" style="width:100px;">备注：</td>
							<td colspan="3"><input name="purOutperson.memo" id="memo" class="nui-textarea" required="false" style="width:340px;height: 22px;"/></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">微信企业号：</td>
							<td ><input name="purOutperson.wxno" id="wxno" onblur="blurWxno()" class="nui-textbox" required="false" style="width:120px" /></td>
							<td align="right" style="width:100px;"></td>
							<td colspan="5"></td>
						</tr>
						<!-- 
						<tr>
							<td align="right" style="width:100px;" id="tr5"></td>
							<td id="tr6" colspan="3"></td>
						</tr>
						 -->
					</table>
				</div>
			</fieldset>
		</form>
		
		<!-- 附件需要 v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v -->
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>外包人员附件</legend>
		<jsp:include page="/ame_common/inputFile.jsp"/>
		<span style="font-weight: bold;color: blue">&nbsp;外包人员附件说明：人员的简历、身份证、毕业证、学位证复印件（或照片）等资料请以独立的附件上传</span>
		</fieldset>
		<!-- 附件需要 ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ -->
		<!-- 外包人员归属项目列表 -->
		<fieldset style="border:solid 1px #aaa;padding:3px; width: 1100px;" id="purProjOutperlist">
			<legend>参与的项目列表</legend>
			<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                    	<a class="nui-button" iconCls="icon-add" onclick="addRow('purProjOutper_grid')">增加</a>
		                    	<a class="nui-button" iconCls="icon-remove" onclick="removeRow('purProjOutper_grid')">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
			<div id="purProjOutper_grid" class="nui-datagrid" style="width: 100%;height:auto;" dataField="purProjOutper" 
				 showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
				 url="com.primeton.eos.ame_pur.outperson.queryPurOutpersonMainTain.biz.ext" onrowclick="doUpdateForecast"
				showFooter="false">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="projoutid" id="projoutid" width="80" align="center" headerAlign="center" visible="false">编号
						<input property="editor" class="nui-textbox" allowInput="false"/>
					</div>
					<div field="projectno" id="projno" width="120" align="center" headerAlign="center" displayField="projectname">服务项目
						<input property="editor" class="nui-buttonedit" emptyText="请选择服务项目"  onbuttonclick="selectProjectList" allowInput="false"/>
					</div>
					<div field="custid" visible="false" align="center" headerAlign="center">服务客户编号
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
					<div field="custname" width="80" align="center" headerAlign="center">服务客户
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
					<div field="startdate" width="80" align="center" dateFormat="yyyy-MM-dd" headerAlign="center">服务开始日期
						<input property="editor" class="nui-datepicker" />
					</div>
					<div field="expenddate" width="80" align="center" dateFormat="yyyy-MM-dd" headerAlign="center">预计结束日期
						<input property="editor" class="nui-datepicker" />
					</div>
					<div field="actenddate" width="80" align="center" dateFormat="yyyy-MM-dd" headerAlign="center">实际结束日期
						<input property="editor" class="nui-datepicker" />
					</div>
					<div field="currentstatus" width="80" align="center" headerAlign="center" renderer="dictGetStatus">服务状态
						<input property="editor" class="nui-dictcombobox" dictTypeId="AME_OUTPERSTATUS" required="false"/>
					</div>
					<div field="inputratio" width="60" align="center" headerAlign="center">投入比重
						<input property="editor" id="inputratio" class="nui-textbox" vtype="float" inputStyle="text-align: right" onblur="checkInputratio"/>
					</div>
					<div field="workunit" width="90" align="center" headerAlign="center" renderer="dictOutperType">工作量计量单位
						<input property="editor" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" required="false"/>
					</div>
					<div field="price" width="80" align="center" headerAlign="center">服务价格(元)
						<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: right"/>
					</div>
					<div field="purorderid" width="80" align="center" headerAlign="center" displayField="purordernum">采购订单
						<input property="editor" class="nui-buttonedit" emptyText="请选择采购订单" onbuttonclick="selectPurOrderList" allowInput="false"/>
					</div>
					<div field="whetherattendance" width="60" align="center" headerAlign="center"  renderer="isWhetherattendance">是否考勤
						<input property="editor" class="nui-dictcombobox"  dictTypeId="MIS_YN"   required="false"/>
					</div>
					<div field="manager" width="70" align="center" headerAlign="center" displayField="managername">汇报对象
						<input property="editor" class="nui-buttonedit" onbuttonclick="selectOrgname" 
							allowInput="false"/>
					</div>
					<%--
					<div field="purorderid"  width="90" align="center" headerAlign="center" visible="false">采购订单编号
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
					<div field="purordernum"  width="90" align="center" headerAlign="center">采购订单
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
					
					<div field="purcontid" width="80" align="center" headerAlign="center" displayField="purcontname">采购合同
						<input property="editor" class="nui-buttonedit" emptyText="请选择采购合同" onbuttonclick="selectPurContractList" allowInput="false"/>
					</div>
					--%>
					  
					<div field="purcontid"  width="80" align="center" headerAlign="center" visible="false">采购合同编号
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
					<div field="purcontname"  width="90" align="center" headerAlign="center">采购合同
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
				</div>
			</div>
		</fieldset>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
	  	form.setChanged(false);
	  	//外包人员归属项目
	  	var purProjOutper_grid = nui.get("purProjOutper_grid");
	  	//修改保存逻辑流路径
        var updateURL = "com.primeton.eos.ame_pur.outperson.updatePurOutperson.biz.ext";
        //新增保存逻辑流路径
    	var addURL = "com.primeton.eos.ame_pur.outperson.addPurOutperson.biz.ext";
    	//保存人员并保存订单人员关系表
    	var saveURL = "";
	   	var updateData = "";
    	var formdata;
    	var oldlinktel=null;
    	var update
    	//关闭刷新外包人员列表
    	var closeReload = false;
    	init();
    	function init(){
    		document.getElementById("tr1").style.display="none";
    		//document.getElementById("tr2").style.display="none";
	    	document.getElementById("tr3").style.display="none";
	    	document.getElementById("tr4").style.display="none";
	    	document.getElementById("tr7").style.display="none";
	    	document.getElementById("tr8").style.display="none";
	    	//document.getElementById("tr5").style.display="";
	    	//document.getElementById("tr6").style.display="";
    	}
    	
	    function SetData(data){
	    	data = nui.clone(data);
	    	
	    	if(data.action == "edit"){
	    		//编辑页面,允许添加外包人员新的项目对应关系
	    		document.getElementById("purProjOutperlist").style.display="";
		    	document.getElementById("tr1").style.display="";
	    		//document.getElementById("tr2").style.display="";
	    		document.getElementById("tr3").style.display="";
	    		document.getElementById("tr7").style.display="";
	    		document.getElementById("tr4").style.display="";
	    		document.getElementById("tr8").style.display="";
		    	//document.getElementById("tr5").style.display="none";
		    	//document.getElementById("tr6").style.display="none";
		    	var json = nui.encode({purOutperson: {outperno: data.outperno}});
		     
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_pur.outperson.getPurOutpersonDetail.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                	//加载附件设置参数
                		nui.get("grid_0").load({"groupid":"purOutperson","relationid":o.purOutperson.outperno});
	                    form.setData(o);
	                    form.isChanged(false);
	    				if(o.purOutperson.linktel){
	                    	oldlinktel=qukongge(o.purOutperson.linktel);
	                    }
	                    if(o.purOutperson.purorderid){
	                    	nui.get("purorderid").setValue(o.purOutperson.purorderid);
	                    	//nui.get("expenddate").style="allowInput: true";
	                    }else{
					    	//nui.get("expenddate").setReadOnly(true);
					    	//nui.get("actenddate").setReadOnly(true);
					    	//nui.get("projectno").setReadOnly(true);
					    	nui.get("pcprotype").setReadOnly(true);
					    	nui.get("currentstatus").setReadOnly(true);
					    	//nui.get("expenddate").setShowButton(false);
					    	//nui.get("actenddate").setShowButton(false);
					    	//nui.get("projectno").setShowButton(false);
					    	nui.get("pcprotype").setShowButton(false);
					    	nui.get("currentstatus").setShowButton(false);
	                    }
	                	//nui.get("projectno").setValue(o.purOutperson.projectno);
	                	//nui.get("projectno").setText(o.purOutperson.projectname);
	                	nui.get("custid").setValue(o.purOutperson.ryzjglcustid);
	                	nui.get("custid").setText(o.purOutperson.ryzjglcustname);
	                	//nui.get("miscustid").setValue(o.purOutperson.userid);
	                	//nui.get("miscustname").setValue(o.purOutperson.miscustname);
	                	//编辑时,加载外包人员归属项目列表
	                	var outperno = nui.get("outperno").getValue();
	                	purProjOutper_grid.load({purOutperson: {outperno: outperno}});
	                	purProjOutper_grid.sortBy("startdate","desc");
	                	
	                	formdata = form.getData();
	                	
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}
    	}
    	
    	//合同流程PMO信息入库环节、编辑、修改订单的外包人员调用方法
    	function PMOaddPer(data){
    		data = nui.clone(data);
    		nui.get("custid").disable();
	    	nui.get("custid").setValue(data.custid);
	    	nui.get("custid").setText(data.custname);
    	}
    	
    	//订单增加外包人员是调用，（暂时不要删除）
    	/* function addPerByOrder(data){
    		data = nui.clone(data);
    		nui.get("custid").disable();
	    	nui.get("custid").setValue(data.custid);
	    	nui.get("custid").setText(data.custname);
	    	nui.get("purorderid").setValue(data.purorderid);
	    	nui.get("purorderoutper").setValue("1");
    	} */
    	
    	//添加外包人员归属项目行
    	function addRow(gridid) {
            //点击添加行,后台查询出该外包人员签订的数据信息
            
            var outperno = nui.get("outperno").getValue();
            if(outperno){
               nui.ajax({
            	url: "com.primeton.eos.ame_pur.outperson.queryPurContractOrder.biz.ext",
            	data: {outperno : outperno},
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (o) {
            		o = nui.clone(o);
            		
					var newRow = { name: "New Row",
						purorderid: o.purProjOutper.purorderid,
						purordernum: o.purProjOutper.purordernum,
						purcontid: o.purProjOutper.purcontid,
						purcontname: o.purProjOutper.purcontname,
						price: o.purProjOutper.price,
						workunit: o.purProjOutper.workunit,
						inputratio: 1,
						whetherattendance: 1
					};
					
            		var grid = nui.get(gridid);
            		grid.addRow(newRow, 0);
            	},
            	error: function (jqXHR, textStatus, errorThrown) {
            		alert(jqXHR.responseText);
	                CloseWindow();
            	}
            });
            }
            else{
            
					var newRow = { name: "New Row",
						inputratio: 1,
						whetherattendance: 1
					};
					
            		var grid = nui.get(gridid);
            		grid.addRow(newRow, 0);
            }
         
    	}
    	//删除外包人员归属项目行
    	function removeRow(gridid) {
	        var grid = nui.get(gridid);
	        var rows = grid.getSelecteds();
	        var data = {purProjOutpers:rows};
		    var json = nui.encode(data);
	        if (rows.length > 0) {
	            //grid.removeRows(rows, true);
	            nui.confirm("确定删除选中记录？", "确定？",
	            	function (action) {
	            		if (action == "ok") {
	            			for(var i = 0;i < rows.length;i ++){
					        	if(rows[i].name == "New Row"){
					        		grid.removeRows(rows, true);
					        	}else{
					        		nui.ajax({
						            	url: "com.primeton.eos.ame_pur.outperson.deletePurOutpersonMainTain.biz.ext",
						            	data: json,
						            	type: 'POST',
						            	cache: false,
						            	contentType: 'text/json',
						            	success: function (text) {
						            		if (text.execption == null) {
						            			nui.alert("删除成功！");
						            			grid.reload();
						            		} else {
						            			nui.alert("删除失败");
						            		}
						            	},
						            	error: function () {
						                }
						            });
					        	}
					        }
	            			
	            		}
	            	}
	            );    
	        }else{
	        	nui.alert("请至少选择一条记录才能进行删除操作！","操作提示");
	        }
	    }
	    
    	//修改外包人员归属项目行
	    function doUpdateForecast(e){
	        e.record;
	    }
	    function onOk(e){
			var filePaths = document.getElementsByName("uploadfile").length;
        	for(var j=0;j<filePaths;j++){
        		var a=document.getElementsByName("remarkList")[j].value;
        		if(a==null||a==""){
        			alert("新增附件不可以为空");
        			return false;
        		}
        	}
        	if(form.validate()){
        		var rows = purProjOutper_grid.getChanges();
        		for(var i = 0;i < rows.length;i++){
        			if (!rows[i].projectno) {
        				alert("外包人员服务项目不能为空！");
        				return;
        			}
        			
        			if (rows[i].startdate) {
        				if (rows[i].expenddate) {
        					if (rows[i].startdate > rows[i].expenddate) {
        						nui.alert("外包人员的服务开始日期不能大于预计服务结束日期！");
        						return;
        					}
        				}
        			}
        			if (rows[i].startdate) {
        				if (rows[i].actenddate) {
        					if (rows[i].startdate > rows[i].actenddate) {
        						nui.alert("外包人员的服务开始日期不能大于实际结束日期！");
        						return;
        					}
        				}
        			}
        			
        			if (!rows[i].currentstatus) {
        				nui.alert("外包人员服务状态不能为空！");
        				return;
        			}
        			if(!rows[i].inputratio){
	            		nui.alert("投入比重不能为空！");
	            		return;
        			}
        			if (!rows[i].workunit) {
        				nui.alert("外包人员工作计量单位不能为空！");
        				return;
        			}
        		}
        		var outperno = nui.get("outperno").getValue(); 
        		if(outperno){
        			var linktel=nui.get("linktel").getValue();
					if(oldlinktel != linktel){
						var json1 = {outperno:outperno,oldlinktel:oldlinktel};
						 nui.ajax({
			                url: "com.primeton.eos.ame_pur.outperson.getAcOperByTel.biz.ext",
			                data: json1,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (result) {
			                	if(result.result==1){
			                		nui.confirm("原手机号已生成操作员账号，是否确认修改？", "确定？",function (action) {
					            		if (action == "ok") {
					            			nui.ajax({
								                url: "com.primeton.eos.ame_pur.outperson.deleteAcoperBuyTel.biz.ext",
								                data: json1,
								                type: 'POST',
								                cache: false,
								                contentType: 'text/json',
								                success: function (text) {
								                	if (text.execption == null) {
								            			document.getElementById("fileCatalog").value="purOutPerson";
				        								form2.submit();
								            		} else {
								            			nui.alert("删除失败");
								            		}
								                },
								                error: function (jqXHR, textStatus, errorThrown) {
								                    alert(jqXHR.responseText);
								                    CloseWindow();
								                }
								             });
					            		}else{
					            			return;
					            		}
					            	})
							    }else{
							    	document.getElementById("fileCatalog").value="purOutPerson";
					        		form2.submit();
							    }
			                },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                    CloseWindow();
			                }
			             });
					}else{
						nui.confirm("确认保存吗？", "系统提示",
		            	function (action) {            
			                if (action == "ok") {
			                	//nui.get("sureButton").disable();
								document.getElementById("fileCatalog").value="purOutPerson";
					        	form2.submit();
					        }
				    	}
				    	);
					}
        		}else{
        			nui.confirm("确认保存吗？", "系统提示",
	            	function (action) {            
		                if (action == "ok") {
		                	//nui.get("sureButton").disable();
							document.getElementById("fileCatalog").value="purOutPerson";
				        	form2.submit();
				        }
			    	}
			    	);
        		}     		
        	}
	    }
        function SaveData() {
            if(form.validate()){
	        	var outperno = nui.get("outperno").getValue();
				if(outperno){
					saveURL = updateURL;
					updateData = "update";
				} else{
					saveURL = addURL;
					updateData = "new";
				}
				var o = form.getData();
				//o.purOutperson.outpercartno = qukongge(o.purOutperson.outpercartno);
				//o.purOutperson.linktel = qukongge(o.purOutperson.linktel);
				//表格数据
				var allpurProj = purProjOutper_grid.getChanges();
				var rows = purProjOutper_grid.getSelecteds();
	            var json = {allpurProjOutpers:allpurProj,purProjOutpers:rows,purOutperson:o.purOutperson};
	            nui.ajax({
	                url: saveURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
						var returnJson = nui.decode(text);
						if(returnJson.exception == null){
							nui.alert("保存成功",null,function(){
			              		//CloseWindow("ok");
			              		form.setChanged(false);
			              		//保存过一次后，需要对外包人员列表进行刷新
			              		closeReload = true;
			              		if(updateData == "new"){
			              			CloseWindow("ok");
			              		}else{
				              		purProjOutper_grid.reload({purOutperson: {outperno: outperno}});
			              		}
							});
		              	}else{
		                	nui.alert("保存失败", "系统提示", function(action){
			                  	if(action == "ok" || action == "close"){
			                    	//CloseWindow("saveFailed");
			                  	}
		                  	});
		                }    
					},
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
	        }else{
	        	return;
	        }
	    }
        //标准方法接口定义
        function CloseWindow(action) {
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) {
            	if(closeReload){
            		action = "ok";
            	}
	            return window.CloseOwnerWindow(action);
            }else{
	            window.close();            
            } 
        }
        
		
    
        function onCancel(e) {
            var data = form.getData();
        	if(data){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	if(closeReload){
		                		CloseWindow("ok");
		                	}else{
			                	CloseWindow("cancel");
		                	}
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
        
        //选择供应商
        function selectSupplier(){
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/ame_pur/PurSupplier/SelectSupplier.jsp",
                title: "选择供应商",
                width: 650,
                height: 380,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.custid);
                            btnEdit.setText(data.custname);
                        }
                    }
                }
            });
        }
        
        //选择项目
/*         function selectProject(){
        	var btnEdit = this;
        	nui.open({
                url:&quot;&lt;%=request.getContextPath() %&gt;/ame_common/SelectProject.jsp&quot;,
                title: &quot;选择项目&quot;,
                width: 850,
                height: 420,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == &quot;ok&quot;) {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.projectno);
                            btnEdit.setText(data.projectName);
							nui.get(&quot;miscustid&quot;).setValue(data.custid);
							nui.get(&quot;miscustname&quot;).setValue(data.custname);
                        }
                    }
                }
            });
        } */
        
        //外包人员归属项目列表-选择项目,级联得到所属订单，合同
        function selectProjectList(){
        	//var allpurProj = purProjOutper_grid.getData();
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
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
                            var rowData = {custid: data.custid,custname: data.custname,manager: data.userid,managername: data.manager};
                            purProjOutper_grid.updateRow(row,rowData); 
                        }
                    }
                }
            });
        }
        //采购订单
        function selectPurOrderList(){
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_pur/order/SelectPurOrderList.jsp",
                title: "选择采购订单",
                width: 850,
                height: 420,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        
                        	//alert(nui.encode(data));
                            btnEdit.setValue(data.purorderid);
                            btnEdit.setText(data.purordernum);
                            
                            //连带出项目服务客户
                            var row = purProjOutper_grid.getSelected();
                            var rowData = {purcontid:data.purContract.purcontid,purcontname:data.purContract.purcontname};
                            purProjOutper_grid.updateRow(row,rowData); 
                        }
                    }
                }
            });
        }
       <%--  //采购合同
        function selectPurContractList(){
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_pur/PurContract/SelectContract.jsp",
                title: "选择采购合同",
                width: 950,
                height: 420,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.purcontid);
                            btnEdit.setText(data.purcontname);
                        }
                    }
                }
            });
        } --%>
        
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
		//设置业务字典值-是否考勤
		function isWhetherattendance(e){
			return nui.getDictText('MIS_YN',e.value);
		}
		
		//设置日期格式
		function onDealDate(e){
			if(e.value){
				return e.value.substring(0,10);
			}
		}
		
		//人员订单关系表，计算单位
		function dictOutperType(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
		}
		
		//验证姓名是否已经存在
		function checkName(){
			if(form.isChanged()){
				var outpername = nui.get("outpername").getValue();
				if(outpername){
					var json = nui.encode({outpername: outpername});
		            nui.ajax({
		                url:"com.primeton.eos.ame_pur.outperson.checkOutName.biz.ext",
		                type:'POST',
		                data:json,
		                cache: false,
		                contentType:'text/json',
		                success:function(text){
		                    var returnJson = nui.decode(text);
		                    if(returnJson.result == "1"){
		                    	nui.alert("姓名已存在");
		                    }else{
		                    	//alert("姓名不存在");
		                    }
		                }
		            }); 
	            }
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
	    
	    /**
	     * 汇报对象
	     */
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
	    
	    //身份证号码去空格
	    function blurOutpercartno(){
	    	nui.get("outpercartno").setValue(qukongge(nui.get("outpercartno").getValue()));
	    }
	    //电话号码去空格
	    function blurLinktel(){
	    	nui.get("linktel").setValue(qukongge(nui.get("linktel").getValue()));
	    }
	    //微信企业号去空格
	    function blurWxno(){
	    	nui.get("wxno").setValue(qukongge(nui.get("wxno").getValue()));
	    }
	    /**
	     * 字符串去空格
	     */
	    function qukongge(str){
	    	return str.replace(/^\s+|\s+$/g,'');
	    }
    </script>
</body>
</html>