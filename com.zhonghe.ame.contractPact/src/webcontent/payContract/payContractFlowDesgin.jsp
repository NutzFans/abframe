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
	<div style="background-image: url('/default/common/flow/payContractFlow.png'); width: 1431px; height: 2294px; position: relative;">

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

		<!-- 企业发展部经办人审批 -->
		<div id="div15" style="position: absolute; left: 746px; top: 911px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门领导复核 -->
		<div id="div16" style="position: absolute; left: 1030px; top: 913px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部主任审批 -->
		<div id="div17" style="position: absolute; left: 605px; top: 1053px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部副主任审批 -->
		<div id="div18" style="position: absolute; left: 863px; top: 1053px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 承办部门分管领导审批 -->
		<div id="div19" style="position: absolute; left: 746px; top: 1347px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总法律顾问审批 -->
		<div id="div20" style="position: absolute; left: 438px; top: 1401px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总法律顾问审批 -->
		<div id="div21" style="position: absolute; left: 713px; top: 1465px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总经理审批 -->
		<div id="div22" style="position: absolute; left: 487px; top: 1547px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总经理审批 -->
		<div id="div23" style="position: absolute; left: 750px; top: 1610px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 法定代表人审批 -->
		<div id="div24" style="position: absolute; left: 752px; top: 1743px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 合同盖章 -->
		<div id="div25" style="position: absolute; left: 753px; top: 1918px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总会计师审批 -->
		<div id="div26" style="position: absolute; left: 522px; top: 1402px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 总会计师审批 -->
		<div id="div27" style="position: absolute; left: 795px; top: 1465px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 财务主任审批 -->
		<div id="div28" style="position: absolute; left: 668px; top: 675px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 财务主任审批 -->
		<div id="div29" style="position: absolute; left: 880px; top: 480px; width: 75px; height: 50px; cursor: pointer;"></div>

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

			// 项监部负责人审批
			$('#div2').click(function() {
				layer.open({
					title : '项监部负责人审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 分公司财务部审批
			$('#div3').click(function() {
				layer.open({
					title : '分公司财务部审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSCWBSP】的字典项数据，修改后【刷新缓存】',
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
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHB-FF】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 财务审批
			$('#div7').click(function() {
				layer.open({
					title : '财务审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_ZNBMCWSP】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 部门领导审批
			$('#div8').click(function() {
				layer.open({
					title : '部门领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_SBZXBMLDSP】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司经营管理部门主任审批
			$('#div9').click(function() {
				layer.open({
					title : '分公司经营管理部门主任审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FGSJYJHBLD】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 法务审批
			$('#div10').click(function() {
				layer.open({
					title : '法务审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_FWSP】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 分公司负责人审批
			$('#div11').click(function() {
				layer.open({
					title : '分公司负责人审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人所属公司的【机构主管人员】字段',
					btn : []
				});
			});

			// 分公司负责人复核
			$('#div12').click(function() {
				layer.open({
					title : '分公司负责人复核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人所属公司的【机构主管人员】字段',
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
					content : '通过【业务字典管理】模块修改类型代码为【ZH_SBZXBMLDSP】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 企业发展部经办人审批
			$('#div15').click(function() {
				layer.open({
					title : '企业发展部经办人审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_BRANCHAGENT】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 部门领导复核
			$('#div16').click(function() {
				layer.open({
					title : '部门领导复核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 企业发展部主任审批
			$('#div17').click(function() {
				layer.open({
					title : '企业发展部主任审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage14】的角色数据',
					btn : []
				});
			});

			// 企业发展部副主任审批
			$('#div18').click(function() {
				layer.open({
					title : '企业发展部副主任审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage5】的角色数据',
					btn : []
				});
			});

			// 承办部门分管领导审批
			$('#div19').click(function() {
				layer.open({
					title : '承办部门分管领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【分管领导】字段',
					btn : []
				});
			});

			// 总法律顾问审批
			$('#div20').click(function() {
				layer.open({
					title : '总法律顾问审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage11】的角色数据',
					btn : []
				});
			});

			// 总法律顾问审批
			$('#div21').click(function() {
				layer.open({
					title : '总法律顾问审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage11】的角色数据',
					btn : []
				});
			});

			// 总经理审批
			$('#div22').click(function() {
				layer.open({
					title : '总经理审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage9】的角色数据',
					btn : []
				});
			});

			// 总经理审批
			$('#div23').click(function() {
				layer.open({
					title : '总经理审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage9】的角色数据',
					btn : []
				});
			});

			// 法定代表人审批
			$('#div24').click(function() {
				layer.open({
					title : '法定代表人审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage10】的角色数据',
					btn : []
				});
			});

			// 合同盖章
			$('#div25').click(function() {
				layer.open({
					title : '合同盖章 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【ZH_HTGZSPR】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 总会计师审批
			$('#div26').click(function() {
				layer.open({
					title : '总会计师审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage15】的角色数据',
					btn : []
				});
			});

			// 总会计师审批
			$('#div27').click(function() {
				layer.open({
					title : '总会计师审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage15】的角色数据',
					btn : []
				});
			});

			// 财务主任审批
			$('#div28').click(function() {
				layer.open({
					title : '财务主任审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage16】的角色数据',
					btn : []
				});
			});

			// 财务主任审批
			$('#div29').click(function() {
				layer.open({
					title : '财务主任审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage16】的角色数据',
					btn : []
				});
			});

		});
	</script>

</body>
</html>