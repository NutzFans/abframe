<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>框架协议 - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/feameAgreementFlow.png'); width: 1463px; height: 2059px; position: relative;">

		<!-- 承办部门项监部审批 -->
		<div id="div1" style="position: absolute; left: 88px; top: 131px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司经营计划部经办人审批 -->
		<div id="div2" style="position: absolute; left: 85px; top: 384px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司经营计划部领导审批 -->
		<div id="div3" style="position: absolute; left: 89px; top: 494px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司领导 -->
		<div id="div4" style="position: absolute; left: 89px; top: 641px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门领导审批 -->
		<div id="div5" style="position: absolute; left: 385px; top: 536px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 设备监理中心经营管理审批 -->
		<div id="div6" style="position: absolute; left: 1091px; top: 411px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 项监部负责人审批 -->
		<div id="div7" style="position: absolute; left: 836px; top: 526px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 设备监理中心领导审批 -->
		<div id="div8" style="position: absolute; left: 1109px; top: 642px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部经办人审批 -->
		<div id="div9" style="position: absolute; left: 390px; top: 794px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部领导审批 -->
		<div id="div10" style="position: absolute; left: 390px; top: 914px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 法务合规审核 -->
		<div id="div11" style="position: absolute; left: 386px; top: 1058px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 审计法务部领导审批 -->
		<div id="div12" style="position: absolute; left: 388px; top: 1170px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部经办人复审 -->
		<div id="div13" style="position: absolute; left: 534px; top: 1170px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 承办部门分管领导审批 -->
		<div id="div14" style="position: absolute; left: 208px; top: 1378px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司承办部门分管领导审批 -->
		<div id="div15" style="position: absolute; left: 391px; top: 1380px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总经理审批 -->
		<div id="div16" style="position: absolute; left: 388px; top: 1508px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 法定代表人审批 -->
		<div id="div17" style="position: absolute; left: 389px; top: 1632px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 合同盖章 -->
		<div id="div18" style="position: absolute; left: 389px; top: 1740px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 协管领导审批 -->
		<div id="div19" style="position: absolute; left: 54px; top: 1377px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 协管领导审批 -->
		<div id="div20" style="position: absolute; left: 566px; top: 1378px; width: 75px; height: 50px; cursor: pointer;"></div>				

	</div>

	<script src="/default/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		layui.use([ 'jquery', 'layer' ], function() {
			$ = layui.jquery;
			layer = layui.layer;

			// 承办部门项监部审批
			$('#div1').click(function() {
				layer.open({
					title : '承办部门项监部审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 分公司经营计划部经办人审批
			$('#div2').click(function() {
				layer.open({
					title : '分公司经营计划部经办人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSCWBJBR】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司经营计划部领导审批
			$('#div3').click(function() {
				layer.open({
					title : '分公司经营计划部领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHBLD】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司领导
			$('#div4').click(function() {
				layer.open({
					title : '分公司领导 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人所属公司的【机构主管人员】字段',
					btn : []
				});
			});

			// 部门领导审批
			$('#div5').click(function() {
				layer.open({
					title : '部门领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 设备监理中心经营管理审批
			$('#div6').click(function() {
				layer.open({
					title : '设备监理中心经营管理审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage13】的角色数据',
					btn : []
				});
			});

			// 项监部负责人审批
			$('#div7').click(function() {
				layer.open({
					title : '项监部负责人审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 设备监理中心领导审批
			$('#div8').click(function() {
				layer.open({
					title : '设备监理中心领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人所属中心的【机构主管人员】字段',
					btn : []
				});
			});

			// 企业发展部经办人审批
			$('#div9').click(function() {
				layer.open({
					title : '企业发展部经办人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_KJXYQFBJBR】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 企业发展部领导审批
			$('#div10').click(function() {
				layer.open({
					title : '企业发展部领导审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage14】的角色数据',
					btn : []
				});
			});

			// 法务合规审核
			$('#div11').click(function() {
				layer.open({
					title : '法务合规审核 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage6】的角色数据',
					btn : []
				});
			});

			// 审计法务部领导审批
			$('#div12').click(function() {
				layer.open({
					title : '审计法务部领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改【审计法务部】的【机构主管人员】字段',
					btn : []
				});
			});

			// 企业发展部经办人复审
			$('#div13').click(function() {
				layer.open({
					title : '企业发展部经办人复审 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_KJXYQFBJBR】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 承办部门分管领导审批
			$('#div14').click(function() {
				layer.open({
					title : '承办部门分管领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSZJLFG】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 公司承办部门分管领导审批
			$('#div15').click(function() {
				layer.open({
					title : '公司承办部门分管领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【分管领导】字段',
					btn : []
				});
			});

			// 总经理审批
			$('#div16').click(function() {
				layer.open({
					title : '总经理审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage9】的角色数据',
					btn : []
				});
			});

			// 法定代表人审批
			$('#div17').click(function() {
				layer.open({
					title : '法定代表人审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage10】的角色数据',
					btn : []
				});
			});

			// 合同盖章
			$('#div18').click(function() {
				layer.open({
					title : '合同盖章 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【kjxy_htgz】的角色数据',
					btn : []
				});
			});
			
			// 协管领导审批
			$('#div19').click(function() {
				layer.open({
					title : '协管领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【HT_XG_LD】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});
			
			// 协管领导审批
			$('#div20').click(function() {
				layer.open({
					title : '协管领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【HT_XG_LD】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});						

		});
	</script>

</body>
</html>