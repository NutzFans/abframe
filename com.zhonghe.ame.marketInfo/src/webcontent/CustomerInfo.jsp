<%@page pageEncoding="UTF-8"%>
<%@include file="/purchase/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-09-04 11:14:48
  - Description:
-->
<head>
<title>客户信息</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
</style>
</head>
<body>
	<div class="nui-panel" title="客户信息管理" style="width:100%;height:100%">
		<div id="form1">
			<input class="nui-hidden" name="criteria._entity" value="com.primeton.rdmgr.data.csomsData.MisCustinfo"/>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;" class="table">
					<tr>
						<td align="right" style="width: 100px;">客户名称：</td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[0]._value" style="width: 200px;"/>
							<input class="nui-hidden" name="criteria._expr[0]._property" value="custname"/>
							<input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						</td>
						<!-- <td align="right" style="width: 100px;">商务客户编号：</td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[1]._value" style="width: 100px;"/>
							<input class="nui-hidden" name="criteria._expr[1]._property" value="custnum"/>
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						</td> -->
						<td align="right" style="width: 100px;">客户类型：</td>
						<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[1]._value"  dictTypeId="ZH_GROUP"  showNullItem="true" nullItemText="全部"  style="width: 200px;"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._property" value="customertype"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
					    </td>
					   <td align="right" style="width: 100px;">联系人：</td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[8]._value" style="width: 200px;"/>
							<input class="nui-hidden" name="criteria._expr[8]._property" value="contacts"/>
							<input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
						</td>
						<!-- <td align="right" style="width: 100px;">是否有效：</td>
						<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[8]._value"  dictTypeId="MIS_YN"  showNullItem="true" nullItemText="全部"  style="width: 100px;"/>
		            		<input class="nui-hidden" name="criteria._expr[8]._property" value="status"/>
		            		<input class="nui-hidden" name="criteria._expr[8]._op" value="="/>
					    </td> -->
					</tr>
	            	<tr>
					    <td colspan="5"></td>
					    <td style="width:20%;padding-left: 40px;" align="center">
			            	<a class="nui-button" iconCls="icon-search" onclick="search()"> 查询</a>
			            	<a class="nui-button" iconCls="icon-reload" onclick="reset()">重置</a> 
				        </td>
				       <!-- <td style="width:20%;" align="center">
			            	
				        </td> -->
					</tr>
				</table>
			</div>
		</div>
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <table>
	        	<tr>
	                <td>
			            <a class="nui-button" iconCls="icon-add" id="custInfo_add" onclick="addCustInfo()">新增</a>
			            <a class="nui-button" iconCls="icon-edit" id="custInfo_edit" onclick="edifCustInfo()">修改</a>
			            <a class="nui-button" iconCls="icon-remove" id="custInfo_remove" onclick="deleteCustInfo()">删除</a>
			        </td>
	            </tr>
	        </table>           
	    </div>
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:88%;" 
	    	url="com.primeton.eos.ame_common.curstinfo.querycustinfo.biz.ext" dataField="custinfo" 
	    	 multiSelect="false" sizeList="[10,20,30,50,100,200,500,1000,5000,10000]" pageSize="10"  allowAlternating="true" multiSelect="true">
			<div property="columns" >
				<div name="temp123" type="checkcolumn"></div>
				<div field="custname" width="110"  renderer="lookInfo" allowSort="true" align="left" headerAlign="center"  >客户名称</div>
				<div field="licenseenddate" width="50" allowSort="true" align='center' headerAlign="center" >接洽日期</div>
				<div field="address" width="50" allowSort="true" align='center' headerAlign="center" >接洽地点</div>
				<div field="comments" width="50" allowSort="true" align='center' headerAlign="center" >主要议题及成果</div>
				<div field="busiscope" width="50" allowSort="true" align='center' headerAlign="center" >主要参会人员</div>
				<div field="contacts" width="50" allowSort="true" align='center' headerAlign="center" >联系人</div>
				<div field="accoutbank" width="50" allowSort="true" align='center' headerAlign="center" >填报部门</div>
				<div field="createDate" width="50" allowSort="true" align='center' headerAlign="center" >创建日期</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	 	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
    		grid.load();
    		grid.sortBy("createDate", "desc");
    		
	    	//按钮权限的控制
	    	getOpeatorButtonAuth("misCustInfo_add,misCustInfo_edit,misCustInfo_remove");//操作按钮权限初始化
		
	    	
		}
		//搜索表单数据
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			var data = form.getData(true,true);
		    grid.sortBy("createDate","desc");
		  	grid.load(data); //datagrid加载数据
		}
		//重置表单数据
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}
		//新增客户信息
		function addCustInfo(){
			var addUrl = "<%=request.getContextPath() %>/marketInfo/AddCustomerInfo.jsp";
			nui.open({
	            url: addUrl,
	            title: "新增客户信息", 
	            width: 1100, 
	            height: 500,
	            onload: function () {
	                <%--var iframe = this.getIFrameEl();
	                var data = { action: "new"};
	                iframe.contentWindow.SetData(data);--%>
	                var iframe = this.getIFrameEl();
	            },
	            ondestroy: function () {
            		reset();
	            }
	        });
		}
		//修改客户信息
		function edifCustInfo(){
			var selectRow = grid.getSelected();
			if(!selectRow){
				nui.alert("请选择其中一条客戶!");
				return;
			}
			var editUrl = '<%=request.getContextPath() %>/marketInfo/custInfoModal.jsp?custid='+selectRow.custid;
			nui.open({
	            url: editUrl,
	            title: "修改客户信息", 
	            width: 1100, 
	            height: 500,
	            onload: function () {
	                <%--var iframe = this.getIFrameEl();
	                var data = { action: "new"};
	                iframe.contentWindow.SetData(data);--%>
	            },
	            ondestroy: function (action) {
	            	if(action=="save"){
	            		grid.reload();
	            	}
	            }
	        });
		}
		//删除客户信息
		function deleteCustInfo(){
			var row = grid.getSelected();
			if (row) {
				//获取当前客户的其他信息
				var json = nui.encode({custid:row.custid});
				//获取当前客户的
				var data = {custinfo:row};
				console.log(json);
				nui.ajax({
		            url: "com.primeton.eos.ame_common.curstinfo.delMisCustbefor.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
				          var c=confirm("可以删除这个空客户，您确认吗？");
				          if(c==true){ 
				             nui.ajax({
					            url: "com.primeton.eos.ame_common.curstinfo.deleteCustInfo.biz.ext",
								type: 'POST',
								data: data,	
								contentType: 'text/json',
					            success: function (o) {
					            	if(o.result==1){
					            		nui.alert("删除成功","提示");
					            		reset();
					            	}else{
					            		nui.alert("删除失败","提示");
					            	}
					            }
					        });
				          }
				        
				     	
		            }
		        });
			}else{
				nui.alert("请选中一条记录","提示");
			}
		}
		function onOk(){
			search();
		}
	    //给该内容加上链接以及点击事件
		function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
		//打开新的窗口展示详情
		function doView(){
			var selectRow = grid.getSelected();
			if(!selectRow){	
				nui.alert("请选择其中一条合同数据!");
				return;
			}
			var custInfoUrl = "<%=request.getContextPath() %>/marketInfo/custInfoView.jsp?custid=" + selectRow.custid;
			window.open(custInfoUrl, "客户详细信息");
		}http:
	    //客户类型业务字典
		function custtype(e){
			return nui.getDictText('ZH_GROUP',e.value);
		}
		//重要性业务字典
		function grade(e){
			return nui.getDictText('MIS_IMPORTANT',e.value);
		}
		
</script>	
</html>