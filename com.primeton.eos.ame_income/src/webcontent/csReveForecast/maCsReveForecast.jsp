<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-11-02 10:18:06
  - Description:
-->
<head>
<title>MA当月收入确认</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div  class="mini-panel" title="MA当月收入确认" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			
		
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td>最新预计收入确认年月：
						<input name="criteria._expr[0]._value" class="nui-monthpicker" style="width:90px;" id="newyearmonth" allowInput="false" readonly="true"/>
						
						&nbsp;&nbsp;<a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="confirmIncome()">一键确认收入</a>
						</td>
						<td align="left">
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="newyearmonth"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="="/> 
							<!-- 状态为未确认 -->
					   	 	<input class="nui-hidden" name="criteria._expr[1]._value"   value="0"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="status"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
						   
						   <!--  收入类型为MA -->
						    <input class="nui-hidden" name="criteria._expr[2]._value"   id="revetype" value="2"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="revetype"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
						    
						   <!--  是否需要销售评估为不需要销售评估 -->
						    <input class="nui-hidden" name="criteria._expr[3]._value"   id="saleseva" value="0"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="saleseva"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
						</td>
					</tr>
	            </table>           
	        </div>
	    </div>
	    <div class="nui-fit">
		<!-- MA当月收入数据列表-->
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:450px;" allowResize="false" dataField="csReveForecasts" showSummaryRow="true" ondrawsummarycell="doCsReveSum"
	    	url="com.primeton.eos.ame_income.csReveForecast.queryReveByMA.biz.ext" sizeList="[1000]"  multiSelect="true" frozenStartColumn="0"  showPager="false" pageSize="10000">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="reveid" width="0" >预估主键</div>	
				<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div> 
				<div field="custname" width="150" align="left" headerAlign="center">签署单位</div>			
				<div field="projectname" width="180" headerAlign="center" renderer="renderprojectname">合同项目名称</div>
				<div field="contsum" width="100" align="right"  headerAlign="center">合同金额</div>
				<div field="reveno" width="80" align="center"  headerAlign="center" renderer="detailReve">收入确认次数</div>
				<div field="revetype" width="80" align="center"  headerAlign="center" renderer="reveType">收入确认类型</div>
				<div field="fcsum" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计确认金额（含税）</div>	
				<div field="fcsum2" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计确认金额（不含税）</div>	
				<div field="newyearmonth" width="85" align="center"  headerAlign="center">预计确认年月</div>
				<div field="marate" width="85" align="center"  headerAlign="center" >MA税率</div>
				<div field="status" width="80" align="center" headerAlign="center" renderer="dictstatus">收入确认状态</div>		
				<div field="saleseva" width="80" align="center" headerAlign="center" renderer="salesevaChange">是否销售评估</div>
			</div>
		</div>
	   </div>	
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var confirmDate;
	init();
	function init(){

		//初始化当前月，可选其他月份
		nui.get("newyearmonth").setValue(year+"-"+month);
		var data = form.getData();
		if(!(nui.get("newyearmonth").getText()==""||nui.get("newyearmonth").getText()==null)){
			var newyearmonth = nui.get("newyearmonth").getText();
    		data.criteria._expr[0]._value = newyearmonth.substring(0,4)+""+newyearmonth.substring(5,7);
		}
		grid.sortBy("contnum","asc");
		grid.load(data);
	}
	//收入确认状态,数据字典转换
	function dictstatus(e) {
		return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
	}
	function renderprojectname(e) {
		if(e.value){
			return e.value;
		}
	}
	
	//是否销售评估
	function salesevaChange(e){
	    var saleseva = e.value;
		if(saleseva=="0"){
			return "否";
		}else{
			return "是";
		}
	}
	
	function doCsReveSum(e){        	
        if (e.field == "fcsum2" || e.field == "fcsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
    }
    
    //收入确认类型
    function reveType(e){
    	return nui.getDictText('AME_REVETYPE',e.value);
    }
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData(); 
		//数据库确认年月格式为int类型，monthpicker类型是date类型，所以要转换
	 	if(!(nui.get("newyearmonth").getText()==""||nui.get("newyearmonth").getText()==null)){
			var newyearmonth = nui.get("newyearmonth").getText();
    		data.criteria._expr[0]._value = newyearmonth.substring(0,4)+""+newyearmonth.substring(5,7);
		} 
	  	grid.load(data); //datagrid加载数据
	}
	
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
	}
    //合同详细信息
    function detailCont(e){
    	return "<a href='javascript:void(0)' onclick='detailCont1();' title='点击查看合同信息'>" + e.value + "</a>";
    }
    function detailCont1(){
 		var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
		window.open(executeUrl, "合同查看", "fullscreen=1");
    }
    //合同收入记录详情
    function detailReve(e){
    	return "<a href='javascript:void(0)' onclick='detailReve1();' title='点击查看收入记录'>" + e.value + "</a>";
    }
    function detailReve1(){
 		var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/ame_income/csReveForecast/detailCsReveForecast.jsp?id=" + selectRow.reveid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl, "合同收入记录详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
    
    function initConfirmDate(date){
    	confirmDate = date;
    }
    
    function formatMoney(num) {
    	return (num.toFixed(2) + '').replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
	}
    
    
    //MA收入确认
    function confirmIncome(){
		var rows = grid.getSelecteds();
	 	if (rows.length>0) {
	 			var number = rows.length;
	 			var total = 0;
	 			for(var t=0;t<number;t++){
	 				var obj = rows[t];
	 				total = total+obj.masum;
	 			} 
	 			
                nui.open({
		            url: "<%=request.getContextPath() %>/ame_income/csReveForecast/choseConfirmDate.jsp",
		            title: "请选择收入确认日期", 
		            width: 250,
		            height: 255,
		            allowResize:false,
		            onload: function () {
		            },
		            ondestroy: function (action) {
		                //当点击确认时间选择界面中的确认按钮时
		                if (action == "confirm") {
		                	nui.get("updateBtn").setEnabled(false);
		                   var temp_date = nui.formatDate(confirmDate, "yyyy-MM-dd");
		                   var info = "MA确认成功 !总条数为:"+number+"条,总金额为:￥"+formatMoney(total)+",确认时间为:"+temp_date;
		                   var json = nui.encode({ids:rows,confirmDate:confirmDate});
		                   $.ajax({
					            url: "com.primeton.eos.ame_income.csReveForecast.confirmInCome.biz.ext",
					            type:'POST',
					            data: json,
					            cache: false,
					            contentType:'text/json',
					            cache: false,
					            success: function (text) {
					            	nui.get("updateBtn").setEnabled(true);
					             	if(text.exception != null){
				                		nui.alert("确认失败!","提示");
				                	}else{
						                nui.alert(info,null,function(){
				                    		grid.reload();
				                    	});
			                    	}
					            }
						    }); 
			              }
		            }
	        	}); 
         }else{
         	nui.alert("请选择需要确认收入的记录，点击列头的选择框支持全选。","提示");
         }
    }
</script>
</html>