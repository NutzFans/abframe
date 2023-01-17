<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>投标信息管理</title>
	<style type="text/css">
		html, body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }    
    </style>
</head>
<body>
<div  id="form1">
    <div class="nui-toolbar" style="border-bottom:0px;padding:0px;width:100%;height:100%">
    </div>
  <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	  <table align="center" border="0" width="100%" class="form_table">
        <tr>
        <!-- <td class="form_label" align = "right"> 招标人</td>
          <td colspan="1">
	    	<input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" />
		    <input class="nui-hidden" name="criteria._expr[1]._property" value="custname"/>
		    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
          </td> -->
           <td class="form_label" align = "right">招标人采购方式</td>
           <td colspan="1">
			 <input name="criteria._expr[1].bidMode" class="nui-dictcombobox" dictTypeId="ZH_CGFS"  shownullItem="true" style="width:200px;"/>
		     <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
           </td>
          <td class="form_label" align = "right"> 项目名称</td>
          <td colspan="1">
	    	<input name="criteria._expr[2].projectname" class="nui-textbox" style="width:200px;" />
		    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
          </td>		          
          <td class="form_label" align = "right" id="aa"> 投标牵头部门</td>
          <td colspan="1" id="ab">
	    	<input name="criteria._expr[3].orgname" class="nui-textbox" style="width:200px;" id="orgname11"/>
		    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
          </td>
      </tr>
      <tr>
  			<!-- <td class="form_label" align = "right"> 招标代理单位</td>
          <td colspan="1">
	    	<input name="criteria._expr[4].proxycompany" class="nui-textbox" style="width:200px;" />
		    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
          </td> -->
          <td class="form_label" align = "right">申请日期</td>
          <td colspan="1">
     	    <input class="nui-hidden" name="criteria._expr[5]._op" value="between" />
            <input class="nui-hidden" name="criteria._expr[5]._pattern" value="yyyy-MM-dd" />
            <input class="nui-hidden" name="criteria._expr[5]._property" value="creatTime" />
            <input class="nui-datepicker" name="criteria._expr[5]._min" style="width:100px;"/>
            <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span>
            <input class="nui-datepicker" name="criteria._expr[5]._max" style="width:100px;"/>
          </td>	
          <td class="form_label" align = "right"> 投标信息创建人</td>
          <td colspan="1">
	    	<input name="criteria._expr[7].empname" class="nui-textbox" style="width:200px;" />
		    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
          </td>
	       <td class="form_labeladdimptask" align = "right">是否中标</td>
           <td colspan="1">
			 <input name="criteria._expr[6].bidstatus" class="nui-dictcombobox" dictTypeId="ZH_BIDSTATUS"  shownullItem="true" style="width:200px;"/>
		     <input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
           </td>
	  </tr>
	  <tr>	
	  		<td colspan="5"></td>
            <td style="width:20%;padding-right: 45px;" align="right">
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
		            <a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">增加</a>
		            <a class="nui-button" id="checkview" iconCls="icon-edit" onclick="editBid()">修改</a>
		              <a class="nui-button" id="checkview"  onclick="exportCwlist()">导出</a>
		            <a class="nui-button" id="checkview" iconCls="icon-remove" onclick="deleteBid()">删除</a>
		        </td>
            </tr>
        </table>           
    </div>
    <div class="nui-fit">
	    <div id="datagrid1"  sizeList="[10,20,50,100]" showPager="true" dataField="bidInfo"   sortMode="client"  pageSize="20"
	    	class="nui-datagrid" style="width:100%;height:80%;" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.querybidinfo.biz.ext" 
	    	multiSelect="false" allowSortColumn=true onshowrowdetail="onShowRowDetail">
	        <div property="columns">
	        	<div type="checkcolumn"></div>
	        	<div type="expandcolumn" width="20"></div>
	        	<div field="projectName" width="150" align="left" headerAlign="center" allowSort="true" renderer="lookInfo">项目名称</div>
	            <div field="proxycompany" width="80" align="left" headerAlign="center" allowSort="true" >招标代理单位</div>
	            <div field="empname" width="60" align="left" headerAlign="center" allowSort="true" >创建人</div>
	            <div field="orgname" width="80" align="left" headerAlign="center" allowSort="true"  >牵头部门</div>
	            <div field="projectsize" width="120" align="left" headerAlign="center" >工程规模</div>
	            <div field="projectlocal" width="150" align="left" headerAlign="center" >项目地点</div>
	            <div field="opentime" width="80" align="left" headerAlign="center" allowSort="true"  >开标日期</div>
	            <div field="bidstatus" width="60" align="left" headerAlign="center" allowSort="true" renderer="check" >是否中标</div>
	            <div field="bidprice" width="120" align="right" headerAlign="center" allowSort="true" >中标价格</div>
	            <div field="contcycle" width="60" align="left" headerAlign="center" allowSort="true" >合同周期</div>
	             <div field="bidMode" width="80" align="left" headerAlign="center" allowSort="true" >招标人采购方式</div>
	             <div field="creatTime" width="80" align="left" headerAlign="center" allowSort="true" >填报日期</div>
	            <!-- <div field="remake" width="80" align="left" headerAlign="center" allowSort="true" >备注</div> -->
	        </div>
        </div>
        <div style="text-align: center;padding: 10px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">确定</a>
			<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
		</div>
	</div>
	<div id="detailGrid_Form" style="display:none;width:75%">
	    <div id="reve_grid" class="nui-datagrid" dataField="bidCom" showSummaryRow="true"
	    	url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.getBidComInfo.biz.ext" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
	        <div property="columns">
	            <div field="custName"  width="80" headerAlign="center" align="center">其他投标部门</div>    
	            <div field="comBidPrice" width="60" headerAlign="center" align="center" >投标金额</div> 
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
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
    	init();
    	function init(){
    		grid.load();
    		grid.sortBy("tbdate","desc");
		}
		function check(e){
			if(e.value==1){
			return "是";
			}else{
			return "否";
			}
		}
		
		function lookInfo(e) {
			
			var bidid = e.row.id;
			
			if(bidid==0 || bidid==null ){
				nui.alert("查询信息有误");
			}else{
				return "<a href='javascript:void(0)' onclick='doView("+ bidid +");' title='点击查看'>" + e.value + "</a>";
			}
		}
		http://127.0.0.1:8080/default/marketInfo/bid/bidDetail.jsp
		
	    function doView(reiid){
			var executeUrl = "<%= request.getContextPath() %>/marketInfo/bid/bidDetail.jsp?bidid=" + reiid;
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
			 var row = grid.getSelected();
			 CloseWindow("ok");   
		}
	function GetData() {
        var row = grid.getSelected();
        return row;
    }
	function onCancel(e) {
    	CloseWindow("cancel");
	}
	function CloseWindow(action) {           
	    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	    else window.close();            
	}	
	function exportCwlist(){
		var data = form.getData(); //获取表单JS对象数据
		exportExcel({"url":"com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.exMyCreatBid.biz.ext","fileName":"招标信息","data":data});
	}
		
		//修改投标明细
		function editBid(){
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    		var row=row[0];
			if (row) {
				nui.open({
				url: "/default/marketInfo/bid/editBid.jsp?id="+row.id,
				width: 1114,
				height: 526,
				onload: function () {
					var iframe = this.getIFrameEl();
				},
				ondestroy: function (action){
					
	            		grid.reload();
	            	
				}
			})
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		}
		}
		
		//展示明细
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
        
		
	function deleteBid(e){
	
			var row = grid.getSelected();
			if (row) {
				
				//获取当前客户的其他信息
				var json = nui.encode({bidid:row.id});
				
				
				var c=confirm("该信息可以删除，您确认吗？");
				if(c==true){ 
				nui.ajax({
					    url: "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.delBidInfo.biz.ext",
						type: 'POST',
						data: json,	
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
			}else{
				nui.alert("请选中一条记录","提示");
			}
	
	
	
	}
	
	
	function add(){
		nui.open({
			url: "/default/marketInfo/bid/creatBid.jsp",
			width: 1114,
			height: 526,
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
			reset();
			}
		})
	}
</script>
</body>
</html>