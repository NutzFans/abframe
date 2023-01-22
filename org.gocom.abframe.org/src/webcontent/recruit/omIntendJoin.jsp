<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): xpc
  - Date: 2019-05-22 16:51:18
  - Description:
-->
<head>
<title>拟入职人员维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fix">
     <div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	拟入职人员维护
                    </td>
                </tr>
             </table>           
        </div>
    </div>
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        		<table align="center" border="0" width="100%">
        			<tr>
        			    <td align="right">姓名:</td>
						<td align="left">					        
			            	<input class="nui-hidden" name="criteria._expr[0]._property" value="intendname"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-textbox" name="criteria._expr[0]._value"  style="width:170px;"  allowInput="true" id="intendname"/>
							<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>							
						</td>
						<td  align = "right">学历:</td>
				        <td align="left">		        
							<input class="nui-hidden" name="criteria._expr[7]._property" value="education"/>
							<input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
							<input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="DEGREE" multiSelect="true" shownullItem="true" style="width:120px;"  />
				        </td>
						<td  align = "right">人员性质:</td>
				        <td align="left">		        
							<input class="nui-hidden" name="criteria._expr[2]._property" value="intendjobtype"/>
							<input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
							<input name="criteria._expr[2]._value" class="nui-dictcombobox" dictTypeId="AME_EMPTYPE2" multiSelect="true" shownullItem="true" style="width:100px;"  />
				        </td>
						<td align = "right">拟入职日期:</td>
			         	<td align="left">							
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="interdate"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
						    <input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
			          	</td>
        			</tr>
        			<tr>
        			   <td align="right">入职部门:</td>
						<td align="left">						    
	                        <input class="nui-hidden" name="criteria._expr[1]._property" value="inorgid"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="=" id="tempcond1"/>
					        <input class="nui-hidden" name="criteria._expr[1]._ref" value="" id="tempcond2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>					        
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-combobox" id="orgid"  name="criteria._ref[0]._expr[0]._value"  style="width:170px;"  
							textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"  onvaluechanged="changeOrg"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all" />	
					        
                            <input class="nui-hidden" name="criteria._expr[6]._property" value="inorgid"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[6]._value" id="orgids" />
					        <input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="intendname"/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="="/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[0]._value" id="intendname"/>
						</td>
						<td  align = "right">入职状态:</td>
				        <td align="left">
							<input class="nui-hidden" name="criteria._expr[4]._property" value="intendstatus"/>
							<input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
							<input name="criteria._expr[4]._value" class="nui-dictcombobox" id="intendstatus"  dictTypeId="INTEND_STATUS" shownullItem="true" multiSelect="true" style="width:120px;" />
				        </td>
				        <td  align = "right">员工属性:</td>
				        <td align="left">
							<input class="nui-hidden" name="criteria._expr[5]._property" value="intendpositiontype"/>
							<input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
							<input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="EMP_TYPE" shownullItem="true" multiSelect="true" style="width:100px;" />
				        </td>
				        <td align = "right">实际入职日期:</td>
			         	<td align="left">							
						    <input class="nui-hidden" name="criteria._expr[8]._property" value="actdate"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
						    <input class="nui-datepicker" name="criteria._expr[8]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd"/>
			          	</td>
        			</tr>
        			<tr>
        			<td align = "right">需求编号:</td>
			        <td align="left">
						<input class="nui-hidden" name="criteria._expr[9]._property" value="recruitid"/>
						<input class="nui-hidden" name="criteria._expr[9]._op" value="in" id="tempcond3"/>
				        <input class="nui-hidden" name="criteria._expr[9]._ref" value="" id="tempcond4" />
				        <input class="nui-hidden" name="criteria._ref[1]._id" value="2"/>					        
				        <input class="nui-hidden" name="criteria._ref[1]._entity" value="org.gocom.abframe.org.custom.OmRecruit"/>
				        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="recruitid"/>
				        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="recruitno"/>
				        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
				        <input class="nui-textbox" name="criteria._ref[1]._expr[0]._value" allowInput="true" style="width:170px;" onvaluechanged="changeRec"/>
				        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all" />
			        </td>
    			    <td align="right">招聘专员:</td>
					<td align="left">					        
		            	<input class="nui-hidden" name="criteria._expr[10]._property" value="intendrecempnames"/>
				        <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
				        <input class="nui-textbox" name="criteria._expr[10]._value"  allowInput="true"  style="width:120px;"/>
						<input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>							
					</td>
					<td align="right" nowrap="nowrap">是否背景调查:</td>
					<td align="left" nowrap="nowrap">
						<input class="nui-dictcombobox" name="criteria._expr[11]._value" style="width:125px" id="isbackgroud" showNullItem="true"  dictTypeId="MIS_YN" multiselect="true">
						<input class="nui-hidden" name="criteria._expr[11]._property" value="isbackgroud">
						<input class="nui-hidden" name="criteria._expr[11]._op"  value="in">
					</td>
				    </tr>
        			<tr>
					<td align="right" nowrap="nowrap">招聘渠道:</td>
					<td align="left" nowrap="nowrap">
						<input class="nui-dictcombobox" name="criteria._expr[12]._value" style="width:170px" id="isbackgroud" showNullItem="true"  dictTypeId="RECRUIT_WAY" multiselect="true">
						<input class="nui-hidden" name="criteria._expr[12]._property" value="recruitway">
						<input class="nui-hidden" name="criteria._expr[12]._op"  value="in">
					</td>
			        <td colspan="6" align="center">
			            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
			            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		                <a class="nui-button" id="expOmIntendJoin" iconCls="icon-download" onclick="expOmIntendJoin()">导出明细</a>
		                <a class="nui-button" id="import" iconCls="icon-upload" onclick="importOmIntendJoin()">导入新员工信息</a> 
			        </td>
				    </tr>
        		</table>
        	</div>
        </div>
        <div style="width:100%;">
	    	<div class="nui-toolbar" id="isFinance" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
				            <a class="nui-button" id="omIntendjoin_addRec" iconCls="icon-add" onclick="addJoin()">新增</a>
				            <a class="nui-button" id="editRec" iconCls="icon-edit" onclick="editJoin()">修改</a>
			                <a class="nui-button" id="removeBtn" iconCls="icon-remove" onclick="remove()">删除</a> 
			                <a class="nui-button" id="exportGoalWord" iconCls="icon-download" onclick="exportGoalWord()">打印试用期目标</a>
			                <a class="nui-button" id="importRegular" iconCls="icon-upload" onclick="importRegular()">实习生转正导入</a>
                            <a class="nui-button" id="startEntryFlow" iconCls="icon-goto" onclick="startEntryFlow()">发起新员工入职流程</a> 
                            <a class="nui-button" id="startRegularFlow" iconCls="icon-goto" onclick="startRegularFlow()" style="display:none">发起实习员工转正流程</a>
				        </td>
	                </tr>
	            </table>           
	        </div>
	        <div id="datagrid1" sizeList="[10,20,50,100,1000,5000,10000]"  showPager="true" dataField="omIntendJoins" frozenStartColumn="0" frozenEndColumn="4" 
	        	class="nui-datagrid" style="width:100%;height:330px;" ondrawcell="ondrawOmRecList"
	        	url="org.gocom.abframe.org.recruit.omIntendJoin.biz.ext"  multiSelect="true"  >
	            <div property="columns">
	            	<div type="checkcolumn"></div>	
	            	        <div field="intendid" width="80" headerAlign="center" align="center" renderer="onActionRenderer">操作</div>
		                    <div field="intendname" width="60" align="center" headerAlign="center" allowSort="true" renderer="getResume">姓名</div>
		                    <div field="inorgname" width="120" align="center" headerAlign="center" >入职部门</div>
		                    <div field="managername" width="50" align="center" headerAlign="center" >主管</div>
		                    <div field="interdate" width="84" align="center" headerAlign="center" allowSort="true">拟入职日期</div>
		                    <div field="recruitno" width="80" headerAlign="center" align="center"  renderer="getDetail">需求编号</div>
		                    <div field="actdate" width="92" align="center" headerAlign="center" allowSort="true">实际入职日期</div>
		                    <div field="intendjobtype" width="80" align="center" headerAlign="center" allowSort="true" renderer="getJobType">人员性质</div>
		                    <div field="intendpositiontype" width="80" align="center" headerAlign="center" allowSort="true" renderer="getPosition">员工属性</div>
		                    <div field="intendstatus" width="70" align="center" headerAlign="center" allowSort="true" renderer="getIntendStatus">入职状态</div>
		                    <div field="position" width="120" align="center" headerAlign="center" allowSort="true" renderer="getPositionname">职位分类</div>
		                    <div field="positionname" width="120" align="center" headerAlign="center" allowSort="true" >职位名称</div>
		                    <div field="recruitway" width="120" align="center" headerAlign="center" allowSort="true" renderer="getrecruitway">招聘渠道</div>
		                    <div field="intendrecempnames" width="100" align="center" headerAlign="center" allowSort="true" >招聘专员</div>
		                    <div field="gender" width="40" align="center" allowSort="true" headerAlign="center" renderer="getGender">性别</div>
		                    <div field="birthdate" width="80" align="center" allowSort="true" headerAlign="center">出生日期</div>
		                    <div field="education" width="60" align="center" headerAlign="center" allowSort="true" renderer="getEducation">学历</div>
		                    <div field="intendworkplace" width="70" align="center" headerAlign="center" renderer="getWorkspace">工作地点</div>
		                    <div field="welfare" width="80" align="center" headerAlign="center" renderer="getWorkspace">福利缴纳地</div>
		                    <div field="worktime" width="90" align="center" headerAlign="center" allowSort="true">参加工作年月</div>
		                    <div field="remark" width="100" align="left" headerAlign="center" allowSort="true">备注</div>
		                </div>
		            </div>
	            </div>
	        </div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
</body>
<script type="text/javascript">
	nui.parse();	
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	//获取当前登陆人 的id,name
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    	%>
	init();
    function init(){
    	//按钮权限的控制
	    getOpeatorButtonAuth("omIntendjoin_addRec");//操作按钮权限初始化
    	var json = {"code":"omIntendJoin","map":{"property":"status","op":"=","value":"running"}};
    	nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
						var authorgs=text.orgs;
			    		var authorgids = text.orgids;
			    		if(text.orgs){
						if(authorgs.length==0){
							// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("intendname").setValue('<%=nowusername %>');
						}
			    		var isall;
						for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
								isall = "1";
								break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
							nui.get("orgids").setValue("");
						}else{
							nui.get("orgids").setValue(authorgids);
						}
						nui.get("orgid").setData(authorgs);
						}else{
						// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("intendname").setValue('<%=nowusername %>');
				}
				        nui.get("intendstatus").setValue("1,4");
					    search();
			     }				
			});
		}
     function search() {
            var data = form.getData(); //获取表单JS对象数据
            grid.sortBy("interdate","asc");
            grid.load(data); //datagrid加载数据
        }
     function reset(){
			form.reset();
			grid.sortBy("interdate","asc");
			nui.get("intendstatus").setValue("1,4");
			search();
		}  
     function getDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='getOmRecruitDetail();' title='点击查看'>" + e.value + "</a>";
    	}
    }
     function getOmRecruitDetail(){
    	var selectRow = grid.getSelected();
		var executeUrl = "/default/abframe/org/recruit/omRecruitDetail.jsp?recruitid=" + selectRow.recruitid;
		window.open(executeUrl);
    }
	function ondrawOmRecList(e){
		var record = e.record;
		var date = new Date();
		var dateTime = Date.parse(date);
		var hopetime = Date.parse(record.hopedate);
		if(dateTime > hopetime){
			e.rowStyle = "background-color: #FF99CC";
		}
	}
    //新增需求
	function addJoin(){
		nui.open({
            url: "<%=request.getContextPath() %>/abframe/org/recruit/omIntendJoinInput.jsp",
            title: "新增拟入职人员信息", 
            width: 1250, 
            height: 520,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
            	if(action=="ok"){
            		grid.reload();
            	}
            }
        });
	}
	//编辑需求
	function editJoin(){
		var row = grid.getSelected();
		if (row) {
			nui.open({
	            url: "<%=request.getContextPath() %>/abframe/org/recruit/omIntendJoinInput.jsp",
	            title: "编辑拟入职人员信息", 
	            width: 1200, 
	            height: 520,
	            onload: function () {
	                var iframe = this.getIFrameEl();
	                var data = { action: "edit",intendid:row.intendid};
	                iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	            	if(action=="ok"){
	            		grid.reload();
	            	}
	            }
	        });
        }else{
	    	nui.alert("请选中一条记录","提示");
	    }
	}
	//删除
	function remove() {            
        var rows = grid.getSelecteds();   
        var data = {omIntendJoins:rows};
        var json = nui.encode(data);      
        if (rows.length > 0) {
            if (confirm("确定删除选中记录？")) {
                grid.loading("操作中，请稍后......");
                nui.ajax({
                    url: "org.gocom.abframe.org.recruit.deleteIntendJoins.biz.ext",
                    type: "post",
                    data: json, 
                    cache: false,
                    contentType: 'text/json',
                    success: function (text) {
                    	grid.unmask();
                		if(text.result == "success"){
	                		nui.alert("删除成功！");
		                	grid.reload();
	                	}else{
	                		nui.alert("删除失败！");
	                	}
                    },
                    error: function () {
                    }
                });
            }
        }else {
            nui.alert("请选中一条记录");
        }
    }
	//导出明细查询
		function expOmIntendJoin(){
			var data = form.getData(); //获取表单JS对象数据
			var json = nui.encode(data); //序列化成JSON	
			form.loading("操作中，请稍后......");
			nui.ajax({
                url: "org.gocom.abframe.org.recruit.expOmIntendJoin.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             		form.unmask();
                	var filePath = o.downloadFile;
                	var fileName = "拟入职人员明细";
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
	function getGender(e){
		return nui.getDictText('ABF_GENDER',e.value);
	}
	function getJobType(e){
		return nui.getDictText('AME_EMPTYPE2',e.value);
	}
	function getPosition(e){
		return nui.getDictText('EMP_TYPE',e.value);
	}
	function getIntendStatus(e){
		return nui.getDictText('INTEND_STATUS',e.value);
	}
	function getEducation(e){
		return nui.getDictText('DEGREE',e.value);
	}
	function getWorkspace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	//职位类型
	function getPositionname(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);
	}
	function getrecruitway(e){
		return nui.getDictText('RECRUIT_WAY',e.value);
	}
    //受益部门值改变时判断是否为空，如果为空则取消ref
	function changeOrg(e){
		if(e.value==null || e.value==""){
			nui.get("tempcond1").setValue("=");
			nui.get("tempcond2").setValue("");
		}else{
			nui.get("tempcond1").setValue("in");
			nui.get("tempcond2").setValue("1");
		}
	}
	//招聘专员改变时判断是否为空，如果为空则取消ref
	function changeRec(e){
		if(e.value==null || e.value==""){
			nui.get("tempcond3").setValue("in");
			nui.get("tempcond4").setValue("");
		}else{
			nui.get("tempcond3").setValue("in");
			nui.get("tempcond4").setValue("2");
		}
	}
	
	//发起新员工入职流程
	function startEntryFlow(){
		var row = grid.getSelected();
		var rows = grid.getSelecteds();
		if(rows.length>1){
			nui.alert("只能选择一条记录发起入职流程！","提示");
			return false;
		}
		if(row){
			if(row.intendstatus != '1'){
				nui.alert("只有入职状态为待入职的拟入职人员可以发起入职流程！","提示");
				return false;
			}
			if(row.issetincome != '1'){
				nui.alert("该拟入职人员的面试流程还未结束，请结束面试流程后发起入职流程！","提示");
				return false;
			}
		}else{
			nui.alert("请您选择一位待入职人员！","提示");
			return false;
		}
		nui.open({
			url: "<%=request.getContextPath() %>/ame_permanage/ame_entry/createNewstaffEntryFlowByRecruiters.jsp?id=" + row.intendid+"&isTrainee=0",
            title: "发起新员工入职流程", 
			width: 1100,
            height: 520,
            onload: function () {
            	grid.reload();
            },
            ondestroy: function (action) {
            	grid.reload();
            }
		});
	}
	//发起实习员工转正流程
	function startRegularFlow(){
		var row = grid.getSelected();
		var rows = grid.getSelecteds();
		if(rows.length>1){
			nui.alert("只能选择一条记录发起实习转正流程！","提示");
			return false;
		}
		if(row){
			if(row.intendstatus != '1'){
				nui.alert("只有入职状态为待入职的拟入职人员可以发起入职流程！","提示");
				return false;
			}
			if(row.issetincome != '1'){
				nui.alert("该拟入职人员的面试流程还未结束，请结束面试流程后发起入职流程！","提示");
				return false;
			}
			if(row.intendpositiontype != '1'){
				nui.alert("实习员工转正，员工属性必须为正式员工！","提示");
				return false;
			}
			if(row.recruitway != '8'){
				nui.alert("实习员工转正，招聘渠道性必须为实习生转入！","提示");
				return false;
			}
		}else{
			nui.alert("请您选择一位待入职人员！","提示");
			return false;
		}
		nui.open({
			url: "<%=request.getContextPath() %>/ame_permanage/ame_entry/createNewstaffEntryFlowByRecruiters.jsp?id=" + row.intendid+"&isTrainee=1",
            title: "发起实习员工转正流程", 
			width: 1100,
            height: 520,
            onload: function () {
            	grid.reload();
            },
            ondestroy: function (action) {
            	grid.reload();
            }
		});
	}
	
	function onActionRenderer(e) {
        var record = e.record;
    	var intendid = e.record.intendid;
        if(record.processinstid){
			s = " <a  href='javascript:void(0)' onclick='getdetailIntendJoin(" + intendid +")' title='点击查看'>明细</a>"+" "+" <a  href='javascript:void(0)' onclick='feeView();' title='点击查看'>流程</a>";
    	}else{
    		s = " <a  href='javascript:void(0)' onclick='getdetailIntendJoin(" + intendid +")' title='点击查看'>明细</a>";
    	}
        return s;
        
    }
	function getdetailIntendJoin(intendid){
		var executeUrl = "<%= request.getContextPath() %>/abframe/org/recruit/detailIntendJoin.jsp?intendid=" + intendid;
		window.open(executeUrl);
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
    
    //导出试用期目标word文档
    function exportGoalWord(){
    	var omIntendJoin = grid.getSelecteds(); //获取表单JS对象数据
    	if(omIntendJoin.length != 1){
    		nui.alert("请选择一条需要导出试用期目标的拟入职人员信息！");
    		return;
    	}
    	var executeUrl = "/default/abframe/org/newOrganization/detailNewstaff.jsp?intendid=" + omIntendJoin[0].intendid;
		window.open(executeUrl);
    }
    /**
	 *批量导入拟入职人员信息
	 */
	function importOmIntendJoin(){
		nui.open({
            url: "<%=request.getContextPath() %>/abframe/org/recruit/importOmIntendJoin.jsp",
            title: "拟入职人员导入", 
			width: 700,
            height: 195,
            allowDrag:true,
            ondestroy: function (action) {
            	if(action=="ok"){
            		grid.reload();
            	}
            }
        });
	}
	
	function importRegular(){
		var executeUrl = "/default/abframe/org/recruit/importTrainee.jsp";
		var iWidth=1200; //弹出窗口的宽度;
		var iHeight=600; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "实习生转正导入", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
    }
	
	function getResume(e){
	       return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    function checkDetail(){
    	var row = grid.getSelected();
		var executeUrl = "/default/ame_permanage/ame_resum/detailofResume.jsp?action='update'&resumeid=" + row.resumeid;
		var iWidth=1200; //弹出窗口的宽度;
		var iHeight=600; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "反馈详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
    	
    }
</script>
</html>