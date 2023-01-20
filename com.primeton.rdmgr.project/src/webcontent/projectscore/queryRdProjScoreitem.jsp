<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2019-05-30 16:26:08
  - Description:
-->
<head>
<title>月考核打分项设置</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fix">
  <div class="nui-panel" title="月考核打分项设置" style="width:100%;">
<!--       <div class="nui-toolbar" style="border-bottom:0;padding:0px;" id="form1">
        		<table align="center" border="0" width="100%">
        			<tr>
        			    <td align="right">设置人</td>
						<td align="left">					        
			            	<input class="nui-hidden" name="criteria._expr[0]._property" value="operatorid"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="tempcond1"/>
					        <input class="nui-hidden" name="criteria._expr[0]._ref" value="" id="tempcond2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>					        
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="userid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="empname"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-textbox" name="criteria._ref[0]._expr[0]._value"  style="width:100px;"  allowInput="true" onvaluechanged="changeOrg"/> 
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all" />	
						</td>
						<td  align = "right">考核项:</td>
				        <td align="left">		        
							<input class="nui-hidden" name="criteria._expr[1]._property" value="assessitem"/>
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
							<input class="nui-textbox"name="criteria._expr[1]._value"  allowInput="true" style="width:100px;" />
							<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>	
				        </td>
						<td  align = "right">权重:</td>
				        <td align="left">		        
							<input class="nui-hidden" name="criteria._expr[2]._property" value="weight"/>
							<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
							<input class="nui-textbox" name="criteria._expr[2]._value"   style="width:50px;"  />
				        </td>
						<td align = "right">状态是否有效</td>
			         	<td align="left">
			         	    <input class="nui-hidden" name="criteria._expr[3]._property" value="status"/>
							<input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
							<input name="criteria._expr[3]._value" class="nui-dictcombobox" dictTypeId="MIS_YN"  shownullItem="true" style="width:50px;"  />							
			          	</td>
        			</tr>
        			<tr>
			         <td colspan="8" align="center" >
			            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
			            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
			         </td>
			        </tr>
        		</table>
        	   </div>	-->
	<div style="padding:0px;">
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <table style="width:100%;">
	            <tr>
	                <td style="width:20%;">
	                    <a class="nui-button" iconCls="icon-add" onclick="addRow()" >增加</a>
	                    <a class="nui-button" iconCls="icon-remove" onclick="removeRow()">删除</a>
	                    <a class="nui-button" iconCls="icon-ok" onclick="save()" >保存</a>
	                </td>
	            </tr>
	        </table>           
	    </div>
	<div id="datagrid1" class="nui-datagrid" style="padding:10px;" dataField="datas"  showPager="false" allowCellEdit="true" allowCellSelect="true" 
	    multiSelect="true" editNextOnEnterKey="true" url="com.primeton.rdmgr.project.projectscore.queryRdProjScoreitem.biz.ext" allowCellWrap="true">			            
	    <div property="columns">
	    	<div type="checkcolumn" width="10"></div>
	        <div field="assessitem" width="50" headerAlign="center"  align="left" allowSort="true">考核项
	        	<input property="editor" class="nui-textbox" inputStyle="text-align: left"/>
	        </div>
	        <div field="assesscontent" width="180" headerAlign="center"  align="left" allowSort="true">考核标准
	        	<input property="editor" class="nui-textarea" inputStyle="text-align: left"/>
	        </div>
	        <div field="weight" width="20" headerAlign="center"  align="center" allowSort="true">权重
	        	<input property="editor" class="nui-textbox" inputStyle="text-align: left"/>
	        </div>
	        <div field="status" width="30" headerAlign="center"  align="center" allowSort="true" renderer="getStatus" >是否有效
	        	<input property="editor"  class="nui-dictcombobox" dictTypeId="MIS_YN" inputStyle="text-align: left"/>
	        </div>
	        <div field="operatorid" displayfield="empname" width="30" headerAlign="center" align="center" allowSort="true" id='empname'>设置人
	        </div> 
	        <div field="sortno" width="20" headerAlign="center"  align="center" allowSort="true">排列顺序
	        	<input property="editor" id="sortno" class="nui-textbox" inputStyle="text-align: left" />
	        </div>
	    </div>
	 </div>
   </div>
  </div>
</div>
<script type="text/javascript">
	//获取当前登陆人 的id,name
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    	%>
		nui.parse();//初始化NUI
		var grid = new nui.get("datagrid1");//获取表格对象
/* 		function search() {
            var data = form.getData(); //获取表单JS对象数据
            grid.load(data); //datagrid加载数据
            grid.sortBy("sortno","asc");
        }
        function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}   */
		//初始化
		init();
		function init(){ 
			grid.load();
			grid.sortBy("sortno","asc");
		}
		//新增
	    function addRow(){
	    	var rowS = {name: "New Row",status:"1",operatorid:"<%=nowuserid %>", empname: "<%=nowusername %>"};
	    	grid.addRow(rowS);
	    }
		//删除
		function removeRow(){
	        var rows = grid.getSelecteds();
	        if (rows.length>0) {
	            grid.removeRows(rows, true);
	        }else{
	        	nui.alert("请至少选中一条记录！");
	        }
	    }
	    //保存
	    function save(){
	    	var added = grid.getChanges("added");//新增数据
	    	var modified = grid.getChanges("modified");//修复数据
	    	var removed = grid.getChanges("removed");//删除数据
	    	if(added.length==0&&modified.length==0&&removed.length==0){
	    		nui.alert("无任何数据更改，请确认后再进行操作！");
	    		return;
	    	}else{
	    		var d = grid.getData();
	    		if(d.length!=0||(removed.length!=0)){//表格数据不为空或删除数据也不为空
	    			var ischeck = '1';
	    			if(d.length!=0){
	    				for(var i =0;i<d.length;i++){
	    					if(d[i].assessitem==""||d[i].assessitem == null){
	    						ischeck = "考核项不能为空";
	    						break;
	    					}
	    					if(d[i].assesscontent==""||d[i].assesscontent == null){
	    						ischeck = "考核标准不能为空";
	    						break;
	    					}
	    					if(d[i].weight==""||d[i].weight == null){
	    						ischeck = "权重不能为空";
	    						break;
	    					}
	    					if(d[i].sortno==""||d[i].sortno == null){
	    						ischeck = "排列顺序不能为空";
	    						break;
	    					}
	    				}
	    			}
	    			if(ischeck=='1'){
	    				grid.loading("保存中...");
	    				var json = nui.encode({added:added,modified:modified,removed:removed});
				        nui.ajax({
				            url: "com.primeton.rdmgr.project.projectscore.saveRdProjScoreitem.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
				            success: function (o) {
				            	var result = o.result;
				            	if(result=='1'){
				            		nui.alert("保存成功！");
				            		grid.unmask();
				      				init();
				            	}else{
				            		nui.alert("保存失败！");
				            		grid.unmask();
				            	}
				            }
				    	});
	    			}else{
	    				nui.alert(ischeck);
	    				return;
	    			}
	    		}else{
	    			return;
	    		}
	    	}
	    }
/* 	    //檢查排列順序是否重复
	    function checkSealname(e){
	    	var d = grid.getData();//表格数据
	    	var sortno = e.value;//用章名称
	    	var ischeck = 0;//是否重复
	    	if(d.length>0){
	    		for(var i=0;i<d.length;i++){
	    			if(sortno==d[i].sortno){
	    				ischeck++;
	    			}
	    		}
	    		if(ischeck!=0){
	    			alert("排列順序不能重复！");
	    			nui.get("sortno").setValue("");
	    			return;
	    		}
	    	}
	    }	 */
	    function getStatus(e){
		return nui.getDictText('MIS_YN',e.value);
	}
	
	function changeOrg(e){
		if(e.value==null || e.value==""){
			nui.get("tempcond1").setValue("=");
			nui.get("tempcond2").setValue("");
		}else{
			nui.get("tempcond1").setValue("in");
			nui.get("tempcond2").setValue("1");
		}
	}
	
	</script>
</body>
</html>