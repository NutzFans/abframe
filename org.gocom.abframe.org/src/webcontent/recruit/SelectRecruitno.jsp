<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- 
  - Author(s): xpc
  - Date: 2014-08-22 16:28:09
  - Description:
-->
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<%@include file="/common/common.jsp"%>
<head>
	<title >选择招聘需求编号</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>	
</head>
	<body>
		<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;" id="form1">
		<!-- <input class="nui-hidden" name="criteria._expr[8]._value" id="isreferrer"/>
	    <input class="nui-hidden" name="criteria._expr[8]._property" value="isreferrer"/>
		<input class="nui-hidden" name="criteria._expr[8]._op" value="="/> -->
		<input class="nui-hidden" name="isflag" id="isflag"/>
		<table align="center" border="0" width="100%">
	          <tr>
        		<td align="right" style="width:66px;">需求部门:</td>
        		<td align="left" style="width:100px;">
		        <input class="nui-hidden" name="criteria._expr[0]._property" value="orgid"/>
				<input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="tempCond11"/>
				<input class="nui-hidden" name="criteria._expr[0]._ref" value="" id="tempCond21"/>
				<input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
				<input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
				<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
				<input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
				<input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
				<input id="orgid"  name="criteria._ref[0]._expr[0]._value"  class="nui-combobox" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"
				textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" />
				<input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
				</td>
				
		        <td align="right" style="width:80px;">招聘职位:</td>
		        <td align="left" >
		        <input name="criteria._expr[1]._value"  class="nui-textbox" allowInput="true"  style="width:90px;"/>
			    <input class="nui-hidden" name="criteria._expr[1]._property" value="recpositionname"/>
				<input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
				<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/> 
				</td>
				
			    <td align="right" style="width:60px;">人员性质:</td>
			    <td align="left" >
			    <input class="nui-hidden" name="criteria._expr[2]._property" value="jobtype"/>
				<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
				<input name="criteria._expr[2]._value" class="nui-dictcombobox" dictTypeId="AME_EMPTYPE2" shownullItem="true" style="width:90px;" />
				</td>
				
				<td align="right" style="width:70px;">工作地点:</td>
				<td align="left" >
			    <input class="nui-hidden" name="criteria._expr[4]._property" value="workplace1"/>
			    <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
			    <input name="criteria._expr[4]._value"  class="nui-dictcombobox" dictTypeId="AREA4CLRY" multiSelect="true" shownullItem="true"  style="width:90px;" />
			    </td>
			    </tr>
			    
			    <tr>
		    	<td  align = "right" style="width:60px;">处理状态:</td>
			    <td align="left" >
		        <input name="criteria._expr[5]._value" class="nui-dictcombobox" id="status" dictTypeId="RECRUIT_STATUS"shownullItem="true" multiSelect="true"  />
				<input class="nui-hidden" name="criteria._expr[5]._property" value="status"/>
				<input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
			    </td>
			    <td align="right" style="width:80px;">需求编号:</td>
		        <td align="left" >
		        <input name="criteria._expr[6]._value"  class="nui-textbox" allowInput="true"  style="width:90px;"/>
			    <input class="nui-hidden" name="criteria._expr[6]._property" value="recruitno"/>
				<input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
				<input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/> 
				</td>
				<td align="right" style="width:60px;" >招聘专员:</td>	
	            <td align="left"> 
	            <input class="nui-hidden" name="criteria._expr[7]._property" value="recempname"/>
				<input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
				<input name="criteria._expr[7]._value" class="nui-textbox"  style="width:90px;"/>
				<input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>  
	            </td>
	            <td  align = "right" style="width:70px;">是否内推:</td>
			    <td align="left" >
		        <input name="criteria._expr[8]._value" class="nui-dictcombobox" id="isreferrer" dictTypeId="MIS_YN"shownullItem="true" multiSelect="false"  style="width:90px;"/>
				<input class="nui-hidden" name="criteria._expr[8]._property" value="isreferrer"/>
				<input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
			    </td>
			    </tr>
			    
			    <tr>
			    <td colspan="8" align="center">
	            <a class="nui-button" style="width:60px;" iconCls="icon-search"onclick="search()">查询</a>
	            <a class="nui-button" style="width:60px;"  iconCls="icon-reload"onclick="reset()">重置</a>
	            </td>
	            </tr>
	            </table>
	    </div>
	    <div class="nui-fit">
	        <div id="grid1" class="nui-datagrid" style="width:100%;height:100%;"
	            idField="empid" allowResize="true" dataField="omRecruits" multiSelect="false"
	            borderStyle="border-left:0;border-right:0;" onrowdblclick="onRowDblClick" url="org.gocom.abframe.org.recruit.SelecrRecruitno.biz.ext" >
	            <div property="columns">	
	                <div type="checkcolumn" width="10"></div>    
	                <div field="recruitno" width="20" headerAlign="center" align="center" allowSort="true" renderer="getDetail">需求编号</div>
	                <div field="orgname" width="25" align="center" headerAlign="center">招聘部门</div>                             
	                <div field="recpositionname" width="30" align="center" headerAlign="center" allowSort="true">招聘职位</div>
	                <div field="jobtype" width="20" align="center" headerAlign="center" allowSort="true" renderer="getJobType">人员性质</div>    
	                <div field="position" width="20" align="center" headerAlign="center" allowSort="true" renderer="getPosition">人员属性</div>
	                <div field="workplace" width="18" align="center" headerAlign="center" allowSort="true" renderer="getWorkspace">工作地点</div>
	                <div field="recempname" width="22" align="center" headerAlign="center" allowSort="true" >招聘专员</div>   
	                <div field="recnum" width="20" align="right" headerAlign="center" allowSort="true" summaryType="sum"  >招聘数量</div> 
	                <div field="finishnum" width="20" align="right" headerAlign="center" allowSort="true" summaryType="sum"  >已完成数</div>  
	                <div field="applyname" width="20" align="center" headerAlign="center" allowSort="true">申请人</div>                    
	            </div>
	        </div>
		</div>  
		<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
	       <table align="center" border="0" width="100%">
	          <td align = "right" >招聘专员推荐简历时间：</td>
			  <td align="left" >
				 <input name="recommendresumedate" class="nui-datepicker" id="recommendresumedate" dateFormat="yyyy-MM-dd" style="width:150px"  />
			  </td>
			  <td align="right" >面试官简历反馈时间：</td>
			  <td align="left" >
				<input name="resumefeedbackdate" id="resumefeedbackdate" class="nui-datepicker" dateFormat="yyyy-MM-dd"style="width:150px"/>
			  </td>
	       </table>
	    </div>              
	    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
	        <a class="nui-button" style="width:60px;" onclick="onOk()" iconCls="icon-ok">确定</a>
	        <span style="display:inline-block;width:25px;"></span>
	        <a class="nui-button" style="width:60px;" onclick="onCancel()" iconCls="icon-cancel">取消</a>
	    </div>
	</body>
	</html>
	
	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("grid1");
		var form = new nui.Form("#form1");
		var isflag = '<%=request.getParameter("isflag") %>';
		var refferexpmouldno = '<%=request.getParameter("refferexpmouldno") %>';
		if(isflag=='1'){
		    nui.get("isflag").setValue("1");
		    nui.get("isreferrer").setValue("1");
		    grid.setMultiSelect(true);
	    }
		//初始化
		init();
    	function init(){
    		grid.sortBy("recruitno","desc");
    		nui.get("status").setValue("0,1");
    		search(); 
		}
		//查询
		function search(){
			if(nui.get("orgid").getValue() == ""){
	    		nui.get("tempCond11").setValue("=");
	    		nui.get("tempCond21").setValue("");
	    	}else{
	    		nui.get("tempCond11").setValue("in");
	    		nui.get("tempCond21").setValue("1");
    	}
    	    var data = form.getData();
			grid.load(data);
			grid.sortBy("recruitno","asc");
	   }
	   //重置
       function reset(){
		   if(nui.get("orgid").getValue() == ""){
		    		nui.get("tempCond11").setValue("=");
		    		nui.get("tempCond21").setValue("");
		    	}else{
		    		nui.get("tempCond11").setValue("in");
		    		nui.get("tempCond21").setValue("1");
			}
			form.reset();
			grid.sortBy("recruitno","asc");
			nui.get("status").setValue("0,1");
			search();
	    } 
	 
	    function GetData() {
			var row = grid.getSelected();
			var recommendresumedate = nui.get("recommendresumedate").getValue();
			var resumefeedbackdate = nui.get("resumefeedbackdate").getValue();
			row.recommendresumedate = recommendresumedate;
			row.resumefeedbackdate = resumefeedbackdate;
			return row;
		} 
		//内推模板支持多选招聘需求
		function BindRecruitno() {
			var rows = grid.getSelecteds();
			return rows;
		} 
		function onKeyEnter(e) {
			search();
		}
		    
		function onRowDblClick(e) {
			onOk();
		}
	
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}
		function getDetail(e){
			if(e.value){
				return "<a href='javascript:void(0)' onclick='getOmRecruitDetail();' title='点击查看'>" + e.value + "</a>";
			}
	    }
	    function getOmRecruitDetail(){
	    	var selectRow = grid.getSelected();
			var executeUrl = "/default/abframe/org/recruit/omRecruitDetail.jsp?recruitid=" + selectRow.recruitid;
			window.open(executeUrl);
	    }
		//保存
		function onOk() {
		    CloseWindow("ok");
		}
		
		function onCancel() {
			CloseWindow("cancel");
		}
		function getJobType(e){
		    return nui.getDictText('AME_EMPTYPE2',e.value);
		}
		function getPosition(e){
			return nui.getDictText('EMP_TYPE',e.value);
		}
		function getWorkspace(e){
			return nui.getDictText('AREA4CLRY',e.value);
		}
		function getStatus(e){
			return nui.getDictText('RECRUIT_STATUS',e.value);
		}
	</script>