<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>紧急采购 - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/urgentPurFlow.png'); width: 1338px; height: 629px; position: relative;">
	
		<!-- 设备监理中心审核、备案 -->
		<div id="div1" style="position: absolute; left: 352px; top: 130px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 设备监理中心主要负责人审核 -->
		<div id="div2" style="position: absolute; left: 750px; top: 132px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 采购需求单位负责人审核 -->
		<div id="div3" style="position: absolute; left: 351px; top: 355px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 采购需求单位分管领导审核 -->
		<div id="div4" style="position: absolute; left: 750px; top: 356px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 公司主要领导审核 -->
		<div id="div5" style="position: absolute; left: 897px; top: 357px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 分公司经营计划部审核、备案 -->
		<div id="div6" style="position: absolute; left: 525px; top: 475px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 分公司领导审批 -->
		<div id="div7" style="position: absolute; left: 761px; top: 474px; width: 75px; height: 50px; cursor: pointer;"></div>																																								

	</div>

	<script src="/default/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		layui.use([ 'jquery', 'layer' ], function() {
			$ = layui.jquery;
			layer = layui.layer;
			
			// 设备监理中心审核、备案
			$('#div1').click(function() {
				layer.open({
					title : '设备监理中心审核、备案 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage13】的角色数据',
					btn : []
				});
			});
			
			// 设备监理中心主要负责人审核
			$('#div2').click(function() {
				layer.open({
					title : '设备监理中心主要负责人审核 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【SBJLZX_FZR】的角色数据',
					btn : []
				});
			});
			
			// 采购需求单位负责人审核
			$('#div3').click(function() {
				layer.open({
					title : '采购需求单位负责人审核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});
			
			// 采购需求单位分管领导审核
			$('#div4').click(function() {
				layer.open({
					title : '采购需求单位分管领导审核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【分管领导】字段',
					btn : []
				});
			});
			
			// 公司主要领导审核
			$('#div5').click(function() {
				layer.open({
					title : '公司主要领导审核 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【GS_ZYLD】的角色数据',
					btn : []
				});
			});
			
			// 分公司经营计划部审核、备案
			$('#div6').click(function() {
				layer.open({
					title : '分公司经营计划部审核、备案 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【jjcg_fgsjyjhb】的角色数据',
					btn : []
				});
			});
			
			// 分公司领导审批
			$('#div7').click(function() {
				layer.open({
					title : '分公司领导审批 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});																																									
																														
		});
	</script>

</body>
</html>