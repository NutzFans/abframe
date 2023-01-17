<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): EPCNB299
  - Date: 2015-07-13 13:11:02
  - Description:
-->
<head>
<title>修改知识库信息</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
</head>
<body>
    <form id="form1" method="post" >
	<input name="kbases.kbid" id="kbId" class="nui-hidden" />
<fieldset style="border:solid 1px #aaa;padding:3px;">
     <legend>基本信息</legend>
           <div>
            	<table>
	                <tr>
	                    <td  align="right">知识点标题：</td>
	                    <td >    
	                        <input name="kbases.kbtitle" id=kbtitle class="nui-textbox" />
	                    </td> 
	                    <td align="right">知识点类型：</td>
	                    <td >    
	                       <input name="kbases.kbtype" id=kbtype class="nui-dictcombobox" dictTypeId="MIS_KBASE"  onvaluechanged="onNameFilterChanged(this.value)">
	                    </td>
	                </tr>
	                <tr>
	                    <td align="right">知识点内容：</td>
	                    <td>    
	                        <input name="kbases.kbcontent" allowInput="true"  class="nui-textbox" />	                        
	                    </td>
	                    <td align="right">知识点提交人：</td>
	                    <td >    
	                       <input name="kbases.kbsubmitor" class="nui-textbox" id="kbsubmitor"/>
	                    </td>    
	                </tr>
	                <tr>
						 <td align="right">知识点提交日期：</td>
						<td>
							<input name="kbases.kbsubmitdate" class="nui-datepicker" id="kbsubmitdate" />
						</td>
						<td align="right">最后更新人：</td>
	                    <td >    
	                        <input name="kbases.lastmoduser" class="nui-textbox" id="lastmoduser" allowInput="true"/>
	                    </td>
					</tr>
					<tr>
					    <td align="right">最后更新日期：</td>
						<td>
							<input name="kbases.lastmoddate" class="nui-datepicker" id="lastmoddate" allowInput="true"/>
						</td>
					</tr>
					<tr>
	        	        <td style="width:110px;" align="right">已上传的附件：</td>
	        	        <td style="width:610px;" id="uploadedFile" colspan="5"></td>
                    </tr>
                    <tr>
            	        <td style="width:110px;" align="right">附件上传：</td>
            	        <td style="width:610px;" colspan="5">
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
	  	<%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	    %>
          nui.parse();
          var form = new nui.Form("#form1"); 
          form.setChanged(false);
      
      //页面进入时调用的方法
          function setData(data) {
		      data = nui.clone(data);  //跨页面传递的数据对象，克隆后才可以安全使用
		      var json = nui.encode({kbases:data});
		      nui.ajax({
                 url: "com.primeton.eos.ame_common.kbasecomponent.mis_getkbase.biz.ext",
			     type: 'POST',
			     data: json,
			     cache:false,	
			     contentType: 'text/json',
                 success: function (text) {
	                 obj = nui.decode(text);
	                 form.setData(obj);
                     form.setChanged(false); //设置是否变动 
                     var tempSrc = "";
                     for(var i=0;i<text.kbases.files.length;i++){
                	    tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + text.kbases.files[i].fileId + "'>" + text.kbases.files[i].fileName + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='mini-button' iconCls='icon-remove' onclick='doDelete(" + text.kbases.files[i].fileId + ")'></a>,";
                     }
               	     document.getElementById("uploadedFile").innerHTML = tempSrc;
               	     nui.parse();
               	     nui.get("kbtype").disable();
               	     nui.get("kbsubmitor").disable();
               	     nui.get("kbsubmitdate").disable();
               	     nui.get("lastmoduser").disable();
               	     nui.get("lastmoddate").disable();
               	     nui.get("lastmoddate").setValue(new Date());
	    			 nui.get("lastmoduser").setValue('<%=username %>');
                 }
             });
	      }
	
    //点击保存按钮
	    function onOk(e) {
		   if(!form.validate()){
	    	  return;
	       }else{
	    	 startUpload(saveData);
	       }
	    }  

    //上传附件
    var sf;
    sf= new SWFFileUpload(nui.decode({
    		name:'kbases.fileids',
    		renderTo:'#upload_div',
			value:'',
			cancelBtnText:'取消上传',
			maxFileCount:3,
			minFileCount:0,
			width:'600px',
			title:'上传附件',
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
	   //保存数据	
      var form = new nui.Form("#dataform1");
      function saveData(){
        form.validate();    //验证表单
        if(form.isValid()==false) return;   //如果表单验证不通过
        var data = form.getData(false,true);
        var json = nui.encode(data);//把JS对象序列化为字符串
        nui.ajax({
          url:"com.primeton.eos.ame_common.kbasecomponent.mis_updatekbase.biz.ext",
          type:'POST',
          data:json,
          cache:false,
          contentType:'text/json',
          success:function(text){
            var returnJson = nui.decode(text);
            if(returnJson.exception == null){
              CloseWindow("saveSuccess");
            }else{
              nui.alert("保存失败", "系统提示", 
              function(action){
                if(action == "ok" || action == "close"){
                  //CloseWindow("saveFailed");
                }
                });
              }
            }
            });
          }
	
      function onCancel(){
           CloseWindow("cancel");
      }
      
      function CloseWindow(action){
	      if(action=="close"){
	      }else if(window.CloseOwnerWindow)
	      	return window.CloseOwnerWindow(action);
	      else
	      	return window.close();
      }
              
         //添加删除附件按钮
      function doDelete(fileID){
        nui.confirm("确定删除该附件？", "确定？",
            function (action) {
                if (action == "ok") {
                    var json = nui.encode({fileid: fileID});
                    nui.ajax({
                        url: "com.primeton.eos.machine.machine.deleteFile.biz.ext",
                        type: 'POST',
                        data: json, 
                        contentType: 'text/json',
                        success: function (o) {
                            var tempSrc = "";
                            for(var i=0;i<o.files.length;i++){
                                tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow.flow?fileId=" + text.kbase.files[i].fileId + "'>" + text.kbase.files[i].fileName + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='mini-button' iconCls='icon-remove' onclick='doDelete(" + text.kbase.files[i].fileId + ")'></a>,";
                   			}
                            document.getElementById("uploadedFile").innerHTML = tempSrc;
                            nui.parse();                
                        }
                    });
                }
            }
        );
    }
    
    </script>
</body>
</html>