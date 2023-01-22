<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-11-01 14:41:46
  - Description:
-->
<head>
<title>组织机构详情信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
 <style type="text/css">
    .asLabel .mini-textbox-border,
    .asLabel .mini-textbox-input,
    .asLabel .mini-buttonedit-border,
    .asLabel .mini-buttonedit-input,
    .asLabel .mini-textboxlist-border
    {
        border:0;background:none;cursor:default;
    }
    .asLabel .mini-buttonedit-button,
    .asLabel .mini-textboxlist-close
    {
        display:none;
    }
    .asLabel .mini-textboxlist-item
    {
        padding-right:8px;
    }    
    </style>
</head>
<body>
	<div id="budgetOrgform">
   		<input class="nui-hidden" name="budgetOrg.orgid" id="orgid"/>
   		
   		<fieldset  style="border:solid 1px #aaa;padding:3px;">
   			<legend>基本信息</legend>
   			<div>
   				<table border="0" cellpadding="1" cellspacing="1" style="width:95%;height:70%;table-layout:fixed;">
		   			<tr>
		   				<td style="width:80px" align="right">
		   					上级机构:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="parentorgName" style="width:100%" class="nui-textbox" readOnly="true"  name="parentorgName" /> 
		   					<input class="nui-hidden" name="budgetOrg.parentorgid" id="parentorgid"/>
		   					<input class="nui-hidden" name="budgetOrg.parentbudyear" id="parentBudYear"/>
		   					<input class="nui-hidden" name="budgetOrg.orglevel" id="orglevel"/>
		   					<input class="nui-hidden" name="budgetOrg.orgseq" id="orgseq"/>
		   				</td>
		   				
		   				<td style="width:80px" align="right">
		   					预算制定人员:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="managerName" style="width: 100%;" name="managerName" class="nui-textbox" />
		   				</td>
		   				
		   			</tr>
		   			<tr>
		   				<td style="width:80px" align="right">
		   					机构名称:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="orgName" style="width:100%" class="nui-textbox"  name="budgetOrg.orgname" required="true" /> 
		   				</td>
		   				<td style="width:80px" align="right">
		   					预算年份:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input class="nui-textbox"  width="100%" name="budgetOrg.budgetYear" id="budgetYear" required="true"  vtype="int" />
		   				</td>
		   				
		   				
		   			</tr>
		   			<tr>
		   				<td style="width:80px" align="right">
		   					机构类型:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input class="nui-dictcombobox" dictTypeId="ABF_ORGTYPE" width="100%" name="budgetOrg.orgtype" id="orgtype" />
		   				</td>
		   				<td style="width:80px" align="right">
		   					机构等级:
		   				</td>
		   				<td style="width:25%" align="left">
		   				<input class="nui-dictcombobox" dictTypeId="BUD_ORGDEGREE" width="100%" name="budgetOrg.orgdegree" id="orgdegree"  />
		   				</td>
		   				
		   			</tr>
		   			<tr>
		   				<td style="width:80px" align="right">
		   					机构状态:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input class="nui-dictcombobox" dictTypeId="ABF_ORGSTATUS" width="100%" name="budgetOrg.status" id="status" />
		   				</td>
		   				
		   				<td style="width:80px" align="right">
		   					所属区域:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="area" style="width:100%" class="nui-textbox"  name="budgetOrg.area" /> 
		   				</td>
		   			</tr>
		   			<tr>
		   				<td style="width:80px" align="right">
		   					排列顺序:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="sortno" style="width:100%" class="nui-textbox"  name="budgetOrg.sortno" /> 
		   				</td>
		   				<td style="width:80px" align="right">
		   					对应实际机构:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="actorgname" style="width: 100%;" name="budgetOrg.actorgname" class="nui-textbox" />
		   				</td>
		   			</tr>
   				</table>
   			</div>
   		</fieldset>
   		
   </div>
</body>
<script type="text/javascript">
		nui.parse();
		
		var orgid = <%=request.getParameter("orgid")%>
		if(orgid == null){
			orgid = 1;
		}
		//预算年份
		var budgetYear= <%=request.getParameter("budgetYear")%>
		if(budgetYear==null){
			var d=new Date();
			budgetYear = d.getFullYear();
		}
		var pName = "<%=request.getParameter("pName")%>";
		var form = new nui.Form("budgetOrgform");
		var json = nui.encode({orgId:orgid,budgetYear:budgetYear});
		if(pName==null || pName=="" || pName=="null" || pName == "undefined" || typeof(pName) == "undefined"){
			
		}else{
			nui.get("parentorgName").setValue(pName);
		}
		nui.get("budgetYear").setValue(budgetYear);
		$.ajax({
	            url: "com.primeton.eos.ame_budget.budgetOrgManager.getbudgetOrgByID.biz.ext",
	            type: 'POST',
	            data: json,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
	                var returnJosn = nui.decode(text);
	                var org = returnJosn.budgetOrg;
	                //form.setData(returnJosn);
	                initEmp(org.managerid);
	                //nui.get("managerid").setValue(org.managerid);
	                nui.get("orgtype").setValue(org.orgtype);
	                nui.get("orgtype").setText(nui.getDictText('ABF_ORGTYPE',org.orgtype));
	                nui.get("orgdegree").setValue(org.orgdegree);
	                nui.get("orgdegree").setText(nui.getDictText('BUD_ORGDEGREE',org.orgdegree));
	                nui.get("status").setValue(org.status);
	                nui.get("status").setText(nui.getDictText('ABF_ORGSTATUS',org.status));
	                nui.get("area").setValue(org.area);
	                nui.get("orgName").setValue(org.orgname);
	                nui.get("orgid").setValue(org.orgid);
	                nui.get("sortno").setValue(org.sortno);
	                nui.get("actorgname").setValue(org.actorgname);
	                setToText();
	            }
	     }); 
	 
	   function initEmp(empId){
	        if(empId){
		    	var json = nui.encode({empId:empId});
				$.ajax({
			            url: "com.primeton.eos.ame_budget.budgetOrgManager.getEmpInfoByEmpId.biz.ext",
			            type: 'POST',
			            data: json,
			            cache: false,
			            contentType:'text/json',
			            cache: false,
			            success: function (text) {
			                var returnJosn = nui.decode(text);
			                //var emp = returnJosn.emp;
			                var names= returnJosn.names
			                nui.get("managerName").setValue(names);
			            }
			     }); 
	        }
    	}
    	
    	function setToText(){
    		var fields = form.getFields();                
            for (var i = 0, l = fields.length; i < l; i++) {
                var c = fields[i];
                if (c.setReadOnly) c.setReadOnly(true);     //只读
                if (c.addCls) c.addCls("asLabel");          //增加asLabel外观
            }
    	
    	}
	     
</script>
</html>