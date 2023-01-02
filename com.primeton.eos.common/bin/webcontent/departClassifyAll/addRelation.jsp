<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 张雅兰
  - Date: 2019-05-15 16:21:16
  - Description:
-->
<head>
<title>费用类型详情信息</title>
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
   <div id="datagrid1" frozenStartColumn="0" frozenEndColumn="4" sizeList="[10,20,50,100]" showPager="false" dataField="departtypess" 
    	showSummaryRow="true"  sortMode="client"  
    	class="nui-datagrid" style="width:100%;height:350px;" url="com.primeton.eos.common.departmentClassifyType.getdepartmentRelation.biz.ext" 
    	multiSelect="true" allowSortColumn=true>
	        <div property="columns">
	            <div field="deptexptypeid" width="120" align="center" headerAlign="center" allowSort="true">部门费用类型编码</div>
	            <div field="deptexptypename" width="80" align="center" headerAlign="center" allowSort="true">部门费用名称</div>
	            <div field="exptypeid" width="80" align="center" headerAlign="center" allowSort="true" >报销费用类型编码</div>
	            <div field="feetypename" width="110" align="center" headerAlign="center" allowSort="true">报销费用名称</div>
	        </div>
    </div>
</body>
<script type="text/javascript">
		nui.parse();
		
	    var grid = nui.get("datagrid1");
		var deptexptypeid = '<%=request.getParameter("deptexptypeid")%>';
		var type = '<%=request.getParameter("type")%>';
		if(deptexptypeid == null){
			deptexptypeid = 1;
		}
		var feet = null;
		var form = new nui.Form("feetypeform");
		var json = nui.encode({"deptexptypeid":deptexptypeid,"type":type});
		$.ajax({
	            url: "com.primeton.eos.common.departmentClassifyType.getDepartmenttypeById.biz.ext",
	            type: 'POST',
	            data: json,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
	                var returnJosn = nui.decode(text);
	                feet = returnJosn.deptexptype;
	                nui.get("deptexptypeid").setValue(feet.deptexptypeid);
	                nui.get("deptexptypename").setValue(feet.deptexptypename);
	                if(type =="1"){
		                nui.get("status").setValue(feet.status);
		                nui.get("deptgrouptypename").setValue(feet.erprptTDeptgrouptype.deptgrouptypename);
	                }
	                setToText();
	                //加载部门费用类型与报销类型对应关系
	                grid.load({
	                	"deptexptypeid":deptexptypeid
	                });
	            }
	     }); 
	     
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