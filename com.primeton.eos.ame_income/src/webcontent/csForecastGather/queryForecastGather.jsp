<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2020-04-02 17:53:26
  - Description:
-->
<head>
<title>收入的回款完成匹配</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	 .myIndex{
        background:#FFF68F;
    }
</style>
</head>
<body>
	<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
		<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                       	收入的回款完成匹配查询
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<tr>
					<td align="right" style="width: 120px;"><span>受益部门:</span></td>
					<td align="left">
					     <input id="orgid2"  name="criteria._expr[3]._value" style="width:150px;" class="nui-combobox" 
						textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
		            	<input class="nui-hidden" name="criteria._expr[3]._property" value="orgseq"/>
				        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="end"/>
				        <input class="nui-hidden" name="criteria._expr[4]._property" value="orgid"/>
				        <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
				        <input class="nui-hidden" name="criteria._expr[4]._value" id="orgids1"/>
					</td>
					<td align="right" width="90px"><span>统计日期:</span></td>
					<td  align="left" nowrap="nowrap">
						<input class="nui-datepicker" name="criteria._or[0]._expr[0]._min" id="finYMstart" style="width:100px" onvaluechanged="watchfinYM"/>-<input class="nui-datepicker" name="criteria._or[0]._expr[0]._max" id="finYMend" style="width:100px" onvaluechanged="watchfinYM"/>
						<input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="maconfirmday"/>
					    <input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._or[0]._expr[0]._pattern" value="yyyy-MM-dd"/>
					    
					    <input class="nui-hidden" name="criteria._or[0]._expr[1]._min" id="finYMstart1" style="width:100px"/>
						<input class="nui-hidden" name="criteria._or[0]._expr[1]._max" id="finYMend1" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="revemaconfirmday"/>
					    <input class="nui-hidden" name="criteria._or[0]._expr[1]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._or[0]._expr[1]._pattern" value="yyyy-MM-dd"/>
					</td>
					<td align="right" width="150px"><span>实际收款日期:</span></td>
	            	<td align="left" nowrap="nowrap">
					  	<input class="nui-datepicker" id="min2" name="criteria._expr[0]._min" style="width:100px"/>-<input class="nui-datepicker" id="max2" name="criteria._expr[0]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="maconfirmday"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[0]._pattern" value="yyyy-MM-dd"/>
					</td>
					<td align="right" style="width: 70px;" nowrap="nowrap"><span>合同编号:</span></td>
	            	<td align="left" nowrap="nowrap">
					    <input name="criteria._expr[1]._value" class="nui-textbox" onenter="onKeyEnter" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[1]._property" value="contnum"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width: 120px;"><span>支付单位:</span></td>
					<td align="left">
						<input name="criteria._expr[2]._value" class="nui-textbox" onenter="onKeyEnter" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[2]._property" value="custname"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					</td>
					<td align="right" width="120px"><span>匹配日期:</span></td>
	            	<td align="left" nowrap="nowrap">
					  	<input class="nui-datepicker" id="min2" name="criteria._expr[7]._min" style="width:100px"/>-<input class="nui-datepicker" id="max2" name="criteria._expr[7]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[7]._property" value="createdate"/>
					    <input class="nui-hidden" name="criteria._expr[7]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[7]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td align="right" width="120px"><span>对应收入日期:</span></td>
	            	<td align="left" nowrap="nowrap">
					  	<input class="nui-datepicker" id="min2" name="criteria._expr[6]._min" style="width:100px"/>-<input class="nui-datepicker" id="max2" name="criteria._expr[6]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[6]._property" value="revemaconfirmday"/>
					    <input class="nui-hidden" name="criteria._expr[6]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[6]._pattern" value="yyyy-MM-dd"/>
					</td>
				    <td align="right" width="100px" nowrap="nowrap"><span>收款金额:</span></td>
	            	<td align="left"  nowrap="nowrap">
				    	<input class="nui-textbox"  name="criteria._expr[5]._min" style="width:75px"/>-<input class="nui-textbox" name="criteria._expr[5]._max" style="width:75px"/>
					    <input class="nui-hidden" name="criteria._expr[5]._property" value="gathermon"/>
					    <input class="nui-hidden" name="criteria._expr[5]._op" value="between"/>
                	</td>
				</tr>
				<tr>
					<td align="center" colspan="8"  id="toolbars1">
                        <a class="nui-button" id="HKWCPP_search" iconCls="icon-search" onclick="search()">查找</a>
                        <a class="nui-button" id="HKWCPP_reset" iconCls="icon-reload" onclick="reset">重置</a>		
                        <a class="nui-button" onclick="exportForecastGather" iconCls="icon-download"  id="HKWCPP_exportButton">导出</a>
                        <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
							<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
							<input type="hidden" name="downloadFile" filter="false"/>
							<input type="hidden" name="fileName" filter="false"/>
						</form>	
                   </td>
				</tr>
			</table>
		</div>
	</div>
	<div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
	    <table style="width:auto;" >
	        <tr>
	            <td style="width:100%;">
	                <a class="nui-button" iconCls="icon-remove" onclick="removeRow('datagrid1')" plain="true" id="HKWCPP_remove">删除</a>
	                <a class="nui-button" iconCls="icon-save" onclick="saveRow()" plain="true" id="HKWCPP_save">保存</a>
	                <span class="separator"></span>
                    <a class="nui-button" id="HKWCPP_update" iconCls="icon-filter" plain="true" onclick="mateForecastGather">收入收款匹配</a>
                </td>
            </tr>
        </table>           
    </div>
	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:340px;" allowResize="true"  allowCellEdit="true" allowCellSelect="true" pageSize="20"  showSummaryRow="true"
        url="com.primeton.eos.ame_income.csForecastGather.queryForecastGather.biz.ext" dataField="forecastGathers" multiSelect="true" frozenStartColumn="0" frozenEndColumn="5"
    	ondrawsummarycell="doCountSum" sizeList="[10,20,50,100,200,500]" onheadercellclick="search">
        <div property="columns">
			<div type="checkcolumn" width="25"></div>
			<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div>  
			<div field="custname" width="200" align="left" headerAlign="center" allowSort="true">签署单位</div> 
			<div field="gatherno" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailGather">收款次数</div>
			<div field="maconfirmday" width="90" align="center" headerAlign="center" allowSort="true">实际收款日期</div>  
			<div field="gathermon" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum" cellCls="myIndex">收款金额
				<input property="editor" class="nui-spinner"  allowLimitValue="false" style="width:100%;" format="n2" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right;"/>
			</div>
			<div field="reveno" width="70" align="center" headerAlign="center" allowSort="true"  renderer="detailReve">收入次数</div>  
			<div field="actsum" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">收入确认金额</div> 
			<div field="revemaconfirmday" width="90" align="center" headerAlign="center" allowSort="true">对应收入日期</div>  
			<div field="revemaconfirmyear" width="90" align="center" headerAlign="center" allowSort="true">对应收入年份</div>  	 
            <div field="orgname" width="100" headerAlign="center" allowSort="true" align="center">受益部门</div>   
            <div field="yjbm" width="80" headerAlign="center" allowSort="true" align="center">一级部门</div>    
            <div field="ejbm" width="80" headerAlign="center" allowSort="true" align="center">二级部门</div>   
            <div field="sjbm" width="80" headerAlign="center" allowSort="true" align="center">三级部门</div>
			<div field="createdate" width="150" align="center" headerAlign="center" allowSort="true"  renderer = "ondealdate">匹配时间</div> 
        </div>
    </div>
    
    <div id="win1" class="nui-window" title="收入回款匹配" style="width:880px;height:390px;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<tr>
					<td align="right" width="150px" nowrap="nowrap"><span>收入回款匹配期间:</span></td>
	            	<td align="left" nowrap="nowrap">
					  	<input class="nui-datepicker" id="min1" style="width:100px"/>-<input class="nui-datepicker" id="max1" style="width:100px"/>
					</td>
					<td style="width:100%;">
	                    <a class="nui-button" onclick="updateForecastGather" iconCls="icon-reload">数据加载</a>
	                </td>
				</tr>
			</table>
	    	<div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
			    <table style="width:auto;" >
			        <tr>
			            <td style="width:100%;">
			                <a class="nui-button" iconCls="icon-remove" onclick="removeRow('browsergrid')" plain="true">删除</a>
		                </td>
		            </tr>
		        </table>           
		    </div>
			<div id="browsergrid" class="nui-datagrid" style="width:100%;height:240px;" allowResize="true" allowCellEdit="true" allowCellSelect="true" showPager="false" showSummaryRow="true"
		        url="com.primeton.eos.ame_income.csForecastGather.browserForecastGather.biz.ext" dataField="forecastGathers" frozenStartColumn="0" frozenEndColumn="4" multiSelect="true"
		    	ondrawsummarycell="doCountSum1">
		        <div property="columns">
					<div type="checkcolumn" width="25"></div>
					<div type="indexcolumn" width="30" headerAlign="center" align="center">序号</div>
					<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div>  
					<div field="custname" width="200" align="left" headerAlign="center" allowSort="true">签署单位</div> 
					<div field="gatherno" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailGather">收款次数</div>
					<div field="maconfirmday" width="80" align="center" headerAlign="center" allowSort="true" renderer = "ondealdate1">实际收款日期</div>  
					<div field="gathermon" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum"  cellCls="myIndex">收款金额
						<input property="editor" class="nui-spinner"  allowLimitValue="false" style="width:100%;" format="n2" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right;"/>
					</div>
					<div field="reveno" width="70" align="center" headerAlign="center" allowSort="true"  renderer="detailReve">收入次数</div>
					<div field="actsum" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">收入确认金额</div> 
					<div field="revemaconfirmday" width="95" align="center" headerAlign="center" allowSort="true" renderer = "ondealdate1">对应的收入日期</div>  
					<div field="revemaconfirmyear" width="95" align="center" headerAlign="center" allowSort="true">对应的收入年份</div>  	
		            <div field="orgname" width="100" headerAlign="center" allowSort="true" align="center">受益部门</div>   
		            <div field="yjbm" width="80" headerAlign="center" allowSort="true" align="center">一级部门</div>    
		            <div field="ejbm" width="80" headerAlign="center" allowSort="true" align="center">二级部门</div>   
		            <div field="sjbm" width="80" headerAlign="center" allowSort="true" align="center">三级部门</div>
		        </div>
		    </div>
			<div style="text-align:center;padding:10px;" class="nui-toolbar">
				<a class="nui-button" iconCls="icon-ok" onclick="confirm()" style="width:60px;margin-right:20px;">确定</a> 
				<a class="nui-button" onclick="onCancel1()" style="width:60px;margin-right:20px;">取消</a>  
			</div>
		</div>
</body>
<script type="text/javascript">
	nui.parse();
    var grid = nui.get("datagrid1");
    var browsergrid = nui.get("browsergrid");
    var form = new nui.Form("form1");
    init();
	function init(){
    	<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		String orgname = user.getUserOrgName();
    		String orgid = user.getUserOrgId();
    	%>
    	var userid = "<%=nowuserid %>";
    	//初始化有权的机构
		//code:对应功能编码，map：对于机构的查询条件
		var json = {"code":"HKWCPP","map":{"property":"status","op":"=","value":"running"}};
		
		//初始化事业部
		nui.ajax({
            url: "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
            type: "post",
            cache: false,
            data:json,
            contentType: 'text/json',
            success: function (text) {
            	if(text.orgs){
            		if(text.orgs.length==0){
						// 没有有权的机构时只能查销售为自己的数据
						nui.get("orgids1").setValue("<%=orgid %>");
					}
					nui.get("orgid2").setData(text.orgs);
					var isall;
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
        				nui.get("orgids1").setValue("");
					}else{
						nui.get("orgids1").setValue(text.orgids);
					}
					search();
            	}else{
            		// 没有有权的机构时只能查销售为自己的数据
					nui.get("orgids1").setValue("<%=orgid %>");
					search();
            	}
    		}
    	});
    	
    	//按钮权限的控制
		getOpeatorButtonAuth("HKWCPP_update,HKWCPP_exportButton,HKWCPP_remove,HKWCPP_save,HKWCPP_search");//操作按钮权限初始化
		
		//获取上月开始日期和结束日期
		var now = new Date(); //当前日期
		var nowYear = now.getFullYear(); //当前年
		nowYear += (nowYear < 2000) ? 1900 : 0; //
		var lastMonthDate = new Date(); //上月日期
		lastMonthDate.setDate(1);
		lastMonthDate.setMonth(lastMonthDate.getMonth() - 1);
		var lastMonth = lastMonthDate.getMonth();
		
		var lastMonthStartDate = new Date(nowYear, lastMonth, 1);
		var lastMonthEndDate = new Date(nowYear, lastMonth, getMonthDays(lastMonth,nowYear));
		
  		nui.get("min1").setValue(nui.formatDate(lastMonthStartDate,"yyyy-MM-dd"));
  		nui.get("max1").setValue(nui.formatDate(lastMonthEndDate,"yyyy-MM-dd"));
	}
    
    function search(){
		nui.get("HKWCPP_search").disable();
		nui.get("HKWCPP_reset").disable();
		nui.get("HKWCPP_exportButton").disable();
		nui.get("HKWCPP_update").disable();
		var data = form.getData(); //获取表单JS对象数据
		
		if(data.criteria._expr[7]._max != null && data.criteria._expr[7]._max !=''){
			data.criteria._expr[7]._max=data.criteria._expr[7]._max.substring(0,10) + " 23:59:59";
		}
		grid.load(data,function(){
			nui.get("HKWCPP_search").enable();
			nui.get("HKWCPP_reset").enable();
			nui.get("HKWCPP_exportButton").enable();
			nui.get("HKWCPP_update").enable();
		}); //datagrid加载数据
    }
    
    //重置
	function reset(){
		form.reset();
		init();
	}

	//or查询条件
	function watchfinYM(){
		nui.get("finYMstart1").setValue(nui.get("finYMstart").getValue());
		nui.get("finYMend1").setValue(nui.get("finYMend").getValue());
	}
	
	function mateForecastGather(){
		var win = nui.get("win1");
        win.showAtPos("center", "middle");
	}
	
	//加载按钮
	function updateForecastGather(){
		var min1 = nui.get("min1").getValue();
		if(min1 == null || min1 == ''){
			nui.alert("加载收入回款完成匹配数据时，收款确认时间开始日期必填！");
			return;
		}
		var max1 = nui.get("max1").getValue();
		if(max1 == null || max1 == ''){
			nui.alert("加载收入回款完成匹配数据时，收款确认时间结束日期必填！");
			return;
		}
		browsergrid.load({"startdate":min1,"enddate":max1})
	}
	//关闭框
	function onCancel1() {//关闭清空编辑框内已填写的数据
    	var rows = browsergrid.getChanges();
		if(rows.length>0){
			nui.confirm("收入的回款完成匹配加载数据有更改，关闭后更改会丢失，确认关闭？", "确定？",
				function (action) {
	    			if(action=='ok'){
				        var win = nui.get("win1");
				        win.hide();
	    			}
			});
		}else{
			var win = nui.get("win1");
        	win.hide();
		}
    }
    
    //确认加载数据
    function confirm(){
    	var forecastGathers = browsergrid.getData();
    	var forecastGatherchanges = browsergrid.getChanges();
    	var json = {"forecastGathers":forecastGathers,"forecastGatherchanges":forecastGatherchanges};
    	if(forecastGathers.length<=0 && forecastGatherchanges.length<=0){
    		nui.alert("无数据需要更新。");
    		return;
    	}
    	nui.confirm("确认加载"+forecastGathers.length+"条数据？", "确定？",
			function (action) {
    			if(action=='ok'){
    				nui.ajax({
				        type:'get',
				        data:json,
				        cache: false,
				        showModal: false,
				        async :false,
				        contentType: 'text/json',
				        url:'com.primeton.eos.ame_income.csForecastGather.updateForecastGather.biz.ext',
				        success:function(o){
				            if(o.result>=0){
				            	nui.alert("数据更新成功，更新了"+o.result+"条数据。");
				            	var win = nui.get("win1");
						        win.hide();
						        search();
				            }else{
				            	nui.alert("数据更新失败，请联系信息技术部！");
				            }
				        },
				        error:function(jqXHR, textStatus, errorThrown){
				            nui.alert("error:" + jqXHR.responseText);
				        }
				    });
    			}
		});
    }
    
    function saveRow(){
    	var forecastGatherchanges = grid.getChanges();
    	var json = {"forecastGathers":null,"forecastGatherchanges":forecastGatherchanges};
    	if(forecastGatherchanges.length<=0){
    		nui.alert("无数据需要修改。");
    		return;
    	}
    	nui.confirm("确认修改"+forecastGatherchanges.length+"条数据？", "确定？",
			function (action) {
    			if(action=='ok'){
    				nui.ajax({
				        type:'get',
				        data:json,
				        cache: false,
				        showModal: false,
				        async :false,
				        contentType: 'text/json',
				        url:'com.primeton.eos.ame_income.csForecastGather.updateForecastGather.biz.ext',
				        success:function(o){
				            if(o.result>=0){
				            	nui.alert("数据修改成功。");
						        search();
				            }else{
				            	nui.alert("数据更新失败，请联系信息技术部！");
				            }
				        },
				        error:function(jqXHR, textStatus, errorThrown){
				            nui.alert("error:" + jqXHR.responseText);
				        }
				    });
    			}
		});
    }
    
    //设置合计行样式---数字靠右等
	function doCountSum(e){
		if (e.field == "gathermon" || e.field == "actsum") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
        }
        
        var result = e.result;
        var grid = e.sender;
     	//服务端汇总计算
        if (e.field == "repContent") {                
            var s = "<div align='center'><b>"
            s +=    "检查到共" + result.total +"条数据<br/>"
                    + "</b></div>";
            e.cellHtml = s;
    	}
	}
	
	//设置合计行样式---数字靠右等
	function doCountSum1(e){
		if (e.field == "gathermon" || e.field == "actsum") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
        }
        
        var result = e.result;
        var grid = e.sender;
     	//服务端汇总计算
        if (e.field == "custname" && result.total != null && result.total != '') {                
            var s = "<div align='center'><b>"
            s +=    "共加载" + result.total +"条数据<br/>"
                    + "</b></div>";
            e.cellHtml = s;
    	}
	}
	
	 //日期格式化---时分秒的格式化
    function ondealdate1(e){
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
          return   curDateTime;     
		}
	}
	
	//合同详细信息
    function detailCont(e){
    	return "<a href='javascript:void(0)' onclick='detailCont1("+e.record.contractid+");' title='点击查看合同信息'>" + e.value + "</a>";
    }
    function detailCont1(contractid){
		var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + contractid;
		window.open(executeUrl, "合同查看", "fullscreen=1");
    }
    
    //合同收入记录详情
    function detailReve(e){
    	return "<a href='javascript:void(0)' onclick='detailReve1("+e.record.reveid+");' title='点击查看收入记录'>" + e.value + "</a>";
    }
    function detailReve1(reveid){
		var executeUrl = "/default/ame_income/csReveForecast/detailCsReveForecast.jsp?id=" + reveid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl, "合同收入记录详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
    
    //合同收入记录详情
    function detailGather(e){
    	return "<a href='javascript:void(0)' onclick='detailGather1("+e.record.gatherid+");' title='点击查看收款明细记录'>" + e.value + "</a>";
    }
    function detailGather1(gatherid){
		var executeUrl = "/default/ame_income/csGatherFc/detailCsGatherFc.jsp?id=" + gatherid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl, "合同收款记录详细信息","fullscreen=1" );
    }
    
    //删除
	function removeRow(grid) {
	    var rows = nui.get(grid).getSelecteds();
	    if (rows.length > 0) {
	        nui.get(grid).removeRows(rows, true);
	    }
	}
	
	function exportForecastGather(){
		nui.get("HKWCPP_exportButton").disable();
		var json = form.getData(); //获取表单JS对象数据
		
		if(json.criteria._expr[7]._max != null && json.criteria._expr[7]._max !=''){
			json.criteria._expr[7]._max=json.criteria._expr[7]._max.substring(0,10) + " 23:59:59";
		}
		nui.confirm("是否确认导出收入的回款完成匹配记录？", "确定？",
            function (action) {
            	if(action=='ok'){
            		nui.ajax({
		    			url: "com.primeton.eos.ame_income.csForecastGather.exportForecasGather.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		nui.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "收入的回款完成匹配记录";
				        	var myDate = new Date();
				        	var year = myDate.getFullYear();
				        	var month = myDate.getMonth()+1;
				        	var day = myDate.getDate();
				        	var hours = myDate.getHours();
				        	var minutes = myDate.getMinutes();
				        	var seconds = myDate.getSeconds();
				        	var curDateTime = year;
				        	if(month>9){
								curDateTime = curDateTime + "" + month;
							}else{
								curDateTime = curDateTime + "0" + month;
								}
				        	if(day>9){
								curDateTime = curDateTime + day;
							}else{
								curDateTime = curDateTime + "0" + day;
								}
							if(hours>9){
								curDateTime = curDateTime + hours;
							}else{
								curDateTime = curDateTime + "0" + hours;
								}
							if(minutes>9){
								curDateTime = curDateTime + minutes;
							}else{
								curDateTime = curDateTime + "0" + minutes;
								}
							if(seconds>9){
								curDateTime = curDateTime + seconds;
							}else{
								curDateTime = curDateTime + "0" + seconds;
							}
							fileName = fileName + "_" + curDateTime + ".xls";
							var frm = document.getElementById("viewlist1");
				        	frm.elements["downloadFile"].value = filePath;
				        	frm.elements["fileName"].value = fileName;
						    frm.submit();
				        },
				        error: function () {
				        	alert("error");
				        }
					});
            	}
        	});
		nui.get("HKWCPP_exportButton").enable();
	}
	
	//日期格式化---时分秒的格式化
    function ondealdate(e){
		if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,18);
		}else{
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm:ss");
		}
	}
	
	//获得某月的天数
	function getMonthDays(myMonth,nowYear) {
	  var monthStartDate = new Date(nowYear, myMonth, 1);
	  var monthEndDate = new Date(nowYear, myMonth + 1, 1);
	  var days = (monthEndDate - monthStartDate) / (1000 * 60 * 60 * 24);
	  return days;
	}
</script>
</html>