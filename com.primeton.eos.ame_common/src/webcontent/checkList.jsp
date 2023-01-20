<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>checklist</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .myrow{
	        background:#E6E6E6;
	    }
	    .mycellcls{
	        text-align:left;
	    }
    </style>    
</head>
<body>
	 <div id="grid_checklist" class="nui-datagrid" style="width:98%;height:auto;" allowResize="true" 
	 dataField="csIncomecheck" allowCellSelect="true" oncellmousedown="checkCellEdit" showPager="false"  multiSelect="true" allowCellWrap="true">
		    <div property="columns">
		    </div>
	</div>
    <script type="text/javascript">
    
	//data包含的参数有processInstID、activityDefID、incomeType、checkObj核查对象（1.收入确认）
	var processinstid;
	
	function queryChickList(data){
        var grid_checklist = nui.get("grid_checklist");
        processinstid = data.processInstID;
		var json = nui.encode(data);
		nui.ajax({
			url:"com.primeton.eos.ame_common.checkList.getActivityIncomeCheck.biz.ext",
			data: json,
			type:"post",
			contentType:"text/json",
			success:function(o){
				var o = nui.decode(o);
				var incomeChecks = o.incomeChecks;
				if(incomeChecks.length>0&&incomeChecks!=null){
					//设置checklist基本名称(将来做成参数传进来可以公用)
					var head;
					var Datas=[];
					var j = 0;
			        for(var i = 0; i<o.incomeChecks.length;i++){
			            if(o.incomeChecks[i].level==1){
			               var head = o.incomeChecks[i].checklistname + ":<span style='color:red'>请针对以下检查点逐条勾选确认</span><span style='float:right;'><a href='javascript:void(0)' onclick='openDetail()'>其他环节核查要点详情</a></span>";
			               if(processinstid == null || processinstid == ''){
								head = o.incomeChecks[i].checklistname + ":<span style='color:red'>请针对以下检查点逐条勾选确认</span>";
						   }
			            }else{
			               if(o.incomeChecks[i].iscancheck==1){//可以编辑
				        	    Datas[j] = {"checklistseq":o.incomeChecks[i].checklistseq,"checklistid":o.incomeChecks[i].checklistid,"checklistname":o.incomeChecks[i].checklistname,'iscancheck':o.incomeChecks[i].iscancheck,
				        		"ischeck":o.incomeChecks[i].ischeck==null?0:o.incomeChecks[i].ischeck,'checkmemo':o.incomeChecks[i].checkmemo};//设置ischeck默认值为0
				        	}else{//不可以编辑
					        	Datas[j] = {"checklistseq":o.incomeChecks[i].checklistseq,"checklistid":o.incomeChecks[i].checklistid,"checklistname":o.incomeChecks[i].checklistname,'iscancheck':o.incomeChecks[i].iscancheck};//设置ischeck默认值为0
				        	}
				        	j++;
			            }
			        }
					var body1 = "审核要点";
					var body2 = "人月工作量确认单";
					var body3 = "检查情况";
					var bodyhead = [body1,body2,body3];
					var field = ['checklistname','incometype','ischeck'];
					var width = ['0','200','70'];
					//设置列标题
					var Cols=[{'header':head,'headerAlign':'left','columns':[
								{'header':'ID','field':'checklistid','headerAlign':'center','align':'center','width':'50'},
								{'header':'编号','field':'checklistseq','headerAlign':'center','align':'left','width':'45'},
								{'header':body1,'field':'checklistname','headerAlign':'center','align':'left','width':'300'},
	// 							{'header':body2,'field':'incometype','headerAlign':'center','align':'center','width':'70'},
								{'header':body3,'headerAlign':'center','align':'center','width':'300','columns':[
									{'header':'是否检查','field':'ischeck','headerAlign':'center','align':'center','width':'70','renderer':'checkBoxRenderer','inputStyle':'text-align:center;'},
									{'header':'检查说明','field':'checkmemo','headerAlign':'center','align':'left','width':'230','inputStyle':'text-align:center;',
										'editor':{ 'type': "textarea",'style':'width:100%;'}
									}
								]},
								{'header':'是否可编辑','field':'iscancheck','headerAlign':'center','align':'center','width':'0'}
							]}
						];
			        grid_checklist.setColumns(Cols);
			        //设置行内容
			        
			        var griddata = {csIncomecheck:Datas};
			     	grid_checklist.setData(griddata.csIncomecheck); //grid_checklist.setData(o.incomeChecks);都行，前者更灵活
					
					grid_checklist.hideColumn(0);
					//设置跨行
					/* var marges = [
			            { rowIndex: 0, columnIndex: 1, rowSpan: 1, colSpan: 3 },
			            { rowIndex: 1, columnIndex: 0, rowSpan: 4, colSpan: 3 }
			        ];
					grid_checklist.mergeCells(marges); */
				}else{
					document.getElementById("grid_checklist").style.display = "none";
				}
			}
		});
	}
	
	function checkBoxRenderer(e){
		var str = "";
		if(e.value==1){
			str = "<input name='ischeck' type='checkbox' align='center' value='1' onclick='javascript:renturnvalue(this.checked," + e.record._uid + ")' checked='checked'/>"
		}else if(e.value==0){
			str = "<input name='ischeck' type='checkbox' align='center' value='1' onclick='javascript:renturnvalue(this.checked," + e.record._uid + ")'/>";
		}else{
			e.rowCls = "myrow";//修改背景颜色样式
		}
		return  str;
	}
	//根据勾选checked的值（true/false）确定ischeck的值（1/0）
	function renturnvalue(flag,_uid){
		var grid_checklist = nui.get("grid_checklist");
		var row = grid_checklist.getRowByUID(_uid);
		if(flag){//如果勾选
			row.ischeck=1;
		}else{//如果取消勾选
			row.ischeck=0;
		}
	}
	
	function hide(e){
		var grid_checklist = nui.get("grid_checklist");  
		grid_checklist.hideColumn("checklistid");
	}
	
	function checkCellEdit(e){
		var grid_checklist = nui.get("grid_checklist");
		var row = e.record;
		if(row.iscancheck==0){
			grid_checklist.allowCellEdit=false;
		}else{
			grid_checklist.allowCellEdit=true;
		}
	}
	
	function openDetail(){
		nui.open({
			url:"<%=request.getContextPath() %>/ame_common/csIncomecheck/showIncomeCheck.jsp?stat=1",
			title:"核查要点详情",
            width: 1000,
            height: 700,
            showModal:false,
            onload: function () {       //弹出页面加载完成
		        var iframe = this.getIFrameEl(); 
		        //调用弹出页面方法进行初始化
		        iframe.contentWindow.showIncomeCheck(processinstid); 
		    }
	 	})
	}
	
</script>
</body>
</html>