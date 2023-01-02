<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-05-31 14:20:45
  - Description:
-->
<head>
	<title>外包人员查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<!-- 
		查询条件：姓名(模糊)，供应商，项目，事业部，受益销售，服务时间，价格范围
		查询结果：外包人员列表
		提供“查看外包人员详细信息”的按钮
	 -->
	<div class="nui-fix">
		<div class="nui-panel" title="外包人员管理" style="width: auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td align="right"><span>姓名：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[0]._value" class="nui-textbox" style="width:100px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="outpername"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							</td>
							<td align="right"><span>供应商：</span></td>
			            	<td align="left">
							    <input class="nui-hidden" name="criteria._expr[1]._property" value="ryzjglcustid"/>
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
						        <input class="nui-hidden" name="criteria._expr[1]._ref" value="2"/>
						        <input class="nui-hidden" name="criteria._ref[1]._id" value="2"/>
						        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="custid"/>
						        <input class="nui-hidden" name="criteria._ref[1]._entity" value="com.primeton.eos.ame_pur.ame.PurSupplier"/>
						        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="custname"/>
			            		<input class="nui-textbox" name="criteria._ref[1]._expr[0]._value" style="width:100px;" onenter="onKeyEnter"/>
						        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all"/>
							</td> 
							<td align="right"><span>创建日期范围：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[8]._min" class="nui-datepicker" style="width:100px;"/>
							    -
							    <input name="criteria._expr[8]._max" class="nui-datepicker" style="width:100px;"/>
							    <input class="nui-hidden" name="criteria._expr[8]._property" value="createdate"/>
							    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
							    <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
							</td>
							<td align="right"><span>事业部：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[3]._value" class="nui-dictcombobox" dictTypeId="CONT_ORG" style="width:120px;" shownullItem="true"/>
							    <input class="nui-hidden" name="criteria._expr[3]._property" value="syb"/>
							    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
							</td> 
						</tr>
						<tr>
							<td align="right"><span>受益销售：</span></td>
			            	<td align="left">
							    <input class="nui-hidden" name="criteria._expr[4]._property" value="salesid"/>
							    <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
						        <input class="nui-hidden" name="criteria._expr[4]._ref" value="3"/>
						        <input class="nui-hidden" name="criteria._ref[2]._id" value="3"/>
						        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="orgid"/>
						        <input class="nui-hidden" name="criteria._ref[2]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
						        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="orgname"/>
			            		<input class="nui-textbox" name="criteria._ref[2]._expr[0]._value" style="width:100px;" onenter="onKeyEnter"/>
						        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._likeRule" value="all"/>
							</td> 
							<td align="right"><span>服务时间：</span></td>
			            	<td align="left">
							    <!-- <input name="criteria._expr[5]._value" class="nui-datepicker" style="width:100px;"/>
							    <input class="nui-hidden" name="criteria._expr[5]._property" value="startdate"/>
							    <input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
							    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/> -->
							    
							    <input name="datebetween" id="datebetween" class="nui-datepicker" style="width:100px;"/>
							    
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[0]._property" value="actenddate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[0]._op" value="notnull"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[1]._property" value="startdate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[1]._op" value="<="/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[1]._value" id="startdate2"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[2]._property" value="actenddate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[2]._op" value=">="/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[2]._value" id="actenddate"/>
							    
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[0]._property" value="actenddate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[0]._op" value="null"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[1]._property" value="startdate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[1]._op" value="<="/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[1]._value" id="startdate1"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[2]._property" value="expenddate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[2]._op" value=">="/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[2]._value" id="expenddate"/>
							    
							</td> 
							<td align="right"><span>价格范围：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[6]._min" class="nui-textbox" style="width:100px;" onenter="onKeyEnter"/>-<input name="criteria._expr[6]._max" class="nui-textbox" style="width:100px;" onenter="onKeyEnter" />
							    <input class="nui-hidden" name="criteria._expr[6]._property" value="price"/>
							    <input class="nui-hidden" name="criteria._expr[6]._op" value="between"/>
							</td> 
							<td align="right"><span>人员状态：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="AME_OUTPERSTATUS" style="width:120px;" shownullItem="true"/>
							    <input class="nui-hidden" name="criteria._expr[7]._property" value="currentstatus"/>
							</td> 
						</tr>
						<tr>
							<td align="right"><span>订单签订时项目：</span></td>
			            	<td align="left">
						        <input class="nui-hidden" name="criteria._expr[2]._property" value="projectno"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
						        <input class="nui-hidden" name="criteria._expr[2]._ref" value="1"/>
						        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
						        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="projectno"/>
						        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.rdmgr.data.rd.RdProject"/>
						        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="projectName"/>
			            		<input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" style="width:100px;" onenter="onKeyEnter"/>
						        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
							</td> 
						</tr>
					    <tr>
			    			<td align="center" colspan="15">
		                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
		                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
		                        <a class="nui-button" onclick="exportOutpersons" iconCls="icon-download" style="width:135px;" id="exportButton">导出外包人员资料</a>	
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
		                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="edit()">编辑</a>
		                        <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="remove()">删除</a>
		                        <!-- 
		                        <a class="nui-button" id="lookBtn" iconCls="icon-search" onclick="look()">查看</a>
		                         -->
		                    </td>
		                </tr>
		             </table>           
		        </div>
		        <div id="datagrid1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="purOutpersons" 
			    	url="com.primeton.eos.ame_pur.outperson.queryPurOutperson.biz.ext" 
			    	idField="appid" multiSelect="true" allowAlternating="true" onselectionchanged="selectionChanged" >
					<div property="columns">
						<div type="checkcolumn" width="30"></div>	
						<div field="outperno" align="center" headerAlign="center" allowSort="true" visible="false">编号</div>
						<div field="outpername" width="90" align="center" headerAlign="center" allowSort="true" renderer="getDetail">姓名</div>	
						<div field="gender" width="40" align="center" headerAlign="center" allowSort="true" renderer="dictGetGender">性别</div>
						<div field="outpercartno" width="140" headerAlign="center" allowSort="true">身份证号码</div>	
						<div field="degree" width="50" align="center" headerAlign="center" allowSort="true" renderer="dictGetDegree">学历</div>
						<div field="gradudate" width="80" align="center" headerAlign="center" allowSort="true">毕业时间</div>
						<div field="ryzjglcustid" align="center" headerAlign="center" allowSort="true" visible="false">供应商id</div>
						<div field="ryzjglcustname" width="200" headerAlign="center" allowSort="true">所属供应商</div>
						<div field="price" width="100" align="right" dataType="currency" headerAlign="center" allowSort="true">最近价格(元)</div>
						<div field="userid" align="center" headerAlign="center" allowSort="true" visible="false">服务客户id</div>
						<div field="miscustname" width="200" headerAlign="center" allowSort="false">服务客户</div>
						<div field="projectno" align="center" headerAlign="center" allowSort="true" visible="false">服务项目</div>
						<div field="projectname" width="200" headerAlign="center" allowSort="false">服务项目</div>
						<div field="currentstatus" width="60" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">当前状态</div>
						<div field="startdate" width="80" align="center" headerAlign="center" allowSort="true">服务开始日期</div>
						<div field="expenddate" width="80" align="center" headerAlign="center" allowSort="true">预计结束日期</div>
						<div field="actenddate" width="80" align="center" headerAlign="center" allowSort="true">实际结束日期</div>
						<div field="linktel" width="100" headerAlign="center" allowSort="true">联系电话</div>
						<div field="linkemail" width="180" headerAlign="center" allowSort="true">联系邮箱</div>
						<div field="createdate" align="center" headerAlign="center" allowSort="true" visible="true">创建日期</div>
						<div field="memo" align="center" headerAlign="center" allowSort="true" visible="false">备注</div>
					</div>
				</div>
			</div>
		</div>
    </div>
    <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
	<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
    		grid.load();
			grid.sortBy("outperno","desc");
		}
    	function search() {
    		if(nui.getbyName("criteria._ref[1]._expr[0]._value").getValue() == ""){
    			nui.getbyName("criteria._expr[1]._op").setValue("=");
    			nui.getbyName("criteria._expr[1]._ref").setValue();
    		}else{
    			nui.getbyName("criteria._expr[1]._op").setValue("in");
    			nui.getbyName("criteria._expr[1]._ref").setValue("2");
    		}
    		if(nui.getbyName("criteria._ref[0]._expr[0]._value").getValue() == ""){
    			nui.getbyName("criteria._expr[2]._op").setValue("=");
    			nui.getbyName("criteria._expr[2]._ref").setValue();
    		}else{
    			nui.getbyName("criteria._expr[2]._op").setValue("in");
    			nui.getbyName("criteria._expr[2]._ref").setValue("1");
    		}
    		if(nui.getbyName("criteria._ref[2]._expr[0]._value").getValue() == ""){
    			nui.getbyName("criteria._expr[4]._op").setValue("=");
    			nui.getbyName("criteria._expr[4]._ref").setValue();
    		}else{
    			nui.getbyName("criteria._expr[4]._op").setValue("in");
    			nui.getbyName("criteria._expr[4]._ref").setValue("3");
    		}
    		nui.get("startdate1").setValue(nui.get("datebetween").getValue());
    		nui.get("startdate2").setValue(nui.get("datebetween").getValue());
    		nui.get("expenddate").setValue(nui.get("datebetween").getValue());
    		nui.get("actenddate").setValue(nui.get("datebetween").getValue());
			var data = form.getData(); //获取表单JS对象数据
			//grid.sortBy("outperno","desc");
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			form.reset();
			grid.load();
		}
		
		//enter键触发查询
        function onKeyEnter(e) {
            search();
        }
        
        //设置业务字典值-学历
		function dictGetDegree(e) {
			return nui.getDictText('DEGREE',e.value);
		}
		
		//设置业务字典值-性别
		function dictGetGender(e) {
			return nui.getDictText('ABF_GENDER',e.value);
		}
		
		//设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//设置业务字典值-人员状态
		function dictGetStatus(e){
			return nui.getDictText('AME_OUTPERSTATUS',e.value);
		}
		
		/**
		 * 新增外包人员
		 */
		function add() {   
            nui.open({
                url: "<%=request.getContextPath() %>/ame_pur/outperson/PurOutpersonInput.jsp",
                title: "新增外包人员", 
                width: 1000, 
                height: 450,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                	if(action=="ok"){
                		grid.reload();
                	}
                }
            });
        }
        
        //删除外包人员信息
        function remove() {
		    var rows = grid.getSelecteds();   //获取所有选中的行对象
		    var data = {purOutpersons:rows};
		    var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
	            //选择列时,如果人员与订单由关系,则不删除!
	            var datadel = rows;
	            var purOutpersons = [];
	            for(var i = 0;i < datadel.length;i ++){
	            	purOutpersons[i] = {"outperno": datadel[i].outperno};
	            }
	            var jsondel = nui.encode({purOutpersons: purOutpersons});
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_pur.outperson.queryPurOutpersonToReq.biz.ext",
	                data: jsondel,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                	o = nui.clone(o);
	                	if(o.result == "1"){//选中的外包人员有与订单有关系的数据,不允许删除,禁用按钮
	                		nui.alert("选中的外包人员跟订单有关联,不允许删除!");
	                		return;
	                	}else{
	                		nui.confirm("确定删除选中记录？", "确定？",
				            function (action) {            
				                if (action == "ok") {
				                    nui.ajax({
						                url: "com.primeton.eos.ame_pur.outperson.deletepurOutpersons.biz.ext",
						                type: "POST",
						                data: json, 
						                cache: false,
						                contentType: 'text/json',
						                success: function (text) {
						                	if(text.exception == null){
						                		nui.alert("删除成功！");
							                	grid.reload();
						                	}else{
						                		nui.alert("删除失败！");
						                	}
						                },
						                error: function () {
					                    }
					               });
				                } else {
				                    return;
				                }
				            }
				        );
	                	}
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                }
	        	});
				
            } else {
                alert("请至少选中一条记录");
            }
        }
        
        /**
         * 编辑外包人员
         */
        function edit() {
    		var row = grid.getSelected();
    		if (row) {
	      		nui.open({
		            url: "<%=request.getContextPath() %>/ame_pur/outperson/PurOutpersonInput.jsp",
		            title: "编辑外包人员",
		            width: 1000,
		            height: 450,
		            onload: function () {
						var iframe = this.getIFrameEl();
						var data = {action: "edit", outperno: row.outperno };
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
         * 查看外包人员
         */
        function look(){
        	var row = grid.getSelected();
    		if (row) {
	      		nui.open({
		            url: "<%=request.getContextPath() %>/ame_pur/outperson/PurOutpersonLook.jsp",
		            title: "查看外包人员",
		            width: 850,
		            height: 550,
		            onload: function () {
						var iframe = this.getIFrameEl();
		              	var data = {action: "look", outperno: row.outperno };
		              	iframe.contentWindow.SetData(data);
					},
					ondestroy: function (action) {
		            }
            	});
            } else {
				nui.alert("请选中一条记录","提示");
            }
        }
        
        //选择供应商
        function selectSupplier(){
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/ame_pur/PurSupplier/SelectSupplier.jsp",
                title: "选择供应商",
                width: 650,
                height: 380,
                ondestroy: function (action) {
                    //if (action == "close") return false;
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.custid);
                            btnEdit.setText(data.custname);
                        }
                    }

                }
            });
        }
        
        //点击姓名查看详情
        function getDetail(e){
	        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/ame_pur/outperson/PurOutpersonLook.jsp?id=" + selectRow.outperno;
			window.open(executeUrl, "外包人员详细信息", "fullscreen=1");
	    }
	    
	    //当选择列时
        function selectionChanged(){
            var rows = grid.getSelecteds();
            <%--
            //选择列时,如果人员与订单由关系,则不删除!
            var data = rows;
            var purOutpersons = [];
            for(var i = 0;i < data.length;i ++){
            	purOutpersons[i] = {"outperno": data[i].outperno};
            }
            var json = nui.encode({purOutpersons: purOutpersons});
        	nui.ajax({
        		url: "com.primeton.eos.ame_pur.outperson.queryPurOutpersonToReq.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	nui.parse();
                	if(o.result == "1"){//选中的外包人员有与订单有关系的数据,不允许删除,禁用按钮
                		nui.get("deltbtn").disable();
                	}else{
                		nui.get("deltbtn").enable();
                	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
        	});--%>
            if(rows.length>1){
                nui.get("updateBtn").disable();
            }else{
                nui.get("updateBtn").enable();
            }
        }
        
        //导出外包人员
        function exportOutpersons(){
        	nui.confirm("是否确认导出外包人员资料？", "确定？",
            function (action) {            
                if (action == "ok") {
		        	if(nui.getbyName("criteria._ref[1]._expr[0]._value").getValue() == ""){
		    			nui.getbyName("criteria._expr[1]._op").setValue("=");
		    			nui.getbyName("criteria._expr[1]._ref").setValue();
		    		}else{
		    			nui.getbyName("criteria._expr[1]._op").setValue("in");
		    			nui.getbyName("criteria._expr[1]._ref").setValue("2");
		    		}
		    		if(nui.getbyName("criteria._ref[0]._expr[0]._value").getValue() == ""){
		    			nui.getbyName("criteria._expr[2]._op").setValue("=");
		    			nui.getbyName("criteria._expr[2]._ref").setValue();
		    		}else{
		    			nui.getbyName("criteria._expr[2]._op").setValue("in");
		    			nui.getbyName("criteria._expr[2]._ref").setValue("1");
		    		}
		    		if(nui.getbyName("criteria._ref[2]._expr[0]._value").getValue() == ""){
		    			nui.getbyName("criteria._expr[4]._op").setValue("=");
		    			nui.getbyName("criteria._expr[4]._ref").setValue();
		    		}else{
		    			nui.getbyName("criteria._expr[4]._op").setValue("in");
		    			nui.getbyName("criteria._expr[4]._ref").setValue("3");
		    		}
					var json = form.getData();
					form.loading("外包人员资料导出中...");
					nui.ajax({
		    			url: "com.primeton.eos.ame_pur.outperson.exportOutpersons.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		form.unmask();
				        	var filePath = o.downloadFile;
				        	var fileName = "外包人员";
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
				        	alert("error");
				        }
					});
				}else{
					return;
				}
            });
        }
  </script>
</body>
</html>