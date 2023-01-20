<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title></title>
</head>
<body>
	<div class="nui-panel" title="" style="width:100%;">
        <div  id="form1">
        <!-- <input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.contractPact.frameAgreement.ZhAgreementEntity"/> -->
		  <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			  <table align="center" border="0" width="100%" class="form_table">
		        <tr >
		          <td class="form_label" align = "right">立项名称:</td>
	          <td colspan="1">
		    	<input name="criteria._expr[1]._value" class="nui-textbox" style="width:65%;" />
				    <input class="nui-hidden" name="criteria._expr[1]._property" value="proAppName"/>
				    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
		          </td>	
  		    	  <td class="form_label" align = "right">立项编号:</td>
		          <td colspan="1">
			    	<input name="criteria._expr[2]._value" class="nui-textbox" style="width:65%;" />
				    <input class="nui-hidden" name="criteria._expr[2]._property" value="proAppCode"/>
				    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
		          </td>
  		          <td class="form_label" align = "right">采购计划编号:</td>
		          <td colspan="1">
			    	<input name="criteria._expr[3]._value" class="nui-textbox" style="width:65%;" />
				    <input class="nui-hidden" name="criteria._expr[3]._property" value="purchaseNumber"/>
				    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				    
				    <input class="nui-hidden" id="ischange" name="criteria._expr[4].ischange" value="1" />
 					<input class="nui-hidden" name="criteria._expr[4]._op" value="=" />
			       
			        <input class="nui-hidden" name="criteria._expr[7]._property" value="createdOrgid"/>
			        <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
			        <input class="nui-hidden" name="criteria._expr[7]._value" id="orgids2"/>
				    <input class="nui-hidden" name="criteria._expr[6].createdBy" id="createdBy" />
				    <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>	
		          		
		          </td>		          
		            <!-- <td colspan="9" align="center">
			            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		        </td> -->		          
		      </tr>
		      <tr>
		            <td colspan="9" align="center">
			            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
			            
			            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
			        </td>
		        </tr>
		      </table>
			</div>
</div>
<div >
    <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="proApp" 
    	showSummaryRow="true"  sortMode="client"
    	class="nui-datagrid" style="width:100%;height:320px;" url="com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext" 
    	multiSelect="false" allowSortColumn=true >
        <div property="columns">
        <div type="indexcolumn" align="center" headerAlign="center">序号</div>
        	<div name="temp123" type="checkcolumn"></div>
        	<!-- <div type="expandcolumn" width="20"></div> -->
        	<div field="proAppName" width="80" align="center" headerAlign="center" allowSort="true" >立项名称</div>
            <div field="proAppCode" width="200" align="center" headerAlign="center" allowSort="true" >立项编号</div>
           <!--  <div field="code" width="80" align="center" headerAlign="center" allowSort="true" >采购计划编号</div> -->
            <div field="proAppOrgName" width="200" align="center" headerAlign="center" allowSort="true" >立项单位</div>
            <div field="projectId" width="150" align="center" headerAlign="center" allowSort="true" >所属项目名称</div>
            <div field="proAppApplyPrice" width="100" align="center" headerAlign="center" allowSort="true"  >立项申请金额(万元)</div>
            
        </div>
        </div>
        <div style="text-align: center;padding: 10px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">确定</a>
			<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
		</div>
		</div>
	</div>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	search();
    	var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
    	function init(){
    		grid.load({type:type});
    		grid.sortBy("tbdate","desc");
		}
		function getStatus(e){
    		if(e.value==1){
    			return "审核中"
    		}
		}
		function check(e){
			if(e.value==1){
				return "是";
			}else{
				return "否";
			}
		}
		
		function onOk() {
	        var row = grid.getSelected();
	        closeOk();    
	    }
		
	    function doView(id){
			var executeUrl = "<%= request.getContextPath() %>/purchase/project/proAppDetail.jsp?id=" + id;
			window.open(executeUrl);
		}
		
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
			search()
		}
		
		
		 function GetData() {
	        var row = grid.getSelected();
	        return row;
    	}
		
		//修改投标明细
		function edit(){
		debugger;
    		var row = grid.getSelecteds();
    		var data=row[0];
			if (data) {
				nui.open({
					url: "/default/contractPact/chargeContract/chargeContractEdit.jsp",
					width: '90%',
					height: '90%',
					title: "收费合同签订编辑",
			        onload: function () {
			        	var iframe = this.getIFrameEl();
						iframe.contentWindow.setEditData(data);
			        },
					ondestroy: function (action) {
		            	if(action=="ok"){
		            		grid.reload();
		            	}
		            }
				})
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
		}
		
		function deleteInfo(){
    		var row = grid.getSelecteds();
			if (row.length != 1) {
    			showTips("请选中一条记录进行删除");
    		}else{
	    		var row=row[0];
	    		console.log(row);
				if (row) {
					var json = nui.encode({id:row.id});
					ajaxCommon({
						    url: "com.zhonghe.ame.imptask.selfValuater.deleteSelfValuate.biz.ext",
							data: json,	
						    success: function (o) {
					           if(o.result==1){
			                	 	showTips("删除成功","系统提示")
					        		grid.reload();
			                	 }else{
			                		showTips("删除失败，请联系信息技术部人员！","系统提示")
			                	 }
						    }
				}); 
			
    		}
		}
	}
		//回车触发
		function onKeyEnter(){
			search();
		}
	    
     function add(){
		nui.open({
			url: "/default/purchase/project/addProApp.jsp",
			width: '90%',
			height: '90%',
			title: "收费合同签订申请",
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
				search();
			}
		})
	}
    function alteration(){
		var row = grid.getSelecteds();
		var data=row[0];
		if (data) {
			nui.open({
				url: "/default/contractPact/chargeContract/chargeContractAlteration.jsp",
				width: '90%',
				height: '90%',
				title: "收费合同协议变更",
				onload: function () {
					var iframe = this.getIFrameEl();
				},
				ondestroy: function (action){
					search();
				}
			})
		}else{
			nui.alert("请选中一条记录","提示");
			}
	}
	
	function contractHistory(){
		var row = grid.getSelecteds();
		var data=row[0];
		if (data) {
			nui.open({
				url: "/default/contractPact/chargeContract/chargeContractHistoryList.jsp",
				width: '90%',
				height: '60%',
				onload: function () {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.setContractHistoryData(data);
				},
				ondestroy: function (action){
					search();
				}
			})
		}else{
			nui.alert("请选中一条记录","提示");
			}
	}
	function zhContractType(e) {
		return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
	}
</script>
</body>
</html>