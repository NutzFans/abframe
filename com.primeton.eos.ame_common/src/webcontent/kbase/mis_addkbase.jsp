<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): EPCNB299
  - Date: 2015-07-10 14:41:44
  - Description:
-->
<head>
<title>新增知识库信息</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
</head>
<body>
        <form id="form1" method="post" >
		<input name="kbase.kbid" id="kbId" class="nui-hidden" /> 
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>基本信息</legend>
        	<div>
            	<table>
	                 <tr>
	                    <td  align="right">知识点标题：</td>
	                    <td >    
	                        <input name="kbases.kbtitle" id=kbtitle class="nui-textbox" required="true"/>
	                    </td> 
	                    <td align="right">知识点类型：</td>
	                     <td >    
	                       <input name="kbases.kbtype" class="nui-dictcombobox" dictTypeId="MIS_KBASE" onvaluechanged="onNameFilterChanged(this.value)" required="true">
	                     </td>
	                     <td align="right">知识点内容：</td>
	                    <td>    
	                        <input name="kbases.kbcontent" allowInput="true"  class="nui-textbox" />	                        
	                    </td>
	                 </tr>
	                 <tr>
	                   <td align="right">知识点提交人：</td>
	                    <td >    
	                       <input name="kbases.kbsubmitor" class="nui-textbox"/>
	                    </td>
	                    <td align="right">知识点提交日期：</td>
	                    <td >    
	                        <input name="kbases.kbsubmitdate" class="nui-datepicker" id="kbsubmitdate" allowInput="true"/>
	                    </td>
	                 </tr>
	                 <tr>
	                    <td class="form_label" align="right">上传附件</td>
                        <td colspan="5">
                        <div id="upload_div"></div>
	                    </td>
	       	  		 </tr>
				</table>
			</div>
		</fieldset>
	</form>
		<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
		    <a class="nui-button" iconCls="icon-save" onclick="onOk">保存</a>
		    <a class="nui-button" iconCls="icon-cancel" onclick="onCancel">取消</a>
        </div>
<script type="text/javascript">
    nui.parse();
    var addURL = "com.primeton.eos.ame_common.kbasecomponent.mis_addkbase.biz.ext";
    var saveURL = "";
    var form = new nui.Form("form1");
	var setData;
	var sf;
    sf=new SWFFileUpload(nui.decode({
    		name:'kbases.fileids',
    		renderTo:'#upload_div',
			value:'',
			cancelBtnText:'取消上传',
			maxFileCount:3,
			minFileCount:0,
			width:'',
			height:'',
			hasCancel:false,
			hiddenType:'nui',
			autoUpload:false,
			uploadUrl:'com.primeton.eos.machine.fileUpload.flow'}));
	
	function startUpload(succ){
		sf.startUpload(function(){
			if(succ){
				succ();
			}
		},function(){
			alert('文件上传失败！');
		});
	}
	function onOk() {
          startUpload(SaveData);
    }
    function gridReload(datagrid){
        var grid = nui.get(datagrid);
        grid.reload();
    }
    function SetData(data){
    	data = nui.clone(data);
    	data.action == "new"
    	nui.get("kbsubmitdate").setValue(new Date());
	    		    		
	   <%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	    %>
	    		nui.getbyName("kbases.kbsubmitor").setValue('<%=userno %>');
	    		nui.getbyName("kbases.kbsubmitor").setValue('<%=username %>');
	}//默认为当前用户
	function SaveData() {
		if(form.validate()){
	           	var o = form.getData(false,true);
	            var json = nui.encode(o);           
	            nui.ajax({
	                url: addURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                    var returnJson = nui.decode(text);
            			if(returnJson.exception == null){
               			    CloseWindow("saveSuccess");
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
    }
        
          //标准方法接口定义
        
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
    function getKbasetype(e){
	  	return nui.getDictText('MIS_KBASE',e.value);//设置业务字典值
	  }
</script>    
</body>
</html>