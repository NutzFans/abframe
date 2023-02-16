<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>供应商评价</title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
<div  id="form1">
<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.contractPact.frameAgreement.ZhAgreementEntity"/>
  <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	  <table align="center" border="0" width="100%" class="form_table">
        <tr >
          <td class="form_label" align = "right">供应商名称:</td>
          <td colspan="1">
	    	<input name="critria._expr[2]._value" class="nui-textbox" style="width:65%;" />
				    <input class="nui-hidden" name="critria._expr[2]._property" value="custname"/>
				    <input class="nui-hidden" name="critria._expr[2]._op" value="like"/>
		          </td>	
  		    	  <td class="form_label" align = "right">合同名称:</td>
		          <td colspan="1">
			    	<input name="critria._expr[3]._value" class="nui-textbox" style="width:65%;" />
				    <input class="nui-hidden" name="critria._expr[3]._property" value="contractName"/>
				    <input class="nui-hidden" name="critria._expr[3]._op" value="like"/>
		          </td>
  		          <td class="form_label" align = "right">合同编号:</td>
		          <td colspan="1">
			    	<input name="critria._expr[4]._value" class="nui-textbox" style="width:65%;" />
		    <input class="nui-hidden" name="critria._expr[4]._property" value="contractNo"/>
		    <input class="nui-hidden" name="critria._expr[4]._op" value="like"/>
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
		            
		            <a class="nui-button" id="checkview1" iconCls="icon-remove" onclick="deleteInfo()">删除</a>

		        </td>
            </tr>
        </table>           
    </div>
    <div class="nui-fit">
    <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="supEvaluate" 
    	class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.purchase.supplierEvaluate.querySupEvaluate.biz.ext" 
    	multiSelect="false" allowSortColumn=true >
        <div property="columns">
        <div name="temp123" type="checkcolumn"></div>
        <div type="indexcolumn" align="center" headerAlign="center">序号</div>
        	
        	<!-- <div type="expandcolumn" width="20"></div> -->
        	<div field="custname" width="80" align="center" headerAlign="center" renderer="lookInfo" >供应商名称</div>
            <div field="contractName" width="200" align="center" headerAlign="center" >合同名称</div>
            <div field="contractNo" width="80" align="center" headerAlign="center" >合同编号</div>
            <div field="createTime"  align="center" headerAlign="center" allowSort="true">创建时间</div>
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
    		grid.sortBy("createTime","desc");
    		grid.load({type:type});
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
		
		function lookInfo(e) {
			var id = e.row.id;
			if(id==0 || id==null ){
				nui.alert("查询信息有误");
			}else{
				return "<a href='javascript:void(0)' onclick='doView("+ id +");' title='点击查看'>" + e.value + "</a>";
			}
		}
		
		function changeInfo(){
			
			var row = grid.getSelecteds();
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    		var row=row[0];
			if (row) {
				nui.open({
				url: "/default/purchase/project/proAppChange.jsp?id="+row.id,
				width: 1114,
				height: 526,
				onload: function () {
					var iframe = this.getIFrameEl();
				},
				ondestroy: function (action){
			
				}
			})
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		}
		
		
		}
		
	    function doView(id){
	    
			var executeUrl = "<%= request.getContextPath() %>/purchase/programme/supplierReviewDetail.jsp?id=" + id;
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
			grid.sortBy("createTime","desc");
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.sortBy("createTime","desc");
			grid.load();
			search()
		}
		
		function onOk(){
			search();
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
			
//     		}
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
					    url: "com.zhonghe.ame.purchase.supplierEvaluate.delSupEvaluate.biz.ext",
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
	    
	    function onActionRenderer(e) {
			var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
        	var processInstID=record.processinstid;
			
			var s = " <a  href='javascript:void(0)' onclick='feeView();' >流程</a>";
			
            return s;
        }
        
	    
	    function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		   /*  if (e.field == "empname") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		    }
		    if (e.field == "total") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "confamt") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "hxamt") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "payamt") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    } */
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
	
	

     function add(){
		nui.open({
			url: "/default/purchase/programme/addSupplierReview.jsp",
			width: '90%',
			height: '75%',
			title: "供应商评审",
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
				width: '50%',
				height: '50%',
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