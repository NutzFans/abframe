<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
	<title>采购方案 </title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
									<input  name="programmeName"  id="programmeName" class="nui-textbox" style="width: 300px" />
								</td>
							<td align="right" style="width:160px">采购立项编号：</td>
								<td><input name="proappId" id="proappId" readonly="readonly"     onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" /></td>
								<td align="right" style="width: 120px">方案编号：</td>
								<td >
									<input name="code" id="code" class="nui-textbox" style="width: 300px;" readonly="readonly" emptyText="系统自动生成"/>
								</td>
							</tr>
							
              		<td class="form_label"  align="right" style="width:140px;">采购方案与文件说明：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 40px;" name="remark" id="remark" class="nui-textarea"  id="technologyNeed"    dictTypeId="ZH_PURCHASE" />
                    </td>
              	</tr>
						</table>
					</div>
				</form>
			</fieldset>	
		</div>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<jsp:include page="/ame_common/inputFile.jsp"/>
     		<jsp:include page="/ame_common/misOpinion.jsp"/>
		</fieldset>
	</div>
	<!--<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px;margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">暂存</a>                
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>-->
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
	    <a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px;margin-right: 20px;">中止</a>	
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
	</div> 
<script type="text/javascript">
    nui.parse();
    var id = <%=request.getParameter("id")%>;
    var countersignUsers,titleText;
    var form = new nui.Form("#form1");
    var opioionform = new nui.Form("opioionform");
    var istype;
    init();
    function init(){
        var json = nui.encode({"workitemid":<%=workitemid%>});
        console.log(json);
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
                nui.get("remark").setValue(result.remark);
                nui.get("code").setValue(result.code);

                var grid_0 = nui.get("grid_0");
                grid_0.load({"groupid":"purProgramme","relationid":result.id});
                grid_0.sortBy("fileTime","desc");
                
                var grid = nui.get("datagrid1");
                grid.load({processInstID:result.processid});
                grid.sortBy("time", "desc");
                document.getElementById("salesEdit").style.display="none";
                //初始化处理意见
                initMisOpinion({auditstatus:"1"});
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
    }
    

    function onOk(e){
    		istype=e;
    		if(istype==1){
				info="是否提交？"
			}else if(istype==0){
				info="是否暂时保存？"
			}else{
				info="是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
    		if(!form.validate()){
				nui.alert("请检查表单的完整性!");
				return;
			}
			//定义变量接受form表单数据
			var data = form.getData();
		  	document.getElementById("fileCatalog").value="purProgramme";
			
        	form2.submit();
    }
    
    function SaveData(){
			var form = new nui.Form("#form1");
			var data = form.getData();
			var data_opioion =opioionform.getData();
			console.log(opioionform.getData());
			data.files = nui.get("fileids").getValue();
			data.istype = istype;
			var json = nui.encode({'purProgramme':data,"misOpinion": data_opioion.misOpinion});
			if(!confirm("是否提交？")){
				return;
			}else{	
		    	ajaxCommon({
	                url: "com.zhonghe.ame.purchase.purchaseProgramme.editPurProgramme.biz.ext",
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
