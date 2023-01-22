<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<body>
<table class="table table-striped table-hover" id="contListId"  >
	<thead>
		<tr>
			<th data-field="contnum" data-align="left" data-halign = "center" data-width = "12%" data-formatter = "onCsContractRenderer">合同编号</th>
			<th data-field="misCustinfo.custname">客户名称</th>
			<th data-field="projectname" >合同名称</th>
			<th data-field="contsum" data-formatter = "numformat" data-align="right">合同金额</th>
			<th data-field="recognisedIncome" data-formatter = "numformat" data-align="right">已确认收入</th>
			<th data-field="recognizedRevenue" data-formatter = "numformat" data-align="right">待确认收入</th>
			<th data-field="gathermon" data-formatter = "numformat" data-align="right">已收款</th>
		</tr>
	</thead>
</table>
</body>
<!-- end: BODY -->
<script type="text/javascript">
	//加载我的销售合同
	function loadMycont(){
		//遮罩
		var el = $('#contListId').parents(".panel");
		el.block({
			overlayCSS: {
				backgroundColor: '#fff'
			},
			message: '<img src="assets/images/loading.gif" /> Just a moment...',
			css: {
				border: 'none',
                color: '#333',
                background: 'none'
            }
		}); 
 		var jsonpro = {"sortOrder":"desc","sortField":"contreg"};
		$.ajax({
			url:'com.primeton.eos.ame_income.csContract.queryContractByIndex.biz.ext',
			data: jsonpro,
			type:"POST",
			success:function(data){
			var datalist = data.csContracts;
				$('#contListId').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
			       	data:datalist,   //datalist 即为需要的数据
			       	dataType:'json',
			       	data_locale:"zh-US",  //转换中文 但是没有什么用处
			       	pagination: false,
			       	pageList:[],
			       	pageNumber:1,
			       	paginationLoop:false,
			  		//这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
			     
		     	});
		     	el.unblock();
			    /*  $('#cusTable').bootstrapTable('hideColumn', 'noticeid'); */
		   	},
		   	error:function(data){
	    		alert("刷新数据失败！");
	    	}
	    })
 	}
		     	
 	//查看销售合同
	function onCsContractRenderer(e,row) {
		var s = '<a class="dgBtn" href="javascript: doViewCsContract(' + row.contractid + ')">' + e + '</a> ';
        return s;
	}
	function doViewCsContract(cscontractid){
		window.open("<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid="+cscontractid,"csContractView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
	}
	 //格式化
	function numformat(e){
		if(e==null || e==""){
			return 0;
		}else{
			var num = (e || 0).toString(), result = '';
			if(num){
				if(num != 0){
					var num2 = num.split(".");
					num = num2[0];
					while (num.length > 3) {
						result = ',' + num.slice(-3) + result;
						num = num.slice(0, num.length - 3);
					}
					if (num) { 
						result = num + result; 
					}
				}else{
					result = 0;
				}
			}else{
				result = 0;
			}
			return result;
		}
	}
</script>
</html>