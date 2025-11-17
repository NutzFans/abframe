<%@page pageEncoding="UTF-8"%>
<%@include file="/purchase/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>采购计划申请查看</title>
<meta name="renderer" content="webkit">
<script src="<%=request.getContextPath()%>/common/nui/warterMark.js" type="text/javascript"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
<style type="text/css">
.layui-table,.layui-table-view {
	margin: 0px;
}

.layui-elem-quote {
	font-weight: bold;
}

.layui-table-cell {
	font-size: 14px;
	padding: 0 5px;
	height: auto;
	overflow: visible;
	text-overflow: inherit;
	white-space: normal;
	word-break: break-all;
}
</style>
</head>
<body>
	<div style="margin: 0 auto; width: 98%; height: auto;">
		<form class="layui-form layui-form-pane" lay-filter="dataFrm" id="dataFrm">
			<h2 id="name" align="center" style="margin-top: 10px"></h2>
			<blockquote class="layui-elem-quote" style="margin-top: 10px; margin-bottom: 5px">
				基本信息
				<i id="status" class="layui-icon" style="font-size: 15px; float: right; color: #5FB878;"></i>
			</blockquote>
			<div class="layui-row">
				<div class="layui-col-xs12">
					<label class="layui-form-label" style="width: 170px">采购计划名称</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="name" disabled="disabled" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-xs3">
					<label class="layui-form-label" style="width: 170px">计划年度</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="year" disabled="disabled" class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3">
					<label class="layui-form-label" style="width: 170px">计划类型</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="extend2" disabled="disabled" class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3">
					<label class="layui-form-label" style="width: 170px">经办人</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="infomantUser" disabled="disabled" class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3">
					<label class="layui-form-label" style="width: 170px">采购计划单位</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="needOrgName" disabled="disabled" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-xs3">
					<label class="layui-form-label" style="width: 170px">申请时间</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="createdTime" disabled="disabled" class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3">
					<label class="layui-form-label" style="width: 170px">采购类型</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="type" disabled="disabled" class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3">
					<label class="layui-form-label" style="width: 170px">计划金额(万元)</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="budgetAmount" disabled="disabled" class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs3">
					<label class="layui-form-label" style="width: 170px">变更后计划金额(万元)</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="newBudgetAmount" disabled="disabled" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-xs12">
					<div class="layui-form-text">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-block">
							<textarea autoHeight="true" name="remark" disabled="disabled" class="layui-textarea"></textarea>
						</div>
					</div>
				</div>
			</div>
		</form>

		<blockquote class="layui-elem-quote" style="margin-top: 10px; margin-bottom: 5px">
			附件信息&nbsp;&nbsp;&nbsp;&nbsp;
			<a href='javascript:void(0)' onclick='downloadZipFile();' style='color: #1b3fba'>打包下载</a>
		</blockquote>
		<table id="fileGrid" class="layui-hide"></table>

		<blockquote class="layui-elem-quote" style="margin-top: 10px; margin-bottom: 5px">计划明细(单位万元)</blockquote>
		<table id="grid" class="layui-hide"></table>
	</div>

	<form name="exprotZipFileFlow" id="exprotZipFileFlow" action="com.primeton.eos.ame_common.ameExportZip.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script src="<%=request.getContextPath()%>/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>

	<script type="text/javascript">
		setWatermark('<%=userName%>');
			
		layui.use([ 'jquery', 'form', 'table' ], function() {
			var $ = layui.jquery;
			var form = layui.form;
			var table = layui.table;
			var extend2;
			id = <%=request.getParameter("id")%>;
			
			var budgetAccountDatas, ledgerCategoryDatas, ledgerNameDatas;
			var needOrgId = ""; // 新增：存储needOrgId，用于判断是否隐藏列

			form.render();

			getData();

			function getData() {
				ajaxCommon({
					url : "com.zhonghe.ame.purchase.purchaseplan.findLedgerCategoryList.biz.ext",
					async : false,
					success : function(result) {
						ledgerCategoryDatas = result.ledgerCategoryList;			
					}
				});
				ajaxCommon({
					url : "com.zhonghe.ame.purchase.purchaseplan.findLedgerNameList.biz.ext",
					async : false,
					success : function(result) {
						ledgerNameDatas = result.ledgerNameList;			
					}
				});			
				$.ajax({
					url : "purchase/plan/com.zhonghe.ame.purchase.purchaseItems.queryPurPlanDetailById.biz.ext",
					data : {
						id : id
					},
					type : "POST",
					dataType : "json",
					success : function(data) {
						var formData = data.purPlan;
						needOrgId = formData.needOrgId || ""; // 关键：获取needOrgId并赋值
						var json = nui.encode({'secOrg' : data.purPlan.needOrgId});
						ajaxCommon({
							url : "com.zhonghe.ame.purchase.purchaseplan.findBudgetAccountList.biz.ext",
							data : json,
							async : false,
							success : function(result) {
								budgetAccountDatas = result.budgetAccountList;
							}
						});							
						document.getElementById("name").innerHTML = formData.name;
						renderStatus(formData.status);
						formData.createdTime = layui.util.toDateString(formData.createdTime, 'yyyy-MM-dd');
						formData.extend2 = nui.getDictText('CG_PLAN_TYPE', formData.extend2);
						formData.type = nui.getDictText('ZH_PURCHASE_NEW', formData.type);
						formData.newBudgetAmount = formData.budgetAmount == formData.newBudgetAmount ? "/" : formData.newBudgetAmount;
						form.val("dataFrm", formData);
						extend2 = formData.extend2;

						$(function() {
							$.fn.autoHeight = function() {
								function autoHeight(elem) {
									elem.style.height = 'auto';
									elem.scrollTop = 0; //防抖动
									elem.style.height = elem.scrollHeight + 5 + 'px';
								}
								this.each(function() {
									autoHeight(this);
									$(this).on('keyup', function() {
										autoHeight(this);
									});
								});
							}
							$('textarea[autoHeight]').autoHeight();
						})
						
						// 关键：获取数据后渲染表格（确保needOrgId已确定）
						renderPlanGrid();
					}
				});
			}

			function renderStatus(status) {
				if (status == 2) {
					document.getElementById("status").innerHTML = "审批通过 ";
				} else if (status == 1 || status == 0) {
					document.getElementById("status").innerHTML = "审批中 ";
					document.getElementById("status").setAttribute("style", "color:#1E9FFF;font-size: 15px;float:right;");
				} else if (status == 4) {
					document.getElementById("status").innerHTML = "已终止 ";
					document.getElementById("status").setAttribute("style", "color:red;font-size: 15px;float:right;");
				}
			}
			
	        function getTextByValue(data, value, defaultValue, idField, textField) {
	            if (!idField) idField = "id";
	            if (!textField) textField = "text";
	            for (var i = 0, l = data.length; i < l; i++) {
	                var o = data[i];
	                if (o[idField] == value) {
	                    return o[textField];
	                }
	            }
	            return defaultValue;
	        }			

			var fileGridInt = table.render({
				elem : '#fileGrid',
				url : 'com.primeton.eos.ame_common.file.getFiles.biz.ext',
				where : {
					"groupid" : "PURCHASEPLAN",
					"relationid" : id,
					"sortField" : "fileTime",
					"sortOrder" : "desc"
				},
				method : 'post',
				cols : [ [ {
					field : 'fileName',
					width : '90%',
					title : '附件名称',
					templet : "<div>{{getdetail(d)}}</div>"
				}, {
					field : 'fileSize',
					width : '10%',
					title : '文件大小',
					templet : "<div>{{getFileSize(d.fileSize)}}</div>"
				} ] ],
				parseData : function(res) {
					return {
						"code" : "0",
						"data" : res.files
					};
				}
			});

			// 渲染计划明细表（动态控制列显示）
			function renderPlanGrid() {
				// 定义完整列配置（包含所有列）
				var colsConfig = [ [ {
					field : 'code',
					width : 200,
					title : '计划编号'
				}, {
					field : 'materialName',
					title : '物项名称'
				}, {
					field : 'purchaseFirstName',
					title : '物项大类名称'
				}, {
					field : 'purchaseTwoName',
					title : '中类名称'
				}, {
					field : 'newNumber',
					title : '数量'
				}, {
					field : 'oldBudgetAmount',
					title : '预算金额'
				}, {
					field : 'yearBudgetAmount',
					title : '本年预计使用金额'
				}, {
					field : 'newBudgetAmount',
					title : '变更后金额',
					templet : function(d) {
						return d.oldBudgetAmount == d.newBudgetAmount ? "/" : d.newBudgetAmount;
					}
				}, {
					field : 'sumamount',
					title : '已立项金额',
					templet : function(d) {
						return extend2 == "变更计划" ? "/" : d.sumamount;
					}
				}, {
					field : 'budgetAccount',
					title : '财务预算主体',
					templet : function(d) {
						return getTextByValue(budgetAccountDatas, d.budgetAccount, null, "id", "name");
					}
				}, {
					field : 'ledgerCategory',
					title : '财务科目分类',
					templet : function(d) {
						return getTextByValue(ledgerCategoryDatas, d.ledgerCategory, null, "id", "name");
					}
				}, {
					field : 'ledgerName',
					title : '财务科目名称',
					templet : function(d) {
						return getTextByValue(ledgerNameDatas, d.ledgerName, null, "id", "name");
					}
				}, {
					field : 'itemPlanType',
					title : '计划类型'
				}, {
					field : 'sumamountRate',
					title : '计划执行情况',
					templet : function(d) {
						return extend2 == "变更计划" ? "/" : d.sumamountRate;
					}
				}, {
					field : 'remark',
					width : 300,
					title : '备注'
				} ] ];

				// 关键判断：当needOrgId为"1111"时，移除财务相关三列
				if (needOrgId == "1111") {
					// 财务预算主体、财务科目分类、财务科目名称对应索引为9、10、11（从0开始）
					colsConfig[0].splice(9, 3); // 从索引9开始，删除3列
				}

				// 渲染表格
				table.render({
					elem : '#grid',
					url : 'com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext',
					where : {
						"planId" : id
					},
					cellMinWidth : 90,
					method : 'post',
					cols : colsConfig, // 使用动态处理后的列配置
					parseData : function(res) {
						return {
							"code" : "0",
							"data" : res.purPlanItem
						};
					}
				});
			}

		});	

		function getdetail(e) {
			return "<a href='javascript:void(0)' style ='color: #1b3fba;'  onclick='checkDetail(" + e.fileId + ");' title='点击查看'>" + e.fileName + "</a>";
		}

		function checkDetail(e) {
			var url = "com.primeton.components.web.fileupload.getfile.flow?fileId=" + e;
			window.open(url, "_self");
		}

		function getFileSize(e) {
			var value = e;
			var unit = "KB";
			if (value > 0) {
				value = (value / 1024).toFixed(3);
				if (value >= 1024) {
					value = (value / 1024).toFixed(3);
					unit = "MB";
				}
			}
			return value + unit;
		}

		function downloadZipFile() {
			if (!confirm("是否确认打包下载？")) {
				return;
			}
			var relationId = id;
			var fileCatalog = 'PurchasePlan';
			var json = nui.encode({
				'relationId' : relationId,
				'fileCatalog' : fileCatalog
			});
			nui.ajax({
				url : "com.primeton.eos.ame_common.file_zip.fileZip.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					if (filePath != null && filePath != "") {
						var fileName = "采购计划_" + document.getElementById("name").innerHTML + "_附件.zip";
						var frm = document.getElementById("exprotZipFileFlow");
						frm.elements["downloadFile"].value = filePath;
						frm.elements["fileName"].value = fileName;
						frm.submit();
					}
				}
			})
		}
				
	</script>

</body>
</html>