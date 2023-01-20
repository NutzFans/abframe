<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-06-13 13:54:50
  - Description:
-->
<head>
<title>选择改派人员</title>
<meta charset="utf-8" />
<!-- start: MAIN CSS -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/ame_common/wxworktime/select2/dist/css/select2.min.css"/>
<style type="text/css">
	body{text-align: center;}
</style>
</head>
<body>
<select id="search-select" style="width: 80%" class="search-select">
	<option id="" ></option>
</select>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/ame/clipview/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/wxworktime/select2/dist/js/select2.full.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/wxworktime/select2/dist/js/select2.min.js"></script>
<script type="text/javascript">
	//下拉框
 	$("#search-select").select2({
  		placeholder: "请选择改派人",
      	allowClear:true,
      	ajax: {
	        url: "com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext",
	        dataType: 'json',
	        delay: 250,
	        openOnEnter:"true",
	        data: function (params) {
	          return {
	            name: params.term,
	          };
	        },
            processResults: function (data) {
                var arr = data.data;
                var empArr=[];
                for(item in arr){
                    empArr.push({id: arr[item].USERID, text: arr[item].EMPNAME});
                }
              	return {
                	results: empArr
              	};
            },
            cache: false
      	},
      	escapeMarkup: function (markup) { return markup; }, 
      	minimumInputLength: 2,
      	formatResult: function formatRepo(repo){
      		return repo.text;
      	}, // 函数用来渲染结果
      	formatSelection: function formatRepoSelection(repo){
      		return repo.text;
      	} // 函数用于呈现当前的选择
	});
	
	function getData(){
		var res = $("#search-select").select2("data")[0];
		return res;
	}
</script>
</html>