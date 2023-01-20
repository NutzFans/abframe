<%@page pageEncoding="UTF-8"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2019-06-18 16:26:08
  - Description:
-->
<head>
<title>请假类型设置</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-fix">
	  <div class="nui-panel" title="请假类型设置" style="width:100%;">
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
		<div id="datagrid1" class="nui-datagrid" style="padding:10px;" dataField="leavetypes"  showPager="false" allowCellEdit="true" allowCellSelect="true" 
		    multiSelect="true" editNextOnEnterKey="true" url="com.primeton.eos.ame_permanage.ame_leavepro.getLeaveType.biz.ext" allowCellWrap="true">			            
		    <div property="columns">
		    	<div type="checkcolumn" width="5"></div>
		        <div field="leavetypeid" width="0" visible="false" headerAlign="center"  align="center">编号</div>
		        <div field="leavetype" width="15" headerAlign="center"  align="center"allowSort="true">请假类型
		        	<input property="editor" class="nui-textbox" />
		        </div>
		        <div field="isreg" width="15" headerAlign="center" renderer="getStatus"  align="center" >是否HR审核
		        	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN"/>
		        </div>
		        <div field="leaverule" width="20" headerAlign="center"  align="center" renderer="getDictRule" >请假天数计算规则
		        	<input property="editor"  class="nui-dictcombobox" dictTypeId="AME_LEAVERULE"/>
		        </div>
		        <div field="limitdays" width="15" headerAlign="center" align="center">最高可请天数
		        	<input property="editor" class="nui-textbox" />
		        </div> 
		        <div field="filetips" width="120" headerAlign="center"  align="left">请假附件提示
		        	<input property="editor" class="nui-textbox" />
		        </div>
		    </div>
		 </div>
	   </div>
	  </div>
	</div>
	<script type="text/javascript">
		nui.parse();//初始化NUI
		var grid = new nui.get("datagrid1");//获取表格对象
		init();
		function init(){ 
			grid.load();
		}
		//新增
	    function addRow(){
	    	var rowS = {name: "New Row"};
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
	    	var datas = grid.getChanges();//新增数据
	    	if(datas.length==0){
	    		nui.alert("无任何数据更改，请确认后再进行操作！");
	    		return;
	    	}else{
				for(var i=0;i<datas.length;i++){
					if(datas[i].leavetype==null||datas[i].leavetype==""){
						nui.alert("请假类型不能为空，请补充后保存！");
						return;
					}
					if(datas[i].isreg==null||datas[i].isreg==""){
						nui.alert("是否常规请假不能为空，请补充后保存！");
						return;
					}
					if(datas[i].leaverule==null||datas[i].leaverule==""){
						nui.alert("请假天数计算规则不能为空，请补充后保存！");
						return;
					}
				}
				grid.loading("保存中...");
				var json = nui.encode({datas:datas});
		        nui.ajax({
		            url: "com.primeton.eos.ame_permanage.ame_leaveQuery.saveLeaveType.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
		            	var result = o.result;
		            	if(result==1){
		            		nui.alert("保存成功！");
		            		grid.unmask();
		      				init();
		            	}else{
		            		nui.alert("保存失败！");
		            		grid.unmask();
		            	}
		            }
		    	});
			}
		}
	    function getStatus(e){
			return nui.getDictText('MIS_YN',e.value);
		}
		
		function getDictRule(e){
			return nui.getDictText('AME_LEAVERULE',e.value);	
		}
	</script>
</body>
</html>