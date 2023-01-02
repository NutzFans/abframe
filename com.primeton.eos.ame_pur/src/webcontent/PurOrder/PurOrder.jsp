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
<title>订单详情查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-panel" title="采购订单管理" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>供应商名称：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:280px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="purContract.purSupplier.custname"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td> 
						<td align="right"><span>合同编号：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-textbox"  style="width:180px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="purContract.purcontnum"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td> 
						<td align="right"><span>订单编号：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[2]._value" class="nui-textbox"  style="width:200px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="purordernum"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>签订日期：</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[3]._property" value="signdate"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
						</td> 
						<td align="right"><span>订单状态：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="AME_ORDERSTATUS" style="width:90px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="purstatus"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
						</td> 
						<td align="right"><span>服务客户：</span></td>
		            	<td align="left">
			            	<input class="nui-hidden" name="criteria._expr[5]._property" value="userid"/>
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="in" id="tempcond11"/>
					        <input class="nui-hidden" name="criteria._expr[5]._ref" value="1" id="tempcond12"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="custid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.mis.contract.contract.MisCustinfo"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="custname">
		            		<input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="dyassetnum1" style="width:150px;" onvaluechanged="changeUserid()"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>服务项目：</span></td>
		            	<td align="left">
		            		<input class="nui-hidden" name="criteria._expr[6]._property" value="projectno"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="in" id="tempcond21"/>
					        <input class="nui-hidden" name="criteria._expr[6]._ref" value="2" id="tempcond22"/>
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="2"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="projectno"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="com.primeton.rdmgr.data.rd.RdProject"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="projectName">
		            		<input class="nui-textbox" name="criteria._ref[1]._expr[0]._value" id="dyassetnum2" style="width:200px;" onvaluechanged="changeProject()"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right"><span>协议签订人：</span></td>
		            	<td align="left">
		            		<input class="nui-hidden" name="criteria._expr[7]._property" value="signuserid"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" value="in" id="tempcond31"/>
					        <input class="nui-hidden" name="criteria._expr[7]._ref" value="3" id="tempcond32"/>
					        <input class="nui-hidden" name="criteria._ref[2]._id" value="3"/>
					        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="userid"/>
					        <input class="nui-hidden" name="criteria._ref[2]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="empname">
		            		<input class="nui-textbox" name="criteria._ref[2]._expr[0]._value" id="dyassetnum3" style="width:100px;" onvaluechanged="changeSignuser()"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right"><span>项目受益部门：</span></td>
		            	<td align="left">
		            		<input class="nui-hidden" name="criteria._expr[8]._property" value="projectno"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="in" id="tempcond41"/>
					        <input class="nui-hidden" name="criteria._expr[8]._ref" value="4" id="tempcond42"/>
					        <input class="nui-hidden" name="criteria._ref[3]._id" value="4"/>
					        <input class="nui-hidden" name="criteria._ref[3]._select._field[0]" value="projectno"/>
					        <input class="nui-hidden" name="criteria._ref[3]._entity" value="com.primeton.rdmgr.data.rd.RdProject"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._property" value="omOrganization.orgid">
		            		<input class="nui-treeselect" expandOnLoad="0"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true"
							name="criteria._ref[3]._expr[0]._value" id="syb" style="width:220px;" valueFromSelect="true" onvaluechanged="changeSyb()" showNullItem="true" nullItemText=""/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._op" value="in"/>
					        
					        <input class="nui-hidden" name="criteria._expr[9]._property" value="projectno"/>
					        <input class="nui-hidden" name="criteria._expr[9]._op" value="in" id="tempcond43"/>
					        <input class="nui-hidden" name="criteria._expr[9]._ref" value="5" id="tempcond44"/>
					        <input class="nui-hidden" name="criteria._ref[4]._id" value="5"/>
					        <input class="nui-hidden" name="criteria._ref[4]._select._field[0]" value="projectno"/>
					        <input class="nui-hidden" name="criteria._ref[4]._entity" value="com.primeton.rdmgr.data.rd.RdProject"/>
					        <input class="nui-hidden" name="criteria._ref[4]._expr[0]._property" value="omOrganization.orgid">
		            		<input class="nui-hidden" name="criteria._ref[4]._expr[0]._value" id="syb1" style="width:120px;" valueFromSelect="true"/>
					        <input class="nui-hidden" name="criteria._ref[4]._expr[0]._op" value="in"/>
						</td>
					</tr>
					<tr>
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="init()">重置</a>	
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
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purOrders" url="com.primeton.eos.ame_pur.PurOrder.queryPurOrder.biz.ext" 
	    sizeList="[10,20,50,100,200,500,1000,10000]" idField="appid" multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="purorderid" width="0" align="center" headerAlign="center" allowSort="true">采购订单编号</div>		
				<div field="purContract.purSupplier.suppliersname" width="70" align="center" headerAlign="center" allowSort="true">供应商简称</div>
				<div field="purordernum" width="120" align="center" headerAlign="center" allowSort="true" renderer="getDetail">采购订单编码</div>
				<div field="signdate" width="70" align="center" headerAlign="center" allowSort="true">签订日期</div>	
				<div field="purstatus" width="55" align="center" headerAlign="center"allowSort="true" renderer="dictorderstatus">状态</div>				
				<div field="empname" width="60" align="center"  headerAlign="center" >协议签订人</div>
				<div field="custname" width="170" align="center" headerAlign="center" >服务客户</div>
				<div field="projectName" width="160" align="center"  headerAlign="center">项目名称</div>
				<div field="calcycle" width="80" align="center" headerAlign="center">结算周期说明</div>				
				<div field="contmemo" width="150" align="center"  headerAlign="center">协议内容说明</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	/**供应商查询*/
	var form = new nui.Form("#form1");
	nui.parse();
	var grid = nui.get("datagrid1");
	init();
	//初始化、重置调用方法
	function init(){
		form.reset();
		//初始化事业部
		var json = {"code":"cgddgl","map":{"property":"status","op":"=","value":"running"}};
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
						nui.get("tempcond43").setValue("=");
						nui.get("tempcond44").setValue("5");
					}
					nui.get("syb").loadList(text.orgs, "orgid", "parentorgid");
					var isall;
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
						nui.get("tempcond43").setValue("=");
        				nui.get("tempcond44").setValue("");
					}else{
						nui.get("syb1").setValue(text.orgids);
					}
				}else{
					// 没有有权的机构时没有权限
					nui.get("tempcond43").setValue("=");
					nui.get("tempcond44").setValue("5");
				}
				
				if(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null){
					nui.get("tempcond11").setValue("=");
					nui.get("tempcond12").setValue("");
				} 
				if(nui.get("dyassetnum2").getValue()==""||nui.get("dyassetnum2").getValue()==null){
					nui.get("tempcond21").setValue("=");
					nui.get("tempcond22").setValue("");
				} 
				if(nui.get("dyassetnum3").getValue()==""||nui.get("dyassetnum3").getValue()==null){
					nui.get("tempcond31").setValue("=");
					nui.get("tempcond32").setValue("");
				} 
				if(nui.get("syb").getValue()==""||nui.get("syb").getValue()==null){
					nui.get("tempcond41").setValue("=");
					nui.get("tempcond42").setValue("");
				} 
			
				var data = form.getData();
			  	grid.load(data);
				grid.sortBy("purorderid","desc");
				return;
            },
            error: function () {
            }
       	});
	}
	function changeUserid(){
		if(!(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null)){
			nui.get("tempcond11").setValue("in");
			nui.get("tempcond12").setValue("1");
		}
	}
	function changeProject(){
		if(!(nui.get("dyassetnum2").getValue()==""||nui.get("dyassetnum2").getValue()==null)){
			nui.get("tempcond21").setValue("in");
			nui.get("tempcond22").setValue("2");
		}
	}
	function changeSignuser(){
		if(!(nui.get("dyassetnum3").getValue()==""||nui.get("dyassetnum3").getValue()==null)){
			nui.get("tempcond31").setValue("in");
			nui.get("tempcond32").setValue("3");
		}
	}
	function changeSyb(){
		if(!(nui.get("syb").getValue()==""||nui.get("syb").getValue()==null)){
			nui.get("tempcond41").setValue("in");
			nui.get("tempcond42").setValue("4");
		}
	}
	
	function dictorderstatus(e) {
		return nui.getDictText('AME_ORDERSTATUS',e.value);//设置业务字典值
	}
	function search() {
		if(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null){
			nui.get("tempcond11").setValue("=");
			nui.get("tempcond12").setValue("");
		} 
		if(nui.get("dyassetnum2").getValue()==""||nui.get("dyassetnum2").getValue()==null){
			nui.get("tempcond21").setValue("=");
			nui.get("tempcond22").setValue("");
		} 
		if(nui.get("dyassetnum3").getValue()==""||nui.get("dyassetnum3").getValue()==null){
			nui.get("tempcond31").setValue("=");
			nui.get("tempcond32").setValue("");
		} 
		if(nui.get("syb").getValue()==""||nui.get("syb").getValue()==null){
			nui.get("tempcond41").setValue("=");
			nui.get("tempcond42").setValue("");
		} 
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
		data1 = data + nui.get("syb").getData();
	  	grid.load(data); //datagrid加载数据
	}
	
	function add() {        	
        nui.open({
            url: "<%=request.getContextPath() %>/ame_pur/PurOrder/ModifyPurOrder.jsp",
            title: "新增信息", 
			width: 900,
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
    	//状态为空怎么处理
	    if(row.purstatus != 3){//无效：3，终止4
	    	alert("工作协议书只有在状态为无效时才可以删除！");
	    	return;
	    }
	    var rows = grid.getSelecteds();   //获取所有选中的行对象
	    var data = {purOrders:rows};
	    var json = nui.encode(data);     //序列化成json字符串
		if (rows.length> 0) {
        	if (confirm("确定删除选中记录？")) {
                grid.loading("操作中，请稍后......");
                nui.ajax({
	                url: "com.primeton.eos.ame_pur.PurOrder.deletePurOrder.biz.ext",
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
            alert("请选中一条记录");
        }
    }
    
    function edit() {
		var row = grid.getSelected();
	    if(row.purstatus == 1){ //新增：0，审核中：1，有效：2，无效：3，终止4
	    	alert("采购订单正在审核不可以编辑！");
	    	return;
	    }
		if (row) {
	  		nui.open({
	            url: "<%=request.getContextPath() %>/ame_pur/PurOrder/ModifyPurOrder.jsp",
	            title: "编辑数据",
	            width: 900,
	            height: 500,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "edit", purorderid: row.purorderid };
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
    
    //选择服务客户弹窗
    function selectCustmer(){
    	var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
            title: "选择供应商",
            width: 650,
            height: 380,
            ondestroy: function (action) {
                //if (action == "close") return false;
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.id);
                        btnEdit.setText(data.text);
                    }
                }
            }
        });
    }
    
    //选择项目弹窗
    function selectProject(){
    	var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/budget/SelectProject.jsp",
                title: "选择供应商",
                width: 650,
                height: 380,
                ondestroy: function (action) {
                    //if (action == "close") return false;
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.projectId);
                            btnEdit.setText(data.projectName);
                        }
                    }

                }
            });
        }
        
    function getDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'> " + e.value + " </a>";
    	}
    }
    
    function checkDetail(){
 		var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/ame_pur/PurOrder/DetailPurOrder.jsp?id=" + selectRow.purorderid;
		window.open(executeUrl, "订单详细信息", "fullscreen=1");
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