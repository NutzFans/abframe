<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-03-05 15:22:29
  - Description:
-->
<head>
	<title>续签业务信息</title>
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
    </style>
</head>
<body>
<div class="nui-fit">
	<!-- 员工基本信息展示  -->
	<jsp:include page="/ame_permanage/ame_contract/empDetail.jsp"/>
	<jsp:include page="/ame_permanage/ame_contract/empContDetail.jsp"/>
	<fieldset id="oldCont">
		<legend>历史合同</legend>
		<jsp:include page="/ame_permanage/ame_contract/empContGrid.jsp"/>
	</fieldset>
	<jsp:include page="/ame_common/misOpinion.jsp"/>
</div>
</body>
<script type="text/javascript">
 	nui.parse();
  	var form = new nui.Form("#form1");//申请信息
	var opioionform = new nui.Form("#opioionform");
  	
	var contract = nui.get("Contract");
	
	var processInstID = <%=request.getParameter("processInstID") %>;
  	var empcontid = <%=request.getParameter("empcontid") %>;
  	
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
   	
	init();
	
	var emp;
	var empCont;
	
	function init(){
		form.mask("数据加载中...");
		var data={"empcontid":empcontid,"processInstID":processInstID};
		var json=nui.encode(data);
  		nui.ajax({
      		url: "com.primeton.eos.ame_permanage.ame_contract.getOmEmpCont.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
       	  		empCont = o.empCont;
       	  		emp = o.empCont.emp;
       	  		setEmp();//设置员工基本信息
       	  		setEmpCont();
	            contract.load({ empid: empCont.empid,processinstid:processInstID});
	            
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID: empCont.processinstid});
				
				$("#opinionHide").hide();
				
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
</script>
<script src="<%=request.getContextPath() %>/ame_permanage/ame_contract/js/empcontapply.js" type="text/javascript"></script>
</html>