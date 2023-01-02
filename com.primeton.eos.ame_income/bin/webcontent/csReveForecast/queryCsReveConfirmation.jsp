<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2018-03-27 15:27:12
  - Description:
-->
<head>
<title>定制实施项目收入确认一览</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

<style type="text/css">
    .showCellTooltip
    {
    	color:blue;text-decoration:overline;
    }
    .ui-tooltip {
        max-width: 850px;
      }
      .asLabel
    {
        border:0;background-color:#F5F5F5;cursor:default;
    }
    </style>
</head>
<body>
	<div  class="nui-panel" title="定制实施项目收入确认一览" width="auto">
		<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<input class="nui-hidden" name="sortField" value="projectName"/>
				<input class="nui-hidden" name="sortOrder" value="desc"/>
				<table style="width:100%;">
					<tr>
						<td align="right"><span>客户名称：</span></td>
						<td align="left">
						    <input name="criteria._expr[3]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
						<td align="right"><span>项目名称：</span></td>
						<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectName"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right"><span>合同编号：</span></td>
						<td align="left">
						    <input name="criteria._expr[2]._value" class="nui-textbox" style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="contnum"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right"><span>项目编号：</span></td>
						<td align="left">
						    <input name="criteria._expr[4]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="projectNo"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>预计确认年份：</span></td>
		            	<td align="left">
		            		<input class="nui-combobox" data="yeariterm" name="criteria._expr[0].year" id="year" style="width:150px;" />
	            		</td>
	            		<td align="right"><span>项目类型：</span></td>
			          	<td>
				            <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="PROJECT_TYPE" multiSelect="true" id="projectType" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="projectType"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
			          	</td>
			          	<td align="right"><span>合同类型：</span></td>
		            	<td colspan="3">
		            		<input class="nui-dictcombobox" name="criteria._expr[6]._value" dictTypeId="MIS_CONTRACTTYPE" id="contracttype" multiSelect="true" style="width: 366px;"/>
		            		<input class="nui-hidden" name="criteria._expr[6]._property" value="contracttype"/>
		            		<input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
					    </td>
					</tr>
					<tr>
						<td align="right"><span>项目实施部门：</span></td>
						<td align="left" colspan="2">
					       <input id="orgid"  name="criteria._expr[7]._value"  style="width:250px;" class="nui-treeselect" 
							textField="orgname" valueField="orgid" parentField="parentorgid" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="true" checkRecursive = "true" expandOnLoad="true" showFolderCheckBox="true"/>
			            	<input class="nui-hidden" name="criteria._expr[7]._property" value="finUnitId"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[8]._property" value="finUnitId"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[8]._value" id="orgids"/>
						</td>
		    			<td align="center" colspan="5">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
                       </td>
	                </tr>
				</table>
			</div>
		</div>
		
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:45%;">
				<tr>
					<td>确认状态：
					</td>
					<td>
						<img src='/default/common/skins/styles/blue/images/datagrid_flag/flag-green.png' style='width:20px;vertical-align:middle;margin-right:5px;'/>已确认
					<td>
					<td>
						<img src='/default/common/skins/styles/blue/images/datagrid_flag/flag-red.png' style='width:20px;vertical-align:middle;margin-right:5px;'/>预计确认逾期
					<td>
					<td>
						<img src='/default/common/skins/styles/blue/images/datagrid_flag/flag-yellow.png' style='width:20px;vertical-align:middle;margin-right:5px;'/>预计确认未逾期
					<td>
				<tr>
			</table>
		</div>
		
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:400px;" allowResize="true" dataField="csReveConfirmation" allowAlternating="true"
	    url="com.primeton.eos.ame_income.csReveForecast.queryCsReveConfirmation.biz.ext" sizeList="[15,20,50,100]"  multiSelect="true" frozenStartColumn="0" frozenEndColumn="5" pageSize="15"
	    showVGridLines="true" ondrawcell="ondrawcell">
	    	<div property="columns">
	    		<div field="custjc" width="130" align="center" headerAlign="center" allowSort="true">客户</div> 
				<div field="projectName" width="180" headerAlign="center" allowSort="true">项目名称</div>
	    		<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div> 
	    		<div field="projectNo" width="90" align="center" headerAlign="center" allowSort="true" renderer="getProjectNameDetail">项目编号</div>
                    <div field="orgname" width="70" align="center" headerAlign="center" allowSort="true" >受益部门</div>
				<div field="month01" width="70" align="center" headerAlign="center" renderer="getflag" cellStyle="border-right-width: 0px;">一月</div>
				<div field="month02" width="70" align="center" headerAlign="center" renderer="getflag" cellStyle="border-right-width: 0px;">二月</div>
				<div field="month03" width="70" align="center" headerAlign="center" renderer="getflag" cellStyle="border-right-width: 0px;">三月</div>
				<div field="month04" width="70" align="center" headerAlign="center" renderer="getflag" cellStyle="border-right-width: 0px;">四月</div>
				<div field="month05" width="70" align="center" headerAlign="center" renderer="getflag" cellStyle="border-right-width: 0px;">五月</div>
				<div field="month06" width="70" align="center" headerAlign="center" renderer="getflag" cellStyle="border-right-width: 0px;">六月</div>
				<div field="month07" width="70" align="center" headerAlign="center" renderer="getflag" cellStyle="border-right-width: 0px;">七月</div>
				<div field="month08" width="70" align="center" headerAlign="center" renderer="getflag" cellStyle="border-right-width: 0px;">八月</div>
				<div field="month09" width="70" align="center" headerAlign="center" renderer="getflag" cellStyle="border-right-width: 0px;">九月</div>
				<div field="month10" width="70" align="center" headerAlign="center" renderer="getflag" cellStyle="border-right-width: 0px;">十月</div>
				<div field="month11" width="70" align="center" headerAlign="center" renderer="getflag" cellStyle="border-right-width: 0px;">十一月</div>
				<div field="month12" width="70" align="center" headerAlign="center" renderer="getflag" >十二月</div>
	    	</div>
	    </div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		String nowuserid = user.getUserId();
	    		String userorgid=user.getUserOrgId();
	    		String userorgname=user.getUserOrgName();
	    		
    		%>
    	var myDate = new Date();
    	var year = myDate.getFullYear();
		var yeariterm = [{id: year-5,text: year-5},
	               		   {id: year-4,text: year-4},
	               		   {id: year-3,text: year-3},
	               		   {id: year-2,text: year-2},
	               		   {id: year-1,text: year-1},
	               		   {id: year,text: year}];
		init();
		function init(){
			//机构权限初始化
    		//code:对应功能编码，map：对于机构的查询条件
			var issearch=1;			
			var json = {"code":"SRQRYL","map":{"property":"status","op":"=","value":"running"}};
			nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg.biz.ext",
				data:json,
				type:'POST',
	            async: false,
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("orgid").setValue('<%=userorgid %>');
							nui.get("orgid").setText('<%=userorgname %>');
							nui.get("orgid").setReadOnly(true);
							issearch=0;
						}
						nui.get("orgid").loadList(text.orgs, "orgid", "parentorgid");
						//nui.get("orgid").setData(text.orgs);
						nui.get("orgids").setValue(text.orgids);
					}else{
						// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("orgid").setValue('<%=userorgid %>');
							nui.get("orgid").setText('<%=userorgname %>');
							nui.get("orgid").setReadOnly(true);
					}
				}
			});
			nui.get("year").setData(yeariterm);
			nui.get("year").setValue(year);
			nui.get("projectType").setValue('4,5');
			nui.get("contracttype").setValue("01,04,10,20,30");
			var data = form.getData();
			if(issearch == 1){
				grid.load(data);
			}else{
				nui.get("search").setEnabled(false);
			}
		}
		function search(){
			var year=nui.get("year").getValue();
			if (year==null || year == ''){
				nui.alert("年份必选！");
				return;
			}
			var form = new nui.Form("#form1");
			var data = form.getData(); 
			grid.load(data); //datagrid加载数据
		}
		function reset(){
			form.reset();
			nui.get("year").setData(yeariterm);
			nui.get("year").setValue(year);
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
	    //项目详细信息
	    function getProjectNameDetail(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkProjectName();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkProjectName(){
	    	var selectRow = grid.getSelected();
			var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
			window.open(executeUrl);
	    }
	    function getflag(e){
			var name = e.value;
			if(name=="已确认"){
				return "<img src='/default/common/skins/styles/blue/images/datagrid_flag/flag-green.png' style='width:20px;vertical-align:middle;margin-right:5px;'/>";
			}
			else if(name=="预计确认延期"){
				return "<img src='/default/common/skins/styles/blue/images/datagrid_flag/flag-red.png' style='width:20px;vertical-align:middle;margin-right:5px;'/>";
			}else if(name=="预计确认未延期"){
				return "<img src='/default/common/skins/styles/blue/images/datagrid_flag/flag-yellow.png' style='width:20px;vertical-align:middle;margin-right:5px;'/>";
			}else{
				return name;
			}
	    }
	    var i=0;
	    function ondrawcell(e) {
	        var row = e.row,column = e.column,field = e.field,value = e.value;
	        var contnum = e.row.contnum;
	        var year = e.row.year;
	        //超链接任务
	        if (field.indexOf('month') >= 0) {
	        	if(value != null){
		        	var month = field.replace("month",'');
		        	var send = "{newyearmonth:'"+year+month+"',contnum:'"+contnum+"'}";
		            e.cellHtml = '<a id="' + send + '" class="showCellTooltip">' + getflag(e) + '</a>';
		        }
	        }
	    }
		
	    //鼠标移至图标展示信息
	    var tip = new nui.ToolTip();
	    tip.set({
	    	target: document,
	    	selector: '.showCellTooltip',
	    	placement:'topright',
	    	onbeforeopen: function (e) {            
	            e.cancel = false;
	        },
	        onopen: function (e) {
	        	var el = e.element;
            	var send = el.id;
            	var json = nui.decode(send);
            	if (json) {
	                this.showLoading();
	                nui.ajax({
	                    url: "com.primeton.eos.ame_income.csReveForecast.getCsReveDetails.biz.ext",
	                    data: json,
	                    async: true,
	                    success: function (o) {
	                        //模拟网络延迟
	                        setTimeout(function () {
	                        	var html="<table style='width:300px;table-layout:fixed;'><tr><td class='asLabel' style='width:150px;'>收入确认次数：</td><td class='asLabel' style='width:150px;'>收入确认金额（含税）：</td></tr>";
	                        	for(var i=0;i<o.detail.length;i++){
	                        		html=html+"<tr><td class='asLabel'>"+o.detail[i].reveno+"</td><td class='asLabel'>"+o.detail[i].sumhs+"</td></tr>"+"<tr><td class='asLabel' style='width:150px;'>确认时机描述：</td><td class='asLabel'>"+o.detail[i].revetimedesc+"</td></tr>";
	                        	}
	                        	html=html+"</table>"
	                            tip.setContent(html);
	                        }, 300);
	                    }
	                });
	            }
	        }
	    });
	</script>
</body>
</html>