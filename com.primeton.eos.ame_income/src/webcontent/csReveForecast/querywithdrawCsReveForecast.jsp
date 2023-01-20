<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<%@ page import="com.eos.data.datacontext.UserObject" %>
<%@ page import="commonj.sdo.DataObject" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): EPCNB324
  - Date: 2018-01-02 10:04:25
  - Description:
-->
<head>
<title>已确认收入撤回查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div  class="mini-panel" title="已确认收入撤回查询" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>受益销售：</span></td>
						<td align="left">
							 <input id="orgid2"  name="criteria._expr[1]._value" style="width:187px;" class="nui-combobox" 
							textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
			            	<input class="nui-hidden" name="criteria._expr[1]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="end"/>
					        <input class="nui-hidden" name="criteria._expr[0]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[0]._value" id="orgids1"/>
						</td>
						<td align="right"><span>合同编号：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[2]._value" class="nui-textbox" style="width:205px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="contnum"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right"><span>合同名称：</span></td>
						<td align="left">
						    <input name="criteria._expr[3]._value" class="nui-textbox" style="width:160px;"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="projectname"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>收入确认类型：</span></td>
						<td align="left">
						    <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="AME_REVETYPE" style="width:187px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="revetype"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
						</td>
						<td align="right"><span>新合同收入类型：</span></td>
						<td align="left">
						    <input name="criteria._expr[10]._value" class="nui-dictcombobox" dictTypeId="AME_NEWTYPE" style="width:205px;" showNullItem="false" nullItemText=""  multiSelect="true"/>
						    <input class="nui-hidden" name="criteria._expr[10]._property" value="newtype"/>
						    <input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
						</td>
						<td align="right"><span>客户：</span></td>
						<td align="left">
						    <input name="criteria._expr[6]._value" class="nui-textbox" style="width:160px;" />
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
						</td>
					</tr>
					
					<tr>
						<td align="right" ><span>撤回操作人：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[11]._value" class="mini-textboxlist" <%--onbuttonclick="showEmployee" --%>id="userid" allowInput="true" textField="empname" valueField="userid" searchField="name" style="width:187px;" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext"/>
						    <input class="nui-hidden" name="criteria._expr[11]._property" value="drawbackuserid"/>
						    <input class="nui-hidden" name="criteria._expr[11]._op" value="in"/>
						</td>
						<td align="right" ><span>撤回日期：</span></td>
						<td align="left">
							<input class="nui-datepicker" name="criteria._expr[12]._min" id="startTime1" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[12]._max" id="endTime1" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[12]._property" value="drawbacktime"/>
						    <input class="nui-hidden" name="criteria._expr[12]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[12]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td align="right"><span>撤回类型：</span></td>
						<td align="left">
							<input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="AME_REVEBACKTYPE" style="width:160px;" showNullItem="false" multiSelect="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="drawbacktype"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
					    </td>
					</tr>
					<tr>
						<td align="right"><span>最新预计收入确认年月：</span></td>
						<td align="left">
						    <input name="criteria._expr[7]._min" class="nui-monthpicker" style="width:90px;" id="newyearmonth1" allowInput="true"/>-<input name="criteria._expr[7]._max" class="nui-monthpicker" style="width:90px;" id="newyearmonth2" allowInput="true"/>
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="newyearmonth"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="between"/>
						</td>
						<td align="right"><span>实际确认日期 ：</span></td>
		            	<td align="left">
					        <input class="nui-datepicker" name="criteria._expr[8]._min" id="startTime" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" id="endTime" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[8]._property" value="confirmday"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd"/>
					        <input class="nui-hidden" name="criteria._expr[9]._value" value=""/>
					        <input class="nui-hidden" name="criteria._expr[9]._property" value="orgseq"/>
						    <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[9]._likeRule" value="end"/>
						</td>
					</tr>
					<tr>	
					    <td align="center" colspan="11">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
                       </td>
					</tr>
				</table>
			</div>
		</div>
		
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="csReveDrawback" showSummaryRow="true" ondrawsummarycell="doCsReveSum"
	    url="com.primeton.eos.ame_income.csReveForecast.queryCsReveDrawback.biz.ext" sizeList="[10,20,50,100]"  multiSelect="false" frozenStartColumn="0" frozenEndColumn="6"
	    >
			<div property="columns">
				<div field="reveid" width="0" >预估主键</div>	
				<div field="org" width="95" align="center" headerAlign="center" renderer="dictOrg" allowSort="true">事业部</div>	
				<div field="salename" width="70" align="center" headerAlign="center" allowSort="true">受益销售</div> 
				<div field="custname" width="150" align="left" headerAlign="center">签署客户</div>			
				<div field="projectname" width="180" headerAlign="center" renderer="renderprojectname">合同项目名称</div>
				<div field="contsum" width="100" align="right"  headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">合同金额</div>	
				<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div>
				<div field="reveno" width="105" align="center"  headerAlign="center" renderer="detailDrawback">撤销收入确认次数</div>
				<div field="oldstatus" width="130" align="center" headerAlign="center" renderer="dictstatus" >撤销收入当前确认状态</div>		
				<div field="newyearmonth" width="85" align="center"  headerAlign="center" visible="false">预计确认年月</div>
				<div field="fcsum2" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计确认金额（不含税）</div>	
				<div field="actsum2" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥" visible="false">实际确认金额（不含税）</div>	
				<div field="confirmday" width="80" align="center" headerAlign="center" visible="false">实际确认日期</div>
				<div field="lastupdate" width="85" align="center" headerAlign="center" allowSort="true" visible="false">最近更新日期</div>
				<div field="lastupdator" width="85" align="center" headerAlign="center" allowSort="true" visible="false">最近更新人</div>	
				<div field="newtype" width="120" align="center" headerAlign="center" renderer="newtype" visible="false">新合同确认类型</div>
				<div field="drawbackempname" width="70" align="center" headerAlign="center" allowSort="true">撤回人</div>	
				<div field="drawbacktime" width="150" align="center" headerAlign="center" renderer = "ondealdate">撤回日期</div>
				<div field="drawbacktype" width="70" align="center" headerAlign="center" renderer="drawbacktyperender">撤回类型</div>	
				<div field="drawbackreason" width="150" align="center" headerAlign="center" >撤回原因</div>	
				<div field="contractid" width="0">合同主键</div>	
				<div field="projectNo" width="100" renderer="detailProj" headerAlign="center">项目编号</div>
				<div field="projectname1" width="0" headerAlign="center">项目名称</div>
				<div field="projectid1" width="0" >项目id</div>	
				<!--<div field="fcreverate" width="50" align="center" headerAlign="center">本次确认比例</div>	
				<div field="revetimedesc" width="70" align="center" headerAlign="center" >收入确认时点</div>		
				<div field="actreveproof" width="70" align="center" headerAlign="center" renderer="dictproof">收入确认证据</div>		
				<div field="newyearmonth" width="75" align="center"  headerAlign="center">实际确认年月</div> -->
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var form = new nui.Form("#form1");
    	nui.parse();
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
	    	<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		String nowuserid = user.getUserId();
	    		String nowusername = user.getUserName();
	    	%>
	    	var userid = "<%=nowuserid %>";
	    	//初始化有权的机构
			//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"YQRSRCH","map":{"property":"status","op":"=","value":"running"}};
				nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							// 没有有权的机构时只能查销售为自己的数据
							nui.getbyName("criteria._expr[1]._value").setValue("<%=nowusername %>");
				    		nui.getbyName("criteria._expr[1]._value").setEnabled(false);
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
					}else{
						// 没有有权的机构时只能查销售为自己的数据
						nui.getbyName("criteria._expr[1]._value").setValue("<%=nowusername %>");
				    	nui.getbyName("criteria._expr[1]._value").setEnabled(false);
					}
					search();
				}
			});
    		
		}
		function dictOrg(e) {
			return nui.getDictText('CONT_ORG',e.value);//设置业务字典值
		}
		function dictproof(e) {
			return nui.getDictText('MIS_INCOMECONV',e.value);//设置业务字典值
		}
		function dictmonth(e) {
			return nui.getDictText('AME_MONTHPERIOD',e.value);//设置业务字典值
		}
		function dictstatus(e) {
			return "<a href='javascript:void(0)' onclick='detailReve1();' title='点击查看流程图'>" + nui.getDictText('AME_REVESTATUS',e.value) + "</a>";
			
		}
		function drawbacktyperender(e){
			return nui.getDictText('AME_REVEBACKTYPE',e.value);
		}
		function newtype(e) {
			return nui.getDictText('AME_NEWTYPE',e.value);//设置业务字典值
		}
		function doCsReveSum(e){        	
            if (e.field == "contsum" || e.field == "fcsum2" ||e.field == "actsum2") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); 
			//数据库确认年月格式为int类型，monthpicker类型是date类型，所以要转换
			if(!(nui.get("newyearmonth1").getText()==""||nui.get("newyearmonth1").getText()==null||
				nui.get("newyearmonth2").getText()==""||nui.get("newyearmonth2").getText()==null)){
				var newyearmonth1 = nui.get("newyearmonth1").getText();
				var newyearmonth2 = nui.get("newyearmonth2").getText();
				data.criteria._expr[7]._min = newyearmonth1.substring(0,4)+""+newyearmonth1.substring(5,7);
				data.criteria._expr[7]._max = newyearmonth2.substring(0,4)+""+newyearmonth2.substring(5,7);
			}
			if(data.criteria._expr[12]._max != null && data.criteria._expr[12]._max !=''){
				data.criteria._expr[12]._max=data.criteria._expr[12]._max.substring(0,10) + " 23:59:59";
			}
			grid.sortBy("contnum","asc");
		  	grid.load(data); //datagrid加载数据
		}
		//日期格式化
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
	//重置
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		init();
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
		var executeUrl = "/default/ame_income/csReveForecast/detailCsReveForecast.jsp?id=" + selectRow.reveid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl, "合同收入记录详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
    //撤回记录详情
    function detailDrawback(e){
    	return "<a href='javascript:void(0)' onclick='detailDrawback1();' title='点击查看收入记录'>" + e.value + "</a>";
    }
    function detailDrawback1(){
 		var selectRow = grid.getSelected();
		var executeUrl = "/default/ame_income/csReveForecast/queryCsReveWithdraw.jsp?id=" + selectRow.reveid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl, "合同收入记录详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
    //项目详细信息
    function detailProj(e){
    	/* if(e.value){
        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
    	} */
    	if(e.value){
        	if(e.value.split(',').length == 1){
	        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
        	}else{
        		return e.value;
        	}
    	}
    }
    function detailProj1(){
 		var selectRow = grid.getSelected();
 		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectid1;
		window.open(executeUrl);
    }
	</script>
</body>
</html>