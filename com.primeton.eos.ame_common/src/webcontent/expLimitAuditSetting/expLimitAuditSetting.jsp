<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-06-05 15:59:09
  - Description:
-->
<head>
	<title>费用额度审核权限设置</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width: 98%" class="body-font">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <legend>费用额度审核权限设置</legend>
	        <div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="queryform">
		        <table id="table1" style="width: 100%;height:32px;font-size:12px;" align="center" >
		        	<tr>
		        		<td width="60px" align="right">作用部门:</td>
		        		<td align="left">
		        			<input name="criteria._expr[3]._value" id="orgname" class="nui-combobox" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" id = "bxbm"
							filterType="like" textField="orgname" valueField="orgid" dataField="orgs" valueFromSelect="true" allowInput="true" style="width:150px;"  shownullItem="true"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="=" id="tempCond"/>
		        		<td  width="80px" align="right">审批类型:</td>
						<td align="left">
							<input id="isTimeOut" class="nui-dictcombobox" name="criteria._expr[0]._value" showNullItem="true"  dictTypeId="AME_APPROVALCHAIN" multiSelect="true" >
							<input class="nui-hidden" name="criteria._expr[0]._property" value="exptype">
							<input class="nui-hidden" name="criteria._expr[0]._op" value="in">
						</td>
						<td width="60px" align="right">年份:</td>
		        		<td align="left">
			        		<input class="nui-textbox" name="criteria._expr[1]._value" id="year">
							<input class="nui-hidden" name="criteria._expr[1]._property" value="finyear">
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like">
						<td width="80px" align="right">审批角色:</td>
		        		<td align="left">
			        		<input class="nui-textbox" name="criteria._expr[2]._value">
							<input class="nui-hidden" name="criteria._expr[2]._property" value="role">
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like">
		        		</td>
						<!-- <td  width="100px" align="right">状态(是否有效):</td>
						<td align="left">
							<input id="isValid" class="nui-dictcombobox" name="criteria._expr[3]._value" showNullItem="true"  dictTypeId="MIS_YN" >
							<input class="nui-hidden" name="criteria._expr[3]._property" value="status">
							<input class="nui-hidden" name="criteria._expr[3]._op" value="=">
						</td> -->
		        		<td width="80px" align="right">审批层级:</td>
		        		<td align="left">
			        		<input class="nui-textbox" name="criteria._expr[4]._value">
							<input class="nui-hidden" name="criteria._expr[4]._property" value="splevel">
							<input class="nui-hidden" name="criteria._expr[4]._op" value="=">
		        		</td>
		        	</tr>
		        	<tr>
						<td width="80px" align="right">审批环节:</td>
		        		<td align="left">
		        			<input class="nui-dictcombobox" name="criteria._expr[5]._value" showNullItem="true"  dictTypeId="AME_SPOBJECT" multiSelect="true" >
			        		<input class="nui-hidden" name="criteria._expr[5]._property" value="spobject">
							<input class="nui-hidden" name="criteria._expr[5]._op" value="in">
						<td align="center" colspan="13">
							<a class="nui-button grayBtn" iconCls="icon-search" onclick="search">查询</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="nui-button grayBtn" iconCls="icon-reload" onclick="reset">重置</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="nui-button" onclick="exportExpLimitAuditSetting" iconCls="icon-download"  id="exportButton">导出</a>
	                        <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
								<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
								<input type="hidden" name="downloadFile" filter="false"/>
								<input type="hidden" name="fileName" filter="false"/>
							</form>	
						</td>	
					</tr>
		        </table>
			</div>
			<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		                        <a class="nui-button" id="editBtn" iconCls="icon-edit" onclick="edit()">编辑</a>
		                        <a class="nui-button" id="removeBtn" iconCls="icon-remove" onclick="remove()">删除</a>
		                    </td>
		                </tr>
		             </table>           
		        </div>
		    </div>
		    <div id="searchOnlineLogId" class="nui-datagrid bpsDatagrid"
				style="margin-top:0px;width: 100%;" dataField="expRbtypeLimit"
				url="com.primeton.eos.ame_common.expLimitAuditSetting.queryExpLimitAuditSetting.biz.ext"
				allowAlternating="true" pageSize="15" showPager="true" multiSelect="true">
				<div property="columns">
					<div type="checkcolumn" ></div>
					<div field="orgname" headerAlign="center" align="left" width="60px">作用部门</div>
					<div field="exptype" headerAlign="center" align="left" allowSort="true"  width="70px" renderer="onExpTypeRenderer">审批类型</div>
					<div field="finyear" headerAlign="center" align="center" allowSort="true" width="40px">年份</div>
					<div field="limitstartmon" headerAlign="center" align="right" allowSort="true" width="50px">主管起始审批金额</div>
					<div field="limitendmon" headerAlign="center" align="right" allowSort="true" width=50px">分管起始审批金额</div>
					<div field="spobject" headerAlign="center" align="center" allowSort="true" renderer="dictSpObject" width="50px">审批环节</div>
					<div field="role" displayfiled = "rolename" headerAlign="center" align="center" allowSort="true" width="40px">审批角色</div>
					<div field="sprole" headerAlign="center" align="center" allowSort="true" width="50px">审批描述</div>
					<div field="splevel" headerAlign="center" align="center" allowSort="true" width="30px">审批层级</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var date = new Date().getFullYear();
		var grid=nui.get("searchOnlineLogId");
		nui.get("year").setValue(date);
		grid.sortBy("exptype", "asc");
		search();
		

		function search(){
	        var form = new nui.Form("#queryform");
	        var data = form.getData();
	        grid.load(data);
	        grid.sortBy("exptype", "asc");
	    }
	    
	    function reset(){
			var form = new nui.Form("#queryform");
			form.reset();
			grid.load();
			grid.sortBy("exptype", "asc");
		}
		
		function add(){
			nui.open({
				url: "<%=request.getContextPath() %>/ame_common/expLimitAuditSetting/addExpLimitAuditSetting.jsp",title: "新增费用额度审核权限", width: 600, height: 360,	                
				onload: function () {
	                var iframe = this.getIFrameEl();
	                var data = {pageType:"add"};
	                iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	                grid.reload();
	            }
	        });
		}
		
		function edit() {
            var row = grid.getSelecteds();
            if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    		var row=row[0];
            if (row) {
                nui.open({
                    url: "<%=request.getContextPath() %>/ame_common/expLimitAuditSetting/updateExpLimitAuditSetting.jsp",
                    title: "编辑费用额度审核权限", 
                    width: 600, height: 360,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = {pageType:"edit",record:{explimitaudit:row}};
                        //直接从页面获取，不用去后台获取
                        iframe.contentWindow.SetData(data);
                        },
                        ondestroy: function (action) {
                            grid.reload();
                        }
                });
             } else {
                nui.alert("请选中一条记录","提示");
             }
             }
        }
		
		function remove() {
	            
	        var rows = grid.getSelecteds();
	        var data = {explimitaudit:rows};
	        var json = nui.encode(data);
	        if (rows.length > 0) {
	            if (confirm("确定删除选中记录？")) {
	                grid.loading("操作中，请稍后......");
	                nui.ajax({
	                    url: "com.primeton.eos.ame_common.expLimitAuditSetting.deleteExpLimitAuditSetting.biz.ext",
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
	    
	    function exportExpLimitAuditSetting(){
	    	var form = new nui.Form("#queryform");
	    	nui.confirm("确认导出费用额度审核权限记录？", "确定？",
		        function (action) {
		        	if(action=='ok'){
		        		var json = form.getData();	
						grid.loading("操作中，请稍后......");
						nui.ajax({
			    			url: "com.primeton.eos.ame_common.expLimitAuditSetting.exportExpLimitAuditSetting.biz.ext",
					        type: "post",
					        data: json,
					        cache: false,
					        contentType: 'text/json',
					        success: function (o) {
					     		grid.unmask();
					     		var filePath = o.downloadFile;
					        	var fileName = "费用额度审核权限";
					        	var myDate = new Date();
					        	var year = myDate.getFullYear();
					        	var month = myDate.getMonth()+1;
					        	var day = myDate.getDate();
					        	var hours = myDate.getHours();
					        	var minutes = myDate.getMinutes();
					        	var seconds = myDate.getSeconds();
					        	var curDateTime = year;
					        	if(month>9){
									curDateTime = curDateTime + "" + month;
								}else{
									curDateTime = curDateTime + "0" + month;
									}
					        	if(day>9){
									curDateTime = curDateTime + day;
								}else{
									curDateTime = curDateTime + "0" + day;
									}
								if(hours>9){
									curDateTime = curDateTime + hours;
								}else{
									curDateTime = curDateTime + "0" + hours;
									}
								if(minutes>9){
									curDateTime = curDateTime + minutes;
								}else{
									curDateTime = curDateTime + "0" + minutes;
									}
								if(seconds>9){
									curDateTime = curDateTime + seconds;
								}else{
									curDateTime = curDateTime + "0" + seconds;
								}
								fileName = fileName + "_" + curDateTime + ".xls";
								var frm = document.getElementById("viewlist1");
					        	frm.elements["downloadFile"].value = filePath;
					        	frm.elements["fileName"].value = fileName;
							    frm.submit();
					        },
					        error: function () {
					     		grid.unmask();
					        	alert("error");
					        }
						});
		        		
		        	}
		        });
	    }
		
		function onExpTypeRenderer(e){
	        return nui.getDictText('AME_APPROVALCHAIN',e.value);//设置业务字典值
	    }
	    
	    function dictSpObject(e){
	        return nui.getDictText('AME_SPOBJECT',e.value);//设置业务字典值
	    }
	    
	    function onStatusRenderer(e){
	        return nui.getDictText('MIS_YN',e.value);//设置业务字典值
	    }
	</script>	
</body>
</html>