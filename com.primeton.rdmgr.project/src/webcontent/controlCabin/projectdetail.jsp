<%@page pageEncoding="UTF-8"%>
<html lang="en" class="no-js">
<!-- 
  - Author(s): 许青倩
  - Date: 2020-05-11 15:42:44
  - Description:
-->
<head>
<title>项目明细</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame_mobile/workDesk/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/css/bootstrap-table.min.css">
</head>
<body>
<div class="table-responsive" id="projectcontain" style="width:100%!important">
	<table class="table table-hover table-striped text-nowrap" id="project">
		<thead>
			<tr>
				<th data-field="custjc" class="center" data-align="center" data-halign = "center">客户简称</th>
				<th data-field="projectno" class="center"  data-align="center" data-halign = "center">项目编号</th>
				<th data-field="projectName" class="center"  data-align="center" data-halign = "center" data-footer-Formatter="contsumall1">项目名称</th>
				<th data-field="expenddate" class="center" data-align="center" data-halign = "center" data-visible="false" data-formatter="TimeFormatter">预计结束日期</th>
				<th data-field="contplandate" class="center" data-align="center" data-halign = "center" data-visible="false" data-formatter="TimeFormatter">预计签署日期</th>
				<th data-field="createdate" class="center" data-align="center" data-halign = "center" data-visible="false" data-formatter="TimeFormatter">创建日期</th>
				<th data-field="pcostsum" class="center" data-align="right" data-halign = "center" data-visible="false" data-formatter="formatCurrency" data-footer-Formatter="contsumall2" data-width = "130px" >预算成本</th>
				<th data-field="expcontsum" class="center" data-align="right" data-halign = "center" data-visible="false" data-formatter="formatCurrency" data-footer-Formatter="contsumall4" data-width = "130px" >预计合同额</th>
				<th data-field="pcostsum1" class="center" data-align="right" data-halign = "center" data-formatter="formatCurrency" data-footer-Formatter="contsumall" data-width = "130px" >当前实际成本</th>
				<th data-field="prosum" class="center" data-align="right" data-halign = "center" data-visible="false" data-formatter="formatCurrency" data-footer-Formatter="contsumall3" data-width = "130px" >超预算金额</th>
				<th data-field="orgname" class="center" data-align="center" data-halign = "center">受益部门</th>
				<th data-field="contnum" class="center" data-align="center" data-halign = "center">合同编号</th>
			</tr>
		</thead>
		<tbody class = "left">
			
		</tbody>
		<tfoot>
			<tr>
				<th colspan='3' id='countall'></th>
				<th id='expenddate' hidden="hidden"></th>
				<th id='contplandate' hidden="hidden"></th>
				<th id='createdate' hidden="hidden"></th>
				<th id='pcostsum' hidden="hidden" style="text-align:right"></th>
				<th id='expcontsum' hidden="hidden" style="text-align:right"></th>
				<th id='pcostsum1' style="text-align:right"></th>
				<th id='prosum' hidden="hidden" style="text-align:right"></th>
				<th id='orgname'></th>
				<th id='contnum'></th>
			</tr>
		</tfoot>
	</table>
</div>
</body>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/js/jquery1.min.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/plugins/blockUI/jquery.blockUI.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/js/bootstrap-table.min.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/js/bootstrap-table-zh-CN.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/js/bootstrap-table-mobile.min.js"></script>
<script type="text/javascript">
	<% 
        String path = request.getContextPath(); 
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
        String orgseq = request.getParameter("orgseq");//用request得到  
        String startdate = request.getParameter("startdate");//用request得到 
        String enddate = request.getParameter("enddate");//用request得到 
        String type = request.getParameter("type");
	%> 
 	//加载我的待办任务
 	var orgseq = "<%=orgseq %>";
 	var startdate = "<%=startdate %>";
 	var enddate = "<%=enddate %>";
 	var type = "<%=type %>";
 	
 	loadMytask();
 	function loadMytask(){
		//遮罩
 	    var el = $('#projectcontain');
 	    var src = "<%= request.getContextPath() %>"+"/ame/clipview/assets/images/loading.gif"
 	    el.block({
		    overlayCSS: {
		        backgroundColor: '#fff'
		    },
		    message: '<img src="'+src+'" /> Just a moment...',
		    css: {
		        border: 'none',
		        color: '#333',
		        background: 'none'
		    }
		});
		if(type == "activerproject" || type == "passbudproject" || type == "postproject" || type == "nocontractproject" || type == "newproject"){
			var json ={"criteria": 
	                    {"_expr[0]": {"_property": "orgseq","_op": "like","_value":orgseq},
	                    "_expr[1]": {"_property": "createdate","_op": "between","_pattern":"yyyy-MM-dd","_min": null,"_max":enddate},
	                    "_expr[2]":{"_property":"projectStatus","_op": "in","_value":"1,0"}}};
	                    
        	if(type == "passbudproject"){
        		json.criteria["_expr[3]"]={"ispassbud":2};
        	}else if(type == "postproject"){
        		json.criteria["_expr[3]"]={"_property": "expenddate","_value": "enddate","_opProperty":"<"};
        		json.criteria["_expr[4]"]={"_property": "expenddate","_op": "notnull"};
        	}else if(type == "nocontractproject"){
        		json.criteria["_expr[3]"]={"nocontractproject":0};
        	}else if(type == "newproject"){
        		json.criteria["_expr[1]"]={"_property": "createdate","_op": "between","_pattern":"yyyy-MM-dd","_min": startdate,"_max":enddate};
        	}
        	
	 		$.ajax({
			   	type:"POST",
				url:'com.primeton.rdmgr.project.controlCabin.projectdetail.biz.ext',
	            data:JSON.stringify(json),
				contentType:'text/json',
				success:function(data){
			    	var datalist = data.rdprojects;
			     	$('#project').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
			       		data:datalist,   //datalist 即为需要的数据
				       	dataType:'json',
				       	data_locale:"zh-US",  //转换中文 但是没有什么用处
				       	pagination: false,
				       	pageList:[],
				       	pageNumber:1,
				       	paginationLoop:false,
				       	showFooter: true
			     	});
			     	
			     	if(type == 'passbudproject'){
			    		$('#project').bootstrapTable('hideColumn', 'contnum');
			    		document.getElementById("contnum").hidden = 'hidden';
			    		$('#project').bootstrapTable('showColumn', 'pcostsum');
			    		document.getElementById("pcostsum").hidden = '';
			    		$('#project').bootstrapTable('showColumn', 'prosum');
			    		document.getElementById("prosum").hidden = '';
			    	}else if(type == 'postproject'){
			    		$('#project').bootstrapTable('hideColumn', 'contnum');
			    		document.getElementById("contnum").hidden = 'hidden';
			    		$('#project').bootstrapTable('showColumn', 'pcostsum');
			    		document.getElementById("pcostsum").hidden = '';
			    		$('#project').bootstrapTable('showColumn', 'expenddate');
			    		document.getElementById("expenddate").hidden = '';
			    	}else if(type == 'nocontractproject'){
			    		$('#project').bootstrapTable('hideColumn', 'contnum');
			    		document.getElementById("contnum").hidden = 'hidden';
			    		$('#project').bootstrapTable('showColumn', 'contplandate');
			    		document.getElementById("contplandate").hidden = '';
			    		$('#project').bootstrapTable('showColumn', 'expcontsum');
			    		document.getElementById("expcontsum").hidden = '';
			    	}else if(type == 'newproject'){
			    		$('#project').bootstrapTable('hideColumn', 'contnum');
			    		document.getElementById("contnum").hidden = 'hidden';
			    		$('#project').bootstrapTable('hideColumn', 'pcostsum1');
			    		document.getElementById("pcostsum1").hidden = 'hidden';
			    		$('#project').bootstrapTable('showColumn', 'createdate');
			    		document.getElementById("createdate").hidden = '';
			    	}
			     	$('#tasknum').text(data.total);
			     	el.unblock();
			     	$('.fixed-table-footer').css("display","none");
		   		},error:function(data){
		   		}
	 		})
		}
 	}
 	
		
	//时间格式化
	function TimeFormatter(value,row,index) {
		if(value == null){
			return '-';
		}else{
			var date = new Date(value.substring(0,10));
		    var year = date.getFullYear();
		    var month = date.getMonth() + 1, month = month < 10 ? '0' + month : month;
		    var day = date.getDate(), day = day < 10 ? '0' + day : day;
		    return year + '-' + month + '-' + day;
	    }
	}
	
	Date = function (Date) {
      MyDate.prototype = Date.prototype;
      return MyDate;

      function MyDate() {
        // 当只有一个参数并且参数类型是字符串时，把字符串中的-替换为/
        if (arguments.length === 1) {
          let arg = arguments[0];
          if (Object.prototype.toString.call(arg) === '[object String]' && arg.indexOf('T') === -1) {
            arguments[0] = arg.replace(/-/g, "/");
            // console.log(arguments[0]);
          }
        }
        let bind = Function.bind;
        let unbind = bind.bind(bind);
        return new (unbind(Date, null).apply(null, arguments));
      }
    }(Date);
	
	function formatCurrency(num,row,index) {
		if(num == null){
			num = 0;
		}
	    num = num.toString().replace(/\$|\,/g,'');
	    if(isNaN(num))
	        num = "0";
	    var sign = (num == (num = Math.abs(num)));
	    num = Math.floor(num*100+0.50000000001);
	    var cents = num%100;
	    num = Math.floor(num/100).toString();
	    if(cents<10)
	        cents = "0" + cents;
	    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
	        num = num.substring(0,num.length-(4*i+3))+','+
	            num.substring(num.length-(4*i+3));
	    return (((sign)?'':'-') + num + '.' + cents);
	}
	
	function contsumall(rows){
		var sum = 0;
        for (var i=0;i<rows.length;i++) {
            sum += rows[i].pcostsum1;
        }
        document.getElementById("pcostsum1").innerHTML = formatCurrency(sum,null,null);
        return formatCurrency(sum,null,null);
	}
	
	function contsumall1(rows){
		var sum = 0;
        for (var i=0;i<rows.length;i++) {
            sum ++;
        }
        document.getElementById("countall").innerHTML = "共"+sum+"条数据";
        return "共"+sum+"条数据";
	}
	
	function contsumall2(rows){
		var sum = 0;
        for (var i=0;i<rows.length;i++) {
            sum += rows[i].pcostsum;
        }
        document.getElementById("pcostsum").innerHTML = formatCurrency(sum,null,null);
        return formatCurrency(sum,null,null);
	}
	
	function contsumall3(rows){
		var sum = 0;
        for (var i=0;i<rows.length;i++) {
            sum += rows[i].prosum;
        }
        document.getElementById("prosum").innerHTML = formatCurrency(sum,null,null);
        return formatCurrency(sum,null,null);
	}
	
	function contsumall4(rows){
		var sum = 0;
        for (var i=0;i<rows.length;i++) {
            sum += rows[i].expcontsum;
        }
        document.getElementById("expcontsum").innerHTML = formatCurrency(sum,null,null);
        return formatCurrency(sum,null,null);
	}
</script>
</html>