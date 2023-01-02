<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
	<head>
		<title>零星采购</title>
		<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
   		</style>
	</head>
	<body>
<div id="form1">
	<div class="nui-toolbar" style="border-bottom:0px;padding:0px;">
	</div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table align="center" border="0" width="100%" class="form_table">
						<tr>
							<td class="form_label" align="right">零星采购名称</td>
							<td>
								<input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" />
					<input class="nui-hidden" name="criteria._expr[1]._property" value="purchaseName" />
					<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
				</td>
				<td class="form_label" align="right">零星采购编号</td>
				<td>
					<input name="criteria._expr[2]._value" class="nui-textbox" dictTypeId="ZH_BIDSTATUS"
						shownullItem="true" style="width:150px;" />
					<input class="nui-hidden" name="criteria._expr[2]._property" value="purchaseCode" />
					<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
				</td>
				<td class="form_label" align="right">采购单位</td>
				<td colspan="1">
					<input id="orgid2" name="criteria._ref[0]._expr[0]._value" style="width:50%;"
						class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs"
									showNullItem="true" allowInput="true" />
								<input class="nui-hidden" name="criteria._expr[5]._property" value="orgId" />
								<input class="nui-hidden" name="criteria._expr[5]._op" value="in" id="tempCond1" />
								<input class="nui-hidden" name="criteria._expr[5]._ref" value="" id="tempCond2" />
								<input class="nui-hidden" name="criteria._ref[0]._id" value="1" />
								<input class="nui-hidden" name="criteria._ref[0]._entity"
									value="org.gocom.abframe.dataset.organization.OmOrganization" />
								<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid" />
								<input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq" />
								<input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like" />
								<input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end" />
								<input class="nui-hidden" name="criteria._or[1]._expr[2]._property" value="orgId" />
								<input class="nui-hidden" name="criteria._or[1]._expr[2]._op" value="in" />
								<input class="nui-hidden" name="criteria._or[1]._expr[2]._value" id="orgids2" />
								
								<input class="nui-hidden" name="criteria._expr[6].createdBy" id="createdBy"  />
								<input class="nui-hidden" name="criteria._expr[6]._op" value="=" />
								<input class="nui-hidden" name="criteria._or[1]._expr[1].createdBy" id="createdBy1"  />
								<input class="nui-hidden" name="criteria._or[1]._expr[1]._op" value="=" />
							</td>


							<td class="form_label" align="right">状态</td>
							<td>
								<input name="criteria._expr[4]._value" class="nui-dictcombobox"
									dictTypeId="ZH_FLOW_TYPE" shownullItem="true" style="width:150px;" />
					<input class="nui-hidden" name="criteria._expr[4]._property" value="status" />
					<input class="nui-hidden" name="criteria._expr[4]._op" value="=" />
				</td>
				<td colspan="9" align="center">
					<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
					<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
				</td>
			</tr>
		</table>
	</div>
</div>

	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
			<tr>
				<td style="width:20%;">
					<a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">新增</a>
					<a class="nui-button" id="checkview" iconCls="icon-print" onclick="print()">打印</a>
					<!-- <a class="nui-button" id="checkview1" iconCls="icon-remove"
						onclick="deleteInfo()">删除</a> -->
				</td>
			</tr>
		</table>
	</div>
	<div class="nui-fit">
	<div id="datagrid1" frozenStartColumn="0" sizeList="[10,20,50,100]" showPager="true"
		dataField="purZeroList"   sortMode="client" class="nui-datagrid" style="width:100%;height:100%;" pageSize="20"
		 url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroList.biz.ext" multiSelect="false">
		<div property="columns">
			<div name="temp123" type="checkcolumn"></div>
			<div type="indexcolumn" align="center" headerAlign="center">序号</div>
			<div field="purchaseName" width="100" align="center" headerAlign="center" allowSort="true"renderer="lookInfo">零星采购名称</div>
			<div field="purchaseCode" width="100" align="center" headerAlign="center" allowSort="true">零星采购编号</div>
			<div field="orgname" width="100" align="center" headerAlign="center" allowSort="true">采购单位</div>
			<div field="status" width="80" align="center" headerAlign="center" allowSort="true"renderer="onActionRenderer">状态</div>
			<div field="createdName" width="100" align="center" headerAlign="center" allowSort="true">申请人</div>
		</div>
	</div>
</div>
		<script type="text/javascript">
			nui.parse();
			var form = new nui.Form("#form1");
			var grid = nui.get("datagrid1");
			init();
			function init() {
				//按钮权限的控制
				getOpeatorButtonAuth("checkview"); //操作按钮权限初始化
				//code:对应功能编码，map：对于机构的查询条件
				var json = {"code":"lxcg","map":{"property":"status","op":"=","value":"running"}};
				ajaxCommon({
					"url": "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
					"data": json,
					"success": function(data) {
						if (data.orgs) {
							if (data.orgs.length == 0) {
								//当没有有权的机构时将申请人设置为登陆人
								 nui.get("createdBy").setValue(userId);
								 nui.get("createdBy1").setValue(userId);
							}
							//根据情况选择一种
							nui.get("orgid2").setData(data.orgs);
							nui.get("orgids2").setValue(data.orgids);
							nui.get("createdBy1").setValue(userId);
						} else {
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createdBy").setValue(userId);
						}
						search();
					}
				});
			}


			function lookInfo(e) {
				var id = e.row.id;
				if (id == 0 || id == null) {
					nui.alert("查询信息有误");
				} else {
					return "<a href='javascript:void(0)' onclick='doView(" + id + ");' title='点击查看'>" + e.value + "</a>";
				}
			}

			function doView(id) {
				var executeUrl = "<%= request.getContextPath() %>/purchase/purzero/zeroPrintAll.jsp?id=" + id;
				window.open(executeUrl);
			}

			function search() {
			if(nui.get("orgid2").getValue() == ""){
	    		nui.get("tempCond1").setValue("=");
	    		nui.get("tempCond2").setValue("");
	    	}else{
	    		nui.get("tempCond1").setValue("in");
	    		nui.get("tempCond2").setValue("1");
	    	}
				var form = new nui.Form("#form1");
				var data = form.getData(); //获取表单JS对象数据
				console.log(data)
				grid.load(data); //datagrid加载数据
			}

			function reset() {
				var form = new nui.Form("#form1");
				form.reset();
				init();
			}

			function deleteInfo() {
				if (!confirm("确定删除吗？")) {
					return;
				} else {
					var row = grid.getSelecteds();
					if (row.length > 1) {
						nui.alert("只能选中一条项目记录进行删除");
					} else {
						var row = row[0];
						console.log(row);
						if (row) {
							var json = nui.encode({id: row.id});
							ajaxCommon({
								"url": "com.zhonghe.ame.purchase.purchaseItems.deleteLxcg.biz.ext",
								"data": json,
								"success": function(data) {
									if (o.result == 1) {
										showTips("删除成功")
										grid.reload();
									} else {
										showTips("删除失败，请联系信息技术部人员！")
									}
								
								}
							});
							row.id;
						} else {
							nui.alert("请选中一条记录", "提示");
						}
					}
				}
			}

			function checkExpNo(reiid) {
				var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
				window.open(executeUrl);
			}

			function onActionRenderer(e) {
				var record = e.record;
				var processId = record.processid;
				console.log(e.value);
				var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) +
					"</a>";
				return s;
			}

			function feeView() {
				var selectRow = grid.getSelected();
				var processId = selectRow.processid;
				var url = "/default/bps/wfclient/task/processinstView.jsp";
				var title = "流程图查看";
				var width = 1000;
				nui.open({
					url: url,
					title: title,
					width: width,
					height: 550,
					onload: function() {
						var iframe = this.getIFrameEl();
						if (iframe.contentWindow.initData) {
							iframe.contentWindow.initData({
								"processInstID": processId
							});
						}
					},
					ondestroy: function(action) {}
				});
			}

			function add() {
				nui.open({
					url: "/default/purchase/purzero/addZeroPurchase.jsp",
					width: "70%",
					height: "75%",
					title:"&nbsp;",
					onload: function() {
						var iframe = this.getIFrameEl();
					},
					ondestroy: function(action) {
						reset();
					}
				})
			}
			
			function print() {
				var row = grid.getSelected();
				if (row) {
					executeUrl = "<%= request.getContextPath() %>/purchase/purzero/zeroPrintAll.jsp?id=" + row.id;
					window.open(executeUrl);
				}else {
					showTips("请选中一条记录");
				}
			}
		</script>
	</body>
</html>
