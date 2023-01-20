<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>采购文件 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>采购文件信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="files1" id="fileids1" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align = "right">采购文件名称：</td>
								<td>
									<input name="type" id="type" class="nui-hidden"value="2"/>
									<input name="planId" id="planId" class="nui-hidden"  readonly="readonly"/>
									<input name="programmeName" id="programmeName" class="nui-textbox" style="width: 300px" required="true"/>
								</td>
								<td align="right" style="width:160px">采购立项编号：</td>
								<td>
									<input name="proappId" id="proappId" onbuttonclick="onButtonEdit" allowInput="false" class="nui-buttonedit" style="width: 300px" required="true"/>
								</td>
								<td align="right" style="width: 120px">采购文件编号：</td>
								<td >
									<input name="code" id="code" class="nui-textbox"  style="width: 300px;" readonly="readonly"  emptyText="系统自动生成"/>
								</td>
							</tr>
							<tr>
			              		<td class="form_label"  align="right" style="width:140px;">采购文件说明：</td>
			                    <td colspan="7">    
			                        <input style="width:100%;height: 40px;" name="remark" id="remark" class="nui-textarea"  id="technologyNeed" required="true"/>
			                    </td>
			              	</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>采购方案附件</legend>
				<jsp:include page="/ame_common/addFiles.jsp"/>
			</fieldset>
		</div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
	    <!-- <a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">暂存</a> -->
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
    	var form = new nui.Form("#form1");
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
                        }
                    }
                }
            });
        }
    	function onOk(){
    		if(!form.validate()){
    			showTips("请检查表单完整性");
    			return;
    		}
			//定义变量接受form表单数据
			var data = form.getData();
		  	document.getElementById("fileCatalog").value="purFile";
			
			var filePaths = document.getElementsByName("uploadfile").length;
    		if(filePaths==0){
    			showTips("采购文件附件不可以为空");
    			return;
    		}else{
    			for(var j=0;j<filePaths;j++){
			      var a=document.getElementsByName("remarkList")[j].value;
				      if(a==null||a==""){
				       showTips("采购文件附件不可以为空");
				       return;
				      }
			     }
    		}
			
		  	form2.submit();
	    }
    	function SaveData(){
			var form = new nui.Form("#form1");
			var data = form.getData();
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({'purProgramme':data});
			if(!confirm("是否提交？")){
        		return;
			}else{	
		    	ajaxCommon({
	                url: "com.zhonghe.ame.purchase.procurementDocuments.addProDocuments.biz.ext",
	                data: json,
	                success: function (text) {
		                if(text.result == "1"){
		               		 showTips("提交成功")
		               		 closeOk();
		                }else{
		                	showTips("提交失败")
		                }
	                }
	            }); 
            }
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
                            btnEdit.doValueChanged();
                        }
                    }
                }
            });
        }
        
    </script></body>
</html>
