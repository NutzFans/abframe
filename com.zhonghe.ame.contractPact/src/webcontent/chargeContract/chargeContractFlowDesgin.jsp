<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>收费合同 - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/chargeContractFlow.png'); width: 1436px; height: 1567px; position: relative;">

		<!-- 承办部门项监部审批 -->
		<div id="div1" style="position: absolute; left: 552px; top: 125px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司财务部审批 -->
		<div id="div2" style="position: absolute; left: 403px; top: 125px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司经营计划部经办人审批 -->
		<div id="div3" style="position: absolute; left: 253px; top: 125px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司经营计划部领导审批 -->
		<div id="div4" style="position: absolute; left: 88px; top: 125px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司领导审批 -->
		<div id="div5" style="position: absolute; left: 86px; top: 237px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 中心部门领导审批 -->
		<div id="div6" style="position: absolute; left: 402px; top: 235px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门领导审批 -->
		<div id="div7" style="position: absolute; left: 704px; top: 237px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 项监部负责人审批 -->
		<div id="div8" style="position: absolute; left: 988px; top: 125px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 设备监理中心经营管理审批 -->
		<div id="div9" style="position: absolute; left: 1154px; top: 125px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 设备监理中心领导审批 -->
		<div id="div10" style="position: absolute; left: 1152px; top: 237px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部经办人审批 -->
		<div id="div11" style="position: absolute; left: 342px; top: 492px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部领导审批 -->
		<div id="div12" style="position: absolute; left: 164px; top: 628px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部领导审批 -->
		<div id="div13" style="position: absolute; left: 524px; top: 628px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 本部法务人员审批 -->
		<div id="div14" style="position: absolute; left: 706px; top: 484px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 审计法务部领导审批 -->
		<div id="div15" style="position: absolute; left: 708px; top: 596px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 财务审批 -->
		<div id="div16" style="position: absolute; left: 957px; top: 484px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 财务主任审批 -->
		<div id="div17" style="position: absolute; left: 1153px; top: 484px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总法律顾问审批 -->
		<div id="div18" style="position: absolute; left: 161px; top: 845px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司承办部门分管领导审批 -->
		<div id="div19" style="position: absolute; left: 341px; top: 846px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总会计师审批 -->
		<div id="div20" style="position: absolute; left: 524px; top: 844px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司领导/中心部门领导复核 -->
		<div id="div21" style="position: absolute; left: 708px; top: 973px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总经理/分管领导审批 -->
		<div id="div22" style="position: absolute; left: 343px; top: 1102px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 法定代表人审批 -->
		<div id="div23" style="position: absolute; left: 340px; top: 1261px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 合同盖章 -->
		<div id="div24" style="position: absolute; left: 710px; top: 1262px; width: 75px; height: 50px; cursor: pointer;"></div>

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
					content : '通过【机构人员管理】模块修改发起人所属部门对应二级部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 分公司财务部审批
			$('#div2').click(function() {
				layer.open({
					title : '分公司财务部审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSCWBSP】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司经营计划部经办人审批
			$('#div3').click(function() {
				layer.open({
					title : '分公司经营计划部经办人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHB-SF】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司经营计划部领导审批
			$('#div4').click(function() {
				layer.open({
					title : '分公司经营计划部领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHBLD】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司领导审批
			$('#div5').click(function() {
				layer.open({
					title : '分公司领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人所属公司的【机构主管人员】字段',
					btn : []
				});
			});

			// 中心部门领导审批
			$('#div6').click(function() {
				layer.open({
					title : '中心部门领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人所属中心的【机构主管人员】字段',
					btn : []
				});
			});

			// 部门领导审批
			$('#div7').click(function() {
				layer.open({
					title : '部门领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 项监部负责人审批
			$('#div8').click(function() {
				layer.open({
					title : '项监部负责人审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 设备监理中心经营管理审批
			$('#div9').click(function() {
				layer.open({
					title : '设备监理中心经营管理审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage13】的角色数据',
					btn : []
				});
			});

			// 设备监理中心领导审批
			$('#div10').click(function() {
				layer.open({
					title : '设备监理中心领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改设备监理中心的【机构主管人员】字段',
					btn : []
				});
			});

			// 企业发展部经办人审批
			$('#div11').click(function() {
				layer.open({
					title : '企业发展部经办人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_BRANCHAGENT】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 企业发展部领导审批
			$('#div12').click(function() {
				layer.open({
					title : '企业发展部领导审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage14】的角色数据',
					btn : []
				});
			});

			// 企业发展部领导审批
			$('#div13').click(function() {
				layer.open({
					title : '企业发展部领导审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage5】的角色数据',
					btn : []
				});
			});

			// 本部法务人员审批
			$('#div14').click(function() {
				layer.open({
					title : '本部法务人员审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage6】的角色数据',
					btn : []
				});
			});

			// 审计法务部领导审批
			$('#div15').click(function() {
				layer.open({
					title : '审计法务部领导审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【sfht_sjfwbld_zx】的角色数据',
					btn : []
				});
			});

			// 财务审批
			$('#div16').click(function() {
				layer.open({
					title : '财务审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_ZNBMCWSP】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 财务主任审批
			$('#div17').click(function() {
				layer.open({
					title : '财务主任审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage16】的角色数据',
					btn : []
				});
			});

			// 总法律顾问审批
			$('#div18').click(function() {
				layer.open({
					title : '总法律顾问审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage11】的角色数据',
					btn : []
				});
			});

			// 公司承办部门分管领导审批
			$('#div19').click(function() {
				layer.open({
					title : '公司承办部门分管领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【分管领导】字段',
					btn : []
				});
			});

			// 总会计师审批
			$('#div20').click(function() {
				layer.open({
					title : '总会计师审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage15】的角色数据',
					btn : []
				});
			});

			// 分公司领导/中心部门领导复核
			$('#div21').click(function() {
				layer.open({
					title : '分公司领导/中心部门领导复核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人所属分公司/中心的【机构主管人员】字段',
					btn : []
				});
			});

			// 总经理/分管领导审批
			$('#div22').click(function() {
				layer.open({
					title : '总经理/分管领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSZJLFG】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 法定代表人审批
			$('#div23').click(function() {
				layer.open({
					title : '法定代表人审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage10】的角色数据',
					btn : []
				});
			});

			// 合同盖章
			$('#div24').click(function() {
				layer.open({
					title : '合同盖章 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_HTGZSPR】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

		});
	</script>

</body>
</html>