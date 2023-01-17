<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 黄宇琪
  - Date: 2018-08-21 14:55:51
  - Description:
-->
<head>
<title>新增白名单</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div id="form1" method="post" >	
		<input id="whitelistid" name="whitelist.whitelistid" class="nui-hidden"/>   
        <fieldset style="height:250px;width:470px;border:solid 1px #aaa;padding:3px;">
			<legend>白名单信息</legend>
        	<div>
            	<table>
	                <tr>
	                   <td align="right">员工：</td>
	                    <td>
							<input id="username" name="whitelist.userid" class="nui-buttonedit" 
								   onbuttonclick="selectOmEmployee" allowInput="false" required="true" />					 	    	   						                        
	                    </td>
	                    <td align="right">状态：</td>
	                    <td >    
	                       <input name="whitelist.state" id="state" class="nui-dictcombobox" dictTypeId="ABF_STATUS" required="true"/>
	                    </td>
	                 </tr>
	                 <tr>
	                    <td align="right">有效开始日期：</td>
						<td>
							<input name="whitelist.startdate"class="nui-datepicker" id="startdate" required="true"/>
						</td>
						<td align="right">有效结束日期：</td>
						<td>
							<input name="whitelist.enddate"class="nui-datepicker" id="enddate" required="true"/>
						</td>	                    
	                 </tr> 
	                 <tr>
						<td align="right">业务类型：</td>
	                    <td colspan="3">    
	                       <input name="whitelist.code"class="nui-dictcombobox" dictTypeId="AME_WHITE_BUSI" required="true" style="width:203px;" />
	                    </td>
	                  </tr>
				</table>
			</div>
		</fieldset>		
		<div style="text-align:center;padding:10px;">
			<a class="nui-button"onclick="onOk"style="width:60px;margin-right:20px;">确定</a>
			<a class="nui-button"onclick="onCancel"style="width:60px;">取消</a>
		</div>
    </div>    	
<script type="text/javascript">		    	   	   
    	nui.parse(); 
    	var whitelistid = <%=request.getParameter("whitelistid") %>;
    	nui.get("whitelistid").setValue(whitelistid);
    	
		function saveData(){
	        var form = new nui.Form("#form1");
	        form.setChanged(false);
	    	var data = form.getData(false, true);        
			var json = nui.encode(data);
	        nui.ajax({
		          url:"com.primeton.eos.ame_common.ameWhitelist.addWhitelist.biz.ext",
		          type:'POST',
		          data:json,
		          cache:false,
		          contentType:'text/json',
		          success:function(text){
		          	var returnJson = nui.decode(text);
			            if(returnJson.exception == null){
			            	if(returnJson.result == "1"){
				            	nui.alert("保存成功", "系统提示", function(action){
				            		CloseWindow("saveSuccess");			                            
				            	});
			            	}else if(returnJson.result == "2"){
			            		nui.alert("已存在对应有效的白名单记录，请检查！", "系统提示", function(action){
				            		return;			                            
				            	});
			            	}else{
			            		 nui.alert("保存失败", "系统提示", function(action){
					              	if(action == "ok" || action == "close"){
					                  //CloseWindow("saveFailed");
					                }
					              });
			            	}
			            }else{
			              nui.alert("保存失败", "系统提示", function(action){
			              	if(action == "ok" || action == "close"){
			                  //CloseWindow("saveFailed");
			                }
			              });
			           }
		         }
	    	});   
		}
	
	//页面间传输json数据
	function setFormData(data){
      	var infos = nui.clone(data);
      	nui.get("state").setValue("1");
	}
	       	/**
			***选择员工
			**/
			function selectOmEmployee(e){
				var edit = this;
		        nui.open({
		            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
	                title: "选择员工",
	                width: 430,
	                height: 400,
	                ondestroy: function (action) {
	                    if (action == "ok") {
	                        var iframe = this.getIFrameEl();
	                        var data = iframe.contentWindow.GetData();
	                        data = nui.clone(data);    //必须
	                        if (data) {
	                            edit.setValue(data.userid);
	                            edit.setText(data.empname);	
	                            //nui.get("userid").setValue(data.userid);
	                            //nui.get("expusername").setValue(data.empname);
	                            
	                        }
	                    }
	
	                }
	            });
			}
          

          //关闭窗口
          function CloseWindow(action) {
            if (action == "close" && form.isChanged()) {
              if (confirm("数据被修改了，是否先保存？")) {
                saveData();
              }
            }
            if (window.CloseOwnerWindow)
            return window.CloseOwnerWindow(action);
            else window.close();
          }

          //确定保存或更新
          function onOk() {
            saveData();
          }

          //取消
          function onCancel() {
            CloseWindow("cancel");
          }         
    </script>
</body>
</html>