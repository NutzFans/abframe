<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-11-12 16:02:52
  - Description:
-->
<head>
<title>外包人员项目关系查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<!-- 	
		1、通过菜单进入
		2、查询条件：项目编号、项目名称、供应商、项目收益部门、服务客户，服务日期范围、服务状态
		3、查询结果：事业部、受益部门、供应商、人员、项目名称、项目编号、所属客户、服务开始日期、预计服务结束日期、投入比重、服务状态、实际服务结束日期、服务价格、最近结算截止日期、最近计提截止日期
		4、排序字段：事业部、受益部门、项目编号
		5、项目名称提供链接，点击显示项目详细信息页面
		6、提供查询结果导出功能
	 -->
	<div class="nui-fix">
		<div class="nui-panel" title="外包人员项目关系" style="width: auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td align="right"><span>项目名称：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="projectname"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							</td>
							<td align="right"><span>项目编号：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[1]._value" class="nui-textbox" style="width:210px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectno"/>
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
							</td>
							<td align="right"><span>供应商：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[2]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="custname"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
							</td> 
						
							<td align="right"><span>项目受益部门：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[3]._value" class="nui-treeselect" expandOnLoad="0" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
								showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true" style="width:200px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[3]._property" value="finUnitId"/>
							    <input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
							</td>
						</tr>
						<tr>
							<td align="right"><span>服务客户：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[4]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter" />
							    <input class="nui-hidden" name="criteria._expr[4]._property" value="miscustname"/>
							    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
							</td>
							<td align="right"><span>服务日期范围：</span></td>
			            	<td align="left">
							    <!-- <input name="criteria._expr[5]._min" class="nui-datepicker" style="width:100px;"/>
							    -
							    <input name="criteria._expr[5]._max" class="nui-datepicker" style="width:100px;"/>
							    <input class="nui-hidden" name="criteria._expr[5]._property" value="startdate"/>
							    <input class="nui-hidden" name="criteria._expr[5]._op" value="between"/>
							    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/> -->
							    <input name="criteria._expr[5]._min" id="mindate" class="nui-datepicker" style="width:100px;"/>
							    -
							    <input name="criteria._expr[5]._max" id="maxdate" class="nui-datepicker" style="width:100px;"/>
							    
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[0]._property" value="actenddate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[0]._op" value="notnull"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[1]._property" value="startdate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[1]._op" value="<="/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[1]._value" id="startdate1"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[2]._property" value="actenddate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[2]._op" value=">="/>
							    <input class="nui-hidden" name="criteria._or[0]._and[0]._expr[2]._value" id="actenddate"/>
							    
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[0]._property" value="actenddate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[0]._op" value="null"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[1]._property" value="startdate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[1]._op" value="<="/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[1]._value" id="startdate2"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[2]._property" value="expenddate"/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[2]._op" value=">="/>
							    <input class="nui-hidden" name="criteria._or[0]._and[1]._expr[2]._value" id="expenddate"/>
							</td>
							<td align="right"><span>服务状态：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[6]._value" class="nui-dictcombobox" dictTypeId="AME_OUTPERSTATUS" style="width:150px;" showNullItem="true" multiSelect="true"/>
							    <input class="nui-hidden" name="criteria._expr[6]._property" value="currentstatus"/>
							    <input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
							</td>
							<td align="right"><span>外包人员：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[7]._value" class="nui-textbox" style="width:100px;" onenter="onKeyEnter" />
							    <input class="nui-hidden" name="criteria._expr[7]._property" value="outpername"/>
							    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
			            	</td>
			            </tr>
						<tr>
							<td align="right"><span>项目负责人：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[9]._value" class="nui-textbox" style="width:100px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[9]._property" value="managername"/>
							    <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
							</td>
							<td align="right"><span>汇报对象：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[10]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[10]._property" value="reportingmanager"/>
							    <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>
							</td>
							<td align="right"><span>是否考勤：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[8]._value" class="nui-dictcombobox" dictTypeId="MIS_YN" shownullItem="true" style="width:100px;"/>
							    <input class="nui-hidden" name="criteria._expr[8]._property" value="whetherattendance"/>
							    <input class="nui-hidden" name="criteria._expr[8]._op" value="="/>
							</td>
							
			    			<td align="center" colspan="2">
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
		                        <a class="nui-button" id="addWXBtn" iconCls="icon-add" onclick="addWXQYZH()">生成微信企业号账号</a>
		                        <!-- <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="edit()">编辑</a>
		                        <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="remove()">删除</a> -->
		                    </td>
		                </tr>
		             </table>           
		        </div>
		        <div id="datagrid1" class="nui-datagrid" style="width: 100%;height:325px;" allowResize="true" dataField="projectOutpers" 
			    	url="com.primeton.eos.ame_pur.outperson.queryOutpersonProjectRelation.biz.ext" 
			    	multiSelect="true" allowAlternating="true" 
			    	frozenStartColumn="0" frozenEndColumn="3">
					<div property="columns">
						<div type="checkcolumn" width="30"></div>	
						<div field="outpername" width="80" align="center" headerAlign="center" allowSort="true"renderer="getOutperDetail">外包人员</div>
						<div field="suppliersname" width="100" align="center" headerAlign="center" allowSort="true" renderer="getSupplierDetail">供应商</div>
						<div field="projectname" width="200" align="left" headerAlign="center" allowSort="true" renderer="getProjectNameDetail">项目名称</div>
						<div field="projectno" width="100" align="center" headerAlign="center" allowSort="true">项目编号</div>
						<div field="dictname" width="100" align="center" headerAlign="center" allowSort="true">二级部门</div>
						<div field="orgname" width="80" align="center" headerAlign="center" allowSort="true">受益部门</div>
						<div field="managername" width="80" align="center" headerAlign="center" allowSort="true">项目负责人</div>
						<div field="reportingmanager" width="80" align="center" headerAlign="center" allowSort="true">汇报对象</div>
						<div field="miscustname" width="200" align="left" headerAlign="center" allowSort="true">所属客户</div>
						<div field="startdate" width="90" align="center" headerAlign="center" allowSort="true">服务开始日期</div>
						<div field="expenddate" width="110" align="center" headerAlign="center" allowSort="true">预计服务结束日期</div>
						<div field="inputratio" width="80" align="center" headerAlign="center" allowSort="true" numberFormat="p0">投入比重</div>
						<div field="currentstatus" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">服务状态</div>
						<div field="actenddate" width="110" align="center" headerAlign="center" allowSort="true">实际服务结束日期</div>
						<div field="price" width="100" align="right" headerAlign="center" allowSort="true" numberFormat="n">服务价格</div>
						<div field="degree" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetDegree">学历</div>
						<div field="gradudate" width="90" align="center" headerAlign="center" allowSort="true">毕业时间</div>
						<div field="linktel" width="100" align="center" headerAlign="center" allowSort="true">联系电话</div>
						<div field="costenddate" width="110" align="center" headerAlign="center" allowSort="true">最近结算截止日期</div>
						<div field="accuenddate" width="110" align="center" headerAlign="center" allowSort="true">最近计提截止日期</div>
						<div field="whetherattendance" width="110" align="center" headerAlign="center" allowSort="true" renderer="isWhetherattendance">是否考勤</div>
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
    	var isSYB = false;
    	init();
    	function init(){
    		nui.ajax({
                url: "com.primeton.eos.ame_common.sendMail.getMySYB.biz.ext",
                type: "post",
                cache: false,
                contentType: 'text/json',
                success: function (text) {
					//除了PMO都能查到事业部，PMO为0
		    		if(text.syb.length > 0){//属于单个或多个事业部
		    			isSYB = true;
		    			var sybdata = [];
	    				for(var i = 0;i < text.syb.length;i ++){
	    					sybdata[i] = {"dictID": text.syb[i].dictid,"dictName": text.syb[i].dictname};
	    				}
	    				nui.get("syb").setData(sybdata);
	    				nui.get("syb").setShowNullItem(false);
    					nui.get("syb").select(0);
				    	//如果只有一个事业部，禁用事业部选项
				    	if(text.syb.length == 1){
				    		nui.get("syb").setEnabled(false);
				    	}
				    	nui.get("addWXBtn").setEnabled(false);
	    			}	    			
		    		nui.get("startdate1").setValue(nui.get("mindate").getValue());
		    		nui.get("startdate2").setValue(nui.get("mindate").getValue());
		    		nui.get("expenddate").setValue(nui.get("maxdate").getValue());
		    		nui.get("actenddate").setValue(nui.get("maxdate").getValue());
					var data = form.getData(); //获取表单JS对象数据
					grid.sortBy("outpername","asc");
		    		grid.load(data);
	    		}
	    	});
    		//事业部、受益部门、项目编号
    		//按外包人员供应商排序
		}
		
		//设置业务字典值-人员状态
		function dictGetStatus(e){
			return nui.getDictText('AME_OUTPERSTATUS',e.value);
		}
		
		//设置业务字典值-学历
		function dictGetDegree(e) {
			return nui.getDictText('DEGREE',e.value);
		}
		
		//设置业务字典值-是否考勤
		function isWhetherattendance(e){
			return nui.getDictText('MIS_YN',e.value);
		}
		
		//查询
		function search(){
			nui.get("startdate1").setValue(nui.get("mindate").getValue());
    		nui.get("startdate2").setValue(nui.get("mindate").getValue());
    		nui.get("expenddate").setValue(nui.get("maxdate").getValue());
    		nui.get("actenddate").setValue(nui.get("maxdate").getValue());
			var json = form.getData();
			grid.sortBy("outpername","asc");
			grid.load(json);
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		//重置
		function reset(){
			form.reset();
			/* nui.get("startdate1").setValue(nui.get("mindate").getValue());
    		nui.get("startdate2").setValue(nui.get("mindate").getValue());
    		nui.get("expenddate").setValue(nui.get("maxdate").getValue());
    		nui.get("actenddate").setValue(nui.get("maxdate").getValue()); */
			var json = form.getData();
			grid.sortBy("outpername","asc");
			grid.load(json);
		}
		
		//导出
		function exportOutpersons(){
			nui.confirm("是否确认导出外包人员资料？", "确定？",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("startdate1").setValue(nui.get("mindate").getValue());
			    		nui.get("startdate2").setValue(nui.get("mindate").getValue());
			    		nui.get("expenddate").setValue(nui.get("maxdate").getValue());
			    		nui.get("actenddate").setValue(nui.get("maxdate").getValue());
						var json = form.getData();
						form.loading("外包人员资料导出中...");
						nui.ajax({
			    			url: "com.primeton.eos.ame_pur.outperson.exportProjectOutpersons.biz.ext",
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
	            }
			);
		}
		
		//供应商链接
		function getSupplierDetail(e){
			if(e.value && isSYB == false){
				return "<a href='javascript:void(0)' onclick='checkSupplierDetail();' title='点击查看'>" + e.value + "</a>";
			}else{
				return e.value;
			}
		}
		function checkSupplierDetail(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "/default/ame_pur/PurSupplier/DetailPurSupplier.jsp?id=" + selectRow.custid;
			window.open(executeUrl, "供应商详细信息", "fullscreen=1");
	    }
	    
	    //外包人员链接-编辑页面
	    function getOutperDetail(e){
	    	if(e.value && isSYB == false){
	    		return "<a href='javascript:void(0)' onclick='checkOutperson();' title='点击编辑'>" + e.value + "</a>";
	    	}else{
	    		return e.value;
	    	}
	    }
	    function checkOutperson(){
	    	var selectRow = grid.getSelected();
	    	nui.open({
	            url: "<%=request.getContextPath() %>/ame_pur/outperson/PurOutpersonInput.jsp",
	            title: "编辑外包人员",
	            width: 1000,
	            height: 450,
	            onload: function () {
					var iframe = this.getIFrameEl();
					var data = {action: "edit", outperno: selectRow.outperno };
					iframe.contentWindow.SetData(data);
				},
				ondestroy: function (action) {
					if(action=="ok"){
						grid.reload();
	                }
				}
			});
	    }
	    
	    //项目链接-修改页面
	    function getProjectNameDetail(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkProjectName();' title='点击编辑'>" + e.value + "</a>";
	    	}
	    }
	    
	    function checkProjectName(){
	    	var selectRow = grid.getSelected();
	    	var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectid;
			window.open(executeUrl);
	    }
	    
	    /**
	     * 生成微信企业号账号
	     */
	    function addWXQYZH(){
	    	var rows = grid.getSelecteds();
	    	var outpernos = "";
	    	for(var i = 0;i < rows.length;i ++){
	    		if(outpernos){
	    			if(outpernos.indexOf(rows[i].outperno) > -1){
	    			}else{
	    				outpernos = outpernos +","+ rows[i].outperno;
	    			}
	    		}else{
	    			outpernos = rows[i].outperno + "";
	    		}
	    	}
	    	//var projectnos = nui.getbyName("criteria._expr[1]._value").getValue();
	    	if(outpernos != ""){
	    		var titleName = "";
    			titleName = "确定要生成微信企业号账号吗？";
	    		nui.confirm(titleName,"操作提示",function(action){
	    			if(action == "ok"){
	    				nui.get("addWXBtn").disable();
			    		var json = nui.encode({"outpernosTemp": outpernos});
	    				form.loading("微信企业号账号生成中...");
				    	nui.ajax({
			        		url: "com.primeton.eos.ame_pur.outpersonFiling.outpersonInitToAcoperator.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (o) {
			                	form.unmask();
			                	o = nui.clone(o);
			                	if(o.resultInfo=="0"){
			                		nui.alert("没有可生成微信企业号账号的人员数据！","系统提示",function(){
				                		nui.get("addWXBtn").enable();
				                	});
			                	}else{
			                		nui.alert("生成完成！","系统提示",function(){
				                		nui.get("addWXBtn").enable();
				                	});
			                	}
			                	
			                },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                    CloseWindow();
			                }
			        	});
	    			}
	    		});
	    	}else{
	    		nui.alert("请选择记录！");
	    		/* nui.confirm("确定要对所有项目外包人员生成微信企业号账号吗？","操作提示",function(action){
	    			if(action == "ok"){
	    				nui.get("addWXBtn").disable();
	    				return;
			    		var json = nui.encode({"purProjOutperTemp": {"projectno": projectno}});
	    				form.loading("微信企业号账号生成中...");
				    	nui.ajax({
			        		url: "com.primeton.eos.ame_pur.outpersonFiling.outpersonInitToAcoperator.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (o) {
			                	form.unmask();
			                	nui.alert("生成完成！",function(){
			                		nui.get("addWXBtn").enable();
			                	});
			                },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                    CloseWindow();
			                }
			        	});
	    			}
	    		}); */
	    	}
	    	
	    }
	</script>
</body>
</html>