<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
<html>
<!-- 
  - Author(s): zhangfan
  - Date: 2020-06-09 10:19:05
  - Description:
-->
<head>
<title>Title</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    
</head>
<body>
<div class="nui-fix">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <legend>流程参与者配置</legend>
		    <div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="form1">
			    <input class="nui-hidden" name="sortField" value="processdefname"/>
				<input class="nui-hidden" name="sortOrder" value="desc"/>
		    	<table style="table-layout:fixed;">
		    		<tr>
		    			<td align="right" width="120px"><span>流程定义名称：</span></td>
		    			<td align="left">
				          	<input name="criteria._expr[0]._value" shownullItem="true" class="nui-combobox" id="processdefname" onvaluechanged="onActivitydefname(this.value)" url="com.primeton.eos.ame_common.processPrompt.queryProcessDefName.biz.ext" textField="processChName" valueField="processDefName" dataField = "processDefines"
								    allowInput="true" style="width:200px;" emptyText="请选择流程定义名称"/>
				          	<input class="nui-hidden" name="criteria._expr[0]._property" value="processdefname" />
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				        </td>
				        <td align="right" width="310px"><span>活动定义名称：</span></td>
				        <td align="left">
				          	<input name="criteria._expr[1]._value" shownullItem="true" class="nui-combobox" id="activitydefname" textField="name" valueField="id" dataField = "wfActivityDefines" 
								    allowInput="true" style="width:200px;" emptyText="请选择活动定义名称"/>
							<input class="nui-hidden" name="criteria._expr[1]._property" value="activitydefid"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
						</td>
						<td align="right"  width="290px"><span>角色参与者：</span></td>
						<td align="left">
					     	<input name="criteria._expr[2]._value" shownullItem=ture class="nui-combobox" textField="rolename" valueField="roleid" style="width:200px;" 
					     	url="com.primeton.eos.ame_budget.budgetOrgManager.queryRoleidByName.biz.ext" allowInput="true"/>
							<input class="nui-hidden" name="criteria._expr[2]._property" value="roelpart"/>
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all" />
						</td>
		           </tr>
		          <tr>
		          <td align="right"  width="290px"><span>作用部门：</span></td>
						<td align="left">
					     	<input name="criteria._expr[4]._value" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true" style="width:200px;" 
					     	url="com.primeton.eos.ame_common.ame_common.getAllRunOrgs.biz.ext" allowInput="true"
					     	multiSelect="false" checkRecursive = "false" expandOnLoad="0" showFolderCheckBox="true"/>
							<input class="nui-hidden" name="criteria._expr[4]._property" value="useorg"/>
							<input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
							
						</td>
		          <td align="right"  width="290px"><span>人员参与者：</span></td>
						<td align="left">
					     	<input name="criteria._expr[3]._value" class="nui-textbox"  style="width:200px;" />
							<input class="nui-hidden" name="criteria._expr[3]._property" value="empname"/>
							<input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all" />
						</td>
				 
		          </tr>
		         </table>
		         <table style="width:100%;">
		            <tr>
		                <td align="center" style="width:100%;">
		                    <a class="nui-button" style="width:60px;" iconCls="icon-yicon" onclick="search()">查询</a>
		                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
		                </td>
		            </tr>
		        </table>
		    </div>
			<div style="width:100%;">
			    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			        <table style="width:100%;">
			            <tr>
			                <td style="width:10%;">
			                    <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="addRow()">新增</a>
			                    <a class="nui-button" id="removeBtn" iconCls="icon-remove" onclick="removeRow()">删除</a>
			                    <a class="nui-button" id="okbutton" iconCls="icon-ok" onclick="onOk()">保存</a>
			                </td>
			            </tr>
			        </table>           
			    </div>
			</div>
				
			<div id="datagrid1" class="nui-datagrid" style="width:100%;height: 400px"  allowResize="true" 
					 url="com.primeton.eos.ame_common.ame_common.getAmeFlowActParti.biz.ext" sizeList="[10,20,50,100]" pageSize="20"  multiSelect="true" 
					dataField="authLists" showPager="true" allowAlternating="true" allowCellSelect="true" allowCellEdit="true" oncellbeginedit="isedit">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="processdefname" displayField="processdefnames" width="80px" align="center"  headerAlign="center" allowSort="true" renderer="getDefineDetail">流程定义名称
						<input property="editor" class="nui-combobox" onvaluechanged="onActivitydefname1(this.value)" url="com.primeton.eos.ame_common.processPrompt.queryProcessDefName.biz.ext" 
						textField="processChName" valueField="processDefName" dataField = "processDefines"  allowInput="true"/>
					
					</div>	
					<div field="activitydefid" displayField="activitydefname" width="80px" align="center"  headerAlign="center">流程活动定义名称
						<input property="editor"  shownullItem="true" class="nui-combobox" id="activitydefname1"
						 textField="name" valueField="id"  data="activityDefines" allowInput="true"/>
					</div>
					<div field="useorg" displayField="useorgname" width="100px" align="center"  headerAlign="center" allowSort="true">作用部门
						<input property="editor" name = "useorg" class="nui-treeselect" 
                		url="com.primeton.eos.ame_common.ame_common.getAllRunOrgs.biz.ext" required="true"
                		textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs" allowInput="false"/>
					</div>
					<div field="roelpart" displayField="rolename" width="200px" align="center"  headerAlign="center" allowSort="false">角色参与者
						<input property="editor" class="nui-textboxlist" name="roleid" allowInput="true" 
						textField="rolename" valueField="roleid" searchField="name" style="width:160px;" 
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryRoleidByName.biz.ext"/>
					</div>
					<div field="emppart" displayField="empname" width="100px" align="center"  headerAlign="center" allowSort="false">人员参与者
						<input property="editor" name = "userid" class="nui-textboxlist"  searchField="name" style="width:160px;"
								url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" 
								textField="EMPNAME" valueField="USERID" />
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>





	<script type="text/javascript">
    	nui.parse();
	var grid = nui.get('datagrid1');
	var form  = new nui.Form("#form1")
	var activityDefines = [];
	search();
	//流程名称与之关联的活动名称
	function onActivitydefname(e){
		var json =  nui.encode({processDefName:e});
		nui.ajax({
                url: "com.primeton.eos.ame_common.processPrompt.queryActivityDefName.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
                success: function (o) {
                	o.wfActivityDefines.splice(0,2);
                	nui.get("activitydefname").setData(o.wfActivityDefines);
                }
	         });
	}
	
	
	function search(){
		var data = form.getData();
		grid.load(data,function(o){
			console.log(o);
		});
		grid.sortBy("processdefname","desc");
	}
	//重置
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
	
	//确定保存或更新
	function onOk() {
	   nui.get("okbutton").disable(); 
	   saveData();
	}
	
	function saveData(){
		var authList = grid.getChanges();
		console.log(authList);
		if(authList.length == 0){
		nui.get("okbutton").enable();
			return ;
		}
		
		for(let i=0 ;i <authList.length ;i++){
			var c=authList[i];
			console.log(c);
			//if(authList[i]._state == added){
				if(authList[i].processdefnames == null || authList[i].activitydefname ==null || authList[i].useorgname == null ||(authList[i].rolename == null && authList[i].empname == null)){
					nui.alert("保存失败。");
					search();
					nui.get("okbutton").enable();
					return;
				}
			//}
		}
		var json = nui.encode({authList:authList});
		nui.ajax({
			url:"com.primeton.eos.ame_common.ame_common.saveAmeFlowActParti.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				nui.get("okbutton").enable(); 
				if(text.returnCode == -1){
					nui.alert("保存失败。");	
					search();		
				}else{
					nui.alert("保存成功。");
					search();
				}
				
			},
			error: function (jqXHR, textStatus, errorThrown) {
	        }
		});
	}
	
	
	function addRow(){
		var newRow = {name:"NEW ROW"};
		grid.addRow(newRow);
	}
			
	 function removeRow(){
		var authList = grid.getSelecteds();
		var json  = {authList:authList[0]};
		if (authList.length > 0) {
		   if(confirm("确定删除该条记录吗？")){
		        nui.ajax({
		        	url:"com.primeton.eos.ame_auth.ame_auth.deleteAppAuthConfig.biz.ext",
					data:json,
					type:'POST',
					success:function(text){
						if(text.returnCode){
							//nui.alert("删除成功，请点保存。");
							grid.removeRows(authList, false);
						}else{
							nui.alert("删除失败。");
						}
						
					},
					error: function (jqXHR, textStatus, errorThrown) {
				    }
		        })
		    }else{
		        return false;
		    }
		}else{
			alert("请选择一条记录！"); 
		}
	}
 

	//机构等级
	function orgdegree(e){
		return nui.getDictText('ABF_ORGDEGREE',e.value);
	}
	//业务字典
	function getIsleaf(e){
		return nui.getDictText('ABF_ROLETYPE',e.value);
	}
	
	function isedit(e){
		/* var record = e.record;
		if(record._state=="added"){
			grid.beginEditRow(record);
		}else{
			grid.cancelEditRow(record);
		console.log(record)
		} */
		var record = e.record;
		if(record._state == "added"){
			if(e.field=="activitydefid"){
				if(record.processdefname){
					var json =  nui.encode({processDefName:record.processdefname});
					nui.ajax({
			            url: "com.primeton.eos.ame_common.processPrompt.queryActivityDefName.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
			            success: function (o) {
			           		o.wfActivityDefines.splice(0,2);
			           		activityDefines = o.wfActivityDefines;
			           		nui.get("activitydefname1").setData(activityDefines);
			           		console.log(activityDefines)
			            }
		         	});
				}else{
					activityDefines = [];
	           		nui.get("activitydefname1").setData(activityDefines);
				}
			}
		}else{
			if(e.field == "processdefname" || e.field =="activitydefid"){
				e.cancel=true;
			}	
		}		
	}
	function getDefineDetail(e){
		if(e.record.processdefnames == null){
			return null;
		}else{
			return '<a class="dgBtn" href="javascript:showDetail('+e.record.processdefid+')">'+e.record.processdefnames+'</a>';
		}
	}
	function showDetail(processdefid) {
    		nui.open({
       			 url: "<%=request.getContextPath() %>/ame_common/ameCommon/processDetail.jsp",
       			 title: "流程信息",
       			 type:'POST',
                 cache: false,
       			 width: 800,
       			 height: 500,
       			 onload: function () {
         			var iframe = this.getIFrameEl();
                   	iframe.contentWindow.setData(processdefid);
         		 }
        	});
    	}
    </script>
</body>
</html>