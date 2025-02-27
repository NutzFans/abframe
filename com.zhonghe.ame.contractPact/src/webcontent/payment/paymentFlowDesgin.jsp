<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>付款管理 - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/paymentFlow.png'); width: 1526px; height: 1780px; position: relative;">

		<!-- 承办部门项监部负责人 -->
		<div id="div1" style="position: absolute; left: 598px; top: 82px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司经营计划部经办人审批 -->
		<div id="div2" style="position: absolute; left: 438px; top: 84px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司经营计划部负责人审批 -->
		<div id="div3" style="position: absolute; left: 250px; top: 83px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司财务负责人审批 -->
		<div id="div4" style="position: absolute; left: 101px; top: 83px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 设备监理中心经营管理审批 -->
		<div id="div5" style="position: absolute; left: 1226px; top: 172px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门领导审批 -->
		<div id="div6" style="position: absolute; left: 750px; top: 329px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 项目审核人审批 -->
		<div id="div7" style="position: absolute; left: 968px; top: 328px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司财务负责人审批 -->
		<div id="div8" style="position: absolute; left: 255px; top: 481px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司领导审批 -->
		<div id="div9" style="position: absolute; left: 506px; top: 480px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部经办人审批 -->
		<div id="div10" style="position: absolute; left: 747px; top: 477px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门领导审批 -->
		<div id="div11" style="position: absolute; left: 1229px; top: 479px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部领导审批 -->
		<div id="div12" style="position: absolute; left: 596px; top: 602px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部领导审批 -->
		<div id="div13" style="position: absolute; left: 749px; top: 718px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 财务部经办人审批 -->
		<div id="div14" style="position: absolute; left: 751px; top: 868px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 财务部领导审批 -->
		<div id="div15" style="position: absolute; left: 752px; top: 988px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司承办部门分管领导审批 -->
		<div id="div16" style="position: absolute; left: 1120px; top: 987px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总会计师审批 -->
		<div id="div17" style="position: absolute; left: 536px; top: 1139px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总会计师审批 -->
		<div id="div18" style="position: absolute; left: 1123px; top: 1139px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总经理审批 -->
		<div id="div19" style="position: absolute; left: 536px; top: 1258px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总经理审批 -->
		<div id="div20" style="position: absolute; left: 1124px; top: 1260px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 法定代表人审批 -->
		<div id="div21" style="position: absolute; left: 536px; top: 1394px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司领导审批 -->
		<div id="div22" style="position: absolute; left: 110px; top: 1545px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 法定代表人审批 -->
		<div id="div23" style="position: absolute; left: 1126px; top: 1546px; width: 75px; height: 50px; cursor: pointer;"></div>

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
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 分公司经营计划部经办人审批
			$('#div2').click(function() {
				layer.open({
					title : '分公司经营计划部经办人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHB-FF】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司经营计划部负责人审批
			$('#div3').click(function() {
				layer.open({
					title : '分公司经营计划部负责人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHBLD】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司财务负责人审批
			$('#div4').click(function() {
				layer.open({
					title : '分公司财务负责人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSCWBLD】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 设备监理中心经营管理审批
			$('#div5').click(function() {
				layer.open({
					title : '设备监理中心经营管理审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage13】的角色数据',
					btn : []
				});
			});

			// 部门领导审批
			$('#div6').click(function() {
				layer.open({
					title : '部门领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 项目审核人审批
			$('#div7').click(function() {
				layer.open({
					title : '项目审核人审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 分公司财务负责人审批
			$('#div8').click(function() {
				layer.open({
					title : '分公司财务负责人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSCWBLD】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司领导审批
			$('#div9').click(function() {
				layer.open({
					title : '分公司领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人所属公司的【机构主管人员】字段',
					btn : []
				});
			});

			// 企业发展部经办人审批
			$('#div10').click(function() {
				layer.open({
					title : '企业发展部经办人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_BRANCHAGENT】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 部门领导审批
			$('#div11').click(function() {
				layer.open({
					title : '部门领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_SBZXBMLDSP】的字典项数据，修改后【刷新缓存】',
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

			// 财务部经办人审批
			$('#div14').click(function() {
				layer.open({
					title : '财务部经办人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_ZNBMCWSP】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 财务部领导审批
			$('#div15').click(function() {
				layer.open({
					title : '财务部领导审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【financeLeader】的角色数据',
					btn : []
				});
			});

			// 公司承办部门分管领导审批
			$('#div16').click(function() {
				layer.open({
					title : '公司承办部门分管领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【分管领导】字段',
					btn : []
				});
			});

			// 总会计师审批
			$('#div17').click(function() {
				layer.open({
					title : '总会计师审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【chiefAccountant】的角色数据',
					btn : []
				});
			});

			// 总会计师审批
			$('#div18').click(function() {
				layer.open({
					title : '总会计师审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【chiefAccountant】的角色数据',
					btn : []
				});
			});

			// 总经理审批
			$('#div19').click(function() {
				layer.open({
					title : '总经理审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage9】的角色数据',
					btn : []
				});
			});

			// 总经理审批
			$('#div20').click(function() {
				layer.open({
					title : '总经理审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage9】的角色数据',
					btn : []
				});
			});

			// 法定代表人审批
			$('#div21').click(function() {
				layer.open({
					title : '法定代表人审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage10】的角色数据',
					btn : []
				});
			});

			// 分公司领导审批
			$('#div22').click(function() {
				layer.open({
					title : '分公司领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人所属公司的【机构主管人员】字段',
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

		});
	</script>

</body>
</html>