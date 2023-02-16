<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>紧急采购</title>
	<style type="text/css">
		html, body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }  
    </style>
</head>
<body>
<div  id="form1">
    <div class="nui-toolbar" style="border-bottom:0px;padding:0px;">
    </div>
  <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	  <table align="center" border="0" width="100%" class="form_table">
        <tr>
          <td class="form_label" align = "right">紧急采购名称</td>
          <td >
	    	<input name="criteria._expr[1].purchaseName class="nui-textbox" style="width:150px;" />
		    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
          </td>
          <td class="form_label" align = "right">紧急采购编号</td>
           <td >
			 <input name="criteria._expr[2].purchaseCode" class="nui-textbox" dictTypeId="ZH_BIDSTATUS"  shownullItem="true" style="width:150px;"/>
		     <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
           </td>
           <td class="form_label" align = "right">采购单位</td>
           <td>
			 <input name="criteria._expr[3].orgname" class="nui-textbox" dictTypeId="ZH_BIDSTATUS"  shownullItem="true" style="width:150px;"/>
		     <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
           </td>
           <td class="form_label" align = "right">状态</td>
           <td >
			 <input name="criteria._expr[4].status" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE"  shownullItem="true" style="width:150px;"/>
		     
	        <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
	        <input class="nui-hidden" name="criteria._expr[5].createdOrgid" id="orgids2"/>
		    <input class="nui-hidden" name="criteria._expr[6].createdBy" id="createdBy" />
		    <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>	
           </td>		          
            <td colspan="9" align="center">
	            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
	            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
	        </td>
        </tr>
      </table>
      
	</div>
</div>

	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
        	<tr>
                <td style="width:20%;">
                	<a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">新增</a>
		          <!--   <a class="nui-button" id="checkview1" iconCls="icon-remove" onclick="deleteInfo()">删除</a> -->
		            <a class="nui-button" id="checkview" iconCls="icon-print" onclick="print()">打印</a>
		        </td>
            </tr>
        </table>           
    </div>
    <div class="nui-fit">
		<div id="datagrid1" pageSize="20"sizeList="[10,20,50,100]" showPager="true" dataField="purUrgentList" 
	    	class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.purchase.purchaseItems.queryPurUrgentList.biz.ext" 
	    	multiSelect="true" allowSortColumn=true onshowrowdetail="onShowRowDetail">
	        <div property="columns"> 
	            <div name="temp123" type="checkcolumn"></div>
	        	<div type="indexcolumn" align="center" headerAlign="center">序号</div>
	        	<!-- <div type="expandcolumn" width="20"></div> -->
	        	<div field="purchaseName" width="100" align="center" headerAlign="center" renderer="lookInfo">紧急采购名称</div>
	            <div field="purchaseCode" width="100" align="center" headerAlign="center">紧急采购编号</div>
	            <div field="orgname" width="100" align="center" headerAlign="center">采购单位</div>
	            <div field="contrctType" width="100" align="center" headerAlign="center" renderer="onContrctType">合同发包方式</div>
	           <div field="status" width="80" align="center" headerAlign="center" aRproAppListllowSort="true"  renderer="onActionRenderer" >状态</div>
	           <div field="createdTime" align="center" headerAlign="center" allowSort="true">申请日期</div>
	        </div>
        </div>
	</div>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
    	if(type==1){
    	document.getElementById("checkview").style.display="none";
    	document.getElementById("checkview1").style.display="none";
    	}
    	
    	init();
    	function init(){
    		//按钮权限的控制
	    	//getOpeatorButtonAuth("cglx_add","cglx_change","cglx_exportExcel");
    		//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"jjcg","map":{"property":"status","op":"=","value":"running"}};
    		nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createdBy").setValue(userId);
						}
						//根据情况选择一种
						nui.get("orgids2").setValue(text.orgids);
					}else{
						//当没有有权的机构时将申请人设置为登陆人
						nui.get("createdBy").setValue(userId);
					}
					search();
				}
			});
		}
    	
    	function onActionRenderer(e) {
            var record = e.record;
        	var processId=record.processid;
			var s = "<a  href='javascript:void(0)' onclick='feeView("+processId+");' >"+nui.getDictText('ZH_FLOW_TYPE',e.value)+"</a>";
            return s;
    }
		function feeView(processId){
			var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width=1000;
		    nui.open({
				url: url,
				title: title,
				width: width,
				height: 550,
				onload: function () {
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						iframe.contentWindow.initData({"processInstID": processId});
					}
				},
				ondestroy: function (action){
				}
			});
	    }
    	init();
    	function init(){
    		grid.sortBy('createdTime', 'desc');
    		grid.load();
		}
		function onContrctType(e) {
				
				return nui.getDictText('ZH_CGFS',e.value);//设置业务字典值
		}
		function getStatus(e) {
			return nui.getDictText('ZH_FLOW_TYPE',e.value);//设置业务字典值
		}
		function check(e){
			if(e.value==1){
			return "是";
			}else{
			return "否";
			}
		}
		 function detail(){
     		var row = grid.getSelecteds();
			if (row.length == 1) {
				var mngJsonData = row[0];
				//获取当前客户的其他信息
				var json = nui.encode({id:mngJsonData.id,createUserid:mngJsonData.createUserid});
				 nui.open({
						url: "/default/imptask/keyTaskVote/voteTaskRank.jsp?id="+mngJsonData.id,
						width: 1000,
						height: 353,
						onload: function () {
							var iframe = this.getIFrameEl();
						},
						ondestroy: function (action){
						reset();
						}
					}) 
				
			}else{
				nui.alert("请选中一条记录","提示");
			}
	}
		
		function lookInfo(e) {
			var id = e.row.id;
			if(id==0 || id==null ){
				nui.alert("查询信息有误");
			}else{
				return "<a href='javascript:void(0)' onclick='doView("+ id +");' title='点击查看'>" + e.value + "</a>";
			}
		}
	    function doView(id){
			var executeUrl = "<%= request.getContextPath() %>/purchase/print/urgentPurPrint.jsp?id=" + id;
			window.open(executeUrl);
	    }
		function dictGetType(e){
			return nui.getDictText('EXP_EXPTYPE',e.value);
		}
		function dictGetStatus(e){
			return nui.getDictText('EXP_CHECKFLAG',e.value);
		}
		 
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy('createdTime', 'desc');
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.sortBy('createdTime', 'desc');
			grid.load();
		}
		
		function onOk(){
			search();
		}
		function on(){
			
		
		}
		//修改投标明细
		function editTaskMng(){
			
    		var row = grid.getSelecteds();
    		if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    		var row=row[0];
    		console.log(row);
			if (row) {
				nui.open({
				
				url: "/default/imptask/selfevaluate/editSelfValuate.jsp?id="+row.id+"&keytaskId="+row.keytaskId,
				width: 1000,
				height: 550,
				onload: function () {
					var iframe = this.getIFrameEl();
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
		}
		
		function deleteInfo(){
			
			if(!confirm("确定删除吗？")){
        				return;
        			}else{	
			
    		var row = grid.getSelecteds();
    		
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行删除");
    		}else{
    		var row=row[0];
    		console.log(row);
			if (row) {
				
				var json = nui.encode({id:row.id});
				nui.ajax({
					    url: "com.zhonghe.ame.purchase.purchaseItems.deletePurUrgent.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
					    success: function (o) {
					           if(o.result==1){
		                	 	nui.alert("删除成功","系统提示",function(){
				        		//nui.get("sureButton").setEnabled(true);
				        		/* CloseWindow("ok"); */
				        		grid.reload();
				        	});

		                	 }else{
		                	 
		                	 nui.alert("删除失败，请联系信息技术部人员！","系统提示", function(action){
								//nui.get("sureButton").setEnabled(true);
							});
		                	 
		                	 }
					    }
				}); 
				row.id;
				
			
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		}
    		
    		}
		}
		
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		
     function add(){
		nui.open({
			url: "/default/purchase/plan/addUrgentPurchase.jsp",
			width: 1200,
			height: 600,
			title:"&nbsp;",
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
			reset();
			}
		})
	}
	
	function print() {
		var row = grid.getSelected();
		if (row) {
			executeUrl = "<%= request.getContextPath() %>/purchase/print/urgentPurPrint.jsp?id=" + row.id;
			window.open(executeUrl);
		}else {
			showTips("请选中一条记录");
		}
	}
</script>
</body>
</html>