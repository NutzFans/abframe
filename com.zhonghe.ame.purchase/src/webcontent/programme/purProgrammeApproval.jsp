
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
	<title>采购方案 </title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>采购立项</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="files1" id="fileids1" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right">采购方案名称：</td>
								<td>
									<input enabled="false" name="programmeName" readOnly="readOnly" id="programmeName" class="nui-textbox" style="width: 300px" />
								</td>
							<td align="right" style="width:160px">采购立项编号：</td>
								<td><input name="proappId" id="proappId"  readOnly="readOnly" enabled="false"  onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" /></td>
							<td align="right" style="width: 120px">采购计划编号：</td>
								<td ><input
									name="planId" id="planId"
									class="nui-buttonedit" 
									enabled="false" 
									readOnly="readOnly" 
									style="width: 300px;"  /></td>
<!-- 								<td><input name="implementOrg"  class="nui-textbox" style="width: 300px"/></td> -->
							</tr>
							
              		<td class="form_label"  align="right" style="width:140px;">采购方案与文件说明：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 40px;" name="remark" id="remark" class="nui-textarea"  id="technologyNeed"  readOnly="readOnly"  dictTypeId="ZH_PURCHASE" />
                    </td>
              	</tr>
						</table>
					</div>
				</form>
			</fieldset>

			
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>采购文件附件</legend>
				
				<div >	
					<jsp:include page="/ame_common/inputFile.jsp"/>
				</div>
			</fieldset>



		</div>
	</div>
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px;margin-right: 20px;">加签</a>  
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">暂存</a>                
		<a class="nui-button" onclick="submit" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
<script type="text/javascript">
    nui.parse();
    <%
        UserObject user = (UserObject) session.getAttribute("userObject");
        String username = user.getUserName();
        String userno = user.getUserId();
        String userOrgName = user.getUserOrgName();
        String userOrgId = user.getUserOrgId();
        Map<String,Object> a = user.getAttributes();
        String empid = (String) a.get("empid");
        DataObject[] roles = (DataObject[])a.get("roles");
    %>
    var id = <%=request.getParameter("id")%>;
    var countersignUsers,titleText;
    init();
    function init(){
        var data = {workitemid:<%=workitemid%>};
        var json = nui.encode(data);
        nui.ajax({
            url: "com.zhonghe.ame.purchase.purchaseProgramme.queryPurProgramme.biz.ext",
            type: 'POST',
            data: json,
            success: function (o) {
                console.log(o.purProgrammes[0]);
                var result=o.purProgrammes[0];
                nui.get("programmeName").setValue(result.programmeName);
                nui.get("proappId").setValue(result.proappId);
                nui.get("proappId").setText(result.proAppCode);
                nui.get("planId").setValue(result.planId);
                nui.get("planId").setText(result.purchaseNumber);
                nui.get("remark").setValue(result.remark);

                var grid_0 = nui.get("grid_0");
                grid_0.load({"groupid":"purProgramme","relationid":result.id});
                grid_0.sortBy("fileTime","desc");
                var grid_1 = nui.get("grid_1");

                grid_1.load({"groupid":"purFile","relationid":result.id});
                grid_1.sortBy("fileTime","desc");
                
                var grid = nui.get("datagrid1");
                grid.load({processInstID:result.processid});
                grid.sortBy("time", "desc");
                //初始化处理意见
                initMisOpinion({auditstatus:"1"});
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
    }

    function selectProjectList(){
        var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
            title: "选择项目",
            width: 850,
            height: 420,
            allowResize: false,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.projectId);
                        btnEdit.setText(data.projectName);
                        //连带出项目服务客户
                        /*  var row = purProjOutper_grid.getSelected();
                         var rowData = {custid: data.custid,custname: data.custname,manager: data.userid,managername: data.manager};
                         purProjOutper_grid.updateRow(row,rowData);  */
                    }
                }
            }
        });
    }


    function selectOmEmployee(){
        var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择报销人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                    }
                }
            }
        });
    }
    
    function selectOmEmployee1(){
        var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择报销人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                    }
                }
            }
        });
    }

    function submit(){
        var auditstatus = nui.get("auditstatus").getValue();
        console.log(auditstatus);
        if(auditstatus == "2"){	//终止流程
            titleText = "终止";
        }else if(auditstatus == "0"){	//退回流程
            if(!nui.get("backTo").getValue()){
                nui.alert("退回环节不能为空！");
                return;
            }
            titleText = "退回";
        }else if(auditstatus == "1"){	//提交流程
            titleText = "提交";
        }
        form2.submit();
    }
    
    function countersign(){
        selectOmEmployee();
    }
    
    function selectOmEmployee(){
        var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/contractPact/selectUsers.jsp",
            title: "立项单位经办人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                console.log(action)
                var user,users = "【";
                countersignUsers =[];
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        console.log(data)
                        for(var i = 0;i<data.length ;i++){
                            user = {};
                            user.id = data[i].userid
                            user.name = data[i].empname
                            user.typeCode = "person"
                            countersignUsers.push(user);
                            if(i==0){
                                users = users +data[i].empname;
                            }else{

                                users = users +","+data[i].empname;
                            }
                        }
                        users = users+"】";
                        titleText ="增加审批人员"+ users +"并提交";
                        form2.submit();
                    }
                }
            }
        });
    }
    // 提交 
    function SaveData(){
        saveData();
    }

    function saveData(json){
        nui.confirm("确定" + titleText + "流程吗？", "操作提示",function (action) {
            if (action == "ok") {
                var misOpinion = opioionform.getData().misOpinion;//审核意见
                var json = {misOpinion:misOpinion,workItemID: <%=workitemid %>,"countersignUsers":countersignUsers};
                mini.mask({
                    el: document.body,
                    cls: 'mini-mask-loading',
                    html: titleText+'中...'
                });
                nui.ajax({
                    url: "com.zhonghe.ame.purchase.purchaseProgramme.purProgrammeApproval.biz.ext",
                    type: "post",
                    data: json,
                    contentType: "text/json",
                    success: function (o){
                        nui.unmask(document.body);
                        if(o.result == "success"){
                            nui.alert(titleText + "成功","系统提示",function(){
                                CloseWindow("ok");
                            });
                        }else{
                            nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
                                CloseWindow("ok");
                            });
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown){
                        alert(jqXHR.responseText);
                    }
                })
                saveData(json);
            }
        });
    }

    function onButtonEdit(e) {
        var btnEdit = this;
        mini.open({
            url: "/default/purchase/project/procurementProAppList.jsp",
            title: "采购立项列表",
            width: '73%',
            height: '75%',
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = mini.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.id);
                        btnEdit.setText(data.proAppCode);
                        nui.get("planId").setValue(data.planId);
                        nui.get("planId").setText(data.purchaseNumber);
                        btnEdit.doValueChanged();
                    }
                }
            }
        });
    }

    function onCancel(e) {
        CloseWindow("cancel");
    }
    //标准方法接口定义
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
</script>
</body>
</html>
