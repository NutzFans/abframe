<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>选择物项明细</title>
<style type="text/css">
    body{
        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
    }
</style>
</head>
<body>
    <div class="nui-fit">
       <div id="datagrid1"    showPager="false" dataField="data"  sortMode="client" 
    	class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.purchase.purchaseplan.queryItemsByOrgid.biz.ext" 
    		multiSelect="true" allowSortColumn=true onshowrowdetail="onShowRowDetail" showfooter="false">
        <div property="columns">
       		<div  type="checkcolumn"  field="zlName" name="a"></div>
        	<div field="dlName" name="dlName" width="120" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">大类名称</div>
			<div field="zlName" name="zlName" width="200" align="center" headerAlign="center" allowSort="true">中类名称</div>
            <div field="xlName" width="100" align="center" headerAlign="center" allowSort="true" >小类名称</div>
            <div field="type" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictIshavebak">采购类型</div>
            <div field="org_id" width="100" align="center" headerAlign="center" allowSort="true" renderer="zhPutUnder">物项归口部门</div>
        </div>
        </div>
    	
    </div>                
    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" 
        borderStyle="border-left:0;border-bottom:0;border-right:0;">
        <a class="nui-button" style="width:60px;" onclick="closeOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="closeCancel()">取消</a>
    </div>
</body>
<script type="text/javascript">
	  nui.parse();
	
    var grid = mini.get("datagrid1");
	var orgid = "<%=request.getParameter("orgid") %>";
    var purType = "<%=request.getParameter("purType") %>";
    grid.load({param:{"orgid":orgid,"purType":purType}})
    function GetData() {
        return grid.getSelecteds();
    }
    function dictIshavebak(e) {
		return nui.getDictText('ZH_PURCHASE',e.value);//设置业务字典值
	}
    function zhPutUnder(e) {
		return nui.getDictText('ZH_PUTUNDER',e.value);//设置业务字典值
	}
	
	grid.on("load", function () {
	    grid.mergeColumns([ "dlName","zlName", "a"]);
	    
	    if(purType==2){
	    	grid.mergeColumns(["dlName", "zlName", "a"]);
	    }
	});
	
</script>
</html>