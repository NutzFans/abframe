<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="commonj.sdo.DataObject" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@include file="/common/common.jsp"%> 
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-20 14:51:55
  - Description:
-->
<head>
	<title>离职申请流程业务信息</title>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
	<link href="../demo.css" rel="stylesheet" type="text/css" /><style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    .asLabel
    {
        border:0;background-color:#F5F5F5;cursor:default;    
    }
    </style>
</head>
<body>
<div class="nui-fit">
	<jsp:include page="/ame_permanage/ame_leave_apply/omLeavedetail.jsp"/>
	<fieldset id="file" style="width: 96%;">
		<legend>附件</legend>
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	    <table style="width:30%;">
	        <tr>
	            <td align="left">
	                <a class="nui-button" id="okbutton" iconCls="icon-ok" onclick="onOk()">保存</a>
	            </td>
	        </tr>
	     </table> 
		<jsp:include page="/ame_common/addFiles2.jsp"/>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	    </div> 	
	</fieldset>
	<fieldset id="field55" style="border:solid 1px #aaa;padding:3px;">
       <legend>核查要点信息</legend>
       <jsp:include page="/ame_common/csIncomecheck/showIncomeCheck.jsp"/>	
    </fieldset>
	<jsp:include page="/ame_common/misOpinion.jsp"/>
</div>
</body>
<script type="text/javascript">
 	nui.parse();
  	var form = new nui.Form("#form1");//申请信息
	var opioionform = new nui.Form("#opioionform");
  	var grid_AllCheck = nui.get("grid_AllCheck");//核查要点
  	var leaveid = <%=request.getParameter("leaveid") %>;
	var processInstID = <%=request.getParameter("processInstID") %>;
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
   		Map<String,Object> a = user.getAttributes();
   		DataObject[] roles1 = (DataObject[])a.get("roles");
   		Boolean isHR = false;//是否财务
   		for(int i=0;i < roles1.length;i++){
			if(roles1[i].getString("roleid").equals("hrLeaveApply")){
				isHR=true;
			}
		}
	%>
	var isHR = <%=isHR %>;
	init();
	function init(){
		form.mask("数据加载中...");
		var data={"leaveid":leaveid,"processInstID":processInstID};
		var json=nui.encode(data);
  		nui.ajax({
      		url: "com.primeton.eos.ame_permanage.ame_leave_apply.getLeaveApply.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
                document.getElementById("userid").innerHTML = o.omLeaveApply.empname == null ?"": o.omLeaveApply.empname;
                document.getElementById("hopeoutdate").innerHTML = o.omLeaveApply.outdate == null ?"": o.omLeaveApply.outdate;
                document.getElementById("outplace").innerHTML = o.omLeaveApply.outplace == null ?"":  nui.getDictText('EXP_REGION',o.omLeaveApply.outplace);
                document.getElementById("hopedealoutdate").innerHTML = o.omLeaveApply.dealoutdate == null ?"": o.omLeaveApply.dealoutdate;
                document.getElementById("outtype").innerHTML = o.omLeaveApply.outtype == null ?"":nui.getDictText('OUT_TYPE',o.omLeaveApply.outtype);
                document.getElementById("outreason").innerHTML = o.omLeaveApply.outreason == null ?"": nui.getDictText('OUT_REASON',o.omLeaveApply.outreason);
                document.getElementById("vacdealtype").innerHTML = o.omLeaveApply.vacdealtype == null ?"": nui.getDictText('OM_LEAVE_VAC',o.omLeaveApply.vacdealtype);
                if("2" == o.omLeaveApply.outtype){
                	document.getElementById("bdleave").style.display = "";
	            	document.getElementById("outoffsetmon").innerHTML = o.omLeaveApply.outoffsetmon == null ?"":formatNumber(o.omLeaveApply.outoffsetmon.toFixed(2),'#,##.00');
                	document.getElementById("outoffsetdesc").innerHTML = o.omLeaveApply.outoffsetdesc == null ?"": o.omLeaveApply.outoffsetdesc;
                }
                document.getElementById("handuserid").innerHTML = o.omLeaveApply.handusername == null ?"": o.omLeaveApply.handusername;
                document.getElementById("handrequire").innerHTML = o.omLeaveApply.handrequire == null ?"": o.omLeaveApply.handrequire;
                document.getElementById("handremark").innerHTML = o.omLeaveApply.handremark == null ?"": o.omLeaveApply.handremark;
                document.getElementById("mailretain").innerHTML = o.omLeaveApply.mailretain == null ?"": nui.getDictText('OM_LEAVE_MAIL',o.omLeaveApply.mailretain);
                document.getElementById("mailretaindate").innerHTML = o.omLeaveApply.mailretaindate == null ?"": o.omLeaveApply.mailretaindate;
                document.getElementById("outagent").innerHTML = o.omLeaveApply.outagentname == null ?"": o.omLeaveApply.outagentname;
                document.getElementById("isreturnvisit").innerHTML = o.omLeaveApply.isreturnvisit == null ?"": nui.getDictText('MIS_YN',o.omLeaveApply.isreturnvisit);
                document.getElementById("issignconf").innerHTML = o.omLeaveApply.issignconf == null ?"": nui.getDictText('MIS_YN',o.omLeaveApply.issignconf);
			    <!--document.getElementById("outmemo").innerHTML = o.omLeaveApply.outmemo == null ? "":o.omLeaveApply.outmemo;-->
			    document.getElementById("remark").innerHTML = o.omLeaveApply.remark == null ? "":o.omLeaveApply.remark;
				document.getElementById("leaveprovedate").innerHTML = o.omLeaveApply.leaveprovedate == null ? "":o.omLeaveApply.leaveprovedate;
			    document.getElementById("poutreason").innerHTML = o.omLeaveApply.poutreason == null ?"": nui.getDictText('OUT_REASON',o.omLeaveApply.poutreason);
				document.getElementById("empcode").innerHTML = o.omLeaveApply.empcode == null ? "":o.omLeaveApply.empcode;
				document.getElementById("indate").innerHTML = o.omLeaveApply.indate == null ? "":o.omLeaveApply.indate;
				document.getElementById("positionname").innerHTML = o.omLeaveApply.positionname == null ? "":o.omLeaveApply.positionname;
				document.getElementById("revisitreason").innerHTML = o.omLeaveApply.revisitreason == null ? "":nui.getDictText('OUT_REASON',o.omLeaveApply.revisitreason);
				document.getElementById("revisitremark").innerHTML = o.omLeaveApply.revisitremark == null ? "":o.omLeaveApply.revisitremark;
				document.getElementById("recipient").innerHTML = o.omLeaveApply.recipient == null ? "":o.omLeaveApply.recipient;
				document.getElementById("telephone").innerHTML = o.omLeaveApply.telephone == null ? "":o.omLeaveApply.telephone;
				document.getElementById("leaveaddress").innerHTML = o.omLeaveApply.leaveaddress == null ? "":o.omLeaveApply.leaveaddress;
				document.getElementById("revisitothreason").innerHTML = o.omLeaveApply.revisitothreason == null ? "":nui.getDictText('OUT_REASON',o.omLeaveApply.revisitothreason);
				document.getElementById("revisitfeel").innerHTML = o.omLeaveApply.revisitfeel == null ? "":o.omLeaveApply.revisitfeel;
				document.getElementById("revisitadvise").innerHTML = o.omLeaveApply.revisitadvise == null ? "":o.omLeaveApply.revisitadvise;
				document.getElementById("revisitgo").innerHTML = o.omLeaveApply.revisitgo == null ? "":o.omLeaveApply.revisitgo;
				document.getElementById("leaveaddress").innerHTML = o.omLeaveApply.leaveaddress == null ? "":o.omLeaveApply.leaveaddress;
				document.getElementById("revisitsalary").innerHTML = o.omLeaveApply.revisitsalary == null ? "":o.omLeaveApply.revisitsalary;
                document.getElementById("isthird").innerHTML = o.omLeaveApply.isthird == null ?"": nui.getDictText('MIS_YN',o.omLeaveApply.isthird);
				document.getElementById("thirdmark").innerHTML = o.omLeaveApply.thirdmark == null ? "":o.omLeaveApply.thirdmark;
				showIncomeCheck(o.omLeaveApply.processinstid);
				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"OM_LEAVE_APPLY","relationid":o.omLeaveApply.leaveid});
				grid_0.sortBy("fileTime","desc");
				
				if(!isHR){
                	document.getElementById("tr1").style.display = "none";
                	document.getElementById("tr2").style.display = "none";
                	document.getElementById("tr3").style.display = "none";
                	document.getElementById("tr4").style.display = "none";
                	document.getElementById("tr5").style.display = "none";
                	document.getElementById("tr6").style.display = "none";
                	document.getElementById("tr7").style.display = "none";
                	document.getElementById("tr8").style.display = "none";
                	document.getElementById("tr9").style.display = "none";
                	document.getElementById("tr10").style.display = "none";
                	document.getElementById("tr11").style.display = "none";
                	document.getElementById("tr12").style.display = "none";
                	document.getElementById("hrconf").style.display = "none";
                	document.getElementById("file").style.display = "none";
                	document.getElementById("bdleave").style.display = "none";
                	document.getElementById("field55").style.display = "none";
				}
  				
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID: o.omLeaveApply.processinstid});
				//设置审核意见基本信息
				nui.get("processinstid").setValue(o.workitem.processInstID);
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
               	nui.get("isshow").setValue("1");
				$("#opinionHide").hide();
				
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	function onOk(){
        document.getElementById("fileCatalog2").value="OM_LEAVE_APPLY";
	    form6.submit();
	}
	function SaveData2(){
	    var fileids = nui.get("fileids2").getValue();
	    var data={"leaveid":leaveid,"fileids":fileids};
	    nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_leave_apply.updateOmLeaveApplyFiles.biz.ext",
            data: data,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	location.reload();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
        });
	}
</script>
</html>