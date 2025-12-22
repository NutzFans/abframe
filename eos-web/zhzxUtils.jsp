<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>业务处理工具</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="zhzx-utils-1" style="border: solid 1px #aaa;">
			<legend>
				<span style="color: red">&nbsp;经营管理系统 - 业务处理工具 - 按钮&nbsp;</span>
			</legend>
			<a id="kpgl_sjkpjezdlssjtc" class="nui-button" iconCls="icon-node" onclick="kpgl_sjkpjezdlssjtc()">开票管理 - 实际开票金额字段历史数据填充</a>
			<p></p>
			<a id="kpgl_user_org_tc" class="nui-button" iconCls="icon-node" onclick="kpgl_user_org_tc()">开票管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充</a>
			<p></p>
			<a id="fkgl_user_org_tc" class="nui-button" iconCls="icon-node" onclick="fkgl_user_org_tc()">付款管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充</a>
			<p></p>
			<a id="xecg_user_tc" class="nui-button" iconCls="icon-node" onclick="xecg_user_tc()">小额采购 - 申请人姓名数据填充</a>
			<p></p>
			<a id="psjg_final_purchas_mode_tc" class="nui-button" iconCls="icon-node" onclick="psjg_final_purchas_mode_tc()">评审结构 - 最终采购方式数据填充</a>
			<p></p>
			<a id="cglx_final_purchas_mode_tc" class="nui-button" iconCls="icon-node" onclick="cglx_final_purchas_mode_tc()">采购立项 - 最终采购方式数据填充</a>
			<p></p>
			<a id="scjy_cydw_sjsx" class="nui-button" iconCls="icon-node" onclick="scjy_cydw_sjsx()">市场经营 - 参与单位数据刷新</a>
			<p></p>
			<input id="yearMonth" class="nui-monthpicker" style="width: 110px" />
			<a id="cwgl_yszk_kz" class="nui-button" iconCls="icon-node" onclick="cwgl_yszk_kz()">财务管理 - 应收账款快照生成</a>
			<p></p>
			<form id="gszdrw_import_excel_form" enctype="multipart/form-data" method="post" class="form-horizontal">
				<div>
					<input id="gszdrw_import_excel_path" class="nui-htmlfile" name="filePath" style="width: 250px" />
					<input id="gszdrw_import_excel" class="nui-button" iconCls="icon-upload" style="margin-left: 10px" onclick="gszdrw_import_excel()" text="公司重点任务 - 导入Excel数据" />
				</div>
			</form>
			<p></p>
			<form id="cqzcgl_import_excel_form" enctype="multipart/form-data" method="post" class="form-horizontal">
				<div>
					<input id="cqzcgl_import_excel_path" class="nui-htmlfile" name="filePath" style="width: 250px" />
					<input id="cqzcgl_import_excel" class="nui-button" iconCls="icon-upload" style="margin-left: 10px" onclick="cqzcgl_import_excel()" text="长期资产管理 - 导入Excel数据" />
				</div>
			</form>
			<p></p>
			<form id="ndystb_import_excel_form" enctype="multipart/form-data" method="post" class="form-horizontal">
				<div>
					<input id="ndystb_import_excel_path" class="nui-htmlfile" name="filePath" style="width: 250px" />
					<input class="nui-textbox" name="budgetYear" style="width: 100px" />
					<input id="ndystb_import_excel" class="nui-button" iconCls="icon-upload" style="margin-left: 10px" onclick="ndystb_import_excel()" text="年度预算填报 - 导入Excel数据" />
				</div>
			</form>
			<p></p>
			<form id="gszdrw_import_excel_form_update" enctype="multipart/form-data" method="post" class="form-horizontal">
				<div>
					<input id="gszdrw_import_excel_path_update" class="nui-htmlfile" name="filePath" style="width: 250px" />
					<input id="gszdrw_import_excel_update" class="nui-button" iconCls="icon-upload" style="margin-left: 10px" onclick="gszdrw_import_excel_update()" text="公司重点任务 - 导入Excel数据 - 更新数据" />
				</div>
			</form>
			<p></p>
			<a id="htbh_sxhtbhfhgf" class="nui-button" iconCls="icon-node" onclick="htbh_sxhtbhfhgf()">合同编号 - 刷新合同编号符合规范</a>
			<p></p>
			<a id="khxt_sfhtkpglscjy" class="nui-button" iconCls="icon-node" onclick="khxt_sfhtkpglscjy()">客户信息导出 - 已关联收费合同、开票管理、市场经营</a>
		</fieldset>

	</div>
	
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>		

	<script type="text/javascript">
		nui.parse();

		// 开票管理 - 实际开票金额字段历史数据填充
		function kpgl_sjkpjezdlssjtc() {
			nui.get("kpgl_sjkpjezdlssjtc").disable();
			if (!confirm("是否执行[开票管理 - 实际开票金额字段历史数据填充]操作？")) {
				nui.get("kpgl_sjkpjezdlssjtc").enable();
			} else {
				nui.ajax({
					url : "com.primeton.eos.common.zhzxUtils.kpgl_sjkpjezdlssjtc.biz.ext",
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(result) {
						if (result.data == "1") {
							nui.alert("开票管理 - 实际开票金额字段历史数据填充 - 执行成功");
						} else {
							nui.alert("开票管理 - 实际开票金额字段历史数据填充 - 执行失败");
						}
						nui.get("kpgl_sjkpjezdlssjtc").enable();
					}
				});
			}
		}

		// 开票管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充
		function kpgl_user_org_tc() {
			nui.get("kpgl_user_org_tc").disable();
			if (!confirm("是否执行[开票管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充]操作？")) {
				nui.get("kpgl_user_org_tc").enable();
			} else {
				nui.ajax({
					url : "com.primeton.eos.common.zhzxUtils.kpgl_user_org_tc.biz.ext",
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(result) {
						if (result.data == "1") {
							nui.alert("开票管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充 - 执行成功");
						} else {
							nui.alert("开票管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充 - 执行失败");
						}
						nui.get("kpgl_user_org_tc").enable();
					}
				});
			}
		}

		// 付款管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充
		function fkgl_user_org_tc() {
			nui.get("fkgl_user_org_tc").disable();
			if (!confirm("是否执行[付款管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充]操作？")) {
				nui.get("fkgl_user_org_tc").enable();
			} else {
				nui.ajax({
					url : "com.primeton.eos.common.zhzxUtils.fkgl_user_org_tc.biz.ext",
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(result) {
						if (result.data == "1") {
							nui.alert("付款管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充 - 执行成功");
						} else {
							nui.alert("付款管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充 - 执行失败");
						}
						nui.get("fkgl_user_org_tc").enable();
					}
				});
			}
		}

		// 小额采购 - 申请人姓名数据填充
		function xecg_user_tc() {
			nui.get("xecg_user_tc").disable();
			if (!confirm("是否执行[小额采购 - 申请人姓名数据填充]操作？")) {
				nui.get("xecg_user_tc").enable();
			} else {
				nui.ajax({
					url : "com.primeton.eos.common.zhzxUtils.xecg_user_tc.biz.ext",
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(result) {
						if (result.data == "1") {
							nui.alert("小额采购 - 申请人姓名数据填充 - 执行成功");
						} else {
							nui.alert("小额采购 - 申请人姓名数据填充 - 执行失败");
						}
						nui.get("xecg_user_tc").enable();
					}
				});
			}
		}

		// 评审结构 - 最终采购方式数据填充
		function psjg_final_purchas_mode_tc() {
			nui.get("psjg_final_purchas_mode_tc").disable();
			if (!confirm("是否执行[评审结构 - 最终采购方式数据填充]操作？")) {
				nui.get("psjg_final_purchas_mode_tc").enable();
			} else {
				nui.ajax({
					url : "com.primeton.eos.common.zhzxUtils.psjg_final_purchas_mode_tc.biz.ext",
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(result) {
						if (result.data == "1") {
							nui.alert("评审结构 - 最终采购方式数据填充 - 执行成功");
						} else {
							nui.alert("评审结构 - 最终采购方式数据填充 - 执行失败");
						}
						nui.get("psjg_final_purchas_mode_tc").enable();
					}
				});
			}
		}

		// 采购立项 - 最终采购方式数据填充
		function cglx_final_purchas_mode_tc() {
			nui.get("cglx_final_purchas_mode_tc").disable();
			if (!confirm("是否执行[采购立项 - 最终采购方式数据填充]操作？")) {
				nui.get("cglx_final_purchas_mode_tc").enable();
			} else {
				nui.ajax({
					url : "com.primeton.eos.common.zhzxUtils.cglx_final_purchas_mode_tc.biz.ext",
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(result) {
						if (result.data == "1") {
							nui.alert("采购立项 - 最终采购方式数据填充 - 执行成功");
						} else {
							nui.alert("采购立项 - 最终采购方式数据填充 - 执行失败");
						}
						nui.get("cglx_final_purchas_mode_tc").enable();
					}
				});
			}
		}

		// 市场经营 - 参与单位数据刷新
		function scjy_cydw_sjsx() {
			nui.get("scjy_cydw_sjsx").disable();
			if (!confirm("是否执行[市场经营 - 参与单位数据刷新]操作？")) {
				nui.get("scjy_cydw_sjsx").enable();
			} else {
				nui.ajax({
					url : "com.primeton.eos.common.zhzxUtils.scjy_cydw_sjsx.biz.ext",
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(result) {
						if (result.data == "1") {
							nui.alert("市场经营 - 参与单位数据刷新 - 执行成功");
						} else {
							nui.alert("市场经营 - 参与单位数据刷新 - 执行失败");
						}
						nui.get("scjy_cydw_sjsx").enable();
					}
				});
			}
		}

		// 财务管理 - 应收账款快照
		function cwgl_yszk_kz() {
			var yearMonth = nui.get("yearMonth").getValue();
			nui.get("cwgl_yszk_kz").disable();
			if (!confirm("是否执行[财务管理 - 应收账款快照生成]操作？")) {
				nui.get("cwgl_yszk_kz").enable();
			} else {
				var json = nui.encode({
					"yearMonth" : yearMonth
				});
				nui.ajax({
					url : "com.primeton.eos.common.zhzxUtils.cwgl_yszk_kz.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(result) {
						if (result.data == "1") {
							nui.alert("财务管理 - 应收账款快照生成 - 执行成功");
						} else {
							nui.alert("财务管理 - 应收账款快照生成 - 执行失败");
						}
						nui.get("cwgl_yszk_kz").enable();
					}
				});
			}
		}

		// 公司重点任务 - 导入Excel数据
		function gszdrw_import_excel() {
			nui.get("gszdrw_import_excel").disable();
			if (!confirm("是否执行[公司重点任务 - 导入Excel数据]操作？")) {
				nui.get("gszdrw_import_excel").enable();
			} else {
				var uploadEventFile = nui.get("gszdrw_import_excel_path").getValue();
				if (uploadEventFile == '' || uploadEventFile == null) {
					nui.alert("请选择excel,再上传", "");
					nui.get("gszdrw_import_excel").enable();
					return;
				} else if (uploadEventFile.lastIndexOf(".xls") < 0) {
					nui.alert("只能上传Excel文件", "");
					nui.get("gszdrw_import_excel").enable();
					return;
				} else {
					document.getElementById('gszdrw_import_excel_form').action = 'default/zhzxUtils.importGszdrw.flow';
					document.getElementById('gszdrw_import_excel_form').submit();
				}
			}
		}

		// 长期资产管理 - 导入Excel数据
		function cqzcgl_import_excel() {
			nui.get("cqzcgl_import_excel").disable();
			if (!confirm("是否执行[长期资产管理 - 导入Excel数据]操作？")) {
				nui.get("cqzcgl_import_excel").enable();
			} else {
				var uploadEventFile = nui.get("cqzcgl_import_excel_path").getValue();
				if (uploadEventFile == '' || uploadEventFile == null) {
					nui.alert("请选择excel,再上传", "");
					nui.get("cqzcgl_import_excel").enable();
					return;
				} else if (uploadEventFile.lastIndexOf(".xls") < 0) {
					nui.alert("只能上传Excel文件", "");
					nui.get("cqzcgl_import_excel").enable();
					return;
				} else {
					document.getElementById('cqzcgl_import_excel_form').action = 'default/zhzxUtils.importCqzcgl.flow';
					document.getElementById('cqzcgl_import_excel_form').submit();
				}
			}
		}

		// 年度预算填报 - 导入Excel数据
		function ndystb_import_excel() {
			nui.get("ndystb_import_excel").disable();
			if (!confirm("是否执行[年度预算填报 - 导入Excel数据]操作？")) {
				nui.get("ndystb_import_excel").enable();
			} else {
				var uploadEventFile = nui.get("ndystb_import_excel_path").getValue();
				if (uploadEventFile == '' || uploadEventFile == null) {
					nui.alert("请选择excel,再上传", "");
					nui.get("ndystb_import_excel").enable();
					return;
				} else if (uploadEventFile.lastIndexOf(".xls") < 0) {
					nui.alert("只能上传Excel文件", "");
					nui.get("ndystb_import_excel").enable();
					return;
				} else {
					document.getElementById('ndystb_import_excel_form').action = 'default/zhzxUtils.importNdystb.flow';
					document.getElementById('ndystb_import_excel_form').submit();
				}
			}
		}

		// 公司重点任务 - 导入Excel数据 - 更新数据
		function gszdrw_import_excel_update() {
			nui.get("gszdrw_import_excel_update").disable();
			if (!confirm("是否执行[公司重点任务 - 导入Excel数据 - 更新数据]操作？")) {
				nui.get("gszdrw_import_excel_update").enable();
			} else {
				var uploadEventFile = nui.get("gszdrw_import_excel_path_update").getValue();
				if (uploadEventFile == '' || uploadEventFile == null) {
					nui.alert("请选择excel,再上传", "");
					nui.get("gszdrw_import_excel_update").enable();
					return;
				} else if (uploadEventFile.lastIndexOf(".xls") < 0) {
					nui.alert("只能上传Excel文件", "");
					nui.get("gszdrw_import_excel_update").enable();
					return;
				} else {
					document.getElementById('gszdrw_import_excel_form_update').action = 'default/zhzxUtils.importGszdrwUpdate.flow';
					document.getElementById('gszdrw_import_excel_form_update').submit();
				}
			}
		}

		// 合同编号 - 刷新合同编号符合规范
		function htbh_sxhtbhfhgf() {
			nui.get("htbh_sxhtbhfhgf").disable();
			if (!confirm("是否执行[合同编号 - 刷新合同编号符合规范]操作？")) {
				nui.get("htbh_sxhtbhfhgf").enable();
			} else {
				nui.ajax({
					url : "com.primeton.eos.common.zhzxUtils.htbh_sxhtbhfhgf.biz.ext",
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(result) {
						if (result.data == "1") {
							nui.alert("合同编号 - 刷新合同编号符合规范 - 执行成功");
						} else {
							nui.alert("合同编号 - 刷新合同编号符合规范 - 执行失败");
						}
						nui.get("htbh_sxhtbhfhgf").enable();
					}
				});
			}
		}

		// 客户信息导出 - 已关联收费合同、开票管理、市场经营
		function khxt_sfhtkpglscjy() {
			nui.get("khxt_sfhtkpglscjy").disable();
			if (!confirm("是否执行[客户信息导出 - 已关联收费合同、开票管理、市场经营]操作？")) {
				nui.get("khxt_sfhtkpglscjy").enable();
			} else {
				var data = {};
				exportExcel({
					"data" : data,
					"url" : "com.primeton.eos.common.zhzxUtils.khxt_sfhtkpglscjy.biz.ext",
					"fileName" : "客户信息"
				})
				nui.get("khxt_sfhtkpglscjy").enable();
			}
		}
	</script>

</body>
</html>