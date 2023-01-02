<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>

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
				<legend>评审报告信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="processid" id="processid" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right">评审报告名称：</td>
								<td>
									<input name="reportName" id="reportName" class="nui-textbox" style="width: 200px" required="true"/>
									<input name="planId" id="planId" class="nui-hidden"/>
								</td>
							<td align="right" style="width:160px">采购立项编号：</td>
								<td><input name="proappId" id="proappId" onbuttonclick="onButtonEdit" allowInput="false" class="nui-buttonedit" style="width: 200px"  required="true"/></td>
							<td align="right" style="width: 120px">评审报告编号：</td>
								<td >
									<input name="code" id="code" class="nui-textbox" style="width: 200px;" readonly="readonly"/>
								</td>
							<tr>
              				<td class="form_label"  align="right" style="width:140px;">评审报告说明：</td>
			                    <td colspan="7">    
			                        <input style="width:100%;height: 40px;" name="remark" id="remark" class="nui-textarea"  required="true"/>
			                    </td>
              				</tr>
						</table>
					</div>
				</form>
			</fieldset>
				<jsp:include page="/ame_common/inputFile.jsp"/>
	</div>
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
<!-- 		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">保存</a> -->
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px;margin-right: 20px;">中止</a>	
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 0px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
	    var form = new nui.Form("#form1");
	    var id = <%=request.getParameter("id")%>;
		init();
        function init(){
        	var json = nui.encode({"workitemid":<%=workitemid%>});
		  	nui.ajax({
		                url: "com.zhonghe.ame.purchase.purchaseReviewReport.queryReviewReport.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (o) {
						 console.log(o.reviewReport[0]);
						 var result=o.reviewReport[0];
						 form.setData(result);
						 nui.get("proappId").setValue(result.proappId);
						 nui.get("proappId").setText(result.proAppCode);
						 var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"purReviewReport","relationid":result.id});
						 grid_0.sortBy("fileTime","desc");
						 
						 var grid = nui.get("datagrid1");
						 grid.load({processInstID:result.processid});
						 grid.sortBy("time", "desc");
							 //设置审核意见基本信息
						nui.get("processinstid").setValue(o.workitem.processInstID);
		               	nui.get("processinstname").setValue(o.workitem.processInstName);
		               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
		               	nui.get("workitemname").setValue(o.workitem.workItemName);
						nui.get("workitemid").setValue(<%=workitemid %>);
		               	nui.get("isshow").setValue("1");
		               	nui.get("auditstatus").setValue("4");
		               	document.getElementById("salesEdit").style.display="none";
		               	nui.get("auditopinion").setValue("");
			        },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });
		}
		
		
    	function onOk(e){
    		nui.get("auditstatus").setValue("4");
    		istype = e;
    		if(!form.validate()){
    			showTips("请检查表单完整性","danger");
    			return;
    		}
    		if(istype==1){
				info="是否提交？"
			}else if(istype==0){
				info="是否暂时保存？"
			}else{
				info="是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
			document.getElementById("fileCatalog").value="purReviewReport";
	    	
	    	nui.confirm("确定"+info,"系统提示",
	        function(action){
	            if(action=="ok"){
		    		form2.submit();
				}
			})
	    }
	    function SaveData(){
			var data = form.getData();
			data.istype=istype;
			data.files = nui.get("fileids").getValue();
			
			var data_opioion = opioionform.getData();
			var json = nui.encode({'reviewReport':data,"misOpinion":data_opioion.misOpinion});
		    	ajaxCommon({
	                url: "com.zhonghe.ame.purchase.purchaseReviewReport.editReviewReport.biz.ext",
	                data: json,
	                success: function (text) {
		                if(text.result == "1"){
		               		showTips("提交成功")
		               		closeOk();
		                }else{
		     			  	showTips("提交失败")
// 		               		closeOk();
		                }
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
        

    </script></body>
</html>
