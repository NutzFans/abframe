<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2018-06-01 10:37:37
  - Description:
-->
<head>
<title>项目与合同关系维护</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
	<div class="nui-fix">
		<div class="nui-panel" title="项目合同关系维护" style="width:100%;">
	        <div id="form1">
	        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <!-- 数据实体的名称 -->
		            <input class="nui-hidden" name="criteria/_entity" value="com.primeton.rdmgr.data.rd.RdProject">
		            <table align="center" border="0" width="100%" class="form_table">
	        			<tr>
				          <td class="form_label" align="right">项目名称</td>
				          <td colspan="1" align="left">
				            <input name="criteria._expr[0]._value" class="nui-textbox"  onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="projectName"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				          </td>
				          <td class="form_label" align="right">项目销售</td>
				          <td colspan="1">
						   		<input class="nui-textbox" name="criteria._expr[7]._value"/>
				           		<input class="nui-hidden"  name="criteria._expr[7]._property" value="prosale"/>
				                <input class="nui-hidden"  name="criteria._expr[7]._op" value="like" />
						    	<input class="nui-hidden"  name="criteria._expr[7]._likeRule" value="all"/> 
				          </td>
				          <td class="form_label" align="right">项目所属客户</td>
				           <td colspan="1">
				           		<input class="nui-textbox" name="criteria._expr[2]._value"/>
				          		<input class="nui-hidden" name="criteria._expr[2]._property" value="custname"/>
				                <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
				                <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
				         </td>
				      </tr>
				      <tr>
				      	 <td class="form_label" align="right"> 项目编号</td>
				          <td colspan="1">
				            <input name="criteria._expr[1]._value" class="nui-textbox"  onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectNo"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
				          </td>
				          <td class="form_label" align="right">合同销售</td>
				          <td colspan="1">
						   		<input class="nui-textbox" name="criteria._expr[8]._value"/>
				           		<input class="nui-hidden" name="criteria._expr[8]._property" value="salename"/>
				                <input class="nui-hidden" name="criteria._expr[8]._op" value="like" />
						    	<input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/> 
				          </td>
				          
				        	
				           <td class="form_label" align="right">合同签署单位</td>
				           <td colspan="1">
				          		<input class="nui-textbox" name="criteria._expr[6]._value"/>
				           		<input class="nui-hidden" name="criteria._expr[6]._property" value="contcustname"/>
				                <input class="nui-hidden" name="criteria._expr[6]._op" value="like" />
						    	<input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/> 
				          </td>
						  
					  </tr>
					  <tr>
				          <td class="form_label" align="right">项目负责人</td>
				            <td colspan="1">
			          			<input class="nui-textbox" name="criteria._expr[3]._value"/>
				          		<input class="nui-hidden" name="criteria._expr[3]._property" value="managername"/>
				                <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				                <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
				          </td>
				           <td class="form_label" align="right">商务合同编号</td>
				           <td colspan="1">
				                <input class="nui-textbox" name="criteria._expr[4]._value" />
				           		<input class="nui-hidden" name="criteria._expr[4]._property" value="contnum"/>
				                <input class="nui-hidden" name="criteria._expr[4]._op" value="like" />
						    	<input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/> 
				        	</td>
				        	 <td class="form_label" align="right">合同订单编号</td>
				           <td colspan="1">
				                <input class="nui-textbox" name="criteria._expr[5]._value"/>
				           		<input class="nui-hidden" name="criteria._expr[5]._property" value="contorderno"/>
				                <input class="nui-hidden" name="criteria._expr[5]._op" value="like" />
						    	<input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/> 
				           </td>
						  
					  </tr>
					  <tr>
				          <td class="form_label" align="right">对应类型</td>
				            <td colspan="1">
			          			<input class="nui-dictcombobox" name="criteria._expr[9]._value" dictTypeId="AME_PROCONT" showNullItem="true" nullItemText="全部"/>
				          		<input class="nui-hidden" name="criteria._expr[9]._property" value="proconttype"/>
				                <input class="nui-hidden" name="criteria._expr[9]._op" value="="/>
				          </td>
				           
				        	 <td class="form_label" align="right">对应关系</td>
				           <td colspan="1">
				                <input class="nui-dictcombobox" name="criteria._expr[10]._value" dictTypeId="AME_RELATION" showNullItem="true"/>
				           		<input class="nui-hidden" name="criteria._expr[10]._property" value="flag"/>
				                <input class="nui-hidden" name="criteria._expr[10]._op" value="=" />
				           </td>
					 		 <td class="form_label" align="right">是否主合同</td>
				           <td colspan="1">
				                <input class="nui-dictcombobox" name="criteria._expr[11]._value" dictTypeId="MIS_YN" showNullItem="true"/>
				           		<input class="nui-hidden" name="criteria._expr[11]._property" value="ismaincont"/>
				                <input class="nui-hidden" name="criteria._expr[11]._op" value="=" />
				           </td>
					  </tr>
	  				</table>
			      	<table style="width:100%;">
		    	  		<tr>
				            <td align="center">
					            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
					            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
					        </td>
				        </tr>
			      	</table>           
				</div>
			</div>
	    	<div style="width:100%;" >
	    		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td>
					            <a class="nui-button" iconCls="icon-add" onclick="addProCont()">增加关联</a>
				                <a class="nui-button" iconCls="icon-remove" onclick="deleteProCont()">删除</a>
					        </td>
		                </tr>
		            </table>           
		        </div>
	            <div id="datagrid1" sizeList="[10,20,50,100]" pageSize="20" style="height: 340px" showPager="true" dataField="projConts" allowResize="true" class="nui-datagrid" url="com.primeton.rdmgr.project.rdProject.queryProCont.biz.ext" 
	            	multiSelect="true" allowSortColumn=true>
	                <div property="columns">
	                	<div type="checkcolumn"></div>
	                	<div field="procontid" width="0">主键id</div>
	                	<div field="projectId" width="0">项目id</div>
	                	<div field="contractid" width="0">合同id</div>
	                    <div field="projectName" width="220" align="left"headerAlign="center" allowSort="true" >项目名称</div>
	                    <div field="projectNo" width="100" align="center" headerAlign="center" allowSort="true" renderer="getProjectDetail">项目编号</div>
	                    <div field="managername" width="80" align="center" headerAlign="center" allowSort="true" >项目负责人</div>
	                    <div field="contnum" width="80" align="center" headerAlign="center" allowSort="true" renderer="getContDetail">合同编号</div>
	                    <div field="contorderno" width="100" align="center" headerAlign="center" allowSort="true" >合同订单编号</div>
	                    <div field="contracttype" width="120" align="center" headerAlign="center" allowSort="true" renderer="dictGetContType">合同类型</div>
	                    <div field="custname" width="180" align="left" headerAlign="center" allowSort="true" >项目所属客户</div>
	                    <div field="contcustname" width="180" align="left" headerAlign="center" allowSort="true" >合同签署单位</div>
	                    <div field="prosale" width="110" align="center" headerAlign="center" allowSort="true" >项目销售</div>
	                    <div field="salename" width="80" align="center" headerAlign="center" allowSort="true" >合同销售</div>
	                    <div field="proconttype" width="110" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">对应类型</div>
	                	<div field="ismaincont" width="50" align="center" headerAlign="center" allowSort="true" renderer="dictIsmaincont">是否主合同</div>
	                </div>
	            </div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		search();
			
		//增加项目合同关联
		function addProCont(){
			nui.open({
	            url: "<%=request.getContextPath() %>/project/rdproject/modifyProCont.jsp",
	            title: "新增项目合同关联关系", 
	            width: 1100, 
	            height: 450,
	            ondestroy: function (action) {
	            	if(action=="ok"){
	            		grid.reload();
	            	}
	            }
	        });
		}
		
		//删除项目与合同关联记录
		function deleteProCont(){
			var rows = grid.getSelecteds();
			var data = {procont:rows};
            var json = nui.encode(data);
			if (rows.length > 0) {
				if (confirm("确定删除选中记录？")) {
					grid.loading("操作中，请稍后......");
                    nui.ajax({
                        url: "com.primeton.rdmgr.project.rdProject.deleteProCont.biz.ext",
                        type: "post",
                        data: json, 
                        cache: false,
                        contentType: 'text/json',
                        success: function (text) {
                        	if(text.result=="succ"){
		                		nui.alert("删除成功！");
			                	grid.reload();
		                	}else{
		                		nui.alert("删除失败！");
		                	}
                        },
                        error: function () {
                        }
                    });
				}
			}else {
                alert("请选中一条记录");
            }
		}
			
		//合同类型业务字典
		function dictGetContType(e){
			return nui.getDictText('MIS_CONTRACTTYPE',e.value);
		}
		
		//对应类型业务字典
		function dictGetType(e){
			return nui.getDictText('AME_PROCONT',e.value);
		}
		
		//是否主合同业务字典
		function dictIsmaincont(e){
			return nui.getDictText('MIS_YN',e.value);
		}
		
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		  	grid.sortBy("projectNo","desc");
		}
		
		//重置
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			search();
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		//查看项目详情
		function getProjectDetail(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='doViewPro();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function doViewPro(){
	    	var selectRow = grid.getSelected();
			var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
			window.open(executeUrl);
	    }
	    
	    //查看合同详情
	    function getContDetail(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='doViewCont();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function doViewCont(){
	    	var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl);
	    }
	</script>
</body>
</html>