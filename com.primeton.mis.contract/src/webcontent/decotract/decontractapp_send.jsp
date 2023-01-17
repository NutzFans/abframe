<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://eos.primeton.com/tags/html" prefix="h"%>
<%@ taglib uri="http://eos.primeton.com/tags/logic" prefix="l"%>
<%@ taglib uri="http://eos.primeton.com/tags/bean" prefix="b"%>
<%@ taglib uri="http://eos.primeton.com/tags/eos" prefix="e"%>
<%@ taglib uri="http://eos.primeton.com/tags/webcomp" prefix="w"%>
<%@ taglib uri="http://eos.primeton.com/tags/richweb" prefix="r"%>
<%@ taglib uri="http://eos.primeton.com/tags/dict" prefix="d"%>
<%@ taglib uri="http://eos.primeton.com/tags/abframe" prefix="abf"%>
<%@page import="org.gocom.abframe.auth.bizlet.SkinUtil"%>
<%@page import="org.gocom.abframe.ABFConfigKey"%>
<%
//TODO å¦æè¦è®¾ç½®å®¢æ·ç«¯ç¼å­é¡µé¢ï¼æ³¨éä»¥ä¸ä¸è¡
response.setHeader("Pragma","No-Cache"); 
response.setHeader("Cache-Control","No-Cache"); 
response.setDateHeader("Expires",   0);  
%>
<script type="text/javascript">
	var contextPath = "<%=request.getContextPath()%>";	 // you should define the contextPath of web application
	var EOSDEBUG = true;
	var FINAL_PANEL_HEIGHT = 22;
	<%-- manager(group_manager.jsp)ä¸»é¡µé¢ä¸­iframeéè¦åå°çé«åº¦ --%>
	var IFRAME_MODIFY_HEIGHE = 35;
	<%-- tree(group_tree.jsp)é¡µé¢ä¸­treeéè¦åå°çé«åº¦ --%>
	var TREE_MODIFY_HEIGHT = 22;
</script>
<h:script i18n="true" src="/common/javascripts/message.js" />
<h:script src='<%=ABFConfigKey.SKIN_STYLE_LOC.getConfigValue()+"/resource.js.jsp"%>'/>
<h:script src="/common/skins/skin0/scripts/resource.js"></h:script>
<h:script src="/common/fckeditor/ckeditor.js" />
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<h:script src="/common/lib/mootools.js"/>
<h:script src="/common/javascripts/common.js" />
<h:script src="/fckeditor/fckeditor.js" />
<h:script src="/common/javascripts/eos-richtext-patch.js" />
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-sys.css",request)%>'/>
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-component.css",request)%>'/>
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-custom.css",request)%>'/>
<%@page import="com.eos.web.taglib.util.RequestUtil,java.util.Map,java.util.HashMap,com.eos.foundation.MailInfo,com.primeton.mis.common.mail.MailManager,com.primeton.ext.access.http.EOSDownloadResource" %>
<%
	//Enumeration ee = request.getAttributeNames();
	//while(	ee.hasMoreElements())
	//	System.out.println(ee.nextElement());
	MailInfo mailinfo = (MailInfo)pageContext.getRequest().getAttribute("mailinfo");
	System.out.println(mailinfo.get("templateid"));
	String bg_pic  = MailManager.getUploadFilePath(Long.toString((Long)mailinfo.get("templateid")));
	String pic_url = null;
	System.out.println(bg_pic);
	if (bg_pic!=null){
		//记录在session中的下载文件列表
	 	Object o = pageContext.getSession().getAttribute("EosDownFileList");
	    Map fileList;
	    //无则生成
      	if (o != null) {
        	fileList = (Map)o;
      	} else {
        	fileList = new HashMap(100);
        	pageContext.getSession().setAttribute("EosDownFileList", fileList);
      	}

		//初始化下载文件
		EOSDownloadResource dr = new EOSDownloadResource(bg_pic);

		//生成文件key
		String downloadFilekey="";
	    do
          downloadFilekey = "download" + Math.random();
        while (fileList.get(downloadFilekey) != null);
        fileList.put(downloadFilekey, dr);
	
		pic_url = RequestUtil.getContextPath(pageContext) + "/common/jsp/download.jsp?id=" + downloadFilekey;
		System.out.println(pic_url);
	}
 %>

<html>
<!-- 
  - Author(s): 岳广彬
  - Date: 2009-12-23 21:19:28
  - Description:组件申请邮件填写页面
-->
<head>
<title>待签署合同邮件发送</title>

</head>
<body onload="doResize()">
 <e:datasource name="mailtemplate" type="entity" path="com.primeton.mis.common.template.MailTemplate" />
    <form name="data_form"  action="com.primeton.mis.decontract.decontractSend.flow"  method="post" enctype="multipart/form-data" onsubmit="return checkForm(this);">
      <h:hidden property="mailinfo/templateid" name="mailinfo/templateid"/>
      <h:hidden property="miscontapp/contappid" name="miscontapp/contappid"/>
      <!--区分参数是设置到邮件主题还是正文-->
      <input type="hidden" name="configflag" value="0">
      <h:hiddendata property="logEntity"/>
      
      <dataform id= "1bcae521-7482-4c2f-9568-f95318e0de47">
        <w:panel id="panel1" width="100%" title="邮件发送">
          <table align="center" border="0" width="100%" class="form_table">
            <tr class="form_bottom">
              <td colspan="2">
              <DIV align="left">
                <input type="button" id="aaa" value="发送" onclick="javascript:doSend();" class="button">
                <input type="button" value="关闭" onclick="javascript:window.close();" class="button">
              </DIV>
              </td>
            </tr>
            <tr>
              <td class="form_label">
                收件人
              </td>
              <td>
                <h:text property="mailinfo/mailtolist" size="95" title="多个邮件地址以;号隔开" validateAttr="allowNull=false"/>
                <input type="button" class="button" name="btn1" value="选择" onclick="doSelectLinkman('to');">
              </td>
            </tr>
            <tr>
              <td class="form_label">
                抄送人
              </td>
              <td>
                <h:text property="mailinfo/mailcclist" size="95" title="多个邮件地址以;号隔开"/>
                <input type="button" class="button" name="btn1" value="选择" onclick="doSelectLinkman('cc');">
              </td>
            </tr>
            <tr>
              <td class="form_label">
                邮件主题
              </td>
              <td>
                <h:text property="mailinfo/mailtitle" size="95" validateAttr="allowNull=false"/>
              </td>
            </tr>
            <tr>
              <td class="form_label">
                正文
              </td>
              <td>
                <textarea name="mailinfo/content" cols="80" rows="4">
                <%
                if (pic_url!=null)
                	out.println("<STYLE TYPE=\"text/css\">BODY {background-image: URL(\"".concat(pic_url).concat("\");background-repeat: no-repeat;background-attachment: fixed;} </STYLE>"));
                 %>
				<b:write property="mailinfo/content" filter="false"/>
				</textarea> 
				<script type="text/javascript"> 
				var oFCKeditor = new FCKeditor("mailinfo/content"); 
				oFCKeditor.Config['ToolbarStartExpanded'] = false ;
				oFCKeditor.BasePath = "<%=request.getContextPath()%>/fckeditor/"; 
				oFCKeditor.Height = 350; 
				oFCKeditor.ToolbarSet = "Default"; 
				oFCKeditor.ReplaceTextarea(); 
				</script>
              </td>
            </tr>
            <tr>
              <td class="form_label">
                邮件附件
              </td>
              <td>
                <table id="FileTable" align="center" border="0" width="100%" class="form_table">
                  <tr>
                    <%int num=0;%>
                    <l:iterate property="attaches" id="id1">
                    <%num++;String name="show"+num;%>
                    <div id="<%=name%>" style="display:block">
                    <input type="hidden" id="ID<%=num%>" name="fileid" value="<b:write iterateId="id1" property="fileId" />">
					<%try{%>
					<h:download property="filePath" iterateId="id1"><b:write iterateId="id1" property="fileName"/></h:download> 
					<%}catch(Exception e){%><span style="color:red">附件不存在</span><%}%> 

					<!-- 邮件模板中带的附件不能删除
				    <input type="button" class="btn" value="删除" onclick="deleteFileOnly(('<b:write iterateId="id1" property="fileId" />','<%=name%>','<%=num%>')">
				     -->
					</div>
                    </l:iterate>
                  </tr>
                  <tr>
                    <h:file  name="file_attach"/>
                    <input type="button" class="button" value="增加新附件" onclick="AddFile();">
                  </tr>
                </table>
              </td>
            </tr>
            
          </table>
        </w:panel>
      </dataform>
    </form>
  </body>
</html>
<script>
 var frm = $name("data_form");
 function doSend(){
 	if(checkForm(frm)){
 		document.getElementById("aaa").disabled = "true";
 		frm.submit();
 	}
 }
 
function configParam(flag) {
   var urlStr = 'com.primeton.mis.template.EntityFieldMsg.flow?entityUrl=<b:write property="mailtemplate/entityname"/>';
   //var str = showModal(urlStr, 600, 400);
   var str = showModalCenter(urlStr, "", callField, 600, 400, '选择字段');
   frm.elements("flag").value = flag
   
}
function callField(str){
   var flag = frm.elements("flag").value
   if (str != null) { 
	   str = "@#" + str + "#@";   
	   //alert(str);
	   //var str = "参数";
	   //var obj = document.inputForm.elements("MAIL_TEMPLATE/TEMPLATENAME");
	   //obj.currPos = document.selection.createRange().duplicate()//对象自定义属性currPos为文档中当前激活选中区被建立的TextRange对象的副本
	   //var flag = document.inputForm.elements("configflag").value;
	   if (flag == 1) {
	      AddText(str);
	   } else {
	      
	      InsertHTML("mailtemplate/content",str);
	   }
   }
}


function getActiveText() {
   var obj = frm.elements("mailtemplate/mailtitle");
   obj.currPos = document.selection.createRange().duplicate();//对象自定义属性currPos为文档中当前激活选中区被建立的TextRange对象的副本
   //document.inputForm.elements("configflag").value = "1";//设置configflag为1
}
function AddText(str) {
var obj = frm.elements("mailtemplate/mailtitle");
   if (obj.currPos)//如果对象obj存在属性
      obj.currPos.text=str
      //设置对象obj当前激活选中区被建立的TextRange对象的文本为参数str的值
      //实现在光标位置插入参数str的值或者用参数str的值来替换选中区文本
   else obj.value+=str
   //如果对象obj的自定义属性currPos不存在//直接把参数str的值添加到对象obj的值后面
}

function InsertHTML(e,inStr)
    {
     var oEditor = FCKeditorAPI.GetInstance(e) ;
     if ( oEditor.EditMode == FCK_EDITMODE_WYSIWYG )
     {
      // Insert the desired HTML.
      oEditor.InsertHtml( inStr ) ;
     }
     else
      alert( 'You must be on WYSIWYG mode!' ) ;
    }

    function ExecuteCommand( commandName,e )
    {
     var oEditor = FCKeditorAPI.GetInstance(e) ;
     oEditor.Commands.GetCommand( commandName ).Execute() ;
    }
function doSelectLinkman(flag){
    if (flag=='to')
	showModalCenter("com.primeton.csoms.mis_cs2.linkmanSelect.flow","",callback_select_to_mail , 800, 300,"人员选择（单选）");
	if (flag=='cc')
	showModalCenter("com.primeton.csoms.mis_cs2.linkmanSelect.flow","",callback_select_cc_mail , 800, 300,"人员选择（单选）");
}
function callback_select_to_mail(value){
	var ret = value;
	if (ret != null) {
		var linkman = ret[1];
        var email = ret[5];
		if (email ==null||email==""){
			alert("选择的联系人没有email");
			return;
		}
		var mailtolist = $name("mailinfo/mailtolist").value.trim();
		if (mailtolist.trim()!="")mailtolist += ";";
		mailtolist += linkman+"<"+email+">";
		$name("mailinfo/mailtolist").value=mailtolist;
	}
}
function callback_select_cc_mail(value){
	var ret = value;
	if (ret != null) {
		var linkman = ret[1];
        var email = ret[5];
		if (email ==null||email==""){
			alert("选择的联系人没有email");
			return;
		}
		var mailtolist = $name("mailinfo/mailcclist").value.trim();
		if (mailtolist.trim()!="")mailtolist += ";";
		mailtolist += linkman+"<"+email+">";
		$name("mailinfo/mailcclist").value=mailtolist;
	}
}
</script>
<script>

//动态增加附件选择框
function AddFile(){
	var myTable = document.all.FileTable;
	var t_rownum = myTable.rows.length;
	//向表格中增加一行
	var myNewRow = myTable.insertRow(myTable.rows.length);
	//取得表格的总行数
	var aRows=myTable.rows;
				
	//取得表格的总网格数
	var aCells=myNewRow.cells;
	//向新增行中增加2个网格
	//var oCell1_1=aRows(myNewRow.rowIndex).insertCell(aCells.length);
	var oCell1_2=aRows(myNewRow.rowIndex).insertCell(aCells.length);
				
	t_rownum=t_rownum+1;
	var rowId="rowId"+t_rownum;
				
	myNewRow.id=rowId;
	//设置2个网格的html文本
	oCell1_2.className = "fb_add_content";
	oCell1_2.colspan = "2";
	oCell1_2.innerHTML="<input  type='file' class='txt' name='file_attach'><input type='button' class='btn' value='删除' onclick='DeleteFile(\""+rowId+"\");'>";
				
	return;
}

//动态删除附件选择框
function DeleteFile(rowId){
	var myTable = document.all.FileTable;	
	myTable.deleteRow(eval(rowId).rowIndex);	
	return;
}	

function getAffix(file_id) {
		url = "fbfile.pr.prFbfile_T_FileDownload.do?FBFILE_T_FILE/FILE_ID=" + file_id;
		window.location.href=url;
	}
function delAttachFile(fileid,name){
	if (!confirm("删除附件将不可恢复。确定删除吗？"))return false;
		
      
	var myAjax = new Ajax("org.gocom.abframe.tools.FileUploadManager.deleteFile.biz");
	
    myAjax.addParam("uploadFiles/fileId", fileid);
    myAjax.addParam("isDeleteFile", true);
    myAjax.submit();
    var returnNode =myAjax.getValue("root/data/success");
    if (returnNode == true) {
       document.getElementById(name).style.display='none';
    }
  }
function deleteFileOnly(fileid,name,num){
	   //DeleteFile(name);
	   document.getElementById(name).style.display='none';
       document.getElementById('ID'+num).value = "";
  }

function doResize(){
	var ww="900";
	var hh="600";
	var left=(screen.availWidth-ww)/10;
	var top=(screen.availHeight-hh)/200;
	window.moveTo(left,top);
	window.resizeTo(ww,hh);
	//resize(ww,hh)
}
  
  //禁止手动刷新页面，避免重复提交
　　document.onkeydown = function() {
　　　　if(event.keyCode==116) {
　　　　　　event.keyCode=0;
　　　　　　event.returnValue = false;
　　　　}
　　}
//	document.oncontextmenu = function() {event.returnValue = false;}
</script>