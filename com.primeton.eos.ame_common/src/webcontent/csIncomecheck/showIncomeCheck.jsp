<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): xuqingqian
  - Date: 2016-10-18 15:01:58
  - Description:
-->
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    html, body
	    {
	        font-size:12px;
	        padding:0;
	        margin:0;
	        border:0;
	        height:100%;
	        overflow:hidden;
	    }
	     .myIndex{
	        background:#FFF68F;
	    }
	    .myrow{
	        background:#E6E6E6;
	    }
	</style>
</head>
<body>
   <span id = "title"></span>
   <div id="grid_AllCheck" class="nui-datagrid" style="width:98%;height:auto;" allowResize="true" dataField="incomeChecks" 
	showPager="false" allowCellWrap="true" allowHeaderWrap="true" allowCellWrap="true">
		<div property="columns">
		</div>
	</div>
	<script type="text/javascript">
		var stat = '<%=request.getParameter("stat") %>';
		if(stat=='1'){
			document.body.style.overflow="scroll";
		}
		
		function showIncomeCheck(data){
			var grid_AllCheck = nui.get("grid_AllCheck");  
        	//checklist所需参数processInstID
        	var checklistdata={processinstid:data};
        	var json  = nui.encode(checklistdata);
        	nui.ajax({
				url:"com.primeton.eos.ame_common.checkList.getCheckListMsg.biz.ext",
				data: json,
				type:"post",
				contentType:"text/json",
				success:function(o){
					var o = nui.decode(o);
					var data = o.data;
					var checklists = o.checklists;
					//设置checklist基本名称(将来做成参数传进来可以公用)
					var body1 = "审核要点";
					var checkers =[];
					for(var i=0;i<data.length;i++){
						if(data[i].mes==null||data[i].mes==""){
							checkers[i]=data[i].name; 
						}else{
							checkers[i]=data[i].name; 
						}
					}
			        //设置行内容
			        var Datas=[];
			        var j = 0;
			        for(var i = 0; i<o.checklists.length;i++){
			            if(o.checklists[i].level==1){
			               document.getElementById("title").innerHTML = o.checklists[i].checklistname;
			            }else{
				        	Datas[j] = {"checklistseq":o.checklists[i].checklistseq,"checklistid":o.checklists[i].checklistid,"checklistname":o.checklists[i].checklistname,"iscancheck":o.checklists[i].iscancheck};//设置ischeck默认值为0
				        	var checkmemo; 
				        	for(var k=0;k<data.length;k++){
				        		checkmemo="checkmemo"+k;
				        		var mes = data[k].mes;
				        		var obj = Datas[j];
				        		if(mes==null||mes.length==0){
				        			eval("obj."+checkmemo+"="+null);
			        			}else{
			        				for(var l=0;l<data[k].mes.length;l++){
			        					if(data[k].mes[l].checklistid==Datas[j].checklistid){
				        					var strs = data[k].mes[l].checkmemo;
				        					if(strs!=null){
				        						var str = strs.replace(/\s*/g,"");
				        					}else{
				        						var str = null;
				        					}
			        						if(str==null){
			        							eval("obj."+checkmemo+"="+null);
			        						}else{
			        						    var str1 = "obj."+checkmemo+"='"+str+"'";
				        					    eval(str1);
			        							/* --姚毅的代码导致审核内容有英文逗号时候无法显示，实际上一个环节审核人只会有一个，不存在多人，审核内容会用逗号拼接
			        							var checkmemoss = str.split(",");
			        							if(checkmemoss.length==1){
			        								var str1 = "obj."+checkmemo+"='"+str+"'";
				        							eval(str1);
			        							}else{
			        								for(var p=0;p<checkmemoss.length;p++){
			        									checkmemo = checkmemo+p;
			        									var str2 = checkmemoss[p];
			        									var str1 = "obj."+checkmemo+"='"+str2+"'";
				        								eval(str1);
			        								}
			        							} */
			        						}
			        					}
			        				}
			        			}
				        	}
				         j++; 	
			          }	
		        	}
			        var griddata = {csIncomecheck:Datas};
			        //设置列标题
					var Cols=[  {'header':'','field':'iscancheck','headerAlign':'center','align':'center','renderer':'checkRenderer','width':'0'},
					            {'header':'ID','field':'checklistid','headerAlign':'center','align':'center','width':'0'},
								{'header':'','field':'checklistseq','headerAlign':'center','align':'left','width':'40'},
								{'header':body1,'field':'checklistname','headerAlign':'center','align':'left','width':'250'},
								
						];
					for(var i=0;i<data.length;i++){
						var checkmemo="checkmemo"+i;
						var a= {'header':checkers[i],'headerAlign':'center','align':'center','width':'200','columns':[]};
						var mes = data[i].mes;
						if(mes==null||mes.length==0){
							var b = {'header':'','field':checkmemo,'headerAlign':'center','align':'left','width':'100','inputStyle':'text-align:center;'};
							a.columns.push(b);
						}else{
							var checker11 = mes[0].checker;
							var checkerss = checker11.split(",");
							if(checkerss.length>1){
								for(var l=0;l<checkerss.length;l++){
									checkmemo=checkmemo+l;
									var b = {'header':checkerss[l],'field':checkmemo,'headerAlign':'center','align':'left','width':'100','inputStyle':'text-align:center;'};
									a.columns.push(b);
								}
							}else{
								var b = {'header':checkerss[0],'field':checkmemo,'headerAlign':'center','align':'left','width':'100','inputStyle':'text-align:center;'};
								a.columns.push(b);
							}
						}
						Cols.push(a);
					}
			        grid_AllCheck.setColumns(Cols);
			     	grid_AllCheck.setData(griddata.csIncomecheck);
			     	grid_AllCheck.hideColumn(1);
				}
			});
        }
        function checkRenderer(e){
			if(e.record.iscancheck==0){
			    e.rowCls = "myrow";//修改背景颜色样式
			} 
			return e.record.iscancheck;
	    }
	    /* function checkmemoRenderer(e,ischeck){
	        if(e.record.ischeck == 1){
	            if(e.value == null || e.value == ''){
	               e.value = "<p style='text-align: center;'><span style='color:#007AFF'>【<span class='status correct'></span>】</span></p>";
	            }else{
	               e.value = "<p style='text-align: left;'><span style='color:#007AFF'>【<span class='status correct'></span>】</span>"+ e.value + "</p>";
	            }
			    
			} 
	        return e.value;
	    } */
	</script>
</body>
</html>