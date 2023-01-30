<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<style type="text/css">
	html,body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
<title>框架协议</title>
</head>
<body>
	<div id="form1">
		<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.contractPact.frameAgreement.ZhAgreementEntity" />
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table align="center" border="0" width="100%" class="form_table">
				<tr>
					<td class="form_label" align="right">申请人:</td>
					<td colspan="1">
						<input name="critria._expr[1]._value" class="nui-textbox" style="width: 64%;" id="createname" />
						<input class="nui-hidden" name="critria._expr[1]._property" value="empname" />
						<input class="nui-hidden" name="critria._expr[1]._op" value="like" />
						<input name="critria._expr[2]._value" class="nui-hidden" id="createUserid" />
						<input class="nui-hidden" name="critria._expr[2]._property" value="createUserid" />
					</td>
					<td class="form_label" align="right">协议实施部门:</td>
					<td colspan="1">
						<input id="orgid2" name="critria._ref[0]._expr[0]._value" style="width: 60%;" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" />
						<input class="nui-hidden" name="critria._expr[3]._property" value="implementOrg" />
						<input class="nui-hidden" name="critria._expr[3]._op" value="in" id="tempCond1" />
						<input class="nui-hidden" name="critria._expr[3]._ref" value="1" id="tempCond2" />
						<input class="nui-hidden" name="critria._ref[0]._id" value="1" />
						<input class="nui-hidden" name="critria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
						<input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="orgid" />
						<input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="orgseq" />
						<input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="like" />
						<input class="nui-hidden" name="critria._ref[0]._expr[0]._likeRule" value="end" />
						<input class="nui-hidden" name="critria._expr[4]._property" value="orgid" />
						<input class="nui-hidden" name="critria._expr[4]._op" value="in" />
						<input class="nui-hidden" name="critria._expr[4]._value" id="orgids2" />
					</td>
					<td class="form_label" align="right" style="width: 100px">协议名称:</td>
					<td colspan="1">
						<input name="critria._expr[6]._value" class="nui-textbox" style="width: 79%;" />
						<input class="nui-hidden" name="critria._expr[6]._property" value="contractName" />
						<input class="nui-hidden" name="critria._expr[6]._op" value="like" />
					</td>
				</tr>
				<tr>
					<td class="form_label" align="right" style="width: 100px">申请日期:</td>
					<td colspan="1">
						<input class="nui-hidden" name="critria._expr[5]._op" value="between" />
						<input class="nui-hidden" name="critria._expr[5]._pattern" value="yyyy-MM-dd" />
						<input class="nui-hidden" name="critria._expr[5]._property" value="createTime" />
						<input class="nui-datepicker" name="critria._expr[5]._min" style="width: 27%;" />
						<span style="border-spacing: 0px; padding-left: 0.2em; padding-right: 0.2em;">至</span>
						<input class="nui-datepicker" name="critria._expr[5]._max" style="width: 27%;" />
					</td>
					<td class="form_label" align="right" style="width: 100px">协议起始日期:</td>
					<td colspan="1">
						<input class="nui-hidden" name="critria._expr[10]._op" value="between" />
						<input class="nui-hidden" name="critria._expr[10]._pattern" value="yyyy-MM-dd" />
						<input class="nui-hidden" name="critria._expr[10]._property" value="startTime" />
						<input class="nui-datepicker" name="critria._expr[10]._min" style="width: 25%;" />
						<span style="border-spacing: 0px; padding-left: 0.2em; padding-right: 0.2em;">至</span>
						<input class="nui-datepicker" name="critria._expr[10]._max" style="width: 25%;" />
					</td>
					<td class="form_label" align="right">协议结束日期:</td>
					<td colspan="1">
						<input class="nui-hidden" name="critria._expr[11]._op" value="between" />
						<input class="nui-hidden" name="critria._expr[11]._pattern" value="yyyy-MM-dd" />
						<input class="nui-hidden" name="critria._expr[11]._property" value="endTime" />
						<input class="nui-datepicker" name="critria._expr[11]._min" style="width: 35%;" />
						<span style="border-spacing: 0px; padding-left: 0.2em; padding-right: 0.2em;">至</span>
						<input class="nui-datepicker" name="critria._expr[11]._max" style="width: 35%;" />
					</td>
				</tr>
				<tr>
					<td class="form_label" align="right">协议编号:</td>
					<td colspan="1">
						<input name="critria._expr[12]._value" class="nui-textbox" style="width: 65%;" />
						<input class="nui-hidden" name="critria._expr[12]._property" value="contractNo" />
						<input class="nui-hidden" name="critria._expr[12]._op" value="like" />
					</td>
					<td class="form_label" align="right">签订日期:</td>
					<td colspan="1">
						<input class="nui-hidden" name="critria._expr[13]._op" value="between" />
						<input class="nui-hidden" name="critria._expr[13]._pattern" value="yyyy-MM-dd" />
						<input class="nui-hidden" name="critria._expr[13]._property" value="signingDate" />
						<input class="nui-datepicker" name="critria._expr[13]._min" style="width: 60%;" />
					</td>
					<td class="form_label" align="right">审批状态:</td>
					<td colspan="1">
						<input name="critria._expr[14].appStatus" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" style="width: 79%;" showNullItem="true" nullItemText="全部" />
					</td>
				</tr>
				<tr>
					<td colspan="9" align="center">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
		<table style="width: 100%;">
			<tr>
				<td style="width: 20%;">
					<a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
					<a class="nui-button" id="dit" iconCls="icon-edit" onclick="zc_edit()">编辑</a>
					<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
					<a class="nui-button" id="kjxylist_wh" iconCls="icon-edit" onclick="wh_edit()">维护</a>
					<a class="nui-button" id="checkview" iconCls="icon-print" onclick="printBtn()">打印</a>
				</td>
			</tr>
		</table>
	</div>

	<div class="nui-fit">
		<div id="datagrid1" sizeList="[10,20,50,100]" showPager="true" dataField="data" pageSize="15" class="nui-datagrid" style="width: 100%; height: 100%;"
			url="com.zhonghe.ame.contractPact.frameAgreement.frameAgreementAll.biz.ext" multiSelect="true" allowSortColumn=true ondrawcell="setBackGroundColor">
			<div property="columns">
				<div type="checkcolumn"></div>
				<div type="indexcolumn" width="40" align="center" headerAlign="center">序号</div>
				<div field="empname" width="60" align="center" headerAlign="center" allowSort="true">申请人</div>
				<div field="contractName" width="150" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">协议名称</div>
				<div field="signatoryname" width="190" align="center" headerAlign="center" allowSort="true" renderer="lookInfo1">签约方</div>
				<div field="orgname" width="240" align="center" headerAlign="center" allowSort="true">协议实施部门</div>
				<div field="createTime" width="100" align="center" headerAlign="center" allowSort="true">申请日期</div>
				<div field="projectLocal" align="center" headerAlign="center" allowSort="true">实施地点</div>
				<div field="projectSize" width="100" align="center" headerAlign="center" allowSort="true">标的规模</div>
				<div field="appStatus" align="center" headerAlign="center" allowSort="true" renderer="onActionRenderer">审批状态</div>
				<div field="startTime" dateFormat="yyyy-MM-dd" width="90" align="center" headerAlign="center">协议起始日期</div>
				<div field="endTime" dateFormat="yyyy-MM-dd" width="90" align="center" headerAlign="center">协议结束日期</div>
				<div field="contractNo" width="100" headerAlign="center" allowSort="true">协议编号</div>
				<div field="signingDate" dateFormat="yyyy-MM-dd" width="90" headerAlign="center">签订日期</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
		var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
		
		init();
		
		function init() {
			// 按钮权限
			if (userId != 'sysadmin') {
				// 维护按钮 - kjxylist_wh
				getOpeatorButtonAuth("kjxylist_wh");
			}
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "kjxylist",
				"map" : {
					"property" : "status",
					"op" : "=",
					"value" : "running"
				}
			};
			nui.ajax({
				url : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data : json,
				type : 'POST',
				contentType : 'text/json',
				success : function(text) {
					if (text.orgs) {
						var orgids = text.orgids;
						if (text.orgs.length == 0) {
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createUserid").setValue(userId);
							nui.get("createname").setValue(userName);
							nui.get("createname").setReadOnly(true);
						}
						nui.get("orgid2").setData(text.orgs);
						if (orgids != null) {
							orgids = orgids.split(",");
							if (!isStr(orgids, "1")) {
								//根据情况选择一种
								nui.get("orgids2").setValue(text.orgids);
							}
						}
					} else {
						//当没有有权的机构时将申请人设置为登陆人
						nui.get("createUserid").setValue(userId);
						nui.get("createname").setValue(userName);
						nui.get("createname").setReadOnly(true);
					}
					search();
				}
			});
		}
		
		function check(e) {
			if (e.value == 1) {
				return "是";
			} else {
				return "否";
			}
		}
		
		function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
		
		function lookInfo1(e) {
			return "<a href='javascript:void(0)' onclick='doView1();' title='点击查看'>" + e.value + "</a>";
		}
		
		function doView() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%=request.getContextPath()%>/contractPact/print/feameAgreementInfoPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录", "danger");
			}
		}
		
		function doView1() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/feameAgreementInfoSignatoryname.jsp?signatoryname=" + row.signatoryname;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录", "danger");
			}
		}
		
		function printBtn() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/feameAgreementInfoPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录", "danger");
			}
		}
		
		function dictGetType(e) {
			return nui.getDictText('EXP_EXPTYPE', e.value);
		}
		
		function dictGetStatus(e) {
			return nui.getDictText('EXP_CHECKFLAG', e.value);
		}
		
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy("createTime", "desc");
			grid.load(data); //datagrid加载数据
		}
		
		function reset() {
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
			search()
		}
		
		function setBackGroundColor(e) {
			var record = e.record;
			if (record.appStatus == "0") {
				e.rowStyle = "background-color: #FFFF99";
			} else if (record.appStatus == "1") {
				e.rowStyle = "background-color: #FF99CC";
			}
		}
		
		function onOk() {
			search();
		}
		
		function wh_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行维护", "danger");
				return;
			}
			var data = row[0];
			if (data.appStatus == "2") {
				nui.open({
					url : "/default/contractPact/frameAgreement/feameAgreementEdit.jsp",
					width : '100%',
					height : '100%',
					title : "框架协议维护",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setEditData(data);
					},
					ondestroy : function(action) {
						if (action == "ok") {
							grid.reload();
						}
						search();
					}
				})			
			
			}else{
				showTips("只能维护审批状态为【审批通过】的数据", "danger");
			}
		}
		
		// 暂存编辑
		function zc_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行编辑", "danger");
				return;
			}
			var data = row[0];
			if (data.appStatus == '0') {
				var json = {
					"processID" : data.processid
				};
				ajaxCommon({
					url : "com.zhonghe.ame.contractPact.frameAgreement.getWorkItemByProcessInstID.biz.ext",
					data : json,
					success : function(result) {
						if(JSON.stringify(result) !== '{}'){
							nui.open({
								url : "/default/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+ result.workItemID,
								width : '100%',
								height : '100%',
								ondestroy : function(action) {
									grid.reload();
									search();
								}
							})
						}
					}
				});
			}else{
				showTips("只能编辑审批状态为【草稿】的数据", "danger");
			}
		}
		
		function deleteInfo() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行删除", "danger");
				return;
			}else{
				var row = row[0];
				if (row.appStatus == '4') {
					if (!confirm("是否删除？")) {
						return;
					} else {
						if (row) {
							var json = nui.encode({
								'data' : row
							});
							nui.ajax({
								url : "com.zhonghe.ame.contractPact.frameAgreement.deleteframeAgreement.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
									if (o.result == 1) {
										showTips("删除成功");
										grid.reload();
									} else {
										showTips("删除失败，请联系信息技术部人员！", "danger");
									}
								}
							});
						} else {
							showTips("只能选中一条项目记录进行删除", "danger");
						}
					}				
				}else{
					showTips("只能删除审批状态为【作废】的数据", "danger");
				}				
			}
		}
		
		function onKeyEnter() {
			search();
		}
		
		function onActionRenderer(e) {
			var record = e.record;
			var processId = record.processid;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) + "</a>";
			return s;
		}
		
		function feeView() {
			var selectRow = grid.getSelected();
			var processId = selectRow.processid;
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width = 1000;
			nui.open({
				url : url,
				title : title,
				width : width,
				height : 550,
				onload : function() {
					var iframe = this.getIFrameEl();
					if (iframe.contentWindow.initData) {
						iframe.contentWindow.initData({
							"processInstID" : processId
						});
					}
				},
				ondestroy : function(action) {
				}
			});
		}
		
		function sure(e) {
			var row = grid.getSelecteds();
			if (row.length == 1) {
				var mngJsonData = row[0];
				//获取当前客户的其他信息
				var json = nui.encode({
					id : mngJsonData.id,
					createUserid : mngJsonData.createUserid
				});
				console.log(json);
				if (!confirm("确定提交该流程？")) {
					return;
				} else {
					nui.ajax({
						url : "com.zhonghe.ame.imptask.keytask.taskMngFillIn.biz.ext",
						type : 'POST',
						data : json,
						contentType : 'text/json',
						success : function(o) {
							if (o.result == 1) {
								nui.alert("流程发起成功", "系统提示", function() {
									CloseWindow("ok");
								});
							} else {
								nui.alert("提交失败，请联系信息技术部人员！", "系统提示", function(action) {
								});
							}
						}
					});
				}
			} else {
				nui.alert("请选中一条记录", "提示");
			}
		}
		
		function add() {
			nui.open({
				url : "/default/contractPact/frameAgreement/feameAgreementAdd.jsp",
				width : '100%',
				height : '100%',
				title : "框架协议签订",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			})
		}
		
		function zhFlowType(e) {
			return nui.getDictText("ZH_FLOW_TYPE", e.value);
		}
		
		function isStr(str, val) {
			if (str.indexOf(val) != -1) {
				return true
			} else {
				return false
			}
		}
	</script>
</body>
</html>
