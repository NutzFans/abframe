<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2018-06-01 16:17:56
  - Description:
-->
<head>
<title>新增/编辑项目合同关系</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;	
	    }
	    fieldset{ border:solid 1px #aaa;padding:3px;}
    </style>
</head>
<body>
	<div class="nui-fit">
	 	<form id="form1" method="post" >
	        <fieldset>
	        	<legend>选择</legend>
	        	<table style="table-layout:fixed;width: 100%" id="table_file1">
			            <tr>
							<td align="right" style="width:100px">选择项目：</td>
							<td style="width:160px">
								<input  class="nui-buttonedit" name ="rdprocont.projectNo"  emptyText="请选择项目"  onbuttonclick="selectProjectList" allowInput="false" style="width:200px"  required="true"/>
							</td>
							<td align="right" style="width:60px">对应类型：</td>
							<td style="width:160px">
								<input class="nui-dictcombobox" dictTypeId="AME_PROCONT" name="rdprocont.proconttype" onvaluechanged = "changeType" style="width:200px" required="true">
							</td>
							<td align="right" style="width:60px">是否主合同：</td>
							<td style="width:60px">
								<input class="nui-dictcombobox" id="ismaincont" dictTypeId="MIS_YN" name="rdprocont.ismaincont"  style="width:100px" required="true">
							</td>
						</tr>
						<tr id = "tip" style="color: red;display: none;width: 600px;height:auto">
							<td align="right">已与该项目关联的合同：</td><td style="word-wrap:break-word" id="relateCont" colspan="5"></td>
						</tr>
						<tr id = "tip1" style="color: red;display: none;width: 600px;height:auto">
							<td align="right">已与该项目关联的合同订单：</td><td style="word-wrap:break-word" colspan="5" id = "relateContOrder"></td>
						</tr>
	        	</table>
	    	</fieldset>
    	</form>
    	<fieldset>
        	<legend>合同信息</legend>
    		<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;">
	    		<div id="formCont">
			    	<input class="nui-hidden" name="sortField" value="contractid"/>
					<input class="nui-hidden" name="sortOrder" value="desc"/>
			      <table style="width:100%;" class="table">
			        <tr>
			          <td>合同编号:</td>
			          <td align="left">
			            <input class="nui-textbox" name="criteria._expr[0]._value" onEnter='searchCont'/>
			            <input class="nui-hidden" name="criteria._expr[0]._property" value = "contnum"/>
			            <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
			            <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			          </td>
			          <td>签署单位:</td>
			          <td align="left">
			            <input class="nui-textbox " name="criteria._expr[1]._value" onEnter='searchCont'/>
			            <input class="nui-hidden" name="criteria._expr[1]._property" value="misCustinfo.custname"/>
			            <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
			            <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			          </td>
			          <td>合同类型:</td>
			          <td align="left">
			            <input class="nui-dictcombobox" dictTypeId="MIS_CONTRACTTYPE" name="criteria._expr[2]._value"  onEnter='searchCont'/>
			            <input class="nui-hidden" name="criteria._expr[2]._property" value="contracttype"/>
			            <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
			          </td>
			          <td>销售:</td>
			          <td align="left">
			            <input class="nui-textbox " name="criteria._expr[3]._value" onEnter='searchCont'/>
			            <input class="nui-hidden" name="criteria._expr[3]._property" value="salename"/>
			            <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
			            <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
			          </td>
			          <td >
			            <a class="nui-button" iconCls="icon-search" onclick="searchCont()"> 查询</a>
			          </td>
			        </tr>
			        <tr>
				        <td colspan="9" align="center"> 
					        <input id="ismulti"  class="nui-radiobuttonlist" valueField="id" textField="text" 
							data="[{'id': '1','text': '排除已关联项目的合同&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'},{'id': '0','text': '符合条件所有合同'}]" 
					    	style="margin-left: 5px;margin-top: 5px;float: left;" onvaluechanged="changeIsmulti" value = "1" />
					    	
					        <input class="nui-hidden" name="criteria._not[0]._expr[4]._property" value="contnum"/>
					        <input class="nui-hidden" name="criteria._not[0]._expr[4]._op" value="in" id="tempCond71"/>
					        <input class="nui-hidden" name="criteria._not[0]._expr[4]._ref" value="7" id="tempCond72"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="7"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.rdmgr.data.rd.RdProjCont"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="contnum"/>
				  		</td>
			        </tr>
			      </table>
			   
		    </div> 
    		<div id="datagrid1" class="nui-datagrid"  dataField="contracts"  url="com.primeton.eos.ame_common.contract.queryContract.biz.ext" style= "width: 100%;"
 				allowResize="true" allowCellSelect="true"  sizeList=[10,20,50,100] pageSize="10" multiSelect="true" onselectionchanged="onSelectionChanged">
    			<div property="columns"> 
    				<div type="checkcolumn" width="10" name = "checkcolumn1"></div>   
    				<div field="contractid" width="0"></div>        
        			<div field="contnum" width="40" headerAlign="center">合同编号</div>
        			<div field="misCustinfo.custname" width="100" allowSort="true"  headerAlign="center">签署单位</div>                          
					<div field="contracttype" width="40" headerAlign="center" renderer="dictContType">合同类型</div>
					<div field="projectname" width="100" headerAlign="center">合同项目名称</div>
					<div field="salename" width="25" headerAlign="center">销售</div>
				</div>
			</div>
		</fieldset>
	    <fieldset id = "contorder" style = "display: none">
			<legend>合同订单信息</legend>
			<div id="datagrid2" class="nui-datagrid"  dataField="csContOrders"  url="com.primeton.mis.contract.contract.getCsContOrder.biz.ext" style= "width: 100%"
 				allowResize="true" allowCellSelect="true" multiSelect="true" showPager="false">
    			<div property="columns"> 
    				<div type="checkcolumn" width="10" ></div>  
    				<div field="contracttype" width="0">合同类型</div>
    				<div field="contnum" width="50" headerAlign="center">合同编号</div>         
        			<div field="contorderno" width="50" headerAlign="center">合同订单编号</div>
        			<div field="orderreg" width="100" headerAlign="center" dateFormate="yyyy-MM-dd" align="left">订单登记日期</div>                          
					<div field="orderdate" width="100" headerAlign="center" renderer="onDealDate" dateFormate="yyyy-MM-dd" align="left">订单签订日期</div>
					<div field="ordermon" dataType="currency" width="150" headerAlign="center" align="right">合同订单金额</div>
				</div>
			</div>
		</fieldset>    
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
    <script type="text/javascript">
   		nui.parse();
   		var formCont = new nui.Form("#formCont");//合同表单信息
   		var form1 = new nui.Form("#form1");//基本信息
   		var grid1 = nui.get("datagrid1");//合同信息列表
   		var grid2 = nui.get("datagrid2");//合同订单信息列表
   		var relateCont;//已关联的合同，用于提交时校验
   		var relateContOrder;//已关联的合同订单，用于提交时校验
   		var relateCont1;//已关联的合同订单对应的合同，用于提交时校验
   		 /**
    	 * 选择项目
    	 */
    	function selectProjectList(){
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp?preSettle=bukongzhi",
                title: "选择项目",
                width: 860,
                height: 490,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        	//alert(nui.encode(data));
                            btnEdit.setValue(data.projectno);
                            btnEdit.setText(data.projectName);
                            //得到与该项目关联的合同及合同订单
                            var json = nui.encode({"projectno":data.projectno});
					    	nui.ajax({
								url: "com.primeton.rdmgr.project.rdProject.getRelateNum.biz.ext",
					        	data: json,
					        	type: 'POST',
					        	cache: false,
					        	contentType: 'text/json',
					            success: function (o) {
						        	var contnum = o.contnum;
						        	var contorderno = o.contorderno;
						        	var contnum1 = o.contnum1;
						        	var result = o.result;
						        	if(contnum){
						        		document.getElementById("tip").style.display = "";
						        		document.getElementById("relateCont").innerHTML = contnum;
						        		relateCont = contnum;
						        	}else{
						        		document.getElementById("tip").style.display = "none";
						        	}
						        	if(contorderno){
						        		document.getElementById("tip1").style.display = "";
						        		document.getElementById("relateContOrder").innerHTML = contorderno;
						        		relateContOrder = contorderno;
						        		relateCont1 = contnum1;
						        	}else{
						        		document.getElementById("tip1").style.display = "none";
						        	}
					 			},
					 			error: function () {
									alert("error");
								}
							});
                            //隐藏合同订单列表
        					document.getElementById("contorder").style.display = "none";
                            //自动带出合同客户和销售的查询条件，并且查询合同信息
                            nui.getbyName("criteria._expr[1]._value").setValue(data.custname);
                            nui.getbyName("criteria._expr[3]._value").setValue(data.orgname);
                            searchCont();
                        }
                    }
                }
            });
        }
        
        //查询合同信息
        function searchCont(){
        	var contData = formCont.getData();
        	grid1.load(contData);
        }
        
        //合同类型业务字典
        function dictContType(e){
        	return nui.getDictText('MIS_CONTRACTTYPE',e.value);
        }
        
        //合同选择改变时触发的方法
        function onSelectionChanged(e) {
        	var proconttype = nui.getbyName("rdprocont.proconttype").getValue();//对应类型
        	//当项目与合同对应类型为项目与合同订单对应则展示合同订单信息
        	if(proconttype == "2"){
	        	//展示列表
	        	document.getElementById("contorder").style.display = "block";
	            var grid = e.sender;
	            var record = grid.getSelecteds();
	            var contractid;
	            for(var i=0;i<record.length;i++){
	            	if(contractid){
	            		contractid = record[i].contractid+","+contractid;
	            	}else{
	            		contractid = record[i].contractid;
	            	}
	            }
	            if (contractid) {
	                grid2.load({"contractid": contractid});
	            }
        	}
        }
        
        //对应类型变更时触发的方法
        function changeType(e){
        	if(e.value == "1"){
        		//隐藏合同订单列表
	        	document.getElementById("contorder").style.display = "none";
        	}
        }
        
        //关闭窗口
        function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}
		
		
		function onCancel() {
			CloseWindow("cancel");
		}
		
		//数据保存前检查
		function onOk() {
			if(!form1.validate()){
	    		nui.alert("信息录入不完整！");
	        	return;
	        }
	        var procontData = form1.getData();//基本信息
	        var datas;//选中的合同|合同订单
	        var isneedwarn=false;//当对应类型为与合同订单关联时，当合同类型不是框架协议或者OEM时提醒
	        if(procontData.rdprocont.proconttype=="1"){
	        	datas = grid1.getSelecteds();
	        	if(datas.length==0){
	        		nui.alert("项目与合同对应时，必须选择一条对应的合同记录！");
	        		return;
	        	}
	        	for(var i=0;i<datas.length;i++){
	        		if(relateCont){
		        		if(relateCont.indexOf(datas[i].contnum)!=-1){
		        			nui.alert("该项目已与合同“"+datas[i].contnum+"”关联不能重复关联！");
		        			return;
		        		}
	        		}
	        		if(relateCont1){
		        		if(relateCont1.indexOf(datas[i].contnum)!=-1){
		        			nui.alert("该项目已与合同“"+datas[i].contnum+"”的合同订单关联请先删除该关联关系！");
		        			return;
		        		}
	        		}
	        	}
	        }else{
	        	datas = grid2.getSelecteds();
	        	if(datas.length==0){
	        		nui.alert("项目与合同订单对应时，必须选择一条对应的合同订单记录！");
	        		return;
	        	}
	        	for(var i=0;i<datas.length;i++){
	        		if(relateCont){
		        		if(relateCont.indexOf(datas[i].contnum)!=-1){
		        			nui.alert("该项目已与合同“"+datas[i].contnum+"”关联请先删除该关联关系！");
		        			return;
		        		}
	        		}
	        		if(relateContOrder){
		        		if(relateContOrder.indexOf(datas[i].contorderno)!=-1){
		        			nui.alert("该项目已与编号为“"+datas[i].contorderno+"”的合同订单关联请不要重复关联！");
		        			return;
		        		}
	        		}
	        		if(datas[i].contracttype!="04"&&datas[i].contracttype!="30"){
	        			isneedwarn = true;
	        		}
	        	}
	        }
	        var ismaincont = nui.get("ismaincont").getValue();
	        if(ismaincont=='1'){
	        	var json = nui.encode({"projectno":procontData.rdprocont.projectNo,"datas":datas});
		    	nui.ajax({
					url: "com.primeton.rdmgr.project.rdProject.checkProjCont.biz.ext",
		        	data: json,
		        	type: 'POST',
		        	cache: false,
		        	contentType: 'text/json',
		            success: function (o) {
			        	var result = o.result;
			        	if(result=='0'){
			        		nui.alert("所选合同中有合同编号与该项目主合同不相符的,请检查后再进行该操作！");
			        		return;
			        	}else{
			        		if(isneedwarn == true){
					        	nui.confirm("选中的合同订单中存在合同类型为非框架协议和OEM的合同，不建议建立与合同订单的关联关系，是否确认关联？","操作提示",function(action){
						        	if(action == "ok"){
						        		saveData(procontData,datas)
						        	}
					       		})
					       	}else{
					       		nui.confirm("是否确认增加关联关系？","操作提示",function(action){
						        	if(action == "ok"){
						        		saveData(procontData,datas)
						        	}
					       		})
					       	}
			        	}
		 			},
		 			error: function () {
						alert("error");
					}
				});
	        }else{
	        	if(isneedwarn == true){
		        	nui.confirm("选中的合同订单中存在合同类型为非框架协议和OEM的合同，不建议建立与合同订单的关联关系，是否确认关联？","操作提示",function(action){
			        	if(action == "ok"){
			        		saveData(procontData,datas)
			        	}
		       		})
		       	}else{
		       		nui.confirm("是否确认增加关联关系？","操作提示",function(action){
			        	if(action == "ok"){
			        		saveData(procontData,datas)
			        	}
		       		})
		       	}
	        }
		}
		
		//保存数据
		function saveData(procontData,datas){
			var json = nui.encode({"rdprocont":procontData.rdprocont,"datas":datas});
	    	nui.ajax({
				url: "com.primeton.rdmgr.project.rdProject.saveRdProCont.biz.ext",
	        	data: json,
	        	type: 'POST',
	        	cache: false,
	        	contentType: 'text/json',
	            success: function (o) {
		        	if(o.result == "succ"){
		        		nui.alert("保存成功","提示",function(e){
				        	CloseWindow("ok");
			       		})
		        		
		        	}else{
		        		nui.alert("保存失败，请联系信息技术部！");
		        	}
	 			},
	 			error: function () {
					alert("error");
				}
			});
		} 
		
		//是否排除已关联项目按钮值改变时触发
		function changeIsmulti(e){
			if(e.value==0){
				nui.get("tempCond71").setValue("=");
        		nui.get("tempCond72").setValue("");
			}else{
				nui.get("tempCond71").setValue("in");
        		nui.get("tempCond72").setValue("7");
			}
		}
   	</script>
</body>
</html>