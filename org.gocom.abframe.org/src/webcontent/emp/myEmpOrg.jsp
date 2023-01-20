<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-27 10:10:45
  - Description:
-->
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div>
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		      <table style="width:100%;">
		    	<tr>
		            <td style="width:20%;" align="left">
			            <a class="nui-button" id="search" iconCls="icon-add" onclick="add()">新增</a>
			            <a class="nui-button" id="reset" iconCls="icon-remove" onclick="removeRow()">删除</a>
			            <a class="nui-button" id="reset" iconCls="icon-save" onclick="save()">保存</a>
			        </td>
		        </tr>
		      </table>           
			</div>
		</div>
    	<div style="width:100%;">
            <div id="datagrid1" showPager="false" sortMode="client" class="nui-datagrid"  allowCellEdit="true"
            	url="org.gocom.abframe.org.employee.EmpManager.queryEmpOrg.biz.ext" dataField="emporgs"
            	editNextOnEnterKey="true" allowCellSelect="true" allowCellWrap="true"
            	style="width:100%;height:520px;"  multiSelect="true" allowSortColumn=true>
                <div property="columns">
                	<div type="checkcolumn" width="20px"></div>
                    <div field="empid" width="0" align="left" headerAlign="center" allowSort="true" visible="false">人员ID</div>
                    <div field="orgid" width="0" align="left" headerAlign="center" allowSort="true" visible="false">组织ID</div>
                    <div field="orgname" width="120" align="center" headerAlign="center" allowSort="true" >机构名称</div>
                    <div field="ismain" width="120" align="center" headerAlign="center" allowSort="true" renderer="getYN">是主机构
                    	<input property="editor" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_YESORNO"/>
                    </div>
                    <div field="orgtype" id="orgtype" width="110" align="center" headerAlign="center" allowSort="true" renderer="getOrgType">机构类型</div>
                    <div field="empprop" width="110" align="center" headerAlign="center" allowSort="true">占比数
                    	<input property="editor" class="nui-textbox"/>
                    </div>
                    <div field="indate" width="110" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd" renderer="dealdate" align="left">调动日期
                    	<input property="editor" class="nui-datepicker"  inputStyle="text-align: left"/>
                    </div>
                </div>
            </div>
		</div>
	</div>
<script type="text/javascript">
    	nui.parse();
    	var deleteEmps = [];
    	var addEmps = [];
    	
    	//var empid = '<b:write property="emp/empid"/>';
    	var empid = '<%=request.getParameter("empid") %>';
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
		    grid.load({ "empid": empid});
		}

		function getYN(e){
			return nui.getDictText('ABF_YESORNO',e.value);
		}
		function getOrgType(e){
			return nui.getDictText('ABF_ORGTYPE',e.value);
		}
		function dealdate(e){
			if(e.value){
				return e.value.substring(0,10);
			}
		}
		
		function removeRow(){
	        var rows = grid.getSelecteds();
	        for(var i = 0;i<rows.length;i++){
	        	if(rows[i].indate == null || rows[i].indate == ""){
	        		alert("删除数据时，调动日期不能为空！");
	        		return;
	        	}
	        	deleteEmps.push(rows[i]);
	        }
	        var num = rows.length;
	        if (rows.length > 0) {
	        	if(confirm("确定删除"+num+"条记录吗？")){
	        		grid.removeRows(rows, false);
	        	}else{
	        		return false;
	        	}
	        }else{
				alert("请选择一条记录！"); 
	        }
		}
		
		function add(){
			nui.open({
				url: "<%=request.getContextPath() %>/abframe/org/emp/addEmpOrg.jsp",
                title: "增加组织归属",
                width: 700,
                height: 450,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = {"action": "add"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        	addEmps.push(data);
                        	var indate = data.indate;
					    	var orgid = data.orgid;
					    	var orgname = data.orgname;
					    	var ismain = data.ismain;
					    	var orgtype = data.orgtype;
					    	var empprop = data.empprop;
                        	if(indate!='null' && indate!=null && indate!=""){
                        		indate = FormatDate(indate);
                        	}
                    		var newRow = { name: "New Row",
							indate: indate,
							orgid: orgid,
							orgname: orgname,
							orgtype: orgtype,
							ismain: ismain,
							empprop: empprop
							};
							var grid = nui.get('datagrid1');
							grid.addRow(newRow);
                        }
                    }
                }
			});
		}
		
		function save(){
			var data = grid.getData();
			var t = 0;
			var p = 0;
			for(var i = 0;i<data.length;i++){
				t = parseFloat(t) + parseFloat(data[i].empprop);
				if(data[i].ismain == "y"){
					p++;
				}
			}
			if(p>1){
				alert("主机构只能有一个！");
				return;
			}
			if(p==0){
				alert("请选择一个机构设为主机构！");
				return;
			}
			if(t !=1 ){
				alert("占比数总和必须为1！");
				return;
			}
			var json = nui.encode({"deleteEmps":deleteEmps,"addEmps":addEmps,"data":data,"empid":empid});
        	nui.ajax({
        		url: "org.gocom.abframe.org.employee.EmpManager.saveOrgEmp.biz.ext",
        		data: json,
        		type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(text){
					if(text.result == "1"){
						alert("保存成功!");
						deleteEmps = [];
    					addEmps = [];
						grid.load({ "empid": empid});
					}else{
						alert("保存失败!");
					}
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    			}
        	});
		} 
		
		
		function FormatDate(strTime) { 
		    var date = new Date(strTime); 
		    var year = date.getFullYear();
		    var month = date.getMonth()+1;
		    var day = date.getDate();
		    if(month<10){
		    	month = "0"+month;
		    }
		    if(day<10){
		    	day = "0"+day;
		    }
		    return year+"-"+month+"-"+day; 
		}
		
</script>
</body>
</html>