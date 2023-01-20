<%@page pageEncoding="UTF-8"%>
<html>
<!-- 
  - Author(s): 朱海翔
  - Date: 2018-11-19 10:18:59
  - Description:
-->
<head>
<title>照片预览</title>
</head>
<body>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/layer/layer.js"></script>
<script>
	SetData();
	function SetData(){
 		var json = {
			"title": "a", //相册标题
		    "id": 123, //相册id
		    "start": 0, //初始显示的图片序号，默认0
		    "data": [   //相册包含的图片，数组格式
			    {
			      "pid": 666, //图片id
			      "src": "/file/"+parent.rowTemp.filePath.substring(parent.rowTemp.filePath.lastIndexOf("upload")+7,parent.rowTemp.filePath.length), //原图地址
			      "thumb": "" //缩略图地址
			    }
		  	]
		}
	       
	    layer.photos({
	    	photos: json, //格式见API文档手册页
		    anim: 5,//0-6的选择，指定弹出图片动画类型，默认随机
		    shade: 0,
		    closeBtn:0,
	    });
	}
</script>
</body>
</html>