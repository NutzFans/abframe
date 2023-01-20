<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-05-07 16:51:18
  - Description:
-->
<head>
<title>招聘需求管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fix">
	<div class="nui-panel" title="招聘需求管理" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        		<table align="center" border="0" width="100%">
        			<tr>
        				<td align="right">需求部门:</td>
						<td align="left">
						    <input id="orgid"  name="criteria._ref[0]._expr[0]._value"  class="nui-combobox" 
						    textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" style="width:150px;"/>
		            		<input class="nui-hidden" name="criteria._expr[0]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="tempCond11"/>
					        <input class="nui-hidden" name="criteria._expr[0]._ref" value="1" id="tempCond21"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end"/>
					        
					        <input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[1]._value" id="orgids"/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="applyuserid"/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="="/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[0]._value" id="applyuserid"/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="interviewer1"/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[1]._op" value="="/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[1]._value" id="interviewer"/>
						</td>
						<td align="right">职位分类:</td>
						<td align="left">
					        <input name="criteria._expr[2]._value" style="width:150px;" class="nui-dictcombobox" dictTypeId="AME_POSITION_MEMO" allowInput="true" />
			            	<input class="nui-hidden" name="criteria._expr[2]._property" value="recposition"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
						</td>
						<td  align = "right">人员性质:</td>
				        <td align="left">
					        <input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="AME_EMPTYPE2"  multiSelect="true"  shownullItem="true" style="width:150px;"  />
							<input class="nui-hidden" name="criteria._expr[4]._property" value="jobtype"/>
							<input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
				        </td>
						<td align = "right">期望入职日期:</td>
			         	<td align="left">
							<input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="hopedate"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
			          	</td>
        			</tr>
        			<tr>
						<td align="right">招聘需求编号:</td>
						<td align="left">
					        <input name="criteria._expr[8]._value" style="width:150px;" class="nui-textbox" allowInput="true" />
			            	<input class="nui-hidden" name="criteria._expr[8]._property" value="recruitno"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
						</td>
						<td align="right">招聘职位:</td>
						<td align="left">
					        <input name="criteria._expr[13]._value" style="width:150px;" class="nui-textbox" allowInput="true" />
			            	<input class="nui-hidden" name="criteria._expr[13]._property" value="recpositionname"/>
					        <input class="nui-hidden" name="criteria._expr[13]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[13]._likeRule" value="all"/>
						</td>
						<td  align = "right">工作地点:</td>
				        <td align="left">
					        <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="AREA4CLRY" multiSelect="true"  style="width:150px;" />
							<input class="nui-hidden" name="criteria._expr[5]._property" value="workplace1"/>
							<input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
				        </td>
				        <td align = "right">提出日期:</td>
			         	<td align="left">
							<input class="nui-datepicker" name="criteria._expr[12]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[12]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[12]._property" value="propdate"/>
						    <input class="nui-hidden" name="criteria._expr[12]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[12]._pattern" value="yyyy-MM-dd"/>
			          	</td>
        			</tr>
        			<tr>
        				<td  align = "right">员工属性:</td>
				        <td align="left">
					        <input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="EMP_TYPE" multiSelect="true" shownullItem="true" style="width:150px;"  />
							<input class="nui-hidden" name="criteria._expr[7]._property" value="position"/>
							<input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
				        </td>
        				<td  align = "right">招聘专员:</td>
				        <td align="left">
					        <input name="criteria._expr[9]._value" class="nui-textbox"  style="width:150px;"/>
							<input class="nui-hidden" name="criteria._expr[9]._property" value="recempname"/>
							<input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
				        </td>
				        <td  align = "right">主考官:</td>
				        <td align="left">
					        <input name="criteria._expr[11]._value" class="nui-textbox"  style="width:150px;"/>
							<input class="nui-hidden" name="criteria._expr[11]._property" value="interempname"/>
							<input class="nui-hidden" name="criteria._expr[11]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[11]._likeRule" value="all"/>
				        </td>
				        <td  align = "right">需求审批状态:</td>
				        <td align="left">
					        <input name="criteria._expr[10]._value" class="nui-dictcombobox" dictTypeId="RECRUIT_APPROVAL_STATUS" shownullItem="true" multiSelect="true" style="width:150px;" />
							<input class="nui-hidden" name="criteria._expr[10]._property" value="approvalstatus"/>
							<input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
				        </td>
				    </tr>
        			<tr>
						<td  align = "right">招聘状态:</td>
				        <td align="left">
					        <input name="criteria._expr[6]._value" class="nui-dictcombobox" dictTypeId="RECRUIT_STATUS" shownullItem="true" multiSelect="true" style="width:150px;" />
							<input class="nui-hidden" name="criteria._expr[6]._property" value="status"/>
							<input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
				        </td>
				        <td  align = "right">HC类型:</td>
				        <td align="left">
					        <input name="criteria._expr[14]._value" class="nui-dictcombobox" dictTypeId="RECRUIT_HCTYPE"style="width:150px;" />
							<input class="nui-hidden" name="criteria._expr[14]._property" value="hctype"/>
							<input class="nui-hidden" name="criteria._expr[14]._op" value="in"/>
				        </td>
				         <td  align = "right">岗位级别:</td>
				        <td align="left">
					        <input name="criteria._expr[15]._value" class="nui-dictcombobox" dictTypeId="AME_TECH"style="width:150px;" />
							<input class="nui-hidden" name="criteria._expr[15]._property" value="joblevel"/>
							<input class="nui-hidden" name="criteria._expr[15]._op" value="in"/>
				        </td>
				        <td colspan="6" align="center">
				            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
				            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
				        </td>
        			<tr>
        		</table>
        	</div>
        </div>
        <div style="width:100%;">
	    	<div class="nui-toolbar" id="isFinance" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
				            <a class="nui-button" id="omRecruitList_addRec" iconCls="icon-add" onclick="addRec()">新增</a>
				            <a class="nui-button" id="omRecruitList_editRec" iconCls="icon-edit" onclick="editRec()">修改</a>
			                <a class="nui-button" id="omRecruitList_removeBtn" iconCls="icon-remove" onclick="remove()">删除</a>
				            <a class="nui-button" id="omRecruitList_exportRec" iconCls="icon-download" onclick="exportRec()">导出招聘信息</a>
                            <a class="nui-button" id="omRecruitList_startEntryFlow" iconCls="icon-goto" onclick="startInterviewFlow()">安排面试</a> 
				        </td>
	                </tr>
	            </table>           
	        </div>
	        <div id="datagrid1" sizeList="[10,20,50,100,1000,5000,10000]" frozenStartColumn="0" frozenEndColumn="10"showPager="true" dataField="omRecruits"
	        	showSummaryRow="true" class="nui-datagrid" style="width:100%;height:330px;" ondrawcell="ondrawOmRecList"
	        	url="org.gocom.abframe.org.recruit.omRecruitList.biz.ext"  ondrawsummarycell="onDrawSummaryCell"
	        	multiSelect="true" allowSortColumn=true allowCellWrap="false">
	            <div property="columns">
	            	<div type="checkcolumn"></div>
	            	<div field="recruitno" width="80" headerAlign="center" align="center" renderer="getDetail">需求编号</div>
	                <div field="orgname" width="120" align="left" headerAlign="center" allowSort="true">招聘部门</div>
	                <div field="recposition" width="120" align="left" headerAlign="center" allowSort="true" renderer="getPositionname">招聘职位分类</div>
	                <div field="recpositionname" width="120" align="left" headerAlign="center" allowSort="true">招聘职位名称</div>
	                <div field="recnum" width="60" align="right" headerAlign="center" allowSort="true" summaryType="sum"  >招聘数量</div>
	                <div field="finishnum" width="60" align="right" headerAlign="center" allowSort="true" summaryType="sum"  >已完成数</div>
	                <div field="propdate" width="80" align="center" allowSort="true" dateFormat="yyyy-MM-dd" headerAlign="center">提出时间</div>
					<div field="hopedate" width="80" align="center" allowSort="true" dateFormat="yyyy-MM-dd" headerAlign="center">期望入职时间</div>
	                <div field="status" width="60" align="center" headerAlign="center" allowSort="true" renderer="getStatus">招聘状态</div>
	                <div field="hctype" width="60" align="center" headerAlign="center" allowSort="true" renderer="getHctype">HC类型</div>
	                <div field="joblevel" width="60" align="center" headerAlign="center" allowSort="true" renderer="getJoblevel">岗位级别</div>
	                <div field="approvalstatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="getApprovalStatus">需求审批状态</div>
	                <div field="recempname" width="60" align="center" headerAlign="center" allowSort="true" >招聘专员</div>
	                <div field="syqname" width="90" align="left" headerAlign="center" allowSort="true">一级部门</div>
	                <div field="sybname" width="100" align="left" headerAlign="center" allowSort="true">二级部门</div>
	                <div field="ywdyname" width="120" align="left" headerAlign="center" allowSort="true">三级部门</div>
	                <div field="jobtype" width="60" align="center" headerAlign="center" allowSort="true" renderer="getJobType">人员性质</div>
	                <div field="position" width="60" align="center" headerAlign="center" allowSort="true" renderer="getPosition">员工属性</div>
	                <div field="priority" width="60" align="center" headerAlign="center" allowSort="true" renderer="getPriority">优先级别</div>
	                <div field="interempname" width="100" align="center" headerAlign="center" allowSort="true"  >主考官</div>
	                <div field="applyname" width="60" align="center" headerAlign="center" allowSort="true">申请人</div>
	                <div field="workplace" width="60" align="center" headerAlign="center" allowSort="true" renderer="getWorkspace">工作地点</div>
	                <div field="isheadhunting" width="80" align="center" headerAlign="center" allowSort="true" renderer="getYN">是否采用猎头</div>
					<div field="confirmdate" width="80" align="center" allowSort="true" dateFormat="yyyy-MM-dd" headerAlign="center">确认时间</div>
					<div field="recbackground" width="200" align="left" allowSort="true" dateFormat="yyyy-MM-dd" headerAlign="center">招聘需求背景</div>
	                <div field="remark" width="200" align="left" headerAlign="center" allowSort="true">备注</div>
	            </div>
	        </div>
		</div>
    </div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	
	init();
	function init(){
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		String userorgid=user.getUserOrgId();
		%>
		//按钮权限的控制
	    getOpeatorButtonAuth("omRecruitList_addRec,omRecruitList_editRec,omRecruitList_removeBtn,omRecruitList_exportRec,omRecruitList_startEntryFlow");//操作按钮权限初始化
		
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
					
		var json = {"code":"omRecruitList","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("applyuserid").setValue('<%=nowuserid %>');
						nui.get("interviewer").setValue('<%=nowuserid %>');
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
						nui.get("tempCond11").setValue("=");
        				nui.get("tempCond21").setValue("");
					}else{
						nui.get("orgids").setValue(text.orgids);
					}
					nui.get("orgid").setData(text.orgs);
				}else{
					// 没有有权的机构时只能查项目负责人为自己的数据
					nui.get("applyuserid").setValue('<%=nowuserid %>');
					nui.get("interviewer").setValue('<%=nowuserid %>');
				}
				search();
			}
		});
	}
	
	function search(){
		if(nui.get("orgid").getValue() == ""){
    		nui.get("tempCond11").setValue("=");
    		nui.get("tempCond21").setValue("");
    	}else{
    		nui.get("tempCond11").setValue("in");
    		nui.get("tempCond21").setValue("1");
    	}
		var data = form.getData();
		grid.load(data);
		grid.sortBy("confirmdate","desc");
	}
	
	function reset(){
		form.reset();
		init();
	}
	
	function onDrawSummaryCell(e){
		var result = e.result;
	    var grid = e.sender;
	    if (e.field == "orgname") {
	        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
	    }
	    if (e.field == "recnum"||e.field=="finishnum") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	}
	
	//新增需求
	function addRec(){
		nui.open({
            url: "<%=request.getContextPath() %>/abframe/org/recruit/omRecruitInput.jsp",
            title: "新增招聘需求", 
            width: 1100, 
            height: 500,
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
	function editRec(){
		var row = grid.getSelected();
		if (row) {
			nui.open({
	            url: "<%=request.getContextPath() %>/abframe/org/recruit/omRecruitInput.jsp",
	            title: "编辑招聘需求", 
	            width: 1100, 
	            height: 500,
	            onload: function () {
	                var iframe = this.getIFrameEl();
	                var data = { action: "edit",recruitid:row.recruitid};
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
        var data = {omRecruits:rows};
        var json = nui.encode(data);
        if (rows.length > 0) {
            if (confirm("确定删除选中记录？")) {
                grid.loading("操作中，请稍后......");
                nui.ajax({
                    url: "org.gocom.abframe.org.recruit.deleteRecruits.biz.ext",
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
        } else {
            nui.alert("请选中一条记录");
        }
    }

	function startInterviewFlow(){
		var row = grid.getSelected();
		if(row){
			if(row.status != '0' && row.status != '1'){
				nui.alert("只有状态为招聘中和长期招聘才可以安排面试！","提示");
				return false;
			}
		}else{
			nui.alert("请您选择一条招聘需求！","提示");
			return false;
		}
		nui.open({
			url: "<%=request.getContextPath() %>/ame_permanage/ame_interview/createInterviewProcess.jsp?id=" + row.recruitid,
            title: "发起面试安排流程", 
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
    
    function exportRec(){
    	if(!confirm("是否确认导出？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "org.gocom.abframe.org.recruit.exportRecruit.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "omrecruit";
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
    
    function getDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='getOmRecruitDetail();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function getOmRecruitDetail(){
    	var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/abframe/org/recruit/omRecruitDetail.jsp?recruitid=" + selectRow.recruitid;
		window.open(executeUrl);
    }
    function ondrawOmRecList(e){
    	var record = e.record;
    	var date = new Date();
    	var dateTime = Date.parse(date);
    	var hopetime = Date.parse(record.hopedate);
    	var status = record.status;
    	var isin = (status =='0' || status =='1')?true:false;
    	if(dateTime > hopetime && isin){
    		e.rowStyle = "background-color: #FF99CC";
    	}
    }
	function getJobType(e){
		return nui.getDictText('AME_EMPTYPE2',e.value);
	}
	function getPosition(e){
		return nui.getDictText('EMP_TYPE',e.value);
	}
	function getPriority(e){
		return nui.getDictText('MIS_EMERLEVEL',e.value);
	}
	function getWorkspace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	function getYN(e){
		return nui.getDictText('MIS_YN',e.value);
	}
	function getStatus(e){
		return nui.getDictText('RECRUIT_STATUS',e.value);
	}
	function getApprovalStatus(e){
		var record = e.record;
    	var processinstid = e.record.processinstid;
        if(processinstid!=null && processinstid!=''){
			return "<a href='javascript:void(0)' onclick='feeView("  + processinstid + ");' title='点击查看'>" + nui.getDictText('RECRUIT_APPROVAL_STATUS',e.value) + "</a>";
		}else{
			return  nui.getDictText('RECRUIT_APPROVAL_STATUS',e.value);
		}
	}
	function feeView(processInstID){
		var url = "/default/bps/wfclient/task/processinstView.jsp";
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
	//职位类型
	function getPositionname(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);
	}
	//hc类型
	function getHctype(e){
		return nui.getDictText('RECRUIT_HCTYPE',e.value);
	}
	//岗位级别
	function getJoblevel(e){
		return nui.getDictText('AME_TECH',e.value);
	}
</script>
</html>