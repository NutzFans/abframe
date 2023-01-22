 <%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-27 10:10:45
  - Description:
-->
<head>
<title>采购报表</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
		html,body {
			margin: 0;
			padding: 0;
			border: 0;
			width: 100%;
			height: 100%;
			overflow: hidden;
		}
	    /* .nui-radiobuttonlist-item{
	    	float: left;
		    margin-left: 200px;
		    color: pink;
		 } */
    </style>
</head>
<body>
<div id="form1">
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		<table align="center" border="0" width="100%" class="form_table">
		  <tr>
			<td class="form_label" align = "right">采购计划名称</td>
			<td>
				<input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" />
				<input class="nui-hidden" name="criteria._expr[1]._property" value="purchasesName"/>
				<input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
			</td>
			<td class="form_label" align = "right">采购计划编号</td>
			<td>
				<input name="criteria._expr[2]._value" class="nui-textbox" style="width:150px;"/>
				<input class="nui-hidden" name="criteria._expr[2]._property" value="codes"/>
				<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
			 </td>
			 <td class="form_label" align = "right">立项单位</td>
			 <td>
				<input name="criteria._expr[3]._value" class="nui-textbox" dictTypeId="ZH_BIDSTATUS"  shownullItem="true" style="width:150px;"/>
				<input class="nui-hidden" name="criteria._expr[3]._property" value="orgname"/>
				<input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
			 </td>
			 <td class="form_label" align = "right">采购类型</td>
			 <td>
				<input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="ZH_PURCHASE"  shownullItem="true" style="width:150px;"/>
				<input class="nui-hidden" name="criteria._expr[5]._property" value="type"/>
				<input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
			 </td>		          
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
<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
      <table style="width:100%;">
        	<tr>
                <td style="width:20%;">
                <!--<a class="nui-button" id="exportCsContBack" iconCls="icon-download" onclick="onExportExcel()">导出</a>-->
                	<a class="nui-button" id=""gys_exportExcel" iconCls="icon-download" onclick="onExportExcel()">导出</a>
		        </td>
           </tr>
      </table>           
</div>
<div class="nui-fit">
	<div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="purReportFormList" 
    	showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell"
    	class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.purchase.reportForm.queryReportForm.biz.ext" 
    	multiSelect="true" allowSortColumn=true onshowrowdetail="onShowRowDetail">
        <div property="columns" > 
			<div name="temp123" type="checkcolumn"></div>
			<div type="indexcolumn" align="center" headerAlign="center">序号</div>
			<!-- <div type="expandcolumn" width="20"></div> -->
			<div field="codes" width="100" align="center" headerAlign="center" allowSort="true">采购计划编号</div>
			<div field="proAppName" width="100" align="center" headerAlign="center" allowSort="true" >立项名称</div>
			<div field="proAppCode" width="100" align="center" headerAlign="center" allowSort="true" >立项编号</div>
			<div field="proapporgname" width="100" align="center" headerAlign="center" allowSort="true" >立项单位</div>
			<div field="contractName" width="100" align="center" headerAlign="center" allowSort="true" >合同名称</div>
			<div field="contractNo" width="100" align="center" headerAlign="center" allowSort="true" >合同编号</div>
			<div field="actcontractsum" width="100" align="center" headerAlign="center" allowSort="true" >合同金额(万元)</div>
			<div field="signatoryname" width="182" align="center" headerAlign="center" allowSort="true" >合同供方/乙方/承包人名称(全称)</div>
			<div field="signingDate" width="100" align="center" headerAlign="center" allowSort="true" >合同签订日期</div>
			<!-- <div field="isProject" width="120" align="center" headerAlign="center" allowSort="true" >是否为工程建设项目</div> 
			<div field="projectName" width="110" align="center" headerAlign="center" allowSort="true" >工程建设项目名称</div> -->
			<div field="proAppObjType" renderer="onCheckRendererAppObjType" width="100" align="center" headerAlign="center" allowSort="true" >采购类型</div>
			<div field="packageType" width="100" align="center" headerAlign="center" allowSort="true" >采购方式</div>
			<div field="type" width="100" renderer="onCheckRendererPurChase" align="center" headerAlign="center" allowSort="true" >集中采购类型</div>
			<div field="isgroupqualified" renderer="onCheckRendererMisYN" width="210" align="center" headerAlign="center" allowSort="true" >成交供应商是否为集团公司合格供应商</div>
			<!-- <div field="projectName" width="100" align="center" headerAlign="center" allowSort="true" >所属项目名称</div> -->
			<div field="proAppApplyPrice" width="100" align="center" headerAlign="center" allowSort="true" >立项金额(万元)</div>
			<div field="costFrom" width="100" renderer="onCheckRendererCostFrom"  align="center" headerAlign="center" allowSort="true" >费用来源</div>
			<div field="agentname" width="100" align="center" headerAlign="center" allowSort="true" >立项单位经办人</div>
			<!--<div field="chargename" width="100" align="center" headerAlign="center" allowSort="true" >立项单位负责人</div>
			<div field="proappapporgname" width="100" align="center" headerAlign="center" allowSort="true" >立项审核单位</div>--> 
			<div field="createdTime" width="100" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true" >立项创建时间</div> 
			<div field="proAppImplTime" width="100" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true" >项目拟实施时间</div> 
			<div field="packageCode" width="100" align="center" headerAlign="center" allowSort="true" >发包编号</div>         
			<!-- <div field="type" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictIshavebak">采购类型</div>
			<div field="focusrate" width="80" align="center" headerAlign="center" allowSort="true"   >电子采购率</div>            
			<div field="electronrate" width="80" align="center" headerAlign="center" allowSort="true"   >集中采购率</div>
			<div field="publicrate" width="80" align="center" headerAlign="center" allowSort="true"   >公开采购率</div>-->
			<div field="status" width="80" renderer="onCheckRendererZhFlowType"  align="center" headerAlign="center" allowSort="true"   >状态</div> 
			<div  width="80" align="center" headerAlign="center" allowSort="true"   >电子采购率</div>            
			<div  width="80" align="center" headerAlign="center" allowSort="true"   >集中采购率</div>
			<div  width="80" align="center" headerAlign="center" allowSort="true"   >公开采购率</div>
			 </div>
	</div>
</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 

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
    	//按钮权限的控制
	    getOpeatorButtonAuth("gys_exportExcel");
    	function init(){
    		grid.load({type:type});
    		grid.sortBy("tbdate","desc");
		}
		function dictIshavebak(e) {
				
				return nui.getDictText('ZH_PURCHASE',e.value);//设置业务字典值
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
				
				console.log(json);
					
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
			
			var id = e.row.processid;
			if(id==0 || id==null ){
				nui.alert("查询信息有误");
			}else{
				return "<a href='javascript:void(0)' onclick='doView("+ id +");' title='点击查看'>" + e.value + "</a>";
			}
		}
	    function doView(id){
			var executeUrl = "<%= request.getContextPath() %>/purchase/plan/purPlanDetail.jsp?processid=" + id;
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
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}
		
		function onOk(){
			search();
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
				
				url: "/default/purchase/plan/purPlanEdit.jsp?processid="+row.processid+"&id="+row.id,
				width: 1200,
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
			
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行删除");
    		}else{
    		var row=row[0];
    		console.log(row);
			if (row) {
				
				var json = nui.encode({id:row.id});
				nui.ajax({
					    url: "com.zhonghe.ame.imptask.keyTaskVote.deleteTaskVote.biz.ext",
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
		
		
		//展示差旅行程明细
		function onShowRowDetail(e) {
	
		 	var grid = e.sender;
	    	var row = e.record;
	        var td = grid.getRowDetailCellEl(row);
	        td.appendChild(detailGrid_Form);
	        detailGrid_Form.style.display = "block";
	        reve_grid.load({ id: row.id });
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		function getExpRei(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkExpNo("+ e.value +");' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkExpNo(reiid){
			var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
			window.open(executeUrl);
	    }
	    
	    
	    function onActionRenderer(e) {
			var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
        	var processInstID=record.processinstid;
			
			var s = " <a  href='javascript:void(0)' onclick='feeView();' >流程</a>";
			
            return s;
        }
        
        function feeView(){
	        var selectRow = grid.getSelected();
	        var processInstID=selectRow.processinstid;
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
						iframe.contentWindow.initData({"processInstID": processInstID});
					}
				},
				ondestroy: function (action){
				}
			});
	    }
        
		
	    function checkexpid(){
	    	var selectRow = grid.getSelected();
	    	var expno=selectRow.expReiList.expno;
	    	var exptype=selectRow.expReiList.exptype;
	    	var processinstid=selectRow.processinstid;
	    	if(processinstid==null||processinstid==""){
	    		var t = /^[a-zA-Z][a-zA-Z0-9]*$/.test(expno);
	    		if(t){
	    			var url = "<%=request.getContextPath() %>/marketInfo/bid/editBid.jsp";
					var title = "打印";
				    nui.open({
						url: url,
						title: title,
						width: 659,
						height: 210,
						onload: function () {
							var iframe = this.getIFrameEl();
						},
						ondestroy: function (action){
						}
					}).show("center",100);
	    		}
			}else{
				var url = "<%=request.getContextPath() %>/ame_fee/myExpenseReimbursement/changePrint.jsp?expno="+expno+"&exptype="+exptype+"&processinstid="+processinstid;
				var title = "打印";
			    nui.open({
					url: url,
					title: title,
					width: 659,
					height: 210,
					onload: function () {
						var iframe = this.getIFrameEl();
					},
					ondestroy: function (action){
					}
				}).show("center",100);
			}
	    }
	    
	    
	    function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		    
		}
		//将中国标准时间格式化为“yyyy-MM-dd HH:mm:ss”
	function ondealdate(e){
		if(e.value){
		  var now  = e.value;
		  var   year=now.getFullYear();     
          var   month=now.getMonth()+1;
          var   day=now.getDate();     
          var   hours=now.getHours();     
          var   minutes=now.getMinutes();     
          var   seconds=now.getSeconds();
          var curDateTime = year;
          if(month>9){
			curDateTime = curDateTime +"-" + month;
		  }else{
		  	curDateTime = curDateTime+"-" + "0" + month;
		  }
    	if(day>9){
			curDateTime = curDateTime+"-" + day;
		}else{
			curDateTime = curDateTime+"-" + "0" + day;
			}
		if(hours>9){
			curDateTime = curDateTime+"   " + hours;
		}else{
			curDateTime = curDateTime+"   " + "0" + hours;
			}
		if(minutes>9){
			curDateTime = curDateTime+":" + minutes;
		}else{
			curDateTime = curDateTime+":" + "0" + minutes;
			}
		if(seconds>9){
			curDateTime = curDateTime+":" + seconds;
		}else{
			curDateTime = curDateTime+":" + "0" + seconds;
			}     
          return   curDateTime;     
		}
	}
	
	function sure(e){
	
			var row = grid.getSelecteds();
			
			if (row.length == 1) {
				
				var mngJsonData = row[0];
				//获取当前客户的其他信息
				var json = nui.encode({id:mngJsonData.id,createUserid:mngJsonData.createUserid});
				
				console.log(json);
				if(!confirm("确定提交该流程？")){
        				return;
        			}else{
				  nui.ajax({
					    url: "com.zhonghe.ame.imptask.keytask.taskMngFillIn.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
					    success: function (o) {
					           if(o.result==1){
		                	 	nui.alert("流程发起成功","系统提示",function(){
				        			//nui.get("sureButton").setEnabled(true);
				        			CloseWindow("ok");
				        		});

		                	 	}else{
		                	 
		                	 		nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
									//nui.get("sureButton").setEnabled(true);
								});
		                	 
		                	 }
					    }
				}); 
				}
			}else{
				nui.alert("请选中一条记录","提示");
			}
	
	
	
	}
	
	
     function add(){
		nui.open({
			url: "/default/purchase/plan/addPurchasePlan.jsp",
			width: '90%',
			height: '90%',
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
			reset();
			}
		})
	}
	//采购台账导出
	function onExportExcel(){
			var data = form.getData();
			exportExcel({
				url: "com.primeton.eos.ame_pur.PurOtherSettlePay.exportPurStandingBook.biz.ext",
				fileName:"采购台账",
				data:data
			})
        }
	
	function onCheckRendererZhFlowType(e) {
		return nui.getDictText('ZH_FLOW_TYPE',e.value);
	}
	
	
	
	//处理结果业务字典显示
	//采购类型业务字典展示
  	function onCheckRendererAppObjType(e) {
		return nui.getDictText('MIS_APPOBJTYPE',e.value);
	}
	//集中采购类型业务字典展示
  	function onCheckRendererPurChase(e) {
		return nui.getDictText('ZH_PURCHASE',e.value);
	}
	//集中费用来源展示
  	function onCheckRendererCostFrom(e) {
		return nui.getDictText('MIS_COSTFROM',e.value);
	}
	//是否集团合格供应商展示
  	function onCheckRendererMisYN(e) {
		return nui.getDictText('MIS_YN',e.value);
	}
</script>
</body>
</html>