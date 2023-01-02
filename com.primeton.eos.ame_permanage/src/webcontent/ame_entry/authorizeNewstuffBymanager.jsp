<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-08-06 10:43:15
  - Description:
-->
<head>
<title>员工授权/授权审核</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
</style>
</head>
<body>
<%long workItemID = (Long)request.getAttribute("workItemID"); %>
<div class="nui-fit">
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<form id=form_Intend method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<input name="emp.orgid" id="orgid" class="nui-hidden">
			<input name="emp.userid" id="userid" class="nui-hidden">
			<input name="emp.operatorid" id="operatorid" class="nui-hidden">
			<input name="emp.oemail" id="oemail1" class="nui-hidden">
			<input name="omIntendJoin.intendid" id="intendid"  class="nui-hidden"/>
			<input name="omIntendJoin.userid" id="userid"  class="nui-hidden"/>
			<input name="omIntendJoin.processinstid" id="processinstid2"  class="nui-hidden"/>
			<input name="omIntendJoin.fileids" id="fileids1" class="nui-hidden"/>
			<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
			<legend >新员工入职信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:80px;">员工工号:</td>
                		<td name="emp.empcode" id="empcode" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:80px;">姓名:</td>
                		<td name="emp.empname" id="empname" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:80px;">性别:</td>
                		<td name="emp.gender" id="gender" class = "asLabel" style="width:190px"></td>
					</tr>
	                <tr>
						<td align="right" style="font-size:12px;width:80px;">员工属性:</td>
                		<td name="emp.emptype" id="emptype" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:80px;">人员性质:</td>
                		<td name="emp.nature" id="nature" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:80px;">人员成本属性:</td>
                		<td name="emp.degree" id="degree" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">入职日期:</td>
                		<td name="emp.indate" id="indate" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:80px;">职位分类:</td>
                		<td name="emp.positionname" id="positionname" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:80px;">职位名称:</td>
                		<td name="emp.positioncall" id="positioncall" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
					    <td align="right" style="width:80px;">职位级别:</td>
                		<td name="emp.joblevel" id="joblevel" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:80px;">直接主管:</td>
                		<td name="emp.major" id="major" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:80px;">工作地:</td>
                		<td name="emp.workplace" id="workplace" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
					    <td align="right" style="width:80px;">所属公司:</td>
                		<td name="emp.company" id="company" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:80px;">办公电话:</td>
                		<td name="emp.otel" id="otel" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:80px;">办公邮编:</td>
                		<td name="emp.ozipcode" id="ozipcode" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
					    <td align="right" style="width:80px;">办公邮件:</td>
                		<td name="emp.oemail" id="oemail" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:80px;">工作描述:</td>
                		<td name="emp.workexp" id="workexp" class = "asLabel" style="width:190px" colspan="3"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">备注:</td>
                		<td name="emp.remark" id="remark" class = "asLabel" style="width:190px" colspan="5"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
		<legend >角色授权</legend>
			<div style="padding:5px;">
				<table>
			        <tr>
			            <td >
			                <div id="listbox1" class="nui-datagrid" style="width:450px;height:150px;"
			                    dataField = "roles" multiSelect="true" onselectionchanged="changeRole"
			                     showPager="false" url="com.primeton.eos.ame_permanage.ame_entry.getAuthorizeRoles.biz.ext">   
			                    <div property="columns">
			                    	<div type="checkcolumn"></div>
			                        <div header="可授权角色" field="rolename"></div>
			                    </div>
			                </div>
			            </td>
			            <td style="width:120px;text-align:center;">
			                <input type="button" value=">>" onclick="addAll()" style="width:40px;"/><br />
			                <input type="button" value="&lt;&lt;" onclick="removeAll()" style="width:40px;"/><br />
			            </td>
			            <td>
			                <div id="listbox2" class="nui-datagrid" style="width:450px;height:150px;" dataField="roles" onselectionchanged="changeRole1"                   
			                      showPager="false" showCheckBox="true" multiSelect="true" url="org.gocom.abframe.org.party.PartyManager.queryEmployeeRole.biz.ext"
			                     >     
			                    <div property="columns">
			                    	<div type="checkcolumn"></div>
			                        <div header="ID" field="roleid"></div>
			                        <div header="已授权角色" field="rolename"></div>
			                    </div>
			                </div>
			            </td>
			        </tr>
			    </table>
		    </div>   
		</fieldset>
		
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
		<legend >邮件组授权</legend>
			<div style="padding:5px;">
				<table>
			        <tr>
			            <td >
			                <div id="mailbox1" class="nui-datagrid" style="width:450px;height:150px;"
			                    dataField = "EmailGroup" multiSelect="true" onselectionchanged="changeEmail" 
			                     showPager="false" url="com.primeton.eos.ame_permanage.ame_entry.getAuthorizeEmails.biz.ext">   
			                    <div property="columns">
			                    	<div type="checkcolumn"></div>
			                        <div header="邮件组地址" field="emailGroupAcc"></div>
			                        <div header="可授权邮件组" field="emailGrouName"></div>
			                    </div>
			                </div>
			            </td>
			            <td style="width:120px;text-align:center;">
			                <input type="button" value=">>" onclick="addmailAll()" style="width:40px;"/><br />
			                <input type="button" value="&lt;&lt;" onclick="removemailAll()" style="width:40px;"/><br />
			            </td>
			            <td>
			                <div id="mailbox2" class="nui-datagrid" style="width:450px;height:150px;" dataField="EmailGroup"  onselectionchanged="changeEmail1"                  
			                      showPager="false" showCheckBox="true" multiSelect="true" url="com.primeton.eos.ame_permanage.ame_entry.getAuthorizeEmails.biz.ext"
			                     >     
			                    <div property="columns">
			                    	<div type="checkcolumn"></div>
			                        <div header="邮件组地址" field="emailGroupAcc"></div>
			                        <div header="已授权邮件组" field="emailGrouName"></div>
			                    </div>
			                </div>
			            </td>
			        </tr>
			    </table>
		    </div>   
		</fieldset>
		
		<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
			<legend >人员当年专项费用额度</legend>
			<div><span style="color: red">注意：1、如不给某项专项额度则无需新增该项额度的明细；</span></div>
			<div><span style="color: red">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   2、“据实报销”的意思是根据实际发生报销，即系统不做额度上限控制。</span></div>
			<div><span style="color: red">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   3、如有需要，请手动添加一条通讯费用额度。</span></div>
			<div><span style="color: red">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   4、入职当月的专项额度是根据入职月的在职天数折算的，即入职月的专项额度=每月专项额度*入职后的在职天数（含入职当天）/入职月份天数，（例：某员工于2020-03-15日入职，每月交通专项额度为600，那么3月当月交通专项额度=600*17/31=329（四舍五入取整），4月及以后月份每月交通专项额度=600）。</span></div>
			<div style="width:140px;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" id="addSpeQuo" iconCls="icon-add" onclick="addRow('speQuo')">增加</a>
		                        <a class="nui-button" id="editSpeQuo" iconCls="icon-remove" onclick="removeRow('speQuo')">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
		    <!-- 人员专项额度新增 -->
		    <div id="speQuo" class="nui-datagrid" dataField="speQuotas" style="width:100%;height: auto"  
					showPager="false" allowAlternating="true" allowCellSelect="true" allowCellEdit="true" 
					url="com.primeton.eos.ame_permanage.ame_entry.querySpeQuota.biz.ext" multiSelect="true" oncellendedit="doCalspeQuo"
					>
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="empname" width="60px" align="center"  headerAlign="center" >员工</div>
					<div field="year" width="60px" align="center"  headerAlign="center" >年
						<input property="editor" class="nui-combobox"valueField="id" textField="text" data="yearlist" />
					</div>
					<div field="month" width="60px" align="center" renderer="setMonth"  headerAlign="center">起始月
						<input property="editor" class="nui-combobox" showNullItem="false"valueField="id" textField="text" data=[{"id":"01","text":"01"},{"id":"02","text":"02"},{"id":"03","text":"03"},{"id":"04","text":"04"},{"id":"05","text":"05"},{"id":"06","text":"06"},{"id":"07","text":"07"},{"id":"08","text":"08"},{"id":"09","text":"09"},{"id":"10","text":"10"},{"id":"11","text":"11"},{"id":"12","text":"12"}] />
					</div>
					<div field="quotype" width="100px" align="center"  renderer="quoType" headerAlign="center">费用类型
						<input property="editor" class="nui-dictcombobox" dictTypeId="AME_SPEQUOTYPE"/>
					</div>
					<div field="feetype" width="100px" align="center"  renderer="feetype" headerAlign="center">额度控制方式
						<input property="editor" class="nui-dictcombobox" dictTypeId="AME_SPEFEETYPE"/>
					</div>
					<div field="stdquota" width="100px" align="right"  headerAlign="center">额度
						<input property="editor" class="nui-spinner"  showbutton="false" inputStyle="text-align: right;" changeOnMousewheel="false" format="n2" allowLimitValue="false"/>
					</div>
				</div>
			</div>
		</fieldset>
		
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<legend >人员销售费用额度</legend>
			<div style="width:140px;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" id="addSpeQuo" iconCls="icon-add" onclick="addRow('saleQuo')">增加</a>
		                        <a class="nui-button" id="editSpeQuo" iconCls="icon-remove" onclick="removeRow('saleQuo')">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
		    <!-- 人员销售额度新增 -->
		    <div id="saleQuo" class="nui-datagrid" dataField="saleQuotas" style="width:100%;height: auto"  
					showPager="false" allowAlternating="true" allowCellSelect="true" allowCellEdit="true" oncellmousedown="oncellmousedown"
					url="com.primeton.eos.ame_permanage.ame_entry.querySaleQquata.biz.ext" multiSelect="true"
					>
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="orgname" width="60px" align="center"  headerAlign="center" >销售</div>
					<div field="year" width="60px" align="center"  headerAlign="center" >年
						<input property="editor" class="nui-combobox"valueField="id" textField="text" data="yearlist" />
					</div>
					<div field="month" width="60px" align="center" renderer="setMonth"  headerAlign="center">起始月
						<input property="editor" class="nui-combobox" showNullItem="false"valueField="id" textField="text" data=[{"id":"01","text":"01"},{"id":"02","text":"02"},{"id":"03","text":"03"},{"id":"04","text":"04"},{"id":"05","text":"05"},{"id":"06","text":"06"},{"id":"07","text":"07"},{"id":"08","text":"08"},{"id":"09","text":"09"},{"id":"10","text":"10"},{"id":"11","text":"11"},{"id":"12","text":"12"}] />
					</div>
					<div field="spequota" width="0px" align="right"  headerAlign="center">每月特批额度
						<input property="editor" class="nui-spinner"  showbutton="false" inputStyle="text-align: right;" changeOnMousewheel="false" format="n2" allowLimitValue="false"/>
					</div>
					<div field="basequota" width="100px" align="right"  headerAlign="center">每月销售额度
						<input property="editor" class="nui-spinner"  showbutton="false" inputStyle="text-align: right;" changeOnMousewheel="false" format="n2" allowLimitValue="false"/>
					</div>
				</div>
			</div>
		</fieldset>
	</form>
	
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		<legend>入职附件</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</fieldset>
	
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;display:none">
		<legend>处理意见附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
</div>

<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="appButton">提交</a>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_Intend = new nui.Form("form_Intend");
	var speQuo = nui.get("speQuo");
	var saleQuo = nui.get("saleQuo");
	var listbox1 = nui.get("listbox1");
    var listbox2 = nui.get("listbox2");
    var mailbox1 = nui.get("mailbox1");
    var mailbox2 = nui.get("mailbox2");
    var orgid = ''; var userid = ''; var orgname = ''; var empname = '';var degree = '';var operatorid = '';
    
    //动态设置财务年的值，为当前日期前两年到后两年的数组
    var nowdate = new Date();
    var year = nowdate.getFullYear();
	var yearlist = [{id: year-2,text: year-2},{id: year-1,text: year-1},{id: year,text: year},{id: year+1,text: year+1},{id: year+2,text: year+2}];
	
	initdate();
  	function initdate(){
  		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		//初始入职人员信息
       	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_entry.getProcessEntry.biz.ext",
            data: {intendid:null,workItemID:<%=workItemID %>,processInstID:null},
            type: 'POST',
            cache: false,
   			async:false,
            contentType: 'text/json',
            success: function (o) {
            	if(o.omIntendJoin){
            		form_Intend.setData(o);
					document.getElementById("empcode").innerHTML = o.emp.empcode == null ?"":o.emp.empcode;
            		document.getElementById("empname").innerHTML = o.emp.empname == null ?"":o.emp.empname;
            		document.getElementById("gender").innerHTML = o.emp.gender == null ?"":nui.getDictText("ABF_GENDER",o.emp.gender);
            		document.getElementById("emptype").innerHTML = o.emp.emptype == null ?"":nui.getDictText("EMP_TYPE",o.emp.emptype);
            		document.getElementById("degree").innerHTML = o.emp.degree == null ?"":nui.getDictText("AME_EMPTYPE2",o.emp.degree);
            		document.getElementById("indate").innerHTML = o.emp.indate == null ?"":o.emp.indate;
            		document.getElementById("positionname").innerHTML = o.emp.positionname == null ?"":nui.getDictText("AME_POSITION_MEMO",o.emp.positionname);
            		document.getElementById("positioncall").innerHTML = o.emp.positioncall == null ?"":o.emp.positioncall;
            		document.getElementById("joblevel").innerHTML = o.emp.joblevel == null ?"":nui.getDictText("AME_TECH",o.emp.joblevel);
            		document.getElementById("major").innerHTML = o.emp.majorname == null ?"":o.emp.majorname;
            		document.getElementById("workplace").innerHTML = o.emp.workplace == null ?"":nui.getDictText("AREA4CLRY",o.emp.workplace);
            		document.getElementById("company").innerHTML = o.emp.company == null ?"":nui.getDictText("company",o.emp.company);
            		document.getElementById("otel").innerHTML = o.emp.otel == null ?"":o.emp.otel;
            		document.getElementById("ozipcode").innerHTML = o.emp.ozipcode == null ?"":o.emp.ozipcode;
            		document.getElementById("oemail").innerHTML = o.emp.oemail == null ?"":o.emp.oemail;
            		document.getElementById("workexp").innerHTML = o.emp.workexp == null ?"":o.emp.workexp;
            		document.getElementById("remark").innerHTML = o.emp.remark == null ?"":o.emp.remark;
            		
            		var empid = o.emp.empid;
					orgid = nui.get("orgid").getValue();
					userid = o.emp.userid;
					orgname = o.emp.empname;
					empname = o.emp.empname;
					operatorid = o.emp.operatorid;
					degree = o.emp.degree;
					var json_spe = ({"criteria": 
                                    {"_expr[0]": {"userid": userid}},processinstid:o.omIntendJoin.processinstid});
					var json_sale = ({"criteria": 
                                    {"_expr[0]": {"orgid": orgid}},processinstid:o.omIntendJoin.processinstid});
                	speQuo.load(json_spe,function(){
                		var speQuos = speQuo.getData();
                		/* if(speQuos.length>0){
	            		}else{
							var date1 = new Date();
							var year1 = date1.getFullYear();
							var month1 =date1.getMonth()+1;
							if(month1<10){
								month1 = '0'+month1;
							}
							var newRow = { name: "New Row",status: "0",userid:userid,empname:empname,year:year1,month:month1,quotype: "2" };
				  		 	var newRow1 = { name: "New Row",status: "0",userid:userid,empname:empname,year:year1,month:month1,quotype: "1" };
				  		 	
				  		 	speQuo.addRow(newRow, 0);
				  		 	speQuo.addRow(newRow1, 0);
	            		} */
                	});
                	saleQuo.load(json_sale,function(){
                		if(degree == '1'){
							document.getElementById("field6").style.display="none";
							var saleQuos = saleQuo.getData();
	                		if(saleQuos.length>0){
		            		}else{
								addRow("saleQuo");
		            		}
						}else{
							document.getElementById("field6").style.display="none";
						}
                	});
                	var role_json = {"omEmployee":{"empid":empid},"acOperator":{"operatorid":operatorid},"type":"self"};
                	listbox2.load(role_json,function(){
	                	var roleids = ""
	                	var role = listbox2.getData();
	                	for(var i=0;i<role.length;i++){
	                		if(roleids == ""){
	                			roleids = "'"+role[i].roleid+"'";
	                		}else{
	                			roleids = roleids+",'"+role[i].roleid+"'";
	                		}
	                	}
	                	var authrole_json = {"roleids":roleids}
	                	//alert(nui.encode(authrole_json));
	                	listbox1.load(authrole_json);
                	});
                	
                	var json_mail1 = {"orgid": orgid,"emailgroupids":o.omIntendJoin.EmaiGroupIDs,emailgroupids1:null};
                	mailbox1.load(json_mail1,function(){
                		var emailgroupids1 = o.omIntendJoin.EmaiGroupIDs;
                		if(emailgroupids1 != null && emailgroupids1 != ''){
	                		var json_mail2 = {"orgid": orgid,"emailgroupids":null,emailgroupids1:emailgroupids1};
	                		mailbox2.load(json_mail2);
                		}
                	});
					
            		//附件加载
            		nui.get("grid_0").load({"groupid":"omIntendJoin","relationid":o.omIntendJoin.intendid});
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.omIntendJoin.processinstid);
					//流程回退路径赋值 
                	nui.get("backTo").setData(o.omIntendJoin.backList);
               		//审核结果设置
					var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("1");
					nui.get("auditopinion").setValue("同意。");
					nui.get("workitemid").setValue(<%=workItemID %>);
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
					var processinstid = o.omIntendJoin.processinstid;
					var grid = nui.get("datagrid1");
					grid.sortBy("time", "desc");
					grid.load({"processInstID": processinstid});
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});
  	}
  	
  	//提交流程
  	var spemessage = '';
	function onOk(){
		var auditstatus = nui.get("auditstatus").getValue();
		if(auditstatus!="2"){
			//人员专项费用额度
			speQuoList = speQuo.getData();
			if(speQuoList.length>0){
				for(var i = 0 ;i < speQuoList.length;i++){
					if(speQuoList[i].year == null || speQuoList[i].year ==""){
						nui.alert("请填写人员专项额度年份");
			        	return;
					}else if(speQuoList[i].month == null || speQuoList[i].month ==""){
						nui.alert("请填写人员专项额起始月份");
			        	return;
					}else if(speQuoList[i].quotype == null || speQuoList[i].quotype ==""){
						nui.alert("请选择人员专项额额度类型");
			        	return;
					}else if(speQuoList[i].feetype == null || speQuoList[i].feetype ==""){
			        	nui.alert("请选择人员专项额专项报销类型");	
			        	return;
					}else if((speQuoList[i].stdquota == null || speQuoList[i].stdquota =="")&&speQuoList[i].stdquota !=0){
						if(speQuoList[i].feetype == "1"){
				        	nui.alert("请填写人员专项额标准额度");	
				        	return;
						}
					}
				}
				spemessage = '';
			} else{
				spemessage = '请确认人员专项费用额度！';
			}
			
			speSaleList = saleQuo.getData();
			if(speSaleList.length>0){
				for(var i = 0 ;i < speSaleList.length;i++){
					if(speSaleList[i].year == null || speSaleList[i].year ==""){
						nui.alert("请填写人员销售额度年份");
			        	return;
					}else if(speSaleList[i].month == null || speSaleList[i].month ==""){
						nui.alert("请填写人员销售额起始月份");
			        	return;
					}else if(speSaleList[i].spequota == null || speSaleList[i].spequota ==""){
						if(speSaleList[i].spequota == 0){
						}else{
				        	nui.alert("请填写人员销售额本月特批额度");	
				        	return;
						}
					}else if(speSaleList[i].basequota == null || speSaleList[i].basequota ==""){
			        	if(speSaleList[i].basequota == 0){
			        	}else{
				        	nui.alert("请填写人员销售额本月基本额度");
				        	return;
			        	}
					}
				}
			}else if(degree == '1'){
				nui.alert("人员销售费用额度必填！");
	        	return;
			}
			var filePaths = document.getElementsByName("uploadfile").length;
	    	for(var j = 0;j < filePaths;j++){
	    		var a = document.getElementsByName("remarkList")[j].value;
	    		if(a == null || a == ""){
	    			nui.alert("新增附件不可以为空");
	    			return false;
	    		}
	    	}
    	}else{
    		spemessage = '';
    	}
    	if(!form_Intend.validate() && auditstatus!="2"){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		document.getElementById("fileCatalog").value="omIntendJoin";
    		form2.submit();
		}
	}
	//保存
	function SaveData(){
		var json = form_Intend.getData();
		var message = "提交";
		//审批意见
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		
		json.acOprRole = listbox2.getChanges();
		json.speQuoList = speQuo.getData();
		json.saleQuoList = saleQuo.getData();
		json.emailGroups = mailbox2.getData();
		
		var mailgroup = mailbox2.getData();
		var EmaiGroupIDs = '';
		for(var i = 0;i < mailgroup.length;i++){
			if (EmaiGroupIDs ==''){
				EmaiGroupIDs = mailgroup[i].emailGroupId;
			}else{
				EmaiGroupIDs = EmaiGroupIDs + ','+ mailgroup[i].emailGroupId;
			}
		}
		json.omIntendJoin.EmaiGroupIDs = EmaiGroupIDs;
		
		var backTo = nui.get("backTo").getValue();
		//回退信息
		if(backTo == 'manualActivity3' || backTo == 'autoActivity' || backTo == 'manualActivity4'){
		  json.omIntendJoin.backflag = "2";
		}
		else if(backTo == 'manualActivity' || backTo == 'manualActivity1' || backTo == 'manualActivity13')
		{
		  json.omIntendJoin.backflag = "3";
		  if(backTo == 'manualActivity13' || backTo == 'manualActivity')
			{
			  	json.omIntendJoin.adminBackFlag = "1";
	  			json.omIntendJoin.otherBackFlag = "0";	
			}
		}
		
		nui.confirm(spemessage+"确定要"+message+"新员工入职流程吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
				form_Intend.loading("处理中,请稍后...");
	    		nui.ajax({
	    			url:"com.primeton.eos.ame_permanage.ame_entry.EntryProcessReve.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form_Intend.unmask();
	    				if(action.exception == null){
	    					var creatwx = "";
	    					if(action.eGroupresult == '0'){
		                    	creatwx = "但邮件组授权失败，请联系信息技术部。";
		                    }
	    					nui.alert(message+"新员工入职流程成功！"+creatwx,"系统提示",function(){
				        		CloseWindow("ok");
			    				nui.get("appButton").setEnabled(true);
				        	});
	    				}else if(action.exception == "fallsendmail"){
				        	nui.alert(message+"新员工入职流程成功！提醒邮件发送失败，请手动发送入职提醒邮件！","系统提示",function(){
				        		CloseWindow("ok");
			    				nui.get("appButton").setEnabled(true);
				        	});
	    				}else{
	    					nui.alert("流程提交失败！","系统提示",function (){
			    				nui.get("appButton").setEnabled(true);
	    					});
	    				}
	    			},
	    			error:function(jqXHR, teactionatus, errorThrown){
	    				nui.alert("error:" + jqXHR.responseText);
	    			}
	    		});
			}
		});
	}
  	
  	function addRow(gridid){
  		var date1 = new Date();
		var year1 = date1.getFullYear();
		var month1 =date1.getMonth()+1;
		if(month1<10){
			month1 = '0'+month1;
		}
		
  		var newRow = ''
  		if(gridid == "speQuo"){
  			newRow = { name: "New Row",status: "0",userid:userid,empname:empname,year:year1,month:month1,quotype: "2" };
  		}else if (gridid == "saleQuo"){
  			newRow = { name: "New Row",status: "0",orgid:orgid,orgname:orgname,year:year1,month:month1,spequota: 0 };
  		}else{
			var newRow = { name: "New Row",status: "0" };
  		}
        var grid = nui.get(gridid);
        grid.addRow(newRow, 0);
	}
	
	function removeRow(gridid){
		var grid = nui.get(gridid);
        var rows = grid.getSelecteds();
        var num = rows.length;
        if (rows.length > 0) {
        	if(confirm("确定删除"+num+"条记录吗？")){
        		grid.removeRows(rows, false);
        	}else{
        		return false;
        	}
        }else{
			alert("请选择一条记录！"); 
        }
	}
	//角色授权控件控制
	function add(){
        var items = listbox1.getSelecteds();
        listbox1.removeRows(items,false);
        for(var i=0;i<items.length;i++){
        	listbox2.addRow({acOperator:{"operatorid":operatorid},roleid:items[i].roleid,rolename:items[i].rolename}, 0);
        }
    }
    function addAll(){
        var items = listbox1.getData();
        listbox1.removeRows(items,false);
        for(var i=0;i<items.length;i++){
        	listbox2.addRow({acOperator:{"operatorid":operatorid},roleid:items[i].roleid,rolename:items[i].rolename}, 0);
        }
    }
    function removes(){
        var items = listbox2.getSelecteds();
        listbox2.removeRows(items, false);
        for(var i=0;i<items.length;i++){
        	listbox1.addRow({acOperator:{"operatorid":operatorid},roleid:items[i].roleid,rolename:items[i].rolename}, 0);
        }
    }
    function removeAll(){
        var items = listbox2.getData();
        listbox2.removeRows(items, false);
        for(var i=0;i<items.length;i++){
        	listbox1.addRow({acOperator:{"operatorid":operatorid},roleid:items[i].roleid,rolename:items[i].rolename}, 0);
        }
    }
    function changeRole(){
    	add();
    }
    function changeRole1(){
    	removes();
    }
    
    //邮箱授权控件控制
	function addmail(){
        var items = mailbox1.getSelecteds();
        mailbox1.removeRows(items,false);
        for(var i=0;i<items.length;i++){
        	mailbox2.addRow({emailGroupId:items[i].emailGroupId,emailGroupAcc:items[i].emailGroupAcc,emailGrouName:items[i].emailGrouName,emailGrouOrgs:items[i].emailGrouOrgs}, 0);
        }
    }
    function addmailAll(){
        var items = mailbox1.getData();
        mailbox1.removeRows(items,false);
        for(var i=0;i<items.length;i++){
        	mailbox2.addRow({emailGroupId:items[i].emailGroupId,emailGroupAcc:items[i].emailGroupAcc,emailGrouName:items[i].emailGrouName,emailGrouOrgs:items[i].emailGrouOrgs}, 0);
        }
    }
    function removesmail(){
        var items = mailbox2.getSelecteds();
        mailbox2.removeRows(items, false);
        for(var i=0;i<items.length;i++){
        	mailbox1.addRow({emailGroupId:items[i].emailGroupId,emailGroupAcc:items[i].emailGroupAcc,emailGrouName:items[i].emailGrouName,emailGrouOrgs:items[i].emailGrouOrgs}, 0);
        }
    }
    function removemailAll(){
        var items = mailbox2.getData();
        mailbox2.removeRows(items, false);
        for(var i=0;i<items.length;i++){
        	mailbox1.addRow({emailGroupId:items[i].emailGroupId,emailGroupAcc:items[i].emailGroupAcc,emailGrouName:items[i].emailGrouName,emailGrouOrgs:items[i].emailGrouOrgs}, 0);
        }
    }
    function changeEmail(){
    	addmail();
    }
    function changeEmail1(){
    	removesmail();
    }
    
	//关闭
	function onCancel(e) {
    	var data = form_Intend.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action=="yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
		}
    }
    function CloseWindow(action){
		if (action == "close" && form_Intend.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function doCalspeQuo(e){
		var row = e.record;
		if(row){
			if(row.feetype == '2' && row.stdquota != 0 && row.stdquota != null){
				nui.alert("人员专项费用额度据实报销不需要填写额度!");
				var rowData = {stdquota: 0};
				speQuo.updateRow(row,rowData);
			}
		}
	}
	
	//额度类型业务字典
    function quoType(e) {
		return nui.getDictText('AME_SPEQUOTYPE',e.value);//设置业务字典值
	}
	//专项报销类型
	function feetype(e){
		return nui.getDictText('AME_SPEFEETYPE',e.value);//设置业务字典值
	}
</script>
</html>