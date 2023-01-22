<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp" %>
<html>
<head>
	<title>采购文件</title>
	<style type="text/css">
		body {
			margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
		}
	</style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;" showHeader="false">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 99%;">
				<legend>采购文件</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input name="files1" id="fileids1" class="nui-hidden" />
					<input class="nui-hidden" name="id" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;width: 60%">
							<tr>
								<td width="100" align="right">采购项目名称：</td>
								<td colspan="3">
									<input name="type" id="type" class="nui-hidden" />
									<input name="planId" id="planId" class="nui-hidden" />
									<input name="programmeName" id="programmeName" class="nui-textbox" style="width: 100%"  />
								</td>
								<td  align="right" style="width: 80px">编号：</td>
								<td colspan="2">
									<input name="code" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">立项名称：</td>
								<td colspan="3">
									<input name="proAppName" id="proAppName" class="nui-textbox" style="width: 100%;"
										readonly="readonly"/>
								</td>
								<td align="right" style="width:100px">立项编号：</td>
								<td colspan="2">
									<input name="proappId" id="proappId" class="nui-buttonedit" style="width: 100%"
										 />
								</td>
							</tr>
							<tr>
								
								<td  align="right" style="width: 80px">申请人：</td>
								<td colspan="1">
									<input name="createdByName" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
								<td  align="right" width="80" >申请时间：</td>
								<td colspan="1">
									<input name="createdTime" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
								<td  align="right" style="width: 80px">申请单位：</td>
								<td colspan="2">
									<input name="createdOrgname" class="nui-textbox" style="width: 100%" readonly="readonly"/>
								</td>
							</tr>
							
							<tr>
								<td class="form_label" align="right" style="width:100px;">归口部门：</td>
                <td colspan="3">
                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER"  readonly="readonly" style="width:100%;" />
                </td>
								<td align="right" style="width: 100px">立项金额：</td>
								<td colspan="1">
									<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" style="width: 100%;"
										readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="form_label" align="right" style="width:120px;">采购文件主要内容简述：</td>
								<td colspan="6">
									<input style="width:100%;height: 40px;" name="remark" id="remark"
										class="nui-textarea"  />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
			<fieldset  style="height:80%; border:solid 1px #aaa;padding:3px;width: 99%">
				<legend>采购计划明细</legend>
		     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
		    	<div id="grid_detail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
			    	url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext" dataField="datas" showPager="false" multiSelect="true"  >
			           <div property="columns">
			           		<div type="indexcolumn" align="center" headerAlign="center"  visible="false"></div>
		           			<div  field="planName" width="110" align="center" headerAlign="center" >计划名称</div>
		           			<div  field="code" width="100" align="center" headerAlign="center" >计划编号</div>
		                <div field="materialName"  width="110" align="center" headerAlign="center">采购物项名称 </div>
		                <div field="budgetAmount"  width="100" align="center" headerAlign="center" >预算金额(万元)</div>
		                <div field="amount"  width="100" align="center" headerAlign="center">立项金额(万元)</div>
		                <div field="sumamount"  width="110" align="center" headerAlign="center" vtype="required">剩余可立项金额(万元)</div>
		                <div field="needOrgName"  width="80" align="left" headerAlign="center" >采购单位</div> 
			           </div>
			        </div>
				</div>
			</fieldset>
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 99%">
				<legend>附件（请上传技术规格书、采购文件）</legend>
				<jsp:include page="/ame_common/inputFile.jsp" />
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;width: 99%">
				<legend>审批信息</legend>
				<jsp:include page="/ame_common/misOpinion.jsp" />
			</fieldset>
		</div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px;margin-right: 20px;">加签</a>  
		<a class="nui-button" onclick="submit" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
<script type="text/javascript">
    nui.parse();
    var id = <%=request.getParameter("id")%>;
    var countersignUsers,titleText;
    var gridDtl = nui.get("grid_detail");
		var form = new nui.Form("#form1");	
    init();
    labelModel();
    function init(){
        var data = {workitemid:<%=workitemid%>};
        var json = nui.encode(data);
        nui.ajax({
            url: "com.zhonghe.ame.purchase.purchaseProgramme.queryPurProgrammeByPid.biz.ext",
            type: 'POST',
            data: json,
            success: function (o) {
               var result = o.purProgramme;
								form.setData(result);
								nui.get("proappId").setValue(result.proappId);
								nui.get("proappId").setText(result.proAppCode);
// 							nui.get("remark").setValue(result.remark);
// 							nui.get("code").setValue(result.code);
								form.setData(result);
								gridDtl.load({"pid":result.proappId})
									
								
                var grid_0 = nui.get("grid_0");
								grid_0.load({ "groupid": "purProgramme", "relationid": result.id });
								grid_0.sortBy("fileTime", "desc");
	
								var grid = nui.get("datagrid1");
								grid.load({ processInstID: result.processid });
								grid.sortBy("time", "desc");
								document.getElementById("salesEdit").style.display = "none";
                //初始化处理意见
                initMisOpinion({auditstatus:"1"});
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
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
    
    function labelModel() {
		    var fields = form.getFields();                
		    for (var i = 0, l = fields.length; i < l; i++) {
		        var c = fields[i];
		        if (c.setReadOnly) c.setReadOnly(true);     //只读
		        if (c.setIsValid) c.setIsValid(true);      //去除错误提示
// 		        if (c.addCls) c.addCls("asLabel");          //增加asLabel外观
		    }
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
            		var data = form.getData();
                var misOpinion = opioionform.getData().misOpinion;//审核意见
                var json = {'purProgramme': data,misOpinion:misOpinion,workItemID: <%=workitemid %>,"countersignUsers":countersignUsers};
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
