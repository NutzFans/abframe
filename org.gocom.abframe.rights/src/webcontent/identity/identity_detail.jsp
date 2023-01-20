<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title>jsp auto create</title> 
<script type="text/javascript">
	var reslist = new Array();
	<l:iterate property="identityreslist" id="res">
	   reslist[<l:indexId start="0" />]='<b:write property="resourceid" iterateId="res" />';
	</l:iterate>
	function doSave(frm)
	{
		if(checkForm(frm))
		{
			var action_url = "org.gocom.abframe.rights.application.IdentityManager.insertIdentity.biz";	
			if($name("identity/identityid").value!=null&&$name("identity/identityid").value.trim()!="")
			{
				action_url = "org.gocom.abframe.rights.application.IdentityManager.updateIdentity.biz";
			}		   
			var ajax = new Ajax(action_url);
			ajax.submitForm(frm);			
			var returnNode =ajax.getResponseXMLDom();
	        if (returnNode){
	        	if(ajax.getValue("root/data/flag")=="true"){
	            	alert('<b:message key="identityManager_m_savesuccess"/>');    //������ݳɹ�
	            	window.close();
	            }
	        }else{
	        	alert('<b:message key="identityManager_m_savefailure"/>');    //�������ʧ��
	        }
        }
	}	
    function initSelected()
    {
    	var len = reslist.length;
        var g = $id("group1")
        if(len>0){
        	for(var i=0;i<len;i++){                
            	for(var j=0;j<g.getLength();j++){                   
                	if(reslist[i]==g.get(j).getParam("select_objs/resourceid")){                     
                    	g.get(j).setSelected();
                       	break;
                    }                     
                }                   
             }
        }
	}
          
</script>
</head>
<body>
<h:form id="form1"  method="post">
<h:hidden name="identity/acOperator/operatorid" property="userObject/attributes/operatorid" scope="session"/>
<h:hidden property="identity/identityid" />
	<table align="center" border="0" width="100%" class="form_table">
          <tr>
            <td class="form_label" width="20%">   <!--  ������ -->
              <b:message key="identityManager_l_identityname"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td width="30%">
                <h:text  property="identity/identityname" validateAttr="allowNull=false" />                
            </td>
            <td class="form_label" width="20%">   <!--  Ĭ����� -->
              <b:message key="identityManager_l_identityflag"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td width="30%">
                <d:select dictTypeId="ABF_YESORNO" property="identity/identityflag"/>                
            </td>
          </tr>
          <tr>
            <td class="form_label">   <!-- ��ʾ˳�� -->
              <b:message key="identityManager_l_seqno"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td class="form_label">
               <h:text validateAttr="type=number" property="identity/seqno" />                
            </td>
            <td class="form_label">  
              &nbsp;
            </td>
            <td class="form_label">
               &nbsp;              
            </td>
          </tr>
          <tr>
	       <td colspan="4" class="eos-panel-title">&nbsp;&nbsp;&nbsp;<b:message key="roleManager_l_roleList"></b:message> </td>
	     </tr>
          <tr>
             <td colspan="4">
               <table align="center" border="0" width="100%" class="EOS_table">           
	          <tr>
	            <th align="center">
	              <l:greaterThan property="l_length" targetValue="0" compareType="number">
	                  <input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll('checkSelect','group1');"> 
	              </l:greaterThan>
	              <b:message key="l_select"></b:message>	             
	            </th>
	            <th> <!--  ��ɫ��� -->
	              <b:message key="identityManager_l_roleid"></b:message>
	            </th>
	            <th> <!--  ��ɫ��� -->
	              <b:message key="identityManager_l_rolename"></b:message>
	            </th>	            
	          </tr>
          <w:checkGroup id="group1">
          <l:iterate property="rolelist" id="id1">
              <tr class="<l:output evenOutput='EOS_table_row' />">
                <td align="center">
                    <w:rowCheckbox >                       
                        <h:param name='select_objs/resourceid' iterateId='id1' property='roleid' indexed="true" />
                        <h:param name='select_objs/resourcetype' value='role' indexed="true" />
                    </w:rowCheckbox>
                </td>
                <td>  <!--  ��ɫ��� -->
                  <b:write iterateId="id1" property="roleid" />
                </td>
                <td>  <!--  ��ɫ��� -->
                  <b:write iterateId="id1" property="rolename" />
                </td>                
                </tr>
            </l:iterate>
            </w:checkGroup>
            <tr>
              <td colspan="5" class="command_sort_area" align="center">
                <input type="button" class="button" value='<b:message key="l_save"/>' onclick="doSave(this.form);" >
                <input type="button" class="button" value='<b:message key="l_close"/>' onclick="self.close();" >
              </td>
            </tr>
            </table>
             </td>
          </tr>
        </table>
</h:form>
</body>
</html>
