 <%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-27 10:10:45
  - Description:
-->
<head>
<title></title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    .nui-radiobuttonlist-item{
	    	float: left;
		    margin-left: 200px;
		    color: pink;
		 }
    </style>
</head>
<body>
	<div class="nui-panel" title="合同协议变更历史" style="width:100%;">
        <div  id="form1">
        <input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.payContract.payContract.ZhPayContractAlterationEntity"/>
		  <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			  <table align="center" border="0" width="100%" class="form_table">
		        <tr >
		          <td class="form_label" align = "right">申请人:</td>
		          <td colspan="1">
			    	<input name="critria._expr[2]._value" class="nui-textbox" style="width:65%;" />
				    <input class="nui-hidden" name="critria._expr[2]._property" value="empname"/>
				    <input class="nui-hidden" name="critria._expr[2]._op" value="="/>
		          </td>	
  		    	  <td class="form_label" align = "right">原合同编号:</td>
		          <td colspan="1">
			    	<input name="critria._expr[3]._value" class="nui-textbox" style="width:65%;" />
				    <input class="nui-hidden" name="critria._expr[3]._property" value="originalContractNo"/>
				    <input class="nui-hidden" name="critria._expr[3]._op" value="="/>
		          </td>
		          <td class="form_label" align = "right">原合同名称:</td>
		          <td colspan="1">
			    	<input name="critria._expr[4]._value" class="nui-textbox" style="width:65%;" />
				    <input class="nui-hidden" name="critria._expr[4]._property" value="originalContractName"/>
				    <input class="nui-hidden" name="critria._expr[4]._op" value="="/>
		          </td>
		      </tr>
<!-- 		      <tr> -->
<!-- 		    	  <td class="form_label" align = "right">合同名称:</td> -->
<!-- 		          <td colspan="1"> -->
<!-- 			    	<input name="critria._expr[5]._value" class="nui-textbox" style="width:65%;" /> -->
<!-- 				    <input class="nui-hidden" name="critria._expr[5]._property" value="contractName"/> -->
<!-- 				    <input class="nui-hidden" name="critria._expr[5]._op" value="like"/> -->
<!-- 		          </td> -->
<!--   		    	  <td class="form_label" align = "right">签约方:</td> -->
<!-- 		          <td colspan="1"> -->
<!-- 			    	<input name="critria._expr[6]._value" class="nui-textbox" style="width:65%;" /> -->
<!-- 				    <input class="nui-hidden" name="critria._expr[6]._property" value="signatory"/> -->
<!-- 				    <input class="nui-hidden" name="critria._expr[6]._op" value="like"/> -->
<!-- 		          </td>	 -->
<!-- 		           <td class="form_label" align = "right">标的规模:</td> -->
<!-- 		          <td colspan="1"> -->
<!-- 			    	<input name="critria._expr[7]._value" class="nui-textbox" style="width:65%;" /> -->
<!-- 				    <input class="nui-hidden" name="critria._expr[7]._property" value="projectSize"/> -->
<!-- 				    <input class="nui-hidden" name="critria._expr[7]._op" value="like"/> -->
<!-- 		          </td>	 -->
<!-- 		      </tr> -->
<!-- 		      <tr> -->
<!-- 				  <td class="form_label" align = "right">申请日期:</td> -->
<!-- 		          <td colspan="1"> -->
<!--              	    <input class="nui-hidden" name="critria._expr[8]._op" value="between" /> -->
<!--                     <input class="nui-hidden" name="critria._expr[8]._pattern" value="yyyy-MM-dd" /> -->
<!--                     <input class="nui-hidden" name="critria._expr[8]._property" value="createTime" /> -->
<!--                     <input class="nui-datepicker" name="critria._expr[8]._min" style="width:30%;"/> -->
<!--                     <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span> -->
<!--                     <input class="nui-datepicker" name="critria._expr[8]._max" style="width:30%;"/> -->
<!-- 		          </td>	 -->
<!--   		    	  <td class="form_label" align = "right">合同起始日期:</td> -->
<!-- 		          <td colspan="1"> -->
<!--              	    <input class="nui-hidden" name="critria._expr[9]._op" value="between" /> -->
<!--                     <input class="nui-hidden" name="critria._expr[9]._pattern" value="yyyy-MM-dd" /> -->
<!-- 					<input class="nui-hidden" name="critria._expr[9]._property" value="startTime" /> -->
<!--                     <input class="nui-datepicker" name="critria._expr[9]._min" style="width:30%;"/> -->
<!--                     <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span> -->
<!--                     <input class="nui-datepicker" name="critria._expr[9]._max" style="width:30%;"/> -->
<!-- 		          </td>	 -->
<!-- 		    	  <td class="form_label" align = "right">合同结束日期:</td> -->
<!-- 		          <td colspan="1"> -->
<!-- 				    <input class="nui-hidden" name="critria._expr[10]._op" value="between"/> -->
<!-- 				    <input class="nui-hidden" name="critria._expr[10]._pattern" value="yyyy-MM-dd"/> -->
<!-- 					<input class="nui-hidden" name="critria._expr[10]._property" value="endTime" /> -->
<!--                     <input class="nui-datepicker" name="critria._expr[10]._min" style="width:30%;"/> -->
<!--                     <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span> -->
<!--                     <input class="nui-datepicker" name="critria._expr[10]._max" style="width:30%;"/> -->
<!-- 		          </td>	 -->
<!-- 		      </tr> -->
<!-- 		       <tr> -->
<!-- 		    	  <td class="form_label" align = "right">合同金额:</td> -->
<!-- 		          <td colspan="1"> -->
<!-- 			    	<input name="critria._expr[11]._value" class="nui-textbox" style="width:65%;" /> -->
<!-- 				    <input class="nui-hidden" name="critria._expr[11]._property" value="contractName"/> -->
<!-- 				    <input class="nui-hidden" name="critria._expr[11]._op" value="like"/> -->
<!-- 		          </td> -->
<!-- 		      </tr> -->
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

    <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="data" 
    	showSummaryRow="true"  sortMode="client"  
    	class="nui-datagrid" style="width:100%;height:400px;" url="com.zhonghe.ame.payContract.payContract.queryPayContractAlterationAll.biz.ext" 
    	multiSelect="false" allowSortColumn=true >
        <div property="columns">
        <div type="indexcolumn" align="center" headerAlign="center">序号</div>
        	<div name="temp123" type="checkcolumn"></div>
        	<!-- <div type="expandcolumn" width="20"></div> -->
        	<div field="empname" width="80" align="center" headerAlign="center" allowSort="true" >申请人</div>
            <div field="originalContractName" width="200" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">合同名称</div>
            <div field="signatory" width="80" align="center" headerAlign="center" allowSort="true" >签约方</div>
            <div field="contractSum" width="200" align="center" headerAlign="center" allowSort="true" >合同金额</div>
            <div field="orgname" width="200" align="center" headerAlign="center" allowSort="true" >合同实施部门</div>
            <div field="projectLocal" width="80" align="center" headerAlign="center" allowSort="true"  >实施地点</div>
            <div field="startTime"  dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" >合同开始日期</div>
            <div field="zhContractType" width="80" align="center" headerAlign="center" allowSort="true" visible="false" renderer="zhContractType">合同类型</div>
            <div field="remark" width="80" align="center" headerAlign="center" allowSort="true"  >变更说明</div>
        </div>
        </div>
		</div>
		
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
</div>
	
<% UserObject user = (UserObject)session.getAttribute("userObject");
	String userName=user.getUserName();
	String orgName=user.getUserOrgName();
 %>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var id = "";
    	var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
		function search() {
// 			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			data.critria._expr[2]._value= "<%=userName %>";
			data.critria._expr[3]._value= id;
		  	grid.load(data); //datagrid加载数据
		}
		function setContractHistoryData(data){
			id = data.contractNo;
			search();
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
			search()
		}
		
		function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
		
		//回车触发
		function onKeyEnter(){
			search();
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
	
	function zhContractType(e) {
		return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
	}
</script>
</body>
</html>