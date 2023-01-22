<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-05-19 11:04:07
  - Description:
-->
<head>
	<title>合同审批表产品授权列表</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<fieldset style="border:solid 1px #aaa;padding:3px;">
        <legend>产品授权清单</legend>
        <div id="csContLicense_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="csContLicenses" 
        	showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
        	editNextOnEnterKey="true"  url="com.primeton.mis.contract.contractApproval.getAmeContLicense.biz.ext" 
        	oncellendedit="doContLicsum"  showSummaryRow="true" ondrawsummarycell="drawCsReveForecastSum">			            
            <div property="columns">
                <div field="contnum" width="100" headerAlign="center" align="left">合同编号</div>
                <div field="prodname" displayField="prodtypename" width="300" headerAlign="center" >产品名称</div>
                <div field="grantunit" width="100" renderer="getCsContLicType" headerAlign="center" align="left">授权单位</div>
                <div field="total" width="80" headerAlign="center" align="center" summaryType="sum">约定数量</div>
                <div field="grantnum" width="80" headerAlign="center" align="center" summaryType="sum">已发放数量</div>
                <div field="lastnum" width="80" headerAlign="center" align="center" summaryType="sum">剩余数量</div>
            </div>
        </div>
    </fieldset>
</body>
</html>