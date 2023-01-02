<%@page pageEncoding="UTF-8"%>
	
<!-- 
  - Author(s): Xmiracle
  - Date: 2016-11-03 09:02:30
  - Description:
  		lookup嵌入页面--多选
  - 使用方法：
  		1.将如下一段话嵌入到需要使用人员lookup的input下面
  			//<%//@include file="/xiancommon/embed/embed_userLookup_multiple.jsp" %>
  		2.设置class为nui-lookup的input的id为    “userLookup_multiple”。
  		3.记得设置class为nui-lookup的input的popup和grid值
  - PS：
  		1.lookup会自动将class为"nui-lookup"的input的value和text设置上,但是注意textField和valueField要对应查出来的字段
  		2.想要获得lookup选中行的其他值，需要在自己的页面定义ServiceUserSetData()方法。
  		3.lookup的多选，取决于input！！
-->

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

	<script type="text/javascript">
    	nui.parse();
    	var userform = new nui.Form("#userPanel_lookup_multiple");
    	var userDatagrid_lookup_multiple = nui.get("userDatagrid_lookup_multiple");
		var data = userform.getData();
		userDatagrid_lookup_multiple.load();
		userDatagrid_lookup_multiple.sortBy("empname", "asc");
        
        function userMultipleCloseLookup(e) {
            var lookup = nui.get("userLookup_multiple");
            lookup.hidePopup();
            
        }
        function search() {
			var data = userform.getData();
			userDatagrid_lookup_multiple.load(data);
		}
        //多选lookup返回选中行，用户可以根据需要设置相关自定义值
        function onServiceUserMultipleRowClick(){
        	var rows = userDatagrid_lookup_multiple.getSelecteds();
        	userSetDataMultiple(rows);
        }
        
        //当行选择改变时
        function onServiceUserMultipleSelectionChanged(){
        }
    </script>
