<%@page pageEncoding="UTF-8"%>
<html lang="en" class="no-js">
<!-- 
  - Author(s): 许青倩
  - Date: 2020-05-13 13:39:09
  - Description:
-->
<head>
<title>当月离职人员明细</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame_mobile/workDesk/assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/css/bootstrap-table.min.css">
</head>
<body>
<body>
<div class="table-responsive" id="leavecontain">
	<table class="table table-striped table-hover table-responsive text-nowrap" id="leave">
		<thead>
			<tr>
				<th data-field="empname" class="center" data-align="center" data-halign = "center" data-footer-Formatter="contsumall1">员工姓名</th>
				<th data-field="outdate" class="center" data-align="center" data-halign = "center"  data-formatter="TimeFormatter">离职日期</th>
				<th data-field="status" class="center" data-align="center" data-halign = "center" data-formatter="statusFormatter">离职状态</th>
				<th data-field="orgname" class="center" data-align="center" data-halign = "center">所属部门</th>
				<th data-field="majorname" class="center" data-align="center" data-halign = "center">直属主管</th>
			</tr>
		</thead>
		<tbody class = "left">
			
		</tbody>
		<tfoot>
			<tr>
				<th colspan='5' id='countall'></th>
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
	%> 
 	//加载我的待办任务
 	var orgseq = "<%=orgseq %>";
 	var startdate = "<%=startdate %>";
 	var enddate = "<%=enddate %>";
 	loadMytask();
 	function loadMytask(){
		//遮罩
 	    var el = $('#leavecontain');
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
		
		var json ={"criteria": 
	                    {"_expr[0]": {"_property": "orgseq","_op": "like","_value":orgseq},
	                    "_expr[1]": {"_property": "outdate","_op": "between","_pattern":"yyyy-MM-dd","_min": startdate,"_max":enddate}}};
 		$.ajax({
		   	type:"POST",
			url:'com.primeton.rdmgr.project.controlCabin.queryLeaveApply.biz.ext',
            data:JSON.stringify(json),
			contentType:'text/json',
			success:function(data){
		    	var datalist = data.queryLeaveApplys;
		     	$('#leave').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
		       		data:datalist,   //datalist 即为需要的数据
			       	dataType:'json',
			       	data_locale:"zh-US",  //转换中文 但是没有什么用处
			       	pagination: false,
			       	pageList:[],
			       	pageNumber:1,
			       	paginationLoop:false,
			       	showFooter: true
		     
		     	});
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
            sum += rows[i].contsum;
        }
        document.getElementById("contsum").innerHTML = formatCurrency(sum,null,null);
        return formatnum(sum,null,null);
	}
	
	function contsumall1(rows){
		var sum = 0;
        for (var i=0;i<rows.length;i++) {
            sum ++;
        }
        document.getElementById("countall").innerHTML = "共"+sum+"条数据";
        return "共"+sum+"条数据";
	}
	
	//开票状态
	function statusFormatter(value,row,index){
		var json = {"dicttypeid":"OUT_STATUS","dictid":value};
		var dictname ='';
		$.ajax({
		   	type:"POST",
		   	async:false,
			url:'com.primeton.rdmgr.project.controlCabin.getdict.biz.ext',
            data:JSON.stringify(json),
			contentType:'text/json',
			success:function(data){
		    	dictname = data.dictname;
	    	}
    	});
		return dictname;
	}
</script>
</html>