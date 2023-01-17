<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wyy
  - Date: 2016-08-02 09:52:48
  - Description:
-->
<head>
<title>ameLeader</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fix">
	<div class="nui-panel" title="人员维护" style="width:100%;">
 	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="form1">
	    	<table style="width:100%;">
	    		<tr>
	    			<td align="right"><span>部门名称：</span></td>
	    			<td align="left">
			           	<input name="criteria._expr[0]._value" class="nui-combobox"  
						    url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" textField="orgname" valueField="orgid" dataField = "orgs" shownullItem="true"
						    allowInput="true" style="width:160px;" />
			          	<input class="nui-hidden" name="criteria._expr[0]._property" value="orgid" />
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
			        </td>
			        <td align="right"><span>技术负责人：</span></td>
			        <td>
			          	<input name="criteria._expr[1]._value" allowInput="false" class="nui-buttonedit" onbuttonclick="showEmployee" style="width:170px;"/>
			          	<input class="nui-hidden" name="criteria._expr[1]._property" value="techLeader" />
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
					</td>
					<td align="right"><span>销售负责人：</span></td>
					<td>
			          	<input name="criteria._expr[2]._value" allowInput="false" class="nui-buttonedit" onbuttonclick="showEmployee" style="width:170px;"/>
			          	<input class="nui-hidden" name="criteria._expr[2]._property" value="saleLeader" />
				        <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
					</td>
		        </tr>
		       <tr>
		       	  <td align="center" colspan="15">
			          <a class="nui-button" style="width:60px;" iconCls="icon-reload" onclick="search()">查询</a>
			          <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
		          </td>
	          </tr>
	         </table>
	    </div>
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
                        <span class="separator"></span>
                        <a class="nui-button" iconCls="icon-save" onclick="saveData()" plain="true">保存</a>            
                    </td>
                </tr>
            </table>           
        </div>
    </div> 
    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:430px;" 
        url="com.primeton.eos.ame_common.ameLeader.queryAmeLeader.biz.ext" idField="id"
        allowResize="true" pageSize="20" sizeList="[10,20,50,100]" dataField="ameLeaders" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" >
        <div property="columns"> 
            <div type="checkcolumn"></div>
            <div field="orgid" displayField="orgname" allowResize="false" width="120" headerAlign="center" allowSort="true">部门名称
                <input property="editor" name="AmeLeader.orgid" class="nui-combobox"  
						    url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" textField="orgname" valueField="orgid" dataField = "orgs" shownullItem="true"
						    allowInput="true" style="width:160px;" />
            </div>
            <div field="techLeader" displayField="techLeaderName" width="100" allowSort="false" headerAlign="center">技术负责人
                <input property="editor" name="AmeLeader.techLeader" id="techLeader" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false"/>
            </div>            
            <div field="saleLeader" displayField="saleLeaderName" width="100" allowSort="false" headerAlign="center">销售负责人
                <input property="editor" name="AmeLeader.saleLeader" id="saleLeader" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false"/>
            </div>    
        </div>
    </div>
    </div>	
</div>
<script type="text/javascript">
        nui.parse();
        var grid = nui.get("datagrid1");
        grid.sortBy("orgid","desc");
        grid.load();
        function search() {	    		
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy("orgid","desc");
		  	grid.load(data); //datagrid加载数据
		}
        function addRow() {          
            var newRow = { name: "New Row" };
            grid.addRow(newRow, 0);
        }
        function removeRow() {
            var rows = grid.getSelecteds();
            if (rows.length > 0) {
                grid.removeRows(rows, true);
            }
        }
        function saveData() {
            var data = {ameLeaders:grid.getChanges()};
            var json = nui.encode(data);
            nui.ajax({
                url: "com.primeton.eos.ame_common.ameLeader.saveAmeLeader.biz.ext",
                type: 'POST',
                data: json,
                success: function (text) {
            		alert("保存成功");
                	grid.sortBy("orgid","asc");
                    grid.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
        }

function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.userid);
		                btnEdit.setText(data.empname);		 
					}
				}
			}
		});
	}
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
	function dictOrgName(e){
	return nui.getDictText('CONT_ORG',e.value);//设置业务字典值
}
</script>
</body>
</html>