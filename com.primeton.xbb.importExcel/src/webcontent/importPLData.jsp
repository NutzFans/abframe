<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): EPCNB324
  - Date: 2016-06-22 10:57:20
  - Description:
-->
<head>
<title>各事业部PL表手录数据</title>
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
                       	PL表手工数据录入管理
                    </td>
                </tr>
             </table>           
        </div>
    </div>
<div class="nui-toolbar" style="border-bottom:0;padding:0px;" id="form1">
   <table style="width:100%;">
      <tr>
         <td align="right"><span>所属部门：</span></td>
            <td align="left">
               <input name="criteria._ref[0]._expr[0]._value" class="nui-combobox" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" filterType="like" textField="orgname" 
               valueField="orgseq" dataField="orgs" valueFromSelect="true" allowInput="true" style="width:150px;" shownullItem="true"/> 
               <input class="nui-hidden" name="criteria._expr[0]._property" value="orgid"/>
		       <input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="tempCond11"/>
		       <input class="nui-hidden" name="criteria._expr[0]._ref" value="1" id="tempCond21"/>
		       <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
		       <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
		       <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
		       <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
		       <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
		       <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end"/>
		     </td>
		 <td align="right"><span>报表指标：</span></td>
            <td align="left">
              	<input class="nui-dictcombobox" name="criteria._expr[3]._value" dictTypeId="ReportCostType" showNullItem="true" style="width: 160px;"/>
	    		<input class="nui-hidden" name="criteria._expr[3]._property" value="type"/>
	    		<input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
			   </td>
         <td align="right"><span>年份：</span></td>
            <td align="left">
               <input name="criteria._expr[1]._value" class="nui-combobox" valueField="id" textField="text"  id = "year" showNullItem="true" nullItemText="全部"
			   data=[{"id":2015,"text":2015},{"id":2016,"text":2016},{"id":2017,"text":2017},{"id":2018,"text":2018},{"id":2019,"text":2019},{"id":2020,"text":2020}] style="width:150px;"/>
               <input class="nui-hidden" name="criteria._expr[1]._property" value="year"/>
			   <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
			   </td>
            <td align="right"><span>月份：</span></td>
            <td align="left">
               <input name="criteria._expr[2]._value" class="nui-combobox" valueField="id" textField="text"  id = "month" showNullItem="true" nullItemText="全部"
			   data=[{"id":1,"text":1},{"id":2,"text":2},{"id":3,"text":3},{"id":4,"text":4},{"id":5,"text":5},{"id":6,"text":6},{"id":7,"text":7},{"id":8,"text":8},{"id":9,"text":9},{"id":10,"text":10},{"id":11,"text":11},{"id":12,"text":12}] style="width:150px;"/>
               <input class="nui-hidden" name="criteria._expr[2]._property" value="month"/>
			   <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
			   </td>
		   </tr>
		   <tr>
			   <td align="center" colspan="15">
            	<a class="nui-button" iconCls="icon-search" onclick="search()">查询</a>
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
	                        	<a class="nui-button" onclick="importPLData" iconCls="icon-upload" id="importPLData">导入Excel</a>
		                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		                        <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
		                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>     
<div id="datagrid1" class="nui-datagrid" style="width:100%;height:280px;" allowResize="true" dataField="ErpDepartmentPL"  url="com.primeton.xbb.importExcel.importPLData.QueryData.biz.ext" 
	 pageSize="15" idField="id" multiSelect="true"  showSummaryRow="true"  ondrawsummarycell="onDrawSummaryCell">
   <div property="columns" >
	  <div type="checkcolumn" width="25"></div>
      <div field="id" width="0" headerAlign="center" allowSort="true">编码</div>
      <div field="orgname" width="120" headerAlign="center" allowSort="true">所属部门</div>
      <div field="contnum" width="120" headerAlign="center" allowSort="true">合同编号</div>
      <div field="year" width="120" headerAlign="center" allowSort="true">年份</div>
      <div field="month" width="120" headerAlign="center" allowSort="true">月份</div>
      <div field="type" width="120" headerAlign="center" allowSort="true" renderer="getReportCostType">报表指标</div>
      <div field="value" dataType="currency" currencyUnit="￥" align="right" width="120" allowSort="true"  summaryType="sum">金额</div>
      <div field="reporttype" width="60" headerAlign="center" allowSort="true">报表类型</div>
   </div>
</div>
<script type="text/javascript">
   nui.parse();
   var grid = nui.get("datagrid1");
   grid.load();           
   function search() {
     var form = new nui.Form("#form1");
   	 var data = form.getData(); //获取表单JS对象数据
       grid.load(data); //datagrid加载数据
     }
   function onGenderRenderer(e) {
      return nui.getDictText('gender',e.value);//设置业务字典值
   }
   
   function remove() {

     var rows = grid.getSelecteds();   //获取所有选中的行对象
     var data = {ErpDepartmentPL:rows};
     
     var json = nui.encode(data);     //序列化成json字符串
     if (rows.length> 0) {
         if (confirm("确定删除选中记录？")) {
     grid.loading("操作中，请稍后......");
     nui.ajax({
     url: "com.primeton.xbb.importExcel.importPLData.deleteData.biz.ext",
     type: "post",
     data: json, 
     cache: false,
     contentType: 'text/json',
     success: function (text) {
     grid.reload();
                        },
     error: function () {
                        }
                    });
                }
            } else {
                alert("请选中一条记录");
            }
   }
    
   function onDrawSummaryCell(e){
		var result = e.result;
	    var grid = e.sender;
	    if (e.field == "type") {
	        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
	    }
	    if (e.field == "value") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	} 
    /**
	 *批量导入坏账核销和应收账款
	 */
	function importPLData(){
		nui.open({
            url: "<%=request.getContextPath() %>/importExcel/importPLExcel.jsp",
            title: "报表基础数据导入", 
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
   function add() {
     nui.open({
	     url: "<%=request.getContextPath() %>/importExcel/addData.jsp",
	                title: "新增", width: 600, height: 360,
	     onload: function () {
	       var  iframe = this.getIFrameEl();
	       var data = { action: "new"};
	     },
	    ondestroy: function (action) {
	      grid.reload();
	    }
	  });
  }
  
  function edit() {
     var row = grid.getSelected();
	 if (row) {
  		nui.open({
            url: "<%=request.getContextPath() %>/importExcel/addData.jsp",
            title: "修改",
            width: 750,
            height: 550,
            onload: function () {
              var iframe = this.getIFrameEl();
              var data = {action: "edit", id:row.id };
              iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if(action=="save"){
                  grid.reload();
                }
            }
        });
        } else {
          nui.alert("请选中一条记录","提示");
     }
  }
  function getReportCostType(e){
  	return nui.getDictText('ReportCostType',e.value);
  }
</script>
</body>
</html>