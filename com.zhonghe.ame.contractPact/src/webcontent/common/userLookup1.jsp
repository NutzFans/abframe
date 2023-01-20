<%@page pageEncoding="UTF-8"%>
	<div id="userPanel_lookup_multiple" class="nui-panel" title="header" iconCls="icon-add" style="width:450px;height:250px;" 
         showToolbar="true" showCloseButton="true" showHeader="false" bodyStyle="padding:0" borderStyle="border:0" >
        <div property="toolbar" style="padding:5px;padding-left:8px;text-align:center;" >   
            <input class="nui-hidden" name="sortField" value="empid"/>
		<input class="nui-hidden" name="sortOrder" value="asc"/>
            <label >员工姓名：</label>
          	<input class="nui-textbox" name="criteria._expr[0].empname" onenter="onKeyEnter" style = "width :100px;"/>
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
<!--	        <label >人员状态：</label>
          	<input class="nui-dictcombobox" name="criteria._expr[1].empstatus" dictTypeId="ABF_EMPSTATUS" shownullItem="true" value="on" onenter="onKeyEnter" style = "width :60px;"/>
	        <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>-->
	        <label >部门名称：</label>
	        <input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
            <input class="nui-hidden" name="criteria._expr[1]._op" value="=" id="jjj"/>
            <input class="nui-hidden" name="criteria._expr[1]._ref" value="" id="kkk"/>
            <input class="nui-hidden" name="criteria._ref[0]._id" value="5"/>
            <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
            <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
            <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgname"/>
            <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
	        <input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="orgname" onvaluechanged="changeusername(e)" style="width:100px;"/>
	        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
          <a class="nui-button" style="width:50px;" onclick="search()">查询</a>
            <div style="float:right;padding-bottom:2px;">
                <a class="nui-button" onclick="userMultipleCloseLookup">关闭</a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div id="userDatagrid_lookup_multiple" class="nui-datagrid" style="width:100%;height:100%;"
            idField="empid" allowResize="true" dataField="omEmployees" multiSelect="true"
            url="com.primeton.eos.machine.machine.queryEmployee.biz.ext"
            onrowclick="onServiceUserMultipleRowClick" onrowdblclick="userMultipleCloseLookup">
            <div property="columns">	    
        		<div type="checkcolumn"></div>
                <div field="userid" width="80" headerAlign="center" allowSort="true">员工帐号</div>                                            
                <div field="empname" width="80" headerAlign="center" allowSort="true">员工姓名</div>
        		<div field="degree" width="0">员工级别</div> 
               <!--  <div field="mobileno" width="100" headerAlign="center" allowSort="true">手机</div>   -->                                         
                <div field="orgname" width="100" headerAlign="center" allowSort="true">部门名称</div>
                <div field="omOrganization.orgseq" width="0">部门seq</div> 
                <div field="orgid" width="0">部门id</div>                                             
            </div>
        </div>
    </div>
	<div id="userPanel_lookup_multiple1" class="nui-panel" title="header" iconCls="icon-add" style="width:450px;height:250px;" 
         showToolbar="true" showCloseButton="true" showHeader="false" bodyStyle="padding:0" borderStyle="border:0" >
        <div property="toolbar" style="padding:5px;padding-left:8px;text-align:center;" >   
            <input class="nui-hidden" name="sortField" value="empid"/>
		<input class="nui-hidden" name="sortOrder" value="asc"/>
            <label >员工姓名：</label>
          	<input class="nui-textbox" name="criteria._expr[0].empname" onenter="onKeyEnter" style = "width :100px;"/>
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
<!--	        <label >人员状态：</label>
          	<input class="nui-dictcombobox" name="criteria._expr[1].empstatus" dictTypeId="ABF_EMPSTATUS" shownullItem="true" value="on" onenter="onKeyEnter" style = "width :60px;"/>
	        <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>-->
	        <label >部门名称：</label>
	        <input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
            <input class="nui-hidden" name="criteria._expr[1]._op" value="=" id="jjj"/>
            <input class="nui-hidden" name="criteria._expr[1]._ref" value="" id="kkk"/>
            <input class="nui-hidden" name="criteria._ref[0]._id" value="5"/>
            <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
            <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
            <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgname"/>
            <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
	        <input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="orgname" onvaluechanged="changeusername(e)" style="width:100px;"/>
	        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
          <a class="nui-button" style="width:50px;" onclick="search1()">查询</a>
            <div style="float:right;padding-bottom:2px;">
                <a class="nui-button" onclick="userMultipleCloseLookup1">关闭</a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div id="userDatagrid_lookup_multiple1" class="nui-datagrid" style="width:100%;height:100%;"
            idField="empid" allowResize="true" dataField="omEmployees" multiSelect="true"
            url="com.primeton.eos.machine.machine.queryEmployee.biz.ext"
            onrowclick="onServiceUserMultipleRowClick1" onrowdblclick="userMultipleCloseLookup1">
            <div property="columns">	    
        		<div type="checkcolumn"></div>
                <div field="userid" width="80" headerAlign="center" allowSort="true">员工帐号</div>                                            
                <div field="empname" width="80" headerAlign="center" allowSort="true">员工姓名</div>
        		<div field="degree" width="0">员工级别</div> 
               <!--  <div field="mobileno" width="100" headerAlign="center" allowSort="true">手机</div>   -->                                         
                <div field="orgname" width="100" headerAlign="center" allowSort="true">部门名称</div>
                <div field="omOrganization.orgseq" width="0">部门seq</div> 
                <div field="orgid" width="0">部门id</div>                                             
            </div>
        </div>
    </div>

	<script type="text/javascript">
    	nui.parse();
    	
    	var userform = new nui.Form("#userPanel_lookup_multiple");
    	var userDatagrid_lookup_multiple = nui.get("userDatagrid_lookup_multiple");
		var data = userform.getData();
		
		var userform1 = new nui.Form("#userPanel_lookup_multiple1");
    	var userDatagrid_lookup_multiple1 = nui.get("userDatagrid_lookup_multiple1");
		var data1 = userform1.getData();
		
		userDatagrid_lookup_multiple.load();
		userDatagrid_lookup_multiple.sortBy("empname", "asc");
        
        userDatagrid_lookup_multiple1.load();
		userDatagrid_lookup_multiple1.sortBy("empname", "asc");
        
        function userMultipleCloseLookup(e) {
            var lookup = nui.get("userLookup_multiple");
            lookup.hidePopup();
            
        }
        
         function userMultipleCloseLookup1(e) {
            var lookup1 = nui.get("userLookup_multiple1");
            lookup1.hidePopup();
            
        }
        
        function search() {
			var data = userform.getData();
			userDatagrid_lookup_multiple.load(data);
		}
		
		function search1() {
			var data1 = userform1.getData();
			console.log(data1)
			userDatagrid_lookup_multiple1.load(data1);
		}
        //多选lookup返回选中行，用户可以根据需要设置相关自定义值
        function onServiceUserMultipleRowClick(){
        	var rows = userDatagrid_lookup_multiple.getSelecteds();
        	userSetDataMultiple(rows);
        }
        
         function onServiceUserMultipleRowClick1(){
        	var rows1 = userDatagrid_lookup_multiple1.getSelecteds();
        	userSetDataMultiple(rows1);
        }
        
        
        //当行选择改变时
        function onServiceUserMultipleSelectionChanged(){
        }
    	
        function onServiceUserMultipleSelectionChanged(){
        }
    </script>
