<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-02-26 11:09:42
  - Description:
-->
<head>
	<title>创建合同续签发起</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link id="css_skin" rel="stylesheet" type="text/css" href="/default/coframe/tools/skins/skin1/style.css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<!-- 提示信息展示  -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<!-- 员工基本信息展示  -->
	<jsp:include page="/ame_permanage/ame_contract/empDetail.jsp"/>
	<fieldset id="oldCont">
		<legend>历史合同</legend>
		<jsp:include page="/ame_permanage/ame_contract/empContGrid.jsp"/>
	</fieldset>
	<!-- 续签合同信息  -->
	<jsp:include page="/ame_permanage/ame_contract/empContForm.jsp"/>
	<form id="opioionform" method="post" >
        <div style="padding: 5px;" id="opinionHide">
			<input name="misOpinion.fileids" id="fileids" class="nui-hidden"/>
            <table style="table-layout: fixed;">
            	<tr id="salesEdit">
                    <td style="width: 150px;" align="right">审核结果：</td>
                    <td style="width: 250px;">
						<input name="misOpinion.auditstatus" id="auditstatus" class="nui-dictradiogroup" style="width: 250px;" 
							required="true" dictTypeId="MIS_AUDITSTATUS" value="4" />
						<input name="misOpinion.auditopinion" id="auditopinion" value="" class="nui-hidden" />
                    </td>
                </tr>
                <!-- <tr>
                    <td style="width: 150px;height: auto;" align="right">任务处理说明：</td>
                    <td colspan="7">
                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" 
                        	style="width: 800px;height: 40px;"/>
                    </td>
                </tr> -->
            </table>
        </div>
	</form>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
	<a class="nui-button" onclick="onOk('1')" id="creatProcess" style="width: 80px;margin-right: 20px;">发起流程</a>
	<a class="nui-button" onclick="onOk('0')" id="saveProcess" style="width: 80px;margin-right: 20px;">暂时保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();

  	var form = new nui.Form("#form1");//申请信息
  	var opioionform = new nui.Form("opioionform");//审核意见
  	
	var contract = nui.get("Contract");
	
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
	
	document.getElementById("salesEdit").style.display="none";
  	//流程操作提示
	promptInit({"workItemID": 0,"processDefName": "com.primeton.eos.ame_permanage.ame_emp_contract","activityDefID": "manualActivity"});
	
	var empid;
	var emp;
	var conttime;
	var contend;
	function SetData(data){
		empid = data.oldempcont.empid;
		var oldempcontid = data.oldempcont.empcontid;
		var oldcontend = data.oldempcont.contend;
		var oldconttype = data.oldempcont.conttype;
		var oldcontprop = data.oldempcont.contprop;
		var oldcontend1 = new Date(oldcontend);
		oldcontend1 = DateAdd("d", 1, oldcontend1);//4个月后日期
		var data={"empid":empid};
		var json=nui.encode(data);
  		nui.ajax({//员工基本信息
      		url: "org.gocom.abframe.org.organization.newOrgEmp.queryMyEmp.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
       	  		emp =o.emp;
       	  		setEmp();//设置员工基本信息
	            contract.load({ empid: empid});
	            nui.get("contuserid").setValue(emp.empcode);
	            nui.get("contcompany").setValue(emp.company);
	            nui.get("contworkplace").setValue(emp.workplace);
	            nui.get("position").setValue(emp.positionname);
	            nui.get("positionname").setValue(emp.positioncall);
	            nui.get("oldempcontid").setValue(oldempcontid);
	            nui.get("conttype").setValue(oldconttype);
	            nui.get("contprop").setValue(oldcontprop);
	            nui.get("conttime").setValue(3);
	            nui.get("contstart").setValue(oldcontend1);
				var oldcontend2 = oldcontend1;
				oldcontend2 = DateAdd("y", 3, oldcontend2);//3年后日期
				oldcontend2 = DateAdd("d", -1, oldcontend2);
	            nui.get("contend").setValue(oldcontend2);
	            conttime=3;
	            contend=oldcontend2;
				document.getElementById("sm1").style.display="none";
				document.getElementById("sm2").style.display="none";
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	
	var type ; //发起还是暂存
    function onOk(e){
        var msg;//提示信息
        if(e == "1"){//发起
        	if(!form.validate()){
	    		nui.alert("信息录入不完整！");
	        	return;
        	}
        	msg="是否发起合同续签申请流程？";
        	type=1;
        }else{
        	msg="是否暂时保存合同续签申请流程？暂时保存后可以在待办任务中进行查询处理！";
        	type=0;
        	nui.get("applystatus").setValue('0');
        }
        nui.confirm(msg,"操作提示",function(o){
        	if("ok" == o){
				//按钮禁用
		    	nui.get("creatProcess").disable();
		    	nui.get("saveProcess").disable();
				SaveData();
        	}
        });
        
    }
	function SaveData(){
		var om = form.getData();//申请信息
		var misOpinion = opioionform.getData().misOpinion;//审核意见
		var msg="合同续签申请";
		if(type =="1"){//发起还是暂存
			misOpinion.auditstatus ="3";
			misOpinion.workitemname="发起"+msg;
		}else{
			misOpinion.auditstatus ="4";
			misOpinion.workitemname="暂时保存"+msg;
		}
    	om.empCont.contstatus = "1";
		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		om.empCont.guanZhu = guanZhu;//是否关注
		var json =nui.encode({empCont:om.empCont,misOpinion:misOpinion});
        save(json);
	}
	
	
	function save(data){
		var content;
    	if(type == '1'){
           	content = '发起中...';
		}else if(type == '0'){
           	content = '暂存中...';
		}
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: content
        });
    	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_contract.creatOmEmpCont.biz.ext",
            data: data,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.unmask(document.body);
        		var returnJson = nui.decode(text);
              	if(returnJson.result == "success"){
    				if(type==1){
	                   	nui.alert("发起流程成功！","系统提示",function (){
	                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	                   	});
    				}else if(type==0){
    					nui.alert("暂时保存成功！","系统提示",function (){
    						window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
    						form.unmask();
    					});
    				}
              	}else {
					nui.get("creatProcess").enable();
					nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！");
    				}
              	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
        });
	}
</script>
<script src="<%=request.getContextPath() %>/ame_permanage/ame_contract/js/empcontapply.js" type="text/javascript"></script>
</html>