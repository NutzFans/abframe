<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="com.primeton.bps.web.control.I18nUtil"%>
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
<title>重点任务</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    html, body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    } 
	    <!--.nui-radiobuttonlist-item{
	    	float: left;
		    margin-left: 200px;
		    color: pink;
		 }-->
    </style>
</head>
<body>
<div class="nui-panel" title="月度计划审核" style="width: 100%;height: 100%">
    <div  id="form1">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table align="center" border="0" width="100%" class="form_table">
                <tr>
                    <td class="form_label" align = "right">申报人</td>
                    <td colspan="1">
                        <input name="criteria._expr[2]._value" class="nui-textbox" style="width:221px;" id="createname"/>
                        <input class="nui-hidden" name="criteria._expr[2]._property" value="empname"/>
                        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
                        <input name="critria._expr[10]._value" class="nui-hidden" id="createUserid"/>
                        <input class="nui-hidden" name="critria._expr[10]._property" value="createUserid"/>
                    </td>
                    <td class="form_label" align = "right">重点任务名称</td>
                    <td colspan="1">
                        <input name="criteria._expr[3]._value" class="nui-textbox" style="width:221px;" />
                        <input class="nui-hidden" name="criteria._expr[3]._property" value="taskName"/>
                        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right" id="aa">责任单位</td>
                    <td colspan="1" id="ab">
                        <input id="orgid2"  name="critria._ref[0]._expr[0]._value" style="width:200px;" class="nui-combobox"
                               textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
                        <input class="nui-hidden" name="critria._expr[4]._property" value="implementOrg"/>
                        <input class="nui-hidden" name="critria._expr[4]._op" value="in" id="tempCond1"/>
                        <input class="nui-hidden" name="critria._expr[4]._ref" value="1" id="tempCond2"/>
                        <input class="nui-hidden" name="critria._ref[0]._id" value="1"/>
                        <input class="nui-hidden" name="critria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
                        <input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="orgid"/>
                        <input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="orgseq"/>
                        <input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="like"/>
                        <input class="nui-hidden" name="critria._ref[0]._expr[0]._likeRule" value="end"/>
                        <input class="nui-hidden" name="critria._expr[9]._property" value="orgid"/>
                        <input class="nui-hidden" name="critria._expr[9]._op" value="in"/>
                        <input class="nui-hidden" name="critria._expr[9]._value" id="orgids2"/>
                    </td>
                    <!--
                    <td class="form_label" align = "right">申报***状态</td>
                    <td colspan="1">
                      <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="ZH_ZDRW_SBZT"  shownullItem="true" style="width:221px;"/>
                      <input class="nui-hidden" name="criteria._expr[5]._property" value="appStatus"/>
                      <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
                    </td>
                     -->
                </tr>
                <tr>
                    <!--<td class="form_label" align = "right">申报年度</td>
                       <td colspan="1">
                         <input class="nui-hidden" name="criteria._expr[6]._op" value="between" />
                        <input class="nui-hidden" name="criteria._expr[6]._pattern" value="yyyy-MM-dd" />
                        <input class="nui-hidden" name="criteria._expr[6]._property" value="declareYear" />
                        <input class="nui-datepicker" style="width: 98px;"  name="criteria._expr[8]._min" />
                        <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span>
                        <input class="nui-datepicker" style="width: 98px;"  name="criteria._expr[8]._max" />
                      </td>-->
                    <!--<td class="form_label" align = "right">总体目标</td>
                    <td colspan="1">
                      <input name="criteria._expr[7]._value" class="nui-textbox" style="width:221px;" />
                      <input class="nui-hidden" name="criteria._expr[7]._property" value="populationTarget"/>
                      <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
                    </td>		-->
                    <!--  <td class="form_label" align = "right" id="aa">年度目标</td>
                      <td colspan="1" id="ab">
                        <input name="criteria._expr[8]._value" class="nui-textbox" style="width:221px;" id="yearTarget"/>
                        <input class="nui-hidden" name="criteria._expr[8]._property" value="yearTarget"/>
                        <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
                        <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
                      </td>-->
                    <!--   <td class="form_label" align = "right">决策情况</td>
                       <td colspan="1">
                         <input name="criteria._expr[9]._value" class="nui-textbox" dictTypeId="ZH_BIDSTATUS"  shownullItem="true" style="width:221px;"/>
                         <input class="nui-hidden" name="criteria._expr[9]._property" value="decisionSituation"/>
                         <input class="nui-hidden" name="criteria._expr[9]._op" value="in"/>
                       </td>-->
                </tr>
                <tr>
                    <!-- <td class="form_label" align = "right">计划完成时间</td>
                        <td colspan="1">
                          <input class="nui-hidden" name="criteria._expr[10]._op" value="between" />
                         <input class="nui-hidden" name="criteria._expr[10]._pattern" value="yyyy-MM-dd" />
                         <input class="nui-hidden" name="criteria._expr[10]._property" value="planCompleteTime" />
                         <input class="nui-datepicker" style="width: 98px;"  name="criteria._expr[8]._min" />
                         <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span>
                         <input class="nui-datepicker" style="width: 98px;"  name="criteria._expr[8]._max" />
                       <td class="form_label" align = "right">实际完成时间</td>
                        <td colspan="1">
                          <input class="nui-hidden" name="criteria._expr[11]._op" value="between" />
                         <input class="nui-hidden" name="criteria._expr[11]._pattern" value="yyyy-MM-dd" />
                         <input class="nui-hidden" name="criteria._expr[11]._property" value="actualCompleteTime" />
                         <input class="nui-datepicker" style="width: 98px;"name="criteria._expr[8]._min" />
                         <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">至</span>
                         <input class="nui-datepicker" style="width: 98px;" name="criteria._expr[8]._max" />  -->
                    <!--   <td class="form_label" align = "right" id="aa">完成状态</td>
                       <td colspan="1" id="ab">
                       <input name="criteria._expr[12]._value" class="nui-dictcombobox" dictTypeId="ZH_BIDSTATUS"  shownullItem="true" style="width:221px;"/>
                          <input class="nui-hidden" name="criteria._expr[12]._property" value="completeStatus"/>
                          <input class="nui-hidden" name="criteria._expr[12]._op" value="in"/>

                          <input name="criteria._expr[12]._value" class="nui-textbox" style="width:221px;" id="completeStatus"/>
                         <input class="nui-hidden" name="criteria._expr[12]._property" value="completeStatus"/>
                         <input class="nui-hidden" name="criteria._expr[12]._op" value="like"/>
                         <input class="nui-hidden" name="criteria._expr[12]._likeRule" value="all"/>

                       </td>-->
                    <!--     <td class="form_label" align = "right">备注</td>
                         <td colspan="1">
                           <input name="criteria._expr[13]._value" class="nui-textbox" dictTypeId="ZH_BIDSTATUS"  shownullItem="true" style="width:221px;"/>
                           <input class="nui-hidden" name="criteria._expr[13]._property" value="remark"/>
                           <input class="nui-hidden" name="criteria._expr[13]._op" value="in"/>
                         </td>-->
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
                    <a class="nui-button" id="checkview" iconCls="icon-edit" onclick="editTaskMng()">进展情况跟踪</a>
                    <a class="nui-button" id="checkview" iconCls="icon-edit" onclick="sure()">月度计划更新</a>
                </td>
            </tr>
        </table>
    </div>
    <div class="nui-fit">
        <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="keyTaskList"
             showSummaryRow="true"  sortMode="client"
             class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.imptask.keytask.queryTaskList.biz.ext"
             multiSelect="false" allowSortColumn=true onshowrowdetail="onShowRowDetail">
            <div property="columns">
                <div name="temp123" type="checkcolumn"></div>
                <div field="taskName" width="150" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">重点任务名称</div>
                <div field="declareYear" width="50" align="center" headerAlign="center" allowSort="true" >申报年度</div>
                <div field="orgname" width="80" align="center" headerAlign="center" allowSort="true" >责任单位</div>
                <div field="populationTarget" width="90" align="center" headerAlign="center" allowSort="true" >总体目标</div>
                <div field="yearTarget" width="80" align="center" headerAlign="center" allowSort="true"  >年度目标</div>
                <div field="decisionSituation" width="120" align="center" headerAlign="center" >决策情况</div>
                <div field="planCompleteTime" width="80" align="center" headerAlign="center" >计划完成时间</div>
                <div field="actualCompleteTime" width="80" align="center" headerAlign="center" allowSort="true">实际完成时间</div>
                <div field="completeStatus" width="66" align="center" headerAlign="center" allowSort="true" renderer="check">完成状态</div>
                <div field="empname" width="80" align="center" headerAlign="center" allowSort="true" >申报人</div>
            </div>
        </div>
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
<% UserObject user = (UserObject)session.getAttribute("userObject");
	String userName=user.getUserName();
	String userId=user.getUserId();
	String orgName=user.getUserOrgName();
 %>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	var type = <%=request.getParameter("type")%>;
	var reve_grid = nui.get("reve_grid");

	var appContext = "<%=request.getContextPath()%>";
	var taskListDataGridObj = nui.get("datagrid1");
	init();
	function init(){
		//code:对应功能编码，map：对于机构的查询条件
		var json = {"code":"ydjhcxbj","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						//当没有有权的机构时将申请人设置为登陆人
						nui.get("createUserid").setValue('<%=userId %>');
						nui.get("createname").setValue('<%=userName %>');
						nui.get("createname").setReadOnly(true);
					}
					//根据情况选择一种
					nui.get("orgid2").setData(text.orgs);
					nui.get("orgids2").setValue(text.orgids);
				}else{
					//当没有有权的机构时将申请人设置为登陆人
						nui.get("createUserid").setValue('<%=userId %>');
						nui.get("createname").setValue('<%=userName %>');
						nui.get("createname").setReadOnly(true);
				}
				search();
			}
		});
	}
		
		
	function check(e){
		if(e.value==1){
		return "是";
		}else{
		return "否";
		}
	}
		
	function check3(e){
		/* 申报状态 0-未下发 1-申报部门填报月度计划 2-经营计划部调整 3 申报部门执行中 4 流程终止 */
		if(e.value==0){
			return "未下发";
		}else  if(e.value==1){
			return "申报部门填报月度计划 ";
		}else  if(e.value==2){
			return "经营计划部调整";
		}else  if(e.value==3){
			return "申报部门执行中";
		}else  if(e.value==4){
			return "流程终止";
		}
	}
		
		
	function check2(e){		
		var d = new Date(e.value);  
		youWant=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
		youWant=youWant.substr(0,4);
		return  youWant;
		/* if(e.value==1){
		return "是";
		}else{
		return "否";
		} */
	}	
		
		
	function lookInfo(e) {	
		var bidid = e.row.pid;
		if(bidid==0 || bidid==null ){
			nui.alert("查询信息有误");
		}else{
			return "<a href='javascript:void(0)' onclick='doView("+ bidid +");' title='点击查看'>" + e.value + "</a>";
		}
	}
	
	
    function doView(reiid){
		var executeUrl = "<%= request.getContextPath() %>/imptask/keyTaskDetail.jsp?id=" + reiid;
		window.open(executeUrl);
    }
		
		 
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
		data.type='4';
	  	grid.load(data); //datagrid加载数据
	}
	
	
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
		
	//修改投标明细
	function editTaskMng(){		
		var rows = grid.getSelecteds();
		if (rows.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    	}else{	
    		var row = rows[0];    		
			if (row) {
				nui.open({
					url: appContext+"/imptask/compileydjh.jsp?id="+row.id+"&isUpdate="+row.isUpdate+"&option=1", 
					width: 1100,
					height: 700,
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
		
	//
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
		  
	
	function sure(e){	
		var rows = grid.getSelecteds(); 				
		if (rows.length > 1) {
			nui.alert("只能选中一条项目记录进行编辑");
		}else{
			var row = rows[0]
			if(row.isUpdate==0){
				nui.alert("暂未授权,请联系经营计划部");
			}else{    			
				if (row) {
					nui.open({
						url: appContext+"/imptask/compileydjh.jsp?id="+row.id+"&isUpdate="+row.isUpdate+"&option=2", 
						width: 1100,
						height: 700,
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
	}
	

</script>
</body>
</html>