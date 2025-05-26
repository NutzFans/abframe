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
				<span style="color: red">经营管理系统 - 业务处理工具 - 按钮</span>
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
		</fieldset>
	</div>

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
		
	</script>

</body>
</html>