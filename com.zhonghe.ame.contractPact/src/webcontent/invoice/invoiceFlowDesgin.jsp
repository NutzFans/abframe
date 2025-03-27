<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>开票管理 - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/invoiceFlow.png'); width: 1436px; height: 1365px; position: relative;">

		<!-- 分公司经营计划部领导审批 -->
		<div id="div1" style="position: absolute; left: 115px; top: 260px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司经营计划部经办人审批 -->
		<div id="div2" style="position: absolute; left: 299px; top: 261px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 承办部门领导项监部审批 -->
		<div id="div3" style="position: absolute; left: 537px; top: 261px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司财务部负责人审批 -->
		<div id="div4" style="position: absolute; left: 114px; top: 403px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司领导审批 -->
		<div id="div5" style="position: absolute; left: 245px; top: 645px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司经营计划部领导审批 -->
		<div id="div6" style="position: absolute; left: 250px; top: 457px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 承办部门领导项监部审批 -->
		<div id="div7" style="position: absolute; left: 630px; top: 457px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司领导审批 -->
		<div id="div8" style="position: absolute; left: 119px; top: 538px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 本部企业发展部经核准 -->
		<div id="div9" style="position: absolute; left: 116px; top: 704px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司财务开票 -->
		<div id="div11" style="position: absolute; left: 122px; top: 1270px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 设备监理中心经营管理审批 -->
		<div id="div13" style="position: absolute; left: 1136px; top: 588px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门领导审批 -->
		<div id="div14" style="position: absolute; left: 764px; top: 749px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 项监部审批 -->
		<div id="div15" style="position: absolute; left: 933px; top: 744px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 设备监理中心领导审批 -->
		<div id="div16" style="position: absolute; left: 1136px; top: 743px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 本部企业发展部核准 -->
		<div id="div17" style="position: absolute; left: 761px; top: 877px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 财务部领导审批 -->
		<div id="div19" style="position: absolute; left: 760px; top: 1005px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 财务开票 -->
		<div id="div20" style="position: absolute; left: 766px; top: 1130px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 分公司经营计划部经办人审批 -->
		<div id="div21" style="position: absolute; left: 430px; top: 457px; width: 75px; height: 50px; cursor: pointer;"></div>

	</div>

	<script src="/default/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		layui.use([ 'jquery', 'layer' ], function() {
			$ = layui.jquery;
			layer = layui.layer;

			// 分公司经营计划部领导审批
			$('#div1').click(function() {
				layer.open({
					title : '分公司经营计划部领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHBLD】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司经营计划部经办人审批
			$('#div2').click(function() {
				layer.open({
					title : '分公司经营计划部经办人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHB-SF】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 承办部门领导项监部审批
			$('#div3').click(function() {
				layer.open({
					title : '承办部门领导项监部审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 分公司财务部负责人审批
			$('#div4').click(function() {
				layer.open({
					title : '分公司财务部负责人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSCWBSP】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司领导审批
			$('#div5').click(function() {
				layer.open({
					title : '分公司领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【分管领导】字段',
					btn : []
				});
			});

			// 分公司经营计划部领导审批
			$('#div6').click(function() {
				layer.open({
					title : '分公司经营计划部领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHBLD】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 承办部门领导项监部审批
			$('#div7').click(function() {
				layer.open({
					title : '承办部门领导项监部审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 分公司领导审批
			$('#div8').click(function() {
				layer.open({
					title : '分公司领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人所属公司的【机构主管人员】字段',
					btn : []
				});
			});

			// 本部企业发展部核准
			$('#div9').click(function() {
				layer.open({
					title : '本部企业发展部核准 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_BRANCHAGENT】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司财务开票
			$('#div11').click(function() {
				layer.open({
					title : '分公司财务开票 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【KPLC_CWKP】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 设备监理中心经营管理审批
			$('#div13').click(function() {
				layer.open({
					title : '设备监理中心经营管理审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage13】的角色数据',
					btn : []
				});
			});

			// 部门领导审批
			$('#div14').click(function() {
				layer.open({
					title : '部门领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 项监部审批
			$('#div15').click(function() {
				layer.open({
					title : '项监部审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 设备监理中心领导审批
			$('#div16').click(function() {
				layer.open({
					title : '设备监理中心领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改设备监理中心的【机构主管人员】字段',
					btn : []
				});
			});

			// 本部企业发展部核准
			$('#div17').click(function() {
				layer.open({
					title : '本部企业发展部核准 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_BRANCHAGENT】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 财务部领导审批
			$('#div19').click(function() {
				layer.open({
					title : '财务部领导审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【financeLeader】的角色数据',
					btn : []
				});
			});

			// 财务开票
			$('#div20').click(function() {
				layer.open({
					title : '财务开票 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【billing】的角色数据',
					btn : []
				});
			});
			
			// 分公司经营计划部经办人审批
			$('#div21').click(function() {
				layer.open({
					title : '分公司经营计划部经办人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHB-SF】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});			
			
		});
	</script>

</body>
</html>