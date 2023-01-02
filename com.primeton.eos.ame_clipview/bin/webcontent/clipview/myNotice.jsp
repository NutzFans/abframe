<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<body>
	<table class="table table-striped table-hover" id="cusTable">
		<thead>
			<tr>
				<th data-field="noticeid" data-visible = "false"></th>
				<th  data-field="noticetitle" data-align="left" data-halign = "center" data-formatter= "onViewRenderer" >标题</th>
				<th data-field="orgname" class="center"   data-width = "90px">发布部门</th>
				<th class="center" data-field="noticedate" data-width = "90px">发布日期</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
</body>
<!-- end: BODY -->
<script type="text/javascript">
	     	//加载公司公告信息
     	function loadNotice(){
 	    	//遮罩
 	    	var el = $('#cusTable').parents(".panel");
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
 	    	var nowdate = new Date();
 	    	var nojson = {"criteria":{"_expr":[{"_property":"noticestate", "_value":"1"},{"_property":"noticedate","_value":nowdate,"_op":"<="}]},"sortOrder":"desc","sortField":"noticedate"}
 	    	nui.ajax({
			   url:'com.primeton.eos.ame_common.ameNotice.noticeList.biz.ext',
			   data: nojson,
			   type:"POST",
			   success:function(data){
			     var datalist = data.ameNotice;
			     $('#cusTable').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
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
			   },error:function(data){
			    alert("刷新数据失败！");
			   }
 			})
     	}
     	
     	
     	function onViewRenderer(e,row,index){
     		return '<a href="javascript:doView(' + row.noticeid + ')">' + e + '</a> ';
     	} 
     	function doView(e){
     		var url = "<%=request.getContextPath()%>/ame_common/notice/noticeShow.jsp?id=" + e;
		var iWidth=1000; //弹出窗口的宽度;
		var iHeight=500; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(url, "公告详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",resizable=yes");
 		// addTabs({ id: 'aa', title: 'aaa', close: true,url:'/default/ame_income/csContract/csContractList.jsp' });
 	}
</script>
</html>