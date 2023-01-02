<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>添加人员组织</title>
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
		<legend>添加人员组织</legend>
		 	<form id="form1" method="post" align = "center">
	        	<table style="table-layout:fixed;" id="table_file1" align = "center">
	          	<tr>
		          <td class="form_label" align = "center">人员名称
		          <input id="combo1" class="nui-combobox" style="width:150px;" textField="empname" valueField="userid" emptyText="请选择..." dataField="Emps"url="com.zhonghe.ame.imptask.keyTaskVote.queryEmployeeUserId.biz.ext"  required="true" allowInput="true" showNullItem="true" nullItemText="请选择..."/>
		          </td>
		           <td class="form_label" align = "center">组织名称
		           <input id="combo2" class="nui-combobox" style="width:150px;" textField="orgname" valueField="orgid" emptyText="请选择..." dataField="Orgs" url="com.zhonghe.ame.imptask.keyTaskVote.queryOrganizationOrgid.biz.ext"   required="true" allowInput="true" showNullItem="true" nullItemText="请选择..."/>
		           </td>
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
	var obj = nui.get("combo1");
    var obj1 = nui.get("combo2");
	function submit(){
				form.validate();
    			if(form.isValid()==false){
    				nui.alert("请检查必填项");
    				return;
    			}	
				if(!confirm("是否添加人员组织")){
        			return;
        		}else{	
		    		var json = nui.encode({"userId":obj.getValue(),"orgId":obj1.getValue(),"userName":obj.getValue()+'_'+obj.getText(),"orgName":obj1.getValue()+'_'+obj1.getText()});
					nui.ajax({
						url:"com.zhonghe.ame.imptask.keyTaskVote.addOrgEmp.biz.ext",
						type: 'post',
						data: json,	
						contentType: 'text/json',
						success: function (o) {
							if(o.result==1){
			                	nui.alert("发起成功","系统提示",function(){
				        			CloseWindow("ok");
				        		});
			                }else{
			                	 nui.alert("添加失败，请联系信息技术部人员！","系统提示", function(action){
								});
			                }
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
    
    function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
	}

	
   	</script>
</body>
</html>
