<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<body>
<table class="table table-striped table-hover projectListId" id="projectListId" >
	<thead>
		<tr>
			<th data-field="projectName" data-align="left" data-halign = "center" data-formatter = "onViewRendererP">项目名称</th>
			<th data-field="projectno">项目编号</th>
			<th data-field="custname" >所属客户</th>
			<th data-field="pcostsum" data-formatter = "numformat" data-align="right">预算成本</th>
			<th data-field="pcostsum1" data-formatter = "numformat" data-align="right">当前总成本</th>
			<th data-field="outstatus" data-formatter = "dictGetOutStatus">外部状态</th>
		</tr>
	</thead>
</table>
</body>
<!-- end: BODY -->
<script type="text/javascript">
	     	//加载我的待办任务
	     	//加载我负责的项目
     	function loadMyproject(){
     		//遮罩
 	    	var el = $('#projectListId').parents(".panel");
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
     		var jsonpro = {"criteria":{"_expr":[{"_property": "outstatus","_op": "<>","_value": "5"},{"_property": "outstatus","_op": "<>","_value": "9"}]}};
 			 nui.ajax({
			   url:'com.primeton.rdmgr.project.benefitToBenefitProject.ConscientiousToProject.biz.ext',
			   data: jsonpro,
			   type:"POST",
			   success:function(data){
			     var datalist = data.rdprojects;
			     $('.projectListId').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
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
	     	
	     //我负责的项目
	function onViewRendererP(e,row){
		var contnum = "";
		if(row.contnum){
			if(row.contnum != null && row.contnum != ""){
				contnum = row.contnum;
			}
		}
		var startdate = "";
		if(row.startdate != null && row.startdate != ""){
				startdate = row.startdate;
		}
		var s = "<a href=javascript:doViewP('" + row.projectId + "','" + row.projectno + "','" + startdate + "','" + contnum + "')>" + e + "</a> ";
        return s;
	}
	
	function doViewP(projectId,projectno,startdate,contnum){
			var url = "<%=request.getContextPath()%>/project/benefitToBenefitProject/projectMessage.jsp?projid=" + projectId;
		var iWidth=1000; //弹出窗口的宽度;
		var iHeight=500; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(url, "项目详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",resizable=yes");
	}

	//外部状态业务字典值展示
	function dictGetOutStatus(e){
		return nui.getDictText('MIS_PROJOUTSTATUS',e);
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