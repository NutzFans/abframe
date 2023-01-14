<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>付款管理列表</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	html,body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
</head>
<body>
	<div class="nui-panel" title="付款列表查询" style="width: 100%; height: 100%">
		<div id="form1">
			<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.payment.payMent.ZhPaymentEntity" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
				<table align="center" border="0" width="100%" class="form_table">
					<tr>
						<td class="form_label" align="right" style="width: 3%">申请人:</td>
						<td colspan="1" style="width: 5%">
							<input name="critria._expr[1]._value" class="nui-textbox" style="width: 100%;" id="createname" />
							<input class="nui-hidden" name="critria._expr[1]._property" value="empname" />
							<input class="nui-hidden" name="critria._expr[1]._op" value="like" />
							<input name="critria._expr[2]._value" class="nui-hidden" id="createUserid" />
							<input class="nui-hidden" name="critria._expr[2]._property" value="createUserid" />
						</td>
						<td class="form_label" align="right" style="width: 3%">合同名称:</td>
						<td colspan="1" style="width: 7%">
							<input name="critria._expr[5]._value" class="nui-textbox" style="width: 95%;" />
							<input class="nui-hidden" name="critria._expr[5]._property" value="contractName" />
							<inputclass ="nui-hidden" name="critria._expr[5]._op" value="like" />
						</td>
						<td class="form_label" align="right" style="width: 3%">签约方:</td>
						<td colspan="1" style="width: 7%">
							<input name="critria._expr[6]._value" class="nui-textbox" style="width: 91%;" />
							<input class="nui-hidden" name="critria._expr[6]._property" value="signatoryname" />
							<input class="nui-hidden" name="critria._expr[6]._op" value="like" />
						</td>
						<td class="form_label" align="right" style="width: 5%">（付费）合同实施部门:</td>
						<td colspan="1" style="width: 7%">
							<input id="orgid2" name="critria._ref[0]._expr[0]._value" style="width: 65%;" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" />
							<input class="nui-hidden" name="critria._expr[3]._property" value="implementOrg" />
							<input class="nui-hidden" name="critria._expr[3]._op" value="in" id="tempCond1" />
							<input class="nui-hidden" name="critria._expr[3]._ref" value="1" id="tempCond2" />
							<input class="nui-hidden" name="critria._ref[0]._id" value="1" />
							<input class="nui-hidden" name="critria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
							<input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="orgid" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="orgseq" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="like" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._likeRule" value="end" />
							<input class="nui-hidden" name="critria._expr[4]._property" value="implementOrg" />
							<input class="nui-hidden" name="critria._expr[4]._op" value="in" />
							<input class="nui-hidden" name="critria._expr[4]._value" id="orgids2" />
						</td>
					</tr>
					<tr>
						<td class="form_label" align="right" style="width: 3%">合同编号:</td>
						<td colspan="1" style="width: 5%">
							<input name="critria._expr[12]._value" class="nui-textbox" style="width: 100%;" />
							<input class="nui-hidden" name="critria._expr[12]._property" value="contractId" />
							<input class="nui-hidden" name="critria._expr[12]._op" value="like" />
						</td>
						<td class="form_label" align="right" style="width: 3%">申请日期:</td>
						<td colspan="1" style="width: 9%">
							<input class="nui-hidden" name="critria._expr[8]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[8]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="critria._expr[8]._property" value="createTime" />
							<input class="nui-datepicker" name="critria._expr[8]._min" style="width: 43%;" />
							<span style="border-spacing: 0px; padding-left: 0.2em; padding-right: 0.2em;">至</span>
							<input class="nui-datepicker" name="critria._expr[8]._max" style="width: 43%;" />
						</td>
						<td class="form_label" align="right" style="width: 3%">最晚付款日期:</td>
						<td colspan="1" style="width: 9%">
							<input class="nui-hidden" name="critria._expr[10]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[10]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="critria._expr[10]._property" value="endTime" />
							<input class="nui-datepicker" name="critria._expr[10]._min" style="width: 41%;" />
							<span style="border-spacing: 0px; padding-left: 0.2em; padding-right: 0.2em;">至</span>
							<input class="nui-datepicker" name="critria._expr[10]._max" style="width: 41%;" />
						</td>
						<td class="form_label" align="right">审批状态:</td>
						<td colspan="1">
							<input name="critria._expr[13].appStatus" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" style="width: 79%;" showNullItem="true" nullItemText="全部" />
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table style="width: 100%;">
				<tr>
					<td>
						<a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="dit" iconCls="icon-edit" onclick="zc_edit()">编辑</a>
						<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
						<a class="nui-button" id="fklblist_wh" iconCls="icon-edit" onclick="wh_edit()">维护</a>
						<a class="nui-button" id="checkview" iconCls="icon-print" onclick="printBtn()">打印</a>
					</td>
					<td align="right">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
					</td>
				</tr>
			</table>
		</div>
		<div class="nui-fit">
			<div id="datagrid1" sizeList="[10,20,50,100]" showPager="true" dataField="data" sortMode="client" class="nui-datagrid" style="width: 100%; height: 100%;" allowCellWrap="true"
				url="com.zhonghe.ame.payment.payMent.payMentAll.biz.ext" multiSelect="true" showSummaryRow="true" frozenStartColumn="0" frozenEndColumn="9">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="id" headerAlign="center" allowSort="true" visible="false">id</div>
					<div field="createTime" headerAlign="center" allowSort="true" visible="false">创建时间</div>
					<div type="indexcolumn" width="50" align="center" headerAlign="center">序号</div>
					<div field="endTime" dateFormat="yyyy-MM-dd" width="90" align="center" headerAlign="center">付款日期</div>
					<div field="empname" width="60" align="center" headerAlign="center" allowSort="true">经办人</div>
					<div field="orgname" width="150" align="center" headerAlign="center" allowSort="true">承办部门</div>
					<div field="contractId" width="150" align="center" headerAlign="center" allowSort="true">合同编号</div>
					<div field="contractName" width="200" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">合同名称</div>
					<div field="appStatus" align="center" headerAlign="center" allowSort="true" renderer="onActionRenderer">审批状态</div>
					<div field="contractSum" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum">合同金额（元）</div>
					<div field="applyPayContractSum" width="130" align="center" headerAlign="center" allowSort="true" summaryType="sum">本次申请金额（元）</div>
					<div field="paidContractSum" width="150" align="center" headerAlign="center" allowSort="true" summaryType="sum">累计已支付金额（元）</div>
					<div field="signatoryname" width="120" align="center" headerAlign="center" allowSort="true">收款单位</div>
					<div field="payer" width="120" align="center" headerAlign="center" allowSort="true" renderer="ZH_INVOICE_NAME_TYPE">付款方</div>
					<div field="payType" width="120" align="center" headerAlign="center" allowSort="true" renderer="payType">本次付款进度</div>
					<div field="invoiceType" width="120" align="center" headerAlign="center" allowSort="true" renderer="MIS_MA_INVOICETYPE">发票类型</div>
					<div field="contractNature" width="120" align="center" headerAlign="center" allowSort="true" renderer="CONTRACT_NATURE">合同性质</div>
					<div field="contractType" width="120" align="center" headerAlign="center" allowSort="true" renderer="ZH_CONTRACT_TYPE">合同类型</div>
				</div>
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
				// 维护按钮 - fklblist_wh
				getOpeatorButtonAuth("fklblist_wh");
			}
			
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "fklblist",
				"map" : {
					"property" : "status",
					"op" : "=",
					"value" : "running"
				}
			};
			ajaxCommon({
				url : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data : json,
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
			console.log(e);
			if (e.value == 1) {
				return "是";
			} else {
				return "否";
			}
		}

		function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}

		function doView() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/payMentListPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录", "danger");
			}
		}
		
		function printBtn() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/payMentListPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录", "danger");
			}
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
			if (data.appStatus == '2') {
				nui.open({
					url : "/default/contractPact/payment/payMentUpdate.jsp",
					width : '100%',
					height : '100%',
					title : "付款信息维护",
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
					url : "com.zhonghe.ame.payment.payMent.getWorkItemByProcessInstID.biz.ext",
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
		
		function setBackGroundColor(e) {
			var record = e.record;
			if (record.appStatus == "0") {
				e.rowStyle = "background-color: #FFFF99";
			} else if (record.appStatus == "1") {
				e.rowStyle = "background-color: #FF99CC";
			}
		}
		
		//回车触发
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
		
		function onDrawSummaryCell(e) {
			var result = e.result;
			var grid = e.sender;
		}
		
		function ondealdate(e) {
			if (e.value) {
				var now = e.value;
				var year = now.getFullYear();
				var month = now.getMonth() + 1;
				var day = now.getDate();
				var hours = now.getHours();
				var minutes = now.getMinutes();
				var seconds = now.getSeconds();
				var curDateTime = year;
				if (month > 9) {
					curDateTime = curDateTime + "-" + month;
				} else {
					curDateTime = curDateTime + "-" + "0" + month;
				}
				if (day > 9) {
					curDateTime = curDateTime + "-" + day;
				} else {
					curDateTime = curDateTime + "-" + "0" + day;
				}
				if (hours > 9) {
					curDateTime = curDateTime + "   " + hours;
				} else {
					curDateTime = curDateTime + "   " + "0" + hours;
				}
				if (minutes > 9) {
					curDateTime = curDateTime + ":" + minutes;
				} else {
					curDateTime = curDateTime + ":" + "0" + minutes;
				}
				if (seconds > 9) {
					curDateTime = curDateTime + ":" + seconds;
				} else {
					curDateTime = curDateTime + ":" + "0" + seconds;
				}
				return curDateTime;
			}
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
									//nui.get("sureButton").setEnabled(true);
									CloseWindow("ok");
								});
							} else {

								nui.alert("提交失败，请联系信息技术部人员！", "系统提示", function(action) {
									//nui.get("sureButton").setEnabled(true);
								});
							}
						}
					});
				}
			} else {
				nui.alert("请选中一条记录", "提示");
			}
		}
		
		function dictGetType(e) {
			return nui.getDictText('EXP_EXPTYPE', e.value);
		}
		
		function dictGetStatus(e) {
			return nui.getDictText('EXP_CHECKFLAG', e.value);
		}
		
		function zhContractType(e) {
			return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
		}
		
		function zhFlowType(e) {
			return nui.getDictText("ZH_FLOW_TYPE", e.value);
		}
		
		function zhLaborDispatchingFlag(e) {
			return nui.getDictText("ZH_LABOR_DISPATCHING_FLAG", e.value);
		}
		
		function add() {
			nui.open({
				url : "/default/contractPact/payment/payMentAdd.jsp",
				width : '100%',
				height : '100%',
				title : "付费管理",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			})
		}
		
		function isStr(str, val) {
			if (str.indexOf(val) != -1) {
				return true
			} else {
				return false
			}
		}

		function payType(e) {
			return nui.getDictText("payType", e.value);
		}

		function ZH_INVOICE_NAME_TYPE(e) {
			return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
		}

		function MIS_MA_INVOICETYPE(e) {
			return nui.getDictText("MIS_MA_INVOICETYPE", e.value);
		}

		function CONTRACT_NATURE(e) {
			return nui.getDictText("CONTRACT_NATURE", e.value);
		}

		function ZH_CONTRACT_TYPE(e) {
			return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
		}
		
		function deleteInfo() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行删除", "danger");
				return;
			} else {
				var row = row[0];
				if(row.appStatus == '4'){
					if (!confirm("是否删除？")) {
						return;
					} else {
						if (row) {
							var json = nui.encode({
								'data' : row
							});
							nui.ajax({
								url : "com.zhonghe.ame.payment.payMent.deletePayMentById.biz.ext",
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
	</script>
</body>
</html>