<%@page pageEncoding="UTF-8"%>
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
	<div class="nui-panel" title="客户信息管理" style="width:100%;">
		<div id="form1">
			<input class="nui-hidden" name="criteria._entity" value="com.primeton.rdmgr.data.csomsData.MisCustinfo"/>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;" class="table">
					<tr>
						<td align="right" style="width: 100px;">客户名称：</td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[0]._value" style="width: 100px;"/>
							<input class="nui-hidden" name="criteria._expr[0]._property" value="custname"/>
							<input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						</td>
						<td align="right" style="width: 100px;">商务客户编号：</td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[1]._value" style="width: 100px;"/>
							<input class="nui-hidden" name="criteria._expr[1]._property" value="custnum"/>
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						</td>
					    <td align="right" style="width: 80px;">联系电话：</td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[2]._value" style="width: 100px;"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._property" value="telephone"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
					    </td>
					    <td align="right" style="width: 80px;">客户类型：</td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[3]._value" dictTypeId="MIS_INDUSTRY" multiSelect="true" showNullItem="true" nullItemText="全部"  style="width: 100px;"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._property" value="custtype"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
					    </td>
					</tr>
					<tr>
						<td align="right" style="width: 100px;">所属集团客户：</td>
						<td align="left">
		            		<input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="groupno" style="width: 100px;"/>
		            		<input class="nui-hidden" name="criteria._expr[7]._property" value="groupno"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" value="in" id="tempCond71"/>
					        <input class="nui-hidden" name="criteria._expr[7]._ref" value="7" id="tempCond72"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="7"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.rdmgr.data.csomsData.MisCustinfo"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="custid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="custname"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
					    </td>
					    <td align="right" style="width: 80px;">重要性：</td>
						<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[4]._value" dictTypeId="MIS_IMPORTANT" multiSelect="true" showNullItem="true" nullItemText="全部"  style="width: 100px;"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="grade"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
					    </td>
						<td align="right" style="width: 80px;">企业性质：</td>
						<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[5]._value"  dictTypeId="MIS_CUSTNATURE"  showNullItem="true" multiSelect="true" nullItemText="全部"  style="width: 100px;"/>
		            		<input class="nui-hidden" name="criteria._expr[5]._property" value="custnature"/>
		            		<input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
					    </td>
					   	<td align="right" style="width: 80px;">是否有效：</td>
						<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[8]._value"  dictTypeId="MIS_YN"  showNullItem="true" nullItemText="全部"  style="width: 100px;"/>
		            		<input class="nui-hidden" name="criteria._expr[8]._property" value="status"/>
		            		<input class="nui-hidden" name="criteria._expr[8]._op" value="="/>
					    </td>
					</tr>
					<tr>
					    <td align="right" style="width: 80px;">是否有合同：</td>
						<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[6]._value"  dictTypeId="MIS_YN"  showNullItem="true" nullItemText="全部"  style="width: 100px;"/>
		            		<input class="nui-hidden" name="criteria._expr[6]._property" value="ishave"/>
		            		<input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
					    </td>
					    <td colspan="3"></td>
					    <td style="width:20%;" align="center">
			            	<a class="nui-button" iconCls="icon-search" onclick="search()"> 查询</a>
				            <a class="nui-button" iconCls="icon-reload" onclick="reset()">重置</a>
				        </td>
				        <td colspan="2"></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <table>
	        	<tr>
	                <td>
			            <a class="nui-button" iconCls="icon-add" id="misCustInfo_add" onclick="addCustInfo()">新增</a>
			            <a class="nui-button" iconCls="icon-edit" id="misCustInfo_edit" onclick="edifCustInfo()">修改</a>
			            <a class="nui-button" iconCls="icon-remove" id="misCustInfo_remove" onclick="deleteCustInfo()">删除</a>
			            
			        </td>
	            </tr>
	        </table>           
	    </div>
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:334px;" 
	    	url="com.primeton.eos.ame_common.curstinfo.querycustinfo.biz.ext" dataField="custinfo" 
	    	 multiSelect="false" sizeList="[10,20,30,50,100,200,500,1000,5000,10000]" pageSize="10" allowAlternating="true" multiSelect="true">
			<div property="columns" >
				<div name="temp123" type="checkcolumn"></div>
				<div field="custname" width="110"  renderer="lookInfo" allowSort="true"headerAlign="center" >客户名称</div>
				<div field="custjc" width="70" allowSort="true"headerAlign="center" align='center'>客户简称</div>
				<div field="custnum" width="50" allowSort="true"headerAlign="center" align='center'>客户编号</div>
				<div field="custname1" width="110" headerAlign="center" align='center'>所属集团客户</div>
				<div field="custtype" width="40" renderer='custtype' allowSort="true" align='center' headerAlign="center" >客户类型</div>
				<div field="grade"  width="30" renderer='grade' allowSort="true" align='center' headerAlign="center" >重要性</div>
				<div field="address" width="110" allowSort="true" headerAlign="center" >联系地址</div>
				<div field="telephone" width="50" allowSort="true" headerAlign="center" >联系电话</div>
				<div field="website" width="70" allowSort="true" headerAlign="center" >公司网址</div>
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
			if(nui.get("groupno").getValue() == ""){
        		nui.get("tempCond71").setValue("=");
        		nui.get("tempCond72").setValue("");
        	}else{
        		nui.get("tempCond71").setValue("in");
        		nui.get("tempCond72").setValue("7");
        	}
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
			var addUrl = "<%=request.getContextPath() %>/ame_common/custinfo/custInfoModal.jsp";
			nui.open({
	            url: addUrl,
	            title: "新增客户信息", 
	            width: 1100, 
	            height: 500,
	            onload: function () {
	                <%--var iframe = this.getIFrameEl();
	                var data = { action: "new"};
	                iframe.contentWindow.SetData(data);--%>
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
			var editUrl = '<%=request.getContextPath() %>/ame_common/custinfo/custInfoModal.jsp?custid='+selectRow.custid;
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
				nui.ajax({
		            url: "com.primeton.eos.ame_common.curstinfo.delMisCustbefor.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
		            	var returnValueman = o.countman;
		            	var returnValuepropa = o.countpropa;
		            	var returnValuecont = o.countcont;
		            	var retunrnValueproend = o.countproend;
		            	if(returnValueman == 0&&returnValuepropa==0&&returnValuecont==0&&retunrnValueproend==0){
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
				     	if(returnValueman != 0&&returnValuepropa==0&&returnValuecont==0&&retunrnValueproend==0){
				          	nui.alert("该客户下还有联系人信息，不能删除！","提示");
				       	} 
				     	if(returnValuecont != 0&&returnValuepropa==0&&returnValueman==0&&retunrnValueproend==0){
				          	nui.alert("该客户下还有合同信息，不能删除！","提示");
				      	} 
				     	if((returnValuepropa != 0||retunrnValueproend!=0)&&returnValuecont==0&&returnValueman==0){
				          	nui.alert("该客户下还有系统信息，不能删除！","提示");
				       	} 
				     	if(returnValueman != 0&&returnValuepropa==0&&returnValuecont!=0&&retunrnValueproend==0){
				          	nui.alert("该客户下还有联系人和合同信息，不能删除！","提示");
				       	}
				     	if((returnValuepropa != 0||retunrnValueproend!=0)&&returnValuecont==0&&returnValueman!=0){
				          	nui.alert("该客户下还有系统和联系人信息，不能删除！","提示");
				       	}
						if((returnValuepropa != 0||retunrnValueproend!=0)&&returnValuecont!=0&&returnValueman==0){
				          	nui.alert("该客户下还有系统和合同信息，不能删除！","提示");
				       	}
				     	if((returnValuepropa != 0||retunrnValueproend!=0)&&returnValuecont!=0&&returnValueman!=0){
				          	nui.alert("该客户下还有联系人、系统和合同信息，不能删除！","提示");
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
			var custInfoUrl = "<%=request.getContextPath() %>/ame_common/custinfo/custInfoView.jsp?custid=" + selectRow.custid;
			window.open(custInfoUrl, "客户详细信息");
		}
	    //客户类型业务字典
		function custtype(e){
			return nui.getDictText('MIS_INDUSTRY',e.value);
		}
		//重要性业务字典
		function grade(e){
			return nui.getDictText('MIS_IMPORTANT',e.value);
		}
		
</script>	
</html>