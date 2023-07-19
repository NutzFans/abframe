<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
<head>
<title>框架协议管理</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="form1">
			<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.contractPact.frameAgreement.ZhAgreementEntity" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">经办人:</td>
						<td style="width: 155px">
							<input name="critria._expr[1].empname" class="nui-textbox" id="createUsername" style="width: 150px" />
							<input class="nui-hidden" name="critria._expr[1]._op" value="like" id="createUsernameOp" />
							<input name="critria._expr[0].createUserid" class="nui-hidden" id="createUserid" />
						</td>
						<td style="width: 90px; text-align: right;">经办部门:</td>
						<td style="width: 155px">
							<input id="orgid2" name="critria._ref[0]._expr[0]._value" style="width: 150px" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true"
								allowInput="true" valueFromSelect="true" />
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
						<td style="width: 60px; text-align: right;">审批状态:</td>
						<td style="width: 155px">
							<input name="critria._expr[14].appStatus" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" style="width: 150px;" showNullItem="true" nullItemText="全部" />
						</td>
						<td style="width: 90px; text-align: right;">协议起始日期:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="critria._expr[10]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[10]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="critria._expr[10]._property" value="startTime" />
							<input class="nui-datepicker" name="critria._expr[10]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="critria._expr[10]._max" style="width: 110px" />
						</td>
						<td style="width: 90px; text-align: right;">协议落实部门:</td>
						<td style="width: 245px">
								<input name="critria._expr[22]._value" class="nui-combobox" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryBidUnitsForAgreement.biz.ext" filterType="like" textField="dictname"
									valueField="dictname" dataField="bidUnits" valueFromSelect="true" allowInput="true" style="width: 241px;" />
								<input class="nui-hidden" name="critria._expr[22]._property" value="bidUnitsName" />
								<input class="nui-hidden" name="critria._expr[22]._op" value="like" />
						</td>
						
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">协议编号:</td>
						<td style="width: 155px">
							<input name="critria._expr[12]._value" class="nui-textbox" style="width: 150px;" />
							<input class="nui-hidden" name="critria._expr[12]._property" value="contractNo" />
							<input class="nui-hidden" name="critria._expr[12]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">协议名称:</td>
						<td style="width: 155px">
							<input name="critria._expr[6]._value" class="nui-textbox" style="width: 150px;" />
							<input class="nui-hidden" name="critria._expr[6]._property" value="contractName" />
							<input class="nui-hidden" name="critria._expr[6]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">签约方:</td>
						<td style="width: 155px">
							<input name="critria._expr[20]._value" class="nui-combobox" url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext" filterType="like" textField="custname" valueField="custname"
								dataField="custs" valueFromSelect="true" allowInput="true" style="width: 150px" />
							<input class="nui-hidden" name="critria._expr[20]._property" value="signatoryname" />
							<input class="nui-hidden" name="critria._expr[20]._op" value="like" />
						</td>
						<td style="width: 90px; text-align: right;">协议结束日期:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="critria._expr[11]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[11]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="critria._expr[11]._property" value="endTime" />
							<input class="nui-datepicker" name="critria._expr[11]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="critria._expr[11]._max" style="width: 110px" />
						</td>
						<td style="width: 90px; text-align: right;">协议签订日期:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="critria._expr[21]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[21]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="critria._expr[21]._property" value="signingDate" />
							<input class="nui-datepicker" name="critria._expr[21]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="critria._expr[21]._max" style="width: 110px" />
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="nui-toolbar" style="border-bottom: 0; padding: 1px;">
			<table style="width: 100%; text-align: center;">
				<tr>
					<td>
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
			<table style="width: 100%;">
				<tr>
					<td>
						<a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="dit" iconCls="icon-edit" onclick="zc_edit()">编辑</a>
						<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
						<a class="nui-button" id="kjxylist_wh" iconCls="icon-edit" onclick="wh_edit()">维护</a>
						<a class="nui-button" id="checkview" iconCls="icon-print" onclick="printBtn()">打印</a>
						<a class="nui-button" id="export" iconCls="icon-download" onclick="exportExcel()">导出</a>
						<a class="nui-button" id="kjxylist_help" iconCls="icon-help" onclick="help()">帮助</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="datagrid1" sizeList="[20,50,100,500]" showPager="true" dataField="data" pageSize="20" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.contractPact.frameAgreement.frameAgreementAll.biz.ext" allowSortColumn=true ondrawcell="setBackGroundColor">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div type="indexcolumn" width="40" align="center" headerAlign="center">序号</div>
					<div field="empname" width="60" align="center" headerAlign="center" allowSort="true">经办人</div>
					<div field="contractName" width="150" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">协议名称</div>
					<div field="signatoryname" width="190" align="center" headerAlign="center" allowSort="true" renderer="lookInfo1">签约方</div>
					<div field="orgname" width="240" align="center" headerAlign="center" allowSort="true">经办部门</div>
					<div field="createTime" width="100" align="center" headerAlign="center" allowSort="true">申请日期</div>
					<div field="projectLocal" align="center" headerAlign="center" allowSort="true">签署地点</div>
					<div field="bidUnitsName" width="240" align="center" headerAlign="center" allowSort="true">协议落实部门</div>
					<div field="appStatus" align="center" headerAlign="center" allowSort="true" renderer="onActionRenderer">审批状态</div>
					<div field="startTime" dateFormat="yyyy-MM-dd" width="90" align="center" headerAlign="center" allowSort="true">协议起始日期</div>
					<div field="endTime" dateFormat="yyyy-MM-dd" width="90" align="center" headerAlign="center" allowSort="true">协议结束日期</div>
					<div field="contractNo" width="100" headerAlign="center" allowSort="true">协议编号</div>
					<div field="signingDate" dateFormat="yyyy-MM-dd" width="90" headerAlign="center" allowSort="true">签订日期</div>
				</div>
			</div>
		</div>
	</div>

	<form name="exprotExcelFlow" id="exprotExcelFlow" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		var type =<%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
		var json = nui.encode({
			"iden" : "1",
			"expseq" : null,
			"feeseq" : null,
			"parentfeetypeid" : null
		});

		init();

		function init() {
			// 按钮权限
			if (userId != 'sysadmin') {
				// 维护按钮 - kjxylist_wh
				getOpeatorButtonAuth("kjxylist_wh,kjxylist_help");
			}
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "kjxylist"
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
				executeUrl = "<%=request.getContextPath()%>/contractPact/print/feameAgreementInfoSignatoryname.jsp?signatoryname=" + row.signatoryname;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录", "danger");
			}
		}
		
		function printBtn() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%=request.getContextPath()%>/contractPact/print/feameAgreementInfoPrint.jsp?id=" + row.id;
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

			} else {
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
						if (JSON.stringify(result) !== '{}') {
							nui.open({
								url : "/default/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID=" + result.workItemID,
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
			} else {
				showTips("只能编辑审批状态为【草稿】的数据", "danger");
			}
		}

		function deleteInfo() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行删除", "danger");
				return;
			} else {
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
				} else {
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

		//导出
		function exportExcel() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var data = form.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.frameAgreement.feameAgreementExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "框架协议管理明细";
					var myDate = new Date();
					var year = myDate.getFullYear();
					var month = myDate.getMonth() + 1;
					var day = myDate.getDate();
					var hours = myDate.getHours();
					var minutes = myDate.getMinutes();
					var seconds = myDate.getSeconds();
					var curDateTime = year;
					if (month > 9) {
						curDateTime = curDateTime + "" + month;
					} else {
						curDateTime = curDateTime + "0" + month;
					}
					if (day > 9) {
						curDateTime = curDateTime + day;
					} else {
						curDateTime = curDateTime + "0" + day;
					}
					if (hours > 9) {
						curDateTime = curDateTime + hours;
					} else {
						curDateTime = curDateTime + "0" + hours;
					}
					if (minutes > 9) {
						curDateTime = curDateTime + minutes;
					} else {
						curDateTime = curDateTime + "0" + minutes;
					}
					if (seconds > 9) {
						curDateTime = curDateTime + seconds;
					} else {
						curDateTime = curDateTime + "0" + seconds;
					}
					fileName = fileName + "_" + curDateTime + ".xls";
					var frm = document.getElementById("exprotExcelFlow");
					frm.elements["downloadFile"].value = filePath;
					frm.elements["fileName"].value = fileName;
					frm.submit();
				},
				error : function() {
					showTips("导出数据异常，请联系管理员！", "danger");
				}
			});
		}
		
		function help() {
			executeUrl = "<%= request.getContextPath() %>/contractPact/frameAgreement/feameAgreementFlowDesgin.jsp";
			window.open(executeUrl);
		}		
		
	</script>

</body>
</html>