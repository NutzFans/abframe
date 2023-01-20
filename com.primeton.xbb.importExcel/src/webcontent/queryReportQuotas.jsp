<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-06-08 
  - Description:
-->
<head>
<title>月度统计指标值查询与维护</title> 
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;">
     <div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	月度统计指标值查询与维护
                    </td>
                </tr>
             </table>           
        </div>
    </div>
<div class="nui-toolbar" style="border-bottom:0;padding:0px;" id="form1">
   <table style="width:100%;">
      <tr>
         <td align="right" style="width: 80px;"><span>部门：</span></td>
            <td align="left">
                <input name="criteria._expr[0]._value" class="nui-combobox" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs" 
			     style="width: 170px"  shownullItem="true" onenter="onKeyEnter" allowInput="true" />
				<input class="nui-hidden" name="criteria._expr[0]._property" value="orgseq"/>
	 		 	<input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
                <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="end"/>
		        
		        <input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
		        <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
		        <input class="nui-hidden" name="criteria._expr[1]._value" id="orgids"/>
		     </td>
		<td align="right" style="width: 110px;"><span>合同编号：</span></td>
        	 <td align="left">
        		<input class="nui-textbox" name="criteria._expr[2]._value" style="width: 120px;"/>
        		<input class="nui-hidden" name="criteria._expr[2]._property" value="contnum"/>
		        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
		        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
		     </td>
		<td align="right" style="width: 100px;"><span>项目编号：</span></td>
             <td align="left">
	    		<input class="nui-textbox" name="criteria._expr[3]._value" style="width: 120px;"/>
        		<input class="nui-hidden" name="criteria._expr[3]._property" value="projectno"/>
		        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
		        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
		     </td>    
		 <td align="right" style="width: 100px;"><span>人员姓名：</span></td>
             <td align="left">
	    		<input class="nui-textbox" name="criteria._expr[4]._value" style="width: 100px;"/>
        		<input class="nui-hidden" name="criteria._expr[4]._property" value="empname"/>
		        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
		        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
			 </td>
		 </tr>
		 <tr>
		   <td align="right" style="width: 80px;"><span>报表：</span></td>
             <td align="left"> 
                <input class="nui-combobox" name="criteria._expr[5]._value" id="reportcode" valueField="reportcode" textField="reportname" url="com.primeton.xbb.importExcel.importReportQuota.getReport.biz.ext" onvaluechanged="onValueChanged"
                dataField="Reports"  allowInput="true" multiSelect="true" style="width: 170px;" />
        		<input class="nui-hidden" name="criteria._expr[5]._property" value="reportcode"/>
		        <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
			 </td>
		    <td align="right"><span>年份：</span></td>
            <td align="left">
               <input name="criteria._expr[6]._value" class="nui-combobox" valueField="id" textField="text"  id = "year" showNullItem="true" nullItemText="全部"
			   data=[{"id":2015,"text":2015},{"id":2016,"text":2016},{"id":2017,"text":2017},{"id":2018,"text":2018},{"id":2019,"text":2019},{"id":2020,"text":2020}] style="width:120px;"/>
               <input class="nui-hidden" name="criteria._expr[6]._property" value="year"/>
			   <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
			   </td>
            <td align="right"><span>月份：</span></td>
            <td align="left">
               <input name="criteria._expr[7]._value" class="nui-combobox" valueField="id" textField="text"  id = "month" showNullItem="true" nullItemText="全部"
			   data=[{"id":1,"text":1},{"id":2,"text":2},{"id":3,"text":3},{"id":4,"text":4},{"id":5,"text":5},{"id":6,"text":6},{"id":7,"text":7},{"id":8,"text":8},{"id":9,"text":9},{"id":10,"text":10},{"id":11,"text":11},{"id":12,"text":12}] style="width:120px;"/>
               <input class="nui-hidden" name="criteria._expr[7]._property" value="month"/>
			   <input class="nui-hidden" name="criteria._expr[7]._op" value="="/>
		    </td>
		    <td align="right" style="width: 100px;"><span>客户名称：</span></td>
             <td align="left">
	    		<input class="nui-textbox" name="criteria._expr[8]._value" style="width: 100px;"/>
        		<input class="nui-hidden" name="criteria._expr[8]._property" value="custname"/>
		        <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
		        <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
			 </td>
		  <tr>
		  <tr>
             <!-- <td align="left">
	    		<input class="nui-textbox" name="criteria._expr[9]._value" style="width: 160px;"/>
        		<input class="nui-hidden" name="criteria._expr[9]._property" value="reportquotaname"/>
		        <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
		        <input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
			 </td> -->
		  <td align="right" style="width: 80px;"><span>指标项：</span></td> 
		  <td align="left">
			 <input class="nui-treeselect" expandOnLoad="true"
			 textField="reportquotaname" valueField="quotaseq" parentField="parentquotacode" dataField="reportquotacodes" showTreeIcon="true" valueFromSelect="true" 
			 showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true" 
			 name="criteria._expr[9]._value" id="reportquotacode" style="width:170px;"  nullItemText=""/>
			 <input class="nui-hidden" name="criteria._expr[9]._property" value="quotaseq"/>
			 <input class="nui-hidden" name="criteria._expr[9]._op"  value="in"/>
		  </td>
		  <td align="right">员工属性：</td>
        	 <td align="left" >
                <input class="nui-dictcombobox"  name="criteria._expr[10]._value"  style="width: 120px" dictTypeId="EMP_TYPE"  multiSelect="true" shownullItem="true"/>
	 		 	<input class="nui-hidden" name="criteria._expr[10]._property" value="intendpositiontype"/>
                <input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
	         </td>
		  </tr>	 
		  <tr>
			   <td align="center" colspan="15">
            	<a class="nui-button" iconCls="icon-search" onclick="search()">查询</a>
            	<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
     		   </td>
          </tr>
   </table>           
</div>
</div>
<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
	                        	<!-- <a class="nui-button" onclick="importPLData" iconCls="icon-upload" id="importPLData">导入Excel</a> -->
		                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		                        <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
		                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
		                        <a class="nui-button" id="import" iconCls="icon-upload" onclick="importReportQuotaStore()">导入统计指标值</a> 
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>     
<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="ReportQuotaStores"  
    url="com.primeton.xbb.importExcel.importReportQuota.queryReportQuotaStore.biz.ext"  allowAlternating="true" "  showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell"
    sizeList="[10,20,50,100,500]"  pageSize="20" idField="id" multiSelect="true" >
   <div property="columns" >
	  <div type="checkcolumn" width="25"></div>
	  <div field="reportname" width="120" headerAlign="center" allowSort="true">所属报表</div>
	  <div field="parentquotaname" width="100" headerAlign="center" allowSort="true">父指标名称</div>
      <div field="reportquotaname" width="100" headerAlign="center" allowSort="true">指标名称</div>
      <div field="orgname" width="120" headerAlign="center" allowSort="true">所属部门</div>
      <div field="year" width="50" headerAlign="center" allowSort="true" align="center">年份</div>
      <div field="month" width="50" headerAlign="center" allowSort="true" align="center">月份</div>
      <div field="quotavalue" width="60" headerAlign="center" allowSort="true" align="right" summaryType="sum">指标值</div>
      <div field="intendpositiontype" width="80" headerAlign="center" allowSort="true" renderer="getPositiontype" align="center">员工属性</div>
      <div field="joblevel" width="60" headerAlign="center" allowSort="true" renderer="getJoblevel" align="center">岗位级别</div>
      <div field="empname" width="80" headerAlign="center" allowSort="true" align="center">人员姓名</div>
      <div field="contname" width="100" headerAlign="center" allowSort="true" align="left">合同名称</div>
      <div field="projectName" width="100" headerAlign="center" allowSort="true" align="left">项目名称</div>
      <div field="custname" width="100" headerAlign="center" allowSort="true" align="left">客户名称</div>
   </div>
</div>
<script type="text/javascript">
   nui.parse();
   <% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		Map attr = user.getAttributes();
			DataObject[] roles = (DataObject[])attr.get("roles");
   %>
   var form = new nui.Form("#form1");
   var grid = nui.get("datagrid1");
   var reportString;
   init();
   function init(){
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
		json = {"code":"queryReportQuotas","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("empname").setValue('<%=nowusername %>');
						nui.get("empname").setReadOnly(true);
					}
					var isall;//是否拥有全公司的权限
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
						nui.getbyName("criteria._expr[1]._op").setValue("=");
        				nui.getbyName("criteria._expr[1]._value").setValue("");
					}else{
						nui.get("orgids").setValue(text.orgids);
					}
					nui.get("orgseq").setData(text.orgs);
				}else{
					// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("empname").setValue('<%=nowusername %>');
						nui.get("empname").setReadOnly(true);
				}
				search();
				var reportStrings = nui.get("reportcode").getData();
				if(reportStrings.length > 0){
					reportString = reportStrings.map(function(obj,index){
	                       return obj.reportcode;
	                }).join(",");
	                onValueChanged();
				}
			}
		});
	}
	
	/* function onGridLoad(e) {
	    onload="onGridLoad"
	    var reportquotacodes = grid.getResultObject().reportquotacodes;
	    nui.get("reportquotacode").loadList(reportquotacodes, "quotaseq", "parentquotacode");
    } */
	//查询功能列表
   function search(){
        var data = form.getData();
        grid.load(data);
        grid.sortBy("month", "desc");
   }
   function reset(){
		form.reset();
		init();
   }
   function remove() {
     var rows = grid.getSelecteds();   //获取所有选中的行对象
     var data = {ReportQuotaStore:rows};
     var json = nui.encode(data);     //序列化成json字符串
     if (rows.length> 0) {
         if (confirm("确定删除选中记录？")) {
	         grid.loading("操作中，请稍后......");
		     nui.ajax({
		     url: "com.primeton.xbb.importExcel.importReportQuota.deleteReportQuotaStore.biz.ext",
		     type: "post",
		     data: json, 
		     cache: false,
		     contentType: 'text/json',
		     success: function (text) {
		           grid.reload();
			  },error: function () {}
		   });
         }}else{
                alert("请选中一条记录");
         }
   }
    /**
	 *批量导入
	 */
	function importPLData(){
		nui.open({
            url: "<%=request.getContextPath() %>/importExcel/importPLExcel.jsp",
            title: "月度统计指标值导入", 
			width: 700,
            height: 170,
            allowDrag:true,
            ondestroy: function (action) {
            	if(action=="ok"){
            		grid.reload();
            	}
            }
        });
	}  
   function add(){
     nui.open({ 
	     url: "<%=request.getContextPath() %>/importExcel/addReportQuotaStore.jsp",
	     title: "新增月度统计指标值", width: 800, height: 360,
	     onload: function () {
	       var  iframe = this.getIFrameEl();
	       var data = { action: "new"};
	     },
	    ondestroy: function (action) {
	      if(action=="ok"){
            		grid.reload();
          }
	    }
	  });
  }
  
  function edit() {
     var rows = grid.getSelecteds();
	 if (rows.length> 0) {
  		nui.open({
            url: "<%=request.getContextPath() %>/importExcel/addReportQuotaStore.jsp",
            title: "修改月度统计指标值",
            width: 800,
            height: 360,
            onload: function () {
              var iframe = this.getIFrameEl();
              var data = {action: "edit",ReportQuotaStore:rows[0]};
              
              iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if(action=="ok"){
                  grid.reload();
                }
            }
        });
        } else {
          nui.alert("请选中一条记录","提示");
      }
    }
    /**
	 *批量导入统计指标值http://127.0.0.1:8080/default/importExcel/importReportQuotaStore.jsp
	 */
	function importReportQuotaStore(){
		nui.open({
            url: "<%=request.getContextPath() %>/importExcel/importReportQuotaStore.jsp",
            title: "批量导入月度统计指标值", 
			width: 700,
            height: 176,
            allowDrag:true,
            ondestroy: function (action) {
            	if(action=="ok"){
            		grid.reload();
            	}
            }
        });
	}
    function onValueChanged(){
	   var reportcode = nui.get("reportcode").getValue();
	   if(reportcode == null || reportcode == ''){
	      reportcode = reportString;
	   }
	   var json = nui.encode({reportcode:reportcode}); 
       nui.ajax({
    		url: "com.primeton.xbb.importExcel.importReportQuota.getReportQuota.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (o) {
                nui.get("reportquotacode").loadList(o.reportquotacodes, "quotaseq", "parentquotacode");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
	    });
    }
    function onDrawSummaryCell(e){
		var result = e.result;
	    var grid = e.sender;
	     if (e.field == "month") {
	        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
	    }
	    if (e.field == "quotavalue") {
	        e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	} 
    
    function getPositiontype(e){
		return nui.getDictText('EMP_TYPE',e.value);//设置业务字典值
	}
	function getJoblevel(e){
		return nui.getDictText('AME_TECH',e.value);//设置业务字典值
	}
</script>
</body>
</html>