<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>零星采购 - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/zeroPurchaseFlow.png'); width: 1321px; height: 767px; position: relative;">
	
		<!-- 分公司经营计划部审核、备案统计 -->
		<div id="div1" style="position: absolute; left: 627px; top: 18px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 分公司主要负责人审核 -->
		<div id="div2" style="position: absolute; left: 1005px; top: 18px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 发起部门负责人审批 -->
		<div id="div3" style="position: absolute; left: 178px; top: 221px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 公司本部设备监理经营主管 -->
		<div id="div4" style="position: absolute; left: 328px; top: 221px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 公司本部设备监理经营主管 -->
		<div id="div5" style="position: absolute; left: 462px; top: 398px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 设备监理分管领导 -->
		<div id="div6" style="position: absolute; left: 870px; top: 399px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 分管领导审核 -->
		<div id="div7" style="position: absolute; left: 179px; top: 670px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 科技信息部审批 -->
		<div id="div8" style="position: absolute; left: 1140px; top: 154px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 集采中心审批实施 -->
		<div id="div9" style="position: absolute; left: 1140px; top: 300px; width: 75px; height: 50px; cursor: pointer;"></div>		
		
		<!-- 公司企业发展部(采购管理支持中心) - 备案 -->
		<div id="div10" style="position: absolute; left: 1140px; top: 420px; width: 75px; height: 50px; cursor: pointer;"></div>																																

	</div>

	<script src="/default/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		layui.use([ 'jquery', 'layer' ], function() {
			$ = layui.jquery;
			layer = layui.layer;
			
			// 分公司经营计划部审核、备案统计
			$('#div1').click(function() {
				layer.open({
					title : '分公司经营计划部审核、备案统计 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【branchMangerAgent】的角色数据',
					btn : []
				});
			});
			
			// 分公司主要负责人审核
			$('#div2').click(function() {
				layer.open({
					title : '分公司主要负责人审核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});
			
			// 发起部门负责人审批
			$('#div3').click(function() {
				layer.open({
					title : '发起部门负责人审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});
			
			// 公司本部设备监理经营主管
			$('#div4').click(function() {
				layer.open({
					title : '公司本部设备监理经营主管 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage13】的角色数据',
					btn : []
				});
			});
			
			// 公司本部设备监理经营主管
			$('#div5').click(function() {
				layer.open({
					title : '公司本部设备监理经营主管 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【SBJLZX_FZR】的角色数据',
					btn : []
				});
			});
			
			// 设备监理分管领导
			$('#div6').click(function() {
				layer.open({
					title : '设备监理分管领导 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【SBJLZX_FGLD】的角色数据',
					btn : []
				});
			});
			
			// 分管领导审核
			$('#div7').click(function() {
				layer.open({
					title : '分管领导审核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【分管领导】字段',
					btn : []
				});
			});
			
			// 科技信息部审批
			$('#div8').click(function() {
				layer.open({
					title : '科技信息部审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【lxcg_kj_sp】的角色数据',
					btn : []
				});
			});	
			
			// 集采中心审批实施
			$('#div9').click(function() {
				layer.open({
					title : '集采中心审批实施 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【fufei_jczxfh】的角色数据',
					btn : []
				});
			});	
			
			// 公司企业发展部(采购管理支持中心) - 备案
			$('#div10').click(function() {
				layer.open({
					title : '公司企业发展部(采购管理支持中心) - 备案 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【purchaseFz】的角色数据',
					btn : []
				});
			});																													
																														
		});
	</script>

</body>
</html>