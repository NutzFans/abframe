<%@page pageEncoding="UTF-8"%>
<html lang="en" class="no-js">
<!-- 
  - Author(s): 许青倩
  - Date: 2020-05-09 16:46:49
  - Description:
-->
<head>
<title>收入明细</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame_mobile/workDesk/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/css/bootstrap-table.min.css">
</head>
<body>
<div class="table-responsive" id="revecontain">
	<table class="table table-striped table-hover table-responsive text-nowrap" id="reve">
		<thead>
			<tr>
				<th data-field="custjc" class="center" data-align="center" data-halign = "center" data-footer-Formatter="contsumall2">客户简称</th>
				<th data-field="contnum" class="center"  data-align="center" data-halign = "center">合同编号</th>
				<th data-field="reveno" class="center"  data-align="center" data-halign = "center">收入编号</th>
				<th data-field="yqrjebhs" class="center" data-align="right" data-halign = "center" data-formatter="formatnum" data-footer-Formatter="contsumall" data-width = "150px">确认金额</th>
				<th data-field="wqrjebhs" class="center" data-align="right" data-halign = "center" data-visible="false" data-formatter="formatnum" data-footer-Formatter="contsumall1"  data-width = "150px">预计确认金额</th>
				<th data-field="maconfirmday" class="center" data-align="center" data-halign = "center"  data-formatter="TimeFormatter">确认日期</th>
				<th data-field="salename" class="center" data-align="center" data-halign = "center">受益部门</th>
			</tr>
		</thead>
		<tbody class = "left">
			
		</tbody>
		<tfoot>
			<tr>
				<th colspan='3' id='countall'></th>
				<th id='yqrjebhs' style="text-align:right"></th>
				<th id='wqrjebhs' hidden="hidden" style="text-align:right"></th>
				<th id='maconfirmday'></th>
				<th id='salesname'></th>
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
        String orgseqsearch = request.getParameter("orgseqsearch");//用request得到  
        String yyears = request.getParameter("yyears");//用request得到 
        String ymonths = request.getParameter("ymonths");//用request得到 
        String status = request.getParameter("status");
	%> 
 	//加载我的待办任务
 	var orgseqsearch = "<%=orgseqsearch %>";
 	var yyears = "<%=yyears %>";
 	var ymonths = "<%=ymonths %>";
 	var status = "<%=status %>";
 	loadMytask();
 	function loadMytask(){
		//遮罩
 	    var el = $('#revecontain');
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
		
		var json ={"obj":{"orgseqsearch":orgseqsearch,"yyears":yyears,"ymonths":ymonths,"status":status,"sortFiled": "maconfirmday","sortOrder": "desc"}};
 		$.ajax({
		   	type:"POST",
			url:'com.primeton.eos.ame_income.csContract.queryCsContractRecognisedManagerDetail.biz.ext',
            data:JSON.stringify(json),
			contentType:'text/json',
			success:function(data){
		    	var datalist = data.objs;
		     	$('#reve').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
		       		data:datalist,   //datalist 即为需要的数据
			       	dataType:'json',
			       	data_locale:"zh-US",  //转换中文 但是没有什么用处
			       	pagination: false,
			       	pageList:[],
			       	pageNumber:1,
			       	paginationLoop:false,
			       	showFooter: true,
		     	});
		    	if(status == '0,2'){
		    		$('#reve').bootstrapTable('hideColumn', 'yqrjebhs');
		    		document.getElementById("yqrjebhs").hidden = 'hidden';
		    		$('#reve').bootstrapTable('hideColumn', 'maconfirmday');
		    		document.getElementById("maconfirmday").hidden = 'hidden';
		    		$('#reve').bootstrapTable('showColumn', 'wqrjebhs');
		    		document.getElementById("wqrjebhs").hidden = '';
		    	}
		     	$('#tasknum').text(data.total);
		     	el.unblock();
		     	$('.fixed-table-footer').css("display","none");
	   		},error:function(data){
	   		}
 		})
 	}
		//执行操作
    function doOperate(workItemID,workItemName) {
	var url = "<%=request.getContextPath()%>/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+workItemID;
	var title = "工作项执行"+"-"+workItemName;
	var width=1100;
    nui.open({
		url: url,
		title: title,
		width: width,
		height: 600,
		onload: function () {
			var iframe = this.getIFrameEl();
		},
		ondestroy: function (action){
			if (action == "ok") {
			loadMytask();
			} else if (action == "execute") {  
				loadMytask();
				//doOperate(rowIndex, false);					
			}
		}
	});
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
	
	function formatnum(num,row,index) {
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
	    return (((sign)?'':'-') + num );
	}
	
	function contsumall(rows){
		var sum = 0;
        for (var i=0;i<rows.length;i++) {
            sum += rows[i].yqrjebhs;
        }
        document.getElementById("yqrjebhs").innerHTML = formatCurrency(sum,null,null);
        return formatnum(sum,null,null);
	}
	
	function contsumall1(rows){
		var sum = 0;
        for (var i=0;i<rows.length;i++) {
            sum += rows[i].wqrjebhs;
        }
        document.getElementById("wqrjebhs").innerHTML = formatCurrency(sum,null,null);
        return formatnum(sum,null,null);
	}
	
	function contsumall2(rows){
		var sum = 0;
        for (var i=0;i<rows.length;i++) {
            sum ++;
        }
        document.getElementById("countall").innerHTML = "共"+sum+"条数据";
        return "共"+sum+"条数据";
	}
</script>
</html>