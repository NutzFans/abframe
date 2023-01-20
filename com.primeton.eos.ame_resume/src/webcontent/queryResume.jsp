<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-07-13 09:42:11
  - Description:
-->
<head>
	<title>查询简历</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width: 98%" class="body-font">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <legend>简历列表</legend>
	        <div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="queryform">
		        <table id="table1" style="width: 100%;height:32px;font-size:12px;" align="center" >
		        	<tr>
		        		<td align="right">姓名:</td>
		        		<td align="left">
			        		<input class="nui-textbox" name="criteria._expr[0]._value" id = "username">
							<input class="nui-hidden" name="criteria._expr[0]._property" value="empname">
							<input class="nui-hidden" name="criteria._expr[0]._op" value="like">
		        		</td>
		        		<td  width="100px" align="right">人员类型:</td>
						<td align="left">
							<input class="nui-dictcombobox" name="criteria._expr[1]._value" id="emptype" showNullItem="true" style="width:160px" dictTypeId="AME_EMPTYPE2" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[1]._property" value="emptype">
							<input class="nui-hidden" name="criteria._expr[1]._op" id="tempCond21" value="in">
						</td>
			        	<td  width="60px" align="right">技术级别:</td>
						<td align="left">
							<input class="nui-dictcombobox" name="criteria._expr[2]._value" showNullItem="true" id="tech" style="width:170px"  dictTypeId="AME_TECH" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[2]._property" value="technology">
							<input class="nui-hidden" name="criteria._expr[2]._op" id="tempCond31" value="in">
						</td>
					</tr>
					<tr>
						<td   align="right">学历:</td>
						<td align="left">
							<input class="nui-dictcombobox" name="criteria._expr[3]._value" style="width:125px" id="degree" showNullItem="true"  dictTypeId="DEGREE" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[3]._property" value="education">
							<input class="nui-hidden" name="criteria._expr[3]._op" id="tempCond41" value="in">
						</td>
						<td width="100px" align="right">证书类型:</td>
		        		<td align="left">
			        		<input class="nui-dictcombobox" name="criteria._ref[0]._expr[0]._value" style="width:160px" showNullItem="true" id="cardtype" dictTypeId="AME_CERTTYPE" multiselect="true"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="resumeid"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="in" id="tempCond51"/>
					        <input class="nui-hidden" name="criteria._expr[4]._ref" value="1" id="tempCond52"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.eos.ame_resume.resume.AmeResumeCert"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="ameResume.resumeid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="cardtype"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="in"/>
		        		</td>
		        		<td align="right">所属部门:</td>
			           	<td>
				         	 <input id="orgid"  name="criteria._expr[5]._value"  class="nui-combobox" 
							    textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" style="width:170px;" onenter="onKeyEnter" />
					    		<input class="nui-hidden" name="criteria._expr[5]._property" value="orgseq"/>
						        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						         <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="end"/>
						        
						        <input class="nui-hidden" name="criteria._expr[6]._property" value="orgid"/>
						        <input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
						        <input class="nui-hidden" name="criteria._expr[6]._value" id="orgids"/>
						        
						        <input class="nui-hidden" name="criteria._expr[7]._property" value="interviewstatus"/>
						        <input class="nui-hidden" name="criteria._expr[7]._op" value="="/>
						        <input class="nui-hidden" name="criteria._expr[7]._value" value="8"/>
			        	</td>
		        	</tr>
		        	
		        	<tr>
						<td align="center" colspan="15">
							<a class="nui-button grayBtn" iconCls="icon-search" onclick="search">查询</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="nui-button grayBtn" iconCls="icon-reload" onclick="reset">重置</a>
						</td>	
					</tr>
		        </table>
			</div>
			<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="addResume()">增加</a>
		                        <a class="nui-button" id="editBtn" iconCls="icon-edit" onclick="editResume()">编辑</a>
		                        <a class="nui-button" id="editBtn" iconCls="icon-download" onclick="downloadResume()">导出人员简历</a>
		                    </td>
		                </tr>
		             </table>           
		        </div>
		    </div>
		    <div id="searchResumeLogId" class="nui-datagrid bpsDatagrid"
				style="margin-top:0px;width: 100%;" dataField="queryResume"
				url="com.primeton.eos.ame_resume.resumeManage.queryResume.biz.ext" allowCellWrap="true"
				allowAlternating="true" pageSize="10" showPager="true" multiSelect="true">
				<div property="columns">
					<div type="checkcolumn" width="20px"></div>
					<div field="empname" headerAlign="center" align="center" renderer="getDetail" allowSort="true" width="40px">姓名</div>
					<div field="userid" headerAlign="center" align="center" allowSort="true" width="40px">工号</div>
					<div field="orgs" headerAlign="center" align="center" allowSort="true" width="50px">部门</div>
					<div field="technology" headerAlign="center" align="center" allowSort="true" width="30px" renderer="onTechRenderer">技术级别</div>
					<div field="education" headerAlign="center" align="center" allowSort="true" width="30px" renderer="onDegreeRenderer">学历</div>
					<div field="school" headerAlign="center" align="left" allowSort="true" width="100px">毕业学校</div>
					<div field="specialty" headerAlign="center" align="left" width=80px">专业</div>
					<div field="workdate" headerAlign="center" align="center" allowSort="true" width="40px">工作年月</div>
					<div field="indate" headerAlign="center" align="center" allowSort="true" width="40px">入职年月</div>
					<div field="files" renderer="onFileRenderer" width="100" align="left" headerAlign="center">附件</div>
				</div>
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
	var grid=nui.get("searchResumeLogId");
	var form = new nui.Form("#queryform");
	
	
	init();
	function init(){
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		String userorgid=user.getUserOrgId();
		%>
    		
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
					
		var json = {"code":"queryResume","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			async:false,
			contentType:'text/json',
			success:function(text){
				console.log()
				if(text.orgs){
					var isall;//是否拥有全公司的权限
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
        				nui.getbyName("criteria._expr[6]._op").setValue("=");
        				nui.getbyName("criteria._expr[6]._value").setValue("");
					}else{
						nui.get("orgids").setValue(text.orgids);
						if(text.orgids == null){
							var username = "<%=nowusername %>";
							nui.get("username").setValue(username);
							nui.get("username").setReadOnly(true);
						}
					}
					nui.get("orgid").setData(text.orgs);
				}
				search();
			}
		});
	}
		
<%--<!--	function init(){
		grid.load();
		grid.sortBy("empname", "asc");
	}
		-->--%>
	function search(){
		var cardtype = nui.get("cardtype").getValue();
		var tech = nui.get("tech").getValue();
		var degree = nui.get("degree").getValue();
		var emptype = nui.get("emptype").getValue();
		if(emptype == ""||emptype==null){
    		nui.get("tempCond21").setValue("=");
    	}else{
    		nui.get("tempCond21").setValue("in");
    	}
    	
		if(cardtype == ""||cardtype==null){
    		nui.get("tempCond51").setValue("=");
    		nui.get("tempCond52").setValue("");
    	}else{
    		nui.get("tempCond51").setValue("in");
    		nui.get("tempCond52").setValue("1");
    	}
    	
    	if(tech == ""||tech==null){
    		nui.get("tempCond31").setValue("=");
    	}else{
    		nui.get("tempCond31").setValue("in");
    	}
    	
    	if(degree == ""||degree==null){
    		nui.get("tempCond41").setValue("=");
    	}else{
    		nui.get("tempCond41").setValue("in");
    	} 
        var data = form.getData();
        grid.load(data);
        grid.sortBy("empname", "asc");
	}
	
	function reset(){
		form.reset();
		init();
	}
	
	function addResume(){
		nui.open({
            url: "<%=request.getContextPath() %>/ame_resume/modifyResume.jsp",
            title: "新增简历", 
            width: 1100, 
            height: 550,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = {action: "add" };
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
        		grid.reload();
            }
        });
	}
	
	function editResume(){
		var rows = grid.getSelecteds();
		if (rows.length > 1){
    		alert("只能选中一条记录进行编辑！");
    	}else{
            var row = grid.getSelected();
            if(row){
				nui.open({
		            url: "<%=request.getContextPath() %>/ame_resume/modifyResume.jsp",
		            title: "编辑简历", 
		            width: 1100, 
		            height: 550,
		            onload: function () {
		                var iframe = this.getIFrameEl();
		                var data = {action: "update", "resumeid": row.resumeid, "resume":{resume:row} };
		                iframe.contentWindow.SetData(data);
		            },
		            ondestroy: function (action) {
		        		grid.reload();
		            }
		        });
		    }else{
                alert("请选中一条记录！");
            }
		}
	}
	
	function getDetail(e){
        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    
    function checkDetail(){
    	var row = grid.getSelected();
    	nui.open({
            url: "<%=request.getContextPath() %>/ame_resume/showResume.jsp",
            title: "查看简历", 
            width: 1100, 
            height: 550,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = {action: "new", "resumeid": row.resumeid };
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
            }
        });
    }
    
    function downloadResume(){
    	var rows = grid.getSelecteds();
    	if(rows.length==0){
    		alert("请至少选中一条记录！");
    		return;
    	}else{
	    	var resumeids = "";
	    	for(var a = 0;a<rows.length;a++){
	    		var resumeid1 = rows[a].resumeid;
	    		if(a != 0){
	    			resumeid1 = "," + resumeid1;
	    		}
	    		resumeids += resumeid1;
	    	}
	    	var json = nui.encode({"resumeid":resumeids});
	    	nui.ajax({
    			url: "com.primeton.eos.ame_resume.resumeManage.exportResume.biz.ext",
    			data: json,
    			type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(text){
					nui.unmask();
		     		var filePath = text.downloadFile;
		        	var fileName = "简历";
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
    			error: function(jqXHR, textStatus, errorThrown){
    				alert(jqXHR.responseText);
    				CloseWindow();
    			}
    		});
		}
    }

	function onTechRenderer(e){
		return nui.getDictText('AME_TECH',e.value);//设置业务字典值
	}
	
	function onDegreeRenderer(e){
		return nui.getDictText('DEGREE',e.value);//设置业务字典值
	}
	
	function onFileRenderer(e) {
        var tempSrc = "";
    	//长度为1，不换行
    	if(e.record.files==null){
    		return;
    	}
    	if(e.record.files.length == 1){
        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
    	}else{
	        for(var i=0;i<e.record.files.length;i++){
	        	//长度大于1小于长度length换行
	        	if(i< e.record.files.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>&nbsp;&nbsp;";
	        	}
	        	//最后一个不换行
        		if(i == e.record.files.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
	        	}
	        }
    	}
       	return tempSrc;
     }
</script>
</body>
</html>