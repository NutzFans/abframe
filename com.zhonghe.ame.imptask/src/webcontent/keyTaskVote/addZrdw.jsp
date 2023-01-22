<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>发起责任单位投票</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>发起责任单位投票</legend>
		 	<form id="form1" method="post" >
	        	<table style="table-layout:fixed;" id="table_file1">
	        			<tr>		
							<td align="right" style="width:160px">投票名称：</td>
							<td>
								<input class="nui-textbox" name="voteCode" id="voteCode" style="width:890px" required="true">
							</td>
						</tr>
						<tr>			
							<td align="right" style="width:160px">结束时间：</td>
							<td style="width: 130px"><input name="voteFinshtime" id="voteFinshtime" class="nui-datepicker" 
								style="width: 300px" required="true"/></td>
						</tr>
						<tr>	  
							  <td align = "right" style="width:160px">被投票单位：</td>
				         	<!--  <td colspan="1" align = "left" >
								  <input name="keytaskIds" id="treeselect1" required="true" class="nui-treeselect" textField="name" valueField="id"  
								  	parentField="pid"  dataField="orgs" expandOnLoad="true" style="width: 890px;" 
								  	url="org.gocom.abframe.org.organization.OrgManager.GetRunSecondOrg2.biz.ext" multiSelect="true"
									/>
							  </td>-->
							  <td colspan="1" align = "left">
							  <input name="keytaskIds" id="treeselect1" required="true" class="nui-treeselect" textField="name" valueField="id"  
							  	parentField="pid"  dataField="orgsAndEmps" expandOnLoad="true" style="width: 890px;" onvaluechanged ="setOrgNames"
							  	url="org.gocom.abframe.org.organization.OrgManager.getRunSecondOrg.biz.ext" multiSelect="true"  onbeforenodeselect="beforenodeselect" 
								/>
								<input class="nui-hidden" id="orgNames" name="orgNames">
						  	  </td>	
						</tr>
						<tr>
						  <td align = "right" style="width:160px">投票单位：</td>
			          	  <td colspan="1" align = "left">
							  <input name="orgIds" id="treeselect2" required="true" class="nui-treeselect" textField="name" valueField="id"  
							  	parentField="pid"  dataField="orgsAndEmps" expandOnLoad="true" style="width: 890px;" onvaluechanged = "setVoteDeps"
							  	url="org.gocom.abframe.org.organization.OrgManager.getRunSecondOrg.biz.ext" multiSelect="true"
								/>
								<input class="nui-hidden" id="voteDep" name="voteDeps">
						  </td>					  
						</tr>
						<tr>
							<td align="right" style="width:160px">备注：</td>
							<td colspan="6"><input class="nui-textarea" dictTypeId="ZH_TASK_STATUS"  name="remark" shownullItem="true"
								style="width: 890px;" required="false" /> 
						</tr>
	        	</table>
	        </form>
    	</fieldset>			
</div>
		<div style="text-align:center;padding:10px;" class="nui-toolbar">
			<a class="nui-button" onclick="submit()" id="appButton" style="width:60px;margin-right:20px;">确定</a>
			<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
		</div>
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var treeselect1 = nui.get("treeselect1");
    	var treeselect2 = nui.get("treeselect2");

	function setOrgNames(){
		var obj = mini.get("treeselect1");
			console.log(obj)
	        nui.get("orgNames").setValue(obj.getText())
	}
	
	function setVoteDeps() {
		var obj = mini.get("treeselect2");
			nui.get("voteDep").setValue(obj.getText())
	}
	
	  function beforenodeselect(e) {
	  	console.log("---------------------")
	  	console.log(e)
            //禁止选中父节点
      }
	

	function submit(){
				form.validate();
    			if(form.isValid()==false){
    				nui.alert("请检查必填项");
    				return;
    			}	
    			var data = form.getData(true,true);
    			var json = nui.encode({"data":data}); 

				if(!confirm("是否发起责任单位投票")){
        				return;
        			}else{	
        			 
		    		 nui.ajax({
		                url: "com.zhonghe.ame.imptask.keyTaskVote.addzrdwVote.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		               
		                	 if(text.result==1){
		                	 nui.alert("发起成功","系统提示",function(){
				        		CloseWindow("ok");
				        	});

		                	 }else{
		                	 nui.alert("发起失败，请联系信息技术部人员！","系统提示", function(action){
							});
		                	 
		                	 }
		                
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });  
		      }
    }
	

	function CloseWindow(action) {            
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }

    function onCancel(e) {
        CloseWindow("cancel");
    }

	
   	</script>
</body>
</html>
