<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<body>
		<div class="panel-body panel-scroll" style="height:400px">
			<table class="table table-striped table-hover" id="regularListId" >
				<thead>
					<tr>
						<th data-field="title" data-align="left" data-halign = "center" data-formatter = "onViewRendererR">制度名称</th>
						<th data-field="orgname">发布部门</th>
						<th data-field="pubdate" data-width='90px'>发布日期</th>
					</tr>
				</thead>
			</table>
		</div>
		<script type="text/javascript">
		     	//加载规章制度
	     	function loadRegular(){
	     		//遮罩
     	    	var el = $('#regularListId').parents(".panel");
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
	     		var nowdateR = new Date();
     	    	var rejson = {"criteria":{"_expr":[{"_property":"pubstate", "_value":"1"},{"_property":"pubdate","_value":nowdateR,"_op":"<="}]},"sortOrder":"desc","sortField":"pubdate"}
	     		nui.ajax({
				   data: rejson,
				   type:"POST",
				   url:'com.primeton.eos.ame_common.ameRegular.regularList.biz.ext',
				   success:function(data){
				     var datalist = data.ameRegular;
				     $('#regularListId').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
				       data:datalist,   //datalist 即为需要的数据
				       dataType:'json',
				       data_locale:"zh-US",  //转换中文 但是没有什么用处
				       data_align:"left",
				       pagination: false,
				       pageList:[],
				       pageNumber:1,
				       paginationLoop:false,
				  //这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
				     /*   columns: [{
						 field: 'title',
						 title: '制度名称',
						 height:'200px',
						 formatter: operateFormatter
						 }, {
						 field: 'orgname',
						 title: '发布部门'
						 }, {
						 field: 'pubdate',
						 title: '发布日期'
					 }]  */
				     });
				     el.unblock();
				   },error:function(data){
				    alert("刷新数据失败！");
				   }
	 			})
	     	}
		     	
		     	   //规章制度
	    function onViewRendererR(e,row){
			var s = '<a class="dgBtn" href="javascript:doViewR(' + row.regularid + ')">' + e + '</a> ';
            return s;
		}
		function doViewR(regularid){
			var url = "<%=request.getContextPath()%>/ame_common/regular/regularShow.jsp?id=" + regularid;
			var iWidth=1000; //弹出窗口的宽度;
			var iHeight=500; //弹出窗口的高度;
			var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
			window.open(url, "规章制度详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",resizable=yes");
		}
		</script>
	</body>
	<!-- end: BODY -->
</html>