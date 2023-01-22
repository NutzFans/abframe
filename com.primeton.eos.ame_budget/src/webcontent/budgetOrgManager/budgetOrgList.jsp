<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-11-01 15:21:07
  - Description:
-->
<head>
<title>机构列表</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%;overflow:scroll; margin: 0px;">
   <div class="nui-fit" > 
         <div  id="datagrid1" idField="orgid"
                        class="nui-datagrid"
                        style="width:100%;height:100%;"
                        url="com.primeton.eos.ame_budget.budgetOrgManager.getBudgetOrgListByID.biz.ext"
                        pageSize="20" sizeList="[10,20,50,100]"
                        showPageInfo="true"
                        multiSelect="true"
                        allowSortColumn="false">
                    <div property="columns">
                        <div type="indexcolumn"></div>
                        <div field="orgid" headerAlign="center" allowSort="true" visible=false>业务序号</div>
                        
                        <div field="orgname" headerAlign="center" allowSort="true" >机构名称</div>
                        
                        <div field="budgetYear" headerAlign="center" allowSort="true" >预算年份</div>
                        
                        <div field="orgtype" headerAlign="center" allowSort="true" renderer="orgtypeRenderer">机构类型</div>
                        
                        <div field="orgdegree" headerAlign="center" allowSort="true" renderer="orgdegreeRenderer">机构等级</div>
                        
                        <div field="status" headerAlign="center" allowSort="true" visible=false>机构状态</div>
                        
                        <div field="manaposition" headerAlign="center" allowSort="true" visible=false>机构主管岗位</div>
                        
                        <div field="managerName" headerAlign="center" allowSort="true">预算制定人员</div>
                        
                    </div>
          </div>
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
		var grid = nui.get("datagrid1");
		grid.load({orgId:orgid,budgetOrgYear:budgetYear});
		
		function orgdegreeRenderer(e){
			return nui.getDictText('BUD_ORGDEGREE',e.value);
		}
		
		function orgtypeRenderer(e){
			return nui.getDictText('ABF_ORGTYPE',e.value);
		}

</script>		
</html>