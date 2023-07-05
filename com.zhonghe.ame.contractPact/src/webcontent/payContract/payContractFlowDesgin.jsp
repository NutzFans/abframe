<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>付费合同 - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/payContractFlow.jpg'); width: 1431px; height: 2294px; position: relative;">

		<!-- 承办部门项监部负责人 -->
		<div id="div1" style="position: absolute; left: 520px; top: 150px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 项监部负责人审批 -->
		<div id="div2" style="position: absolute; left: 1099px; top: 150px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司财务部审批 -->
		<div id="div3" style="position: absolute; left: 520px; top: 277px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门领导审批 -->
		<div id="div4" style="position: absolute; left: 748px; top: 277px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门经营管理审批 -->
		<div id="div5" style="position: absolute; left: 1099px; top: 277px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司经营管理部门经办人审批 -->
		<div id="div6" style="position: absolute; left: 520px; top: 402px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 财务审批 -->
		<div id="div7" style="position: absolute; left: 746px; top: 411px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门领导审批 -->
		<div id="div8" style="position: absolute; left: 1102px; top: 411px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司经营管理部门主任审批 -->
		<div id="div9" style="position: absolute; left: 520px; top: 537px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 法务审批 -->
		<div id="div10" style="position: absolute; left: 746px; top: 539px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司负责人审批 -->
		<div id="div11" style="position: absolute; left: 520px; top: 673px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司负责人复核 -->
		<div id="div12" style="position: absolute; left: 221px; top: 763px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 审计法务部领导审批 -->
		<div id="div13" style="position: absolute; left: 748px; top: 764px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门领导复核 -->
		<div id="div14" style="position: absolute; left: 1318px; top: 765px; width: 75px; height: 50px; cursor: pointer;"></div>

	</div>

	<script src="/default/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		layui.use([ 'jquery', 'layer' ], function() {
			$ = layui.jquery;
			layer = layui.layer;

			// 承办部门项监部负责人
			$('#div1').click(function() {
				layer.open({
					title : '承办部门项监部负责人 - 调整审批人',
					content : '通过【机构人员管理】模块修改组织的【机构主管人员】字段',
					btn : []
				});
			});

			// 项监部负责人审批
			$('#div2').click(function() {
				layer.open({
					title : '项监部负责人审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改组织的【机构主管人员】字段',
					btn : []
				});
			});

			// 分公司财务部审批
			$('#div3').click(function() {
				layer.open({
					title : '分公司财务部审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSCWBSP】的字典项数据',
					btn : []
				});
			});

			// 部门领导审批
			$('#div4').click(function() {
				layer.open({
					title : '部门领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改组织的【机构主管人员】字段',
					btn : []
				});
			});

			// 部门经营管理审批
			$('#div5').click(function() {
				layer.open({
					title : '部门经营管理审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage13】的角色数据',
					btn : []
				});
			});

			// 分公司经营管理部门经办人审批
			$('#div6').click(function() {
				layer.open({
					title : '分公司经营管理部门经办人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHB-FF】的字典项数据',
					btn : []
				});
			});

			// 财务审批
			$('#div7').click(function() {
				layer.open({
					title : '财务审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_ZNBMCWSP】的字典项数据',
					btn : []
				});
			});

			// 部门领导审批
			$('#div8').click(function() {
				layer.open({
					title : '部门领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_SBZXBMLDSP】的字典项数据',
					btn : []
				});
			});

			// 分公司经营管理部门主任审批
			$('#div9').click(function() {
				layer.open({
					title : '分公司经营管理部门主任审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHBLD】的字典项数据',
					btn : []
				});
			});

			// 法务审批
			$('#div10').click(function() {
				layer.open({
					title : '法务审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FWSP】的字典项数据',
					btn : []
				});
			});

			// 分公司负责人审批
			$('#div11').click(function() {
				layer.open({
					title : '分公司负责人审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改组织的【机构主管人员】字段',
					btn : []
				});
			});

			// 分公司负责人复核
			$('#div12').click(function() {
				layer.open({
					title : '分公司负责人复核 - 调整审批人',
					content : '通过【机构人员管理】模块修改组织的【机构主管人员】字段',
					btn : []
				});
			});

			// 审计法务部领导审批
			$('#div13').click(function() {
				layer.open({
					title : '审计法务部领导审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage7】的角色数据',
					btn : []
				});
			});
			
			// 部门领导复核
			$('#div14').click(function() {
				layer.open({
					title : '部门领导复核 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_SBZXBMLDSP】的字典项数据',
					btn : []
				});
			});			

		});
	</script>

</body>
</html>