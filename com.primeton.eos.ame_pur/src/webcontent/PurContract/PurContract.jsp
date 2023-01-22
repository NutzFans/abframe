<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>采购合同管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-panel" title="采购合同管理" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>供应商名称：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:280px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="purSupplier.custname"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right"><span>合同名称：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-textbox"  style="width:285px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="purcontname"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right"><span>采购合同编号：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[2]._value" class="nui-textbox"  style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="purcontnum"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>合同签订日期：</span></td>
		            	<td align="left">
						    <input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[3]._property" value="signdate"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
						</td>
						<td align="right"><span>合同金额范围：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[4]._min" style="width:100px"/>-<input class="nui-textbox" name="criteria._expr[4]._max" style="width:100px"/>(元)
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="contmoney"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
						</td> 
						<td align="right"><span>采购合同类型：</span></td>
						<td align="left">
						    <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="AME_CONTYPE" style="width:150px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="purtype"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>我方经办人：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[6]._value" class="nui-textbox"  style="width:100px;"/>				
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="ouroper"/>
						     <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/> 
						    <!--  <input class="nui-hidden" name="criteria._expr[6]._op" value="in" id="tempcond31"/>
					        <input class="nui-hidden" name="criteria._expr[6]._ref" value="4" id="tempcond32"/>
					        <input class="nui-hidden" name="criteria._ref[3]._id" value="4"/>
					        <input class="nui-hidden" name="criteria._ref[3]._select._field[0]" value="userid"/>
					        <input class="nui-hidden" name="criteria._ref[3]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._property" value="empname">
		            		<input class="nui-textbox" name="criteria._ref[3]._expr[0]._value" id="dyassetnum3" style="width:100px;" onvaluechanged="changeSignuser()"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._likeRule" value="all"/> -->
						</td>
						<td align="right"><span>销售合同编号：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[7]._value" class="nui-textbox"  style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="outcontnum"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
						</td>
						<td align="right"><span>成本类型：</span></td>
						<td align="left">
						    <input name="criteria._expr[8]._value" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" style="width:150px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[8]._property" value="costtype"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="="/>
						</td>
					</tr>
					<tr>
						<td align="right">项目编号：</td>
						<td>
							<input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" style="width:100px" id="projectno" onvaluechanged="changeproj"/>
						    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="projectno"/>
						    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
						    
						    <input class="nui-hidden" name="criteria._expr[9]._property" value="purcontid"/>
					        <input class="nui-hidden" name="criteria._expr[9]._op" value="=" id="tempCond81"/>
					        <input class="nui-hidden" name="criteria._expr[9]._ref" value="" id="tempCond82"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.eos.ame_pur.ame.PurProjCont"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="purcontid"/>
				        </td>
				        <td align="right"><span>合同关键内容：</span></td>
						<td align="left">
						    <input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>
						    <input name="criteria._expr[10]._value" class="nui-textbox"  style="width:200px;"/>
						    <input class="nui-hidden" name="criteria._expr[10]._property" value="contKeyinfo"/>
						    <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
						</td>
						<td align="right"><span>采购合同状态：</span></td>
						<td align="left">
						    <input name="criteria._expr[11]._value" class="nui-dictcombobox" dictTypeId="AME_ORDERSTATUS" style="width:150px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[11]._property" value="purstatus"/>
						    <input class="nui-hidden" name="criteria._expr[11]._op" value="="/>
						</td>
					</tr>
					<tr>
					<td class="form_label" align="right">受益部门：</td>
			         <td align="left">
		            		 
		            		 
		            		<!--  
					        <input class="nui-hidden" name="criteria._expr[12]._property" value="purcontid"/>
					        <input class="nui-hidden" name="criteria._expr[12]._op" value="in" id="tempcond41"/>
					        <input class="nui-hidden" name="criteria._expr[12]._ref" value="2" id="tempcond42"/>
					         -->
					        
					        <!-- <input class="nui-textbox" name="criteria._ref[1]._expr[0]._value" style="width:100px" onvaluechanged="changeproj"/>
						    <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="projectno"/>
						    <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all"/> -->
						    
						    <input class="nui-hidden" name="criteria._expr[12]._property" value="purcontid"/>
					        <input class="nui-hidden" name="criteria._expr[12]._op" value="in" id="tempcond11"/>
					        <input class="nui-hidden" name="criteria._expr[12]._ref" value="8" id="tempcond12"/>
					        <input class="nui-hidden" name="criteria._ref[2]._id" value="8"/>
					        <input class="nui-hidden" name="criteria._ref[2]._entity" value="com.primeton.eos.ame_pur.ame.PurProjCont"/>
					        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="purcontid"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="projectno"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="in" id="tempcond21"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._ref" value="2" id="tempcond22"/>
					        
					        <input class="nui-hidden" name="criteria._ref[3]._id" value="2"/>
					        <input class="nui-hidden" name="criteria._ref[3]._select._field[0]" value="projectno"/>
					        <input class="nui-hidden" name="criteria._ref[3]._entity" value="com.primeton.rdmgr.data.rd.RdProject"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._property" value="omOrganization.orgid">
						
						
							<input class="nui-treeselect" expandOnLoad="0"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true"
							name="criteria._ref[3]._expr[0]._value" id="syb" style="width:220px;"  nullItemText=""/>
		            		<!-- <input class="nui-treeselect" expandOnLoad="0"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true"
							name="criteria._ref[3]._expr[0]._value" id="syb" style="width:220px;" valueFromSelect="true"  showNullItem="true" nullItemText=""/>
					         -->
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._op" value="in"/>
					        
					        <input class="nui-hidden" name="criteria._expr[13]._property" value="purcontid"/>
					        <input class="nui-hidden" name="criteria._expr[13]._op" value="in" id="tempcond43"/>
					        <input class="nui-hidden" name="criteria._expr[13]._ref" value="5" id="tempcond44"/>
					        
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="5"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="com.primeton.eos.ame_pur.ame.PurProjCont"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="purcontid"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="projectno"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="in" id="tempcond63"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._ref" value="6" id="tempcond64"/>
					        
					        <input class="nui-hidden" name="criteria._ref[4]._id" value="6"/>
					        <input class="nui-hidden" name="criteria._ref[4]._select._field[0]" value="projectno"/>
					        <input class="nui-hidden" name="criteria._ref[4]._entity" value="com.primeton.rdmgr.data.rd.RdProject"/>
					        <input class="nui-hidden" name="criteria._ref[4]._expr[0]._property" value="omOrganization.orgid">
		            		<input class="nui-hidden" name="criteria._ref[4]._expr[0]._value" id="syb1" style="width:120px;" valueFromSelect="true"/>
					        <input class="nui-hidden" name="criteria._ref[4]._expr[0]._op" value="in"/>
					        
					       <!--  <input class="nui-hidden" name="criteria._ref[2]._id" value="3"/>
					        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="purcontid"/>
					        <input class="nui-hidden" name="criteria._ref[2]._entity" value="com.primeton.eos.ame_pur.ame.queryPurContractSy"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="finUnitId">
		            		<input class="nui-hidden" name="criteria._ref[2]._expr[0]._value" id="syb1" style="width:120px;" valueFromSelect="true"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="in"/>  -->
						</td>
					
					</tr>
					<tr>
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
                            <a class="nui-button" id="PurContract_ExportBtn" iconCls="icon-download" onclick="exportData()">导出</a></td>
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="PurContract_addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="PurContract_updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
	                        <a class="nui-button" id="PurContract_deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                    </td>
	                </tr>
                 </table>
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:320px;" allowResize="true" dataField="purContracts" 
	    url="com.primeton.eos.ame_pur.PurContract.queryPurContract.biz.ext" sizeList="[10,20,50,100,200,500,1000,10000]"  idField="appid" multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>	
				<div field="purcontid" width="0" align="center" headerAlign="center" allowSort="true">采购合同编号</div>		
				<div field="purcontnum" width="125" align="center" headerAlign="center" renderer="getDetail" allowSort="true">采购合同编号</div>		
				<div field="purcontname" width="275" align="left" headerAlign="center" >合同名称</div>	
				<div field="purSupplier.suppliersname" width="130" align="center" headerAlign="center">供应商简称</div>							
				<div field="signdate" width="90" align="center" headerAlign="center"allowSort="true">签订日期</div>				
				<div field="startdate"width="80" align="center" headerAlign="center"allowSort="true">合同开始日期</div>
				<div field="enddate" width="80" align="center"  headerAlign="center"allowSort="true">合同截止日期</div>
				<div field="contmoney" width="80" align="right"  headerAlign="center"allowSort="true" dataType="currency">合同金额(元)</div>
				<div field="yspje" width="80" align="right" headerAlign="center" dataType="currency">已收票金额</div>
				<div field="yjtje" width="80" align="right" headerAlign="center" dataType="currency">已计提金额</div>
				<div field="yzfje" width="80" align="right" headerAlign="center" dataType="currency">已支付金额</div>
				<div field="ouroper" width="75" align="center"  headerAlign="center"allowSort="true">我方经办人</div>
				<div field="outcontnum" width="80" align="center"  headerAlign="center"allowSort="true">销售合同编号</div>
				<div field="purstatus" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictpurstatus">合同状态</div>		
				<div field="purtype" width="110" align="center" headerAlign="center" allowSort="true" renderer="dictpurtype">采购合同类型</div>
				<div field="costtype" width="110" align="center" headerAlign="center" allowSort="true" renderer="dictcosttype">成本类型</div>		
						
			</div>
		</div>
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" /> 
		<input type="hidden" name="fileName" filter="false" />
	</form>
</body>
<script type="text/javascript">
	/**供应商查询*/
	var form = new nui.Form("#form1");
	nui.parse();
	var grid = nui.get("datagrid1");
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
		String nowuserorgid=user.getUserOrgId(); 
	%>
	
	var nowuserorgid = '<%=nowuserorgid %>';
	
	
	
	init1();
	
	function init1(){
		form.reset();
		//初始化事业部
		var json = {"code":"cghtgl","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
            url: "com.primeton.eos.ame_auth.ame_auth.getownorg.biz.ext",
            data:json,
            type: "post",
            cache: false,
            contentType: 'text/json',
            success: function (text) {
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时没有权限
						nui.get("syb1").setValue(0); 
					}else{
						nui.get("syb").loadList(text.orgs, "orgid", "parentorgid");
						
						if(text.orgids){
							
							var isall;
							for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
								nui.get("tempCond81").setValue("=");
        						nui.get("tempCond82").setValue("");
        						nui.get("tempcond43").setValue("=");
        						nui.get("tempcond44").setValue("");
						}else{
							nui.get("syb1").setValue(text.orgids);
						}
						
						}else{
							nui.get("syb1").setValue('0'); 
						}
					}
				}else{
					nui.get("syb1").setValue(0); 
				}
				//初始化页面
				search();
            },
            error: function () {
            }
       	});
	}
	
	 /* function changeSyb(){
	
		  if((nui.get("syb").getValue()==""||nui.get("syb").getValue()==null)){
		  	
			nui.get("tempcond11").setValue("=");
			nui.get("tempcond12").setValue("");
			nui.get("tempcond21").setValue("=");
			nui.get("tempcond22").setValue("");
		}else{
			nui.get("tempcond11").setValue("in");
			nui.get("tempcond12").setValue("8");
			nui.get("tempcond21").setValue("in");
			nui.get("tempcond22").setValue("2");
		}
		if((nui.get("syb1").getValue()==""||nui.get("syb1").getValue()==null)){
			nui.get("tempcond43").setValue("=");
			nui.get("tempcond44").setValue("");
			nui.get("tempcond63").setValue("=");
			nui.get("tempcond64").setValue("");
		}else{
			nui.get("tempcond43").setValue("in");
			nui.get("tempcond44").setValue("5");
			nui.get("tempcond63").setValue("in");
			nui.get("tempcond64").setValue("6");
		}     
		
	}     */
	  
	
	/* function init(){
	
		grid.load();
		grid.sortBy("signdate","desc");
		getOpeatorButtonAuth("PurContract_addBtn,PurContract_updateBtn,PurContract_deltbtn");//操作按钮权限初始化 
	}  */
	
	function search() {
		
		  
		if((nui.get("syb").getValue()==""||nui.get("syb").getValue()==null)){
			nui.get("tempcond11").setValue("=");
			nui.get("tempcond12").setValue("");
			nui.get("tempcond21").setValue("=");
			nui.get("tempcond22").setValue("");
		}else{
			nui.get("tempcond11").setValue("in");
			nui.get("tempcond12").setValue("8");
			nui.get("tempcond21").setValue("in");
			nui.get("tempcond22").setValue("2");
			
		} 
		 /* if(((nui.get("syb1").getValue()==""||nui.get("syb1").getValue()==null)) && nui.get("syb1").getValue()!=0){
		 		console.log("33")
			nui.get("tempcond43").setValue("=");
			nui.get("tempcond44").setValue("");
			nui.get("tempcond63").setValue("=");
			nui.get("tempcond64").setValue("");
		}  else{
			console.log("44")
			 nui.get("tempcond43").setValue("in");
			nui.get("tempcond44").setValue("5"); 
			nui.get("tempcond63").setValue("in");
			nui.get("tempcond64").setValue("6");
		}       
	 	  */
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	  	grid.sortBy("signdate","desc");
	  	getOpeatorButtonAuth("PurContract_addBtn,PurContract_updateBtn,PurContract_deltbtn,PurContract_ExportBtn");//操作按钮权限初始化 
	  	
	}
	
	function reset(){
		init1();
	}
	function add() {        	
        nui.open({
            url: "<%=request.getContextPath() %>/ame_pur/PurContract/ModifyPurContract.jsp",
            title: "新增采购合同", 
			width: 1000,
            height: 500,
            onload: function () {
           	 //页面提供“发起采购合同流程”按钮
                var iframe = this.getIFrameEl();
                var data = { action: "new"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                grid.reload();
            }
        });
    }
    
    function remove() {
    	//删除权限
    	var row = grid.getSelected();  
	    if(row.purstatus !=3){ //无效：3，终止4
	    	alert("采购合同只有在状态为无效时才可以删除！");
	    	return;
	    }
	    
	    var rows = grid.getSelecteds();   //获取所有选中的行对象
	    var data = {purContracts:rows};
	    var json = nui.encode(data);     //序列化成json字符串
		if (rows.length> 0) {
        	if (confirm("确定删除选中记录？")) {
                grid.loading("操作中，请稍后......");
                nui.ajax({
	                url: "com.primeton.eos.ame_pur.PurContract.deletePurContract.biz.ext",
	                type: "post",
	                data: json, 
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	grid.reload();
	                },
	                error: function () {
                    }
               });
            }
        } else {
            alert("请至少选中一条记录");
        }
    }
    
    function edit() {
		var row = grid.getSelected();
	    if(row.purstatus ==1){ //新增：0，审核中：1，有效：2，无效：3，终止4
	    	alert("采购合同正在审核不可以编辑！");
	    	return;
	    }
		if (row) {
      		nui.open({
	            url: "<%=request.getContextPath() %>/ame_pur/PurContract/ModifyPurContract.jsp",
	            title: "编辑采购合同",
	            width: 1000,
	            height: 500,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "edit", purcontid: row.purcontid };
	              iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	                if(action=="saveSuccess"){
	                  grid.reload();
	                }
	            }
            });
        } else {
          nui.alert("请选中一条记录","提示");
        }
    }
    
    function checkDetail(){
 		var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl, "合同详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
    
    function getDetail(e){
    	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    function dictpurstatus(e) {
		return nui.getDictText('AME_ORDERSTATUS',e.value);//设置业务字典值
	}
	function dictpurtype(e) {
		return nui.getDictText('AME_CONTYPE',e.value);//设置业务字典值
	}
	function dictcosttype(e) {
		return nui.getDictText('AME_CONTCOSTTYPE',e.value);//设置业务字典值
	}
	
	//项目编号值改变时触发
	function changeproj(e){
		if(e.value != null&&e.value != ""){
			nui.get("tempCond81").setValue("in");
        	nui.get("tempCond82").setValue("1");
		}else{
			nui.get("tempCond81").setValue("=");
    		nui.get("tempCond82").setValue("");
		}
	}

	//导出
	function exportData() {
		var result = form.getData();
		grid.loading("操作中，请稍后...");
		nui.ajax({
					url : "com.primeton.eos.ame_pur.PurContract.exportPurProjContract.biz.ext",
					type : "post",
					data : result,
					success : function(o) {
						grid.unmask();
						var filePath = o.downloadFile;
						var fileName = "采购合同清单";
						var myDate = new Date();
						var year = myDate.getFullYear();
						var month = myDate.getMonth() + 1;
						var day = myDate.getDate();
						var hours = myDate.getHours();
						var minutes = myDate.getMinutes();
						var seconds = myDate.getSeconds();
						var curDateTime = year;
						if (month > 9) {
							curDateTime = curDateTime + "" + month;
						} else {
							curDateTime = curDateTime + "0" + month;
						}
						if (day > 9) {
							curDateTime = curDateTime + day;
						} else {
							curDateTime = curDateTime + "0" + day;
						}
						if (hours > 9) {
							curDateTime = curDateTime + hours;
						} else {
							curDateTime = curDateTime + "0" + hours;
						}
						if (minutes > 9) {
							curDateTime = curDateTime + minutes;
						} else {
							curDateTime = curDateTime + "0" + minutes;
						}
						if (seconds > 9) {
							curDateTime = curDateTime + seconds;
						} else {
							curDateTime = curDateTime + "0" + seconds;
						}
						fileName = fileName + "_" + curDateTime + ".xls";
						var frm = document.getElementById("viewlist1");
						frm.elements["downloadFile"].value = filePath;
						frm.elements["fileName"].value = fileName;
						frm.submit();
					},
					error : function() {
						nui.alert("error");
					}
				});
	}
	//当选择列时
    /* function selectionChanged(){
        var rows = grid.getSelecteds();
        //如果选择的结算单为流程审批中则不能编辑和删除，只能查看
        var status = rows[0].purstatus;
        if(rows.length>0){
    		if(rows[0].purstatus==0){
    			nui.get("updateBtn").enable();
    			nui.get("deltbtn").enable();
    		}else{
    			nui.get("updateBtn").disable();
    			nui.get("deltbtn").disable();
    		}
        }else{
        	nui.get("updateBtn").enable();
        }
    } */
</script>
</html>