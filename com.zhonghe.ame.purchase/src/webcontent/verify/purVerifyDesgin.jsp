<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>采购验收 - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/purVerifyFlow.png'); width: 1338px; height: 629px; position: relative;">

		<!-- 验收人填写意见 -->
		<div id="div1" style="position: absolute; left: 274px; top: 56px; width: 75px; height: 50px; cursor: pointer;"></div>

	</div>

	<script src="/default/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		layui.use([ 'jquery', 'layer' ], function() {
			$ = layui.jquery;
			layer = layui.layer;

			// 验收人填写意见
			$('#div1').click(function() {
				layer.open({
					title : '验收人填写意见 - 调整审批人',
					content : '发起人填写表单时【验收审核人】字段',
					btn : []
				});
			});

		});
	</script>

</body>
</html>