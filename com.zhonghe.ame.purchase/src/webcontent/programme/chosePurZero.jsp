<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp" %>
<html>
<head>
	<title>零星采购</title>
	<style type="text/css">
		body {margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;}
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

							<input class="nui-hidden" name="criteria._expr[6].createdBy" id="createdBy" />
							<input class="nui-hidden" name="criteria._expr[6]._op" value="=" />
							<input class="nui-hidden" name="criteria._or[1]._expr[1].createdBy" id="createdBy1" />
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
	<div class="nui-fit">
		<div id="datagrid1" frozenStartColumn="0" sizeList="[10,20,50,100]" showPager="true"
			dataField="purZeroList" sortMode="client" class="nui-datagrid" style="width:100%;height:80%;"
			pageSize="20" url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroList.biz.ext"
			multiSelect="false">
			<div property="columns">
				<div name="temp123" type="checkcolumn"></div>
				<div type="indexcolumn" align="center" headerAlign="center">序号</div>
				<div field="purchaseName" width="100" align="left" headerAlign="center" allowSort="true" renderer="lookInfo">零星采购名称</div>
				<div field="purchaseCode" width="100" align="left" headerAlign="center" allowSort="true"> 零星采购编号</div>
				<div field="orgname" width="100" align="left" headerAlign="center" allowSort="true">采购单位</div>
				<div field="status" width="80" align="center" headerAlign="center" allowSort="true" renderer="onActionRenderer">状态</div>
				<div field="createdName" width="100" align="center" headerAlign="center" allowSort="true">申请人
				</div>
			</div>
		</div>
		<div style="text-align: center;padding: 10px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">确定</a>
			<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
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
			search();
			function doView(id) {
				var executeUrl = "<%= request.getContextPath() %>/purchase/purzero/zeroPrintAll.jsp?id=" + id;
				window.open(executeUrl);
			}

			function search() {
				if (nui.get("orgid2").getValue() == "") {
					nui.get("tempCond1").setValue("=");
					nui.get("tempCond2").setValue("");
				} else {
					nui.get("tempCond1").setValue("in");
					nui.get("tempCond2").setValue("1");
				}
				var form = new nui.Form("#form1");
				var data = form.getData(); //获取表单JS对象数据
				grid.load(data); //datagrid加载数据
			}

			function reset() {
				var form = new nui.Form("#form1");
				form.reset();
				init();
			}

		function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
		function onOk(){
			var row = grid.getSelected();
            CloseWindow("ok"); 
		}
		
		 function CloseWindow(action) {
    	      
		    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		    else window.close();            
		}
		function GetData() {
	        var row = grid.getSelected();
	        return row;
    	}
    	function onActionRenderer(e) {
				var record = e.record;
				var processId = record.processid;
				console.log(e.value);
				var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) +
					"</a>";
				return s;
			}
	</script>
</body>
</html>