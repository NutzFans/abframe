<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): EPCNB299
  - Date: 2015-07-20 13:50:30
  - Description:
-->
<head>
<title>查看知识点详细信息</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript">
     body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;}  
    </script> 
</head>
<body>
   <div id="dataform1"  class="nui-form"  style="height:100%">  
     <div id="tabs1" class="nui-tabs" idField="kbid" activeIndex="0" style="width:100%;height:100%;" bodyStyle="padding:0;border:0;">
      <div title="知识点详细信息">
       <fieldset style="border:solid 1px #aaa;position:relative;margin:5px 2px 0px 2px;">
         <legend> 知识点详细信息</legend> 
        <table style="width:100%;height:95%;table-layout:fixed;"  class="nui-form-table">
         <tr>
           <td class="form_label" align="right">知识点标题:</td>
           <td id="kbtitle" ></td> 
           <td class="form_label" align="right" >知识点类型:</td>
           <td id="kbtype" colspan="2"></td>                            
         </tr>
         <tr>
           <td class="form_label" align="right">知识点内容:</td>
           <td id="kbcontent" ></td> 
           <td class="form_label" align="right">知识点提交人:</td>
           <td id="kbsubmitor" ></td>                         
         </tr>
         <tr>
           <td class="form_label" align="right">知识点提交日期:</td>
           <td id="kbsubmitdate"></td> 
           <td class="form_label" align="right">最后更新人:</td>
           <td id="lastmoduser"></td>
         </tr>
         <tr>
           <td class="form_label" align="right">最后更新日期:</td>
           <td id="lastmoddate"></td>
         </tr> 
         <tr>  
           <td class="form_label" align="right">已上传的附件:</td>
           <td id="uploadedFile" colspan="5"></td>
         </tr>
        </table>
        </fieldset> 
     </div>
   </div>
 </div> 
 <div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
 </div>
<script>
  nui.parse();
  var form = new nui.Form("#dataform1"); 
  var kbid = getUrlParam("kbid");
  var kbtype = getUrlParam("kbtype");
  onload();
  
  function onload(){
  	var json = {kbid: kbid ,kbtype: kbtype};
	  nui.ajax({
	    url: "com.primeton.eos.ame_common.kbasecomponent.mis_querykbasedetail.biz.ext",	           
		type: 'POST',
		data: json,
		cache:false,	
		contentType: 'text/json',
	    success: function (o) {
	        document.getElementById("kbtitle").innerHTML = o.kbases.kbtitle == null ?"":o.kbases.kbtitle;
	        document.getElementById("kbtype").innerHTML = nui.getDictText('MIS_KBASE',o.kbases.kbtype);
	        document.getElementById("kbcontent").innerHTML = o.kbases.kbcontent == null ?"":o.kbases.kbcontent;
	        document.getElementById("kbsubmitor").innerHTML = o.kbases.kbsubmitor == null ?"":o.kbases.kbsubmitor;	        
	        document.getElementById("kbsubmitdate").innerHTML = o.kbases.kbsubmitdate == null ?"":o.kbases.kbsubmitdate;
	        document.getElementById("lastmoduser").innerHTML = o.kbases.lastmoduser == null ?"":o.kbases.lastmoduser;
	        document.getElementById("lastmoddate").innerHTML = o.kbases.lastmoddate == null ?"":o.kbases.lastmoddate;
	        var tempSrc = "";
                for(var i=0;i<o.kbases.files.length;i++){
                	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o.kbases.files[i].fileId + "'>" + o.kbases.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
                }
               	document.getElementById("uploadedFile").innerHTML = tempSrc;
               	
	    }
	 });
  }
   
  function getUrlParam(name) { 
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) 
	return unescape(r[2]); 
	return null;
 }
  function onCancel(e) {
	 if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	 else window.close();  
  } 
   </script>
</body>
</html>