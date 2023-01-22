	var isagain = false;
    var rowTemp;
    var urlTemp;
    var uidArray = new Array();//记录预览打开得窗口，避免重复打开
    var currentid;//当前tab页得id
    amepath = amepath.substring(0,amepath.lastIndexOf("default"));
    //在线预览
    function preview(obj){
    	var row_uid = $(obj).attr("uid");
    	var grids = $(obj).attr("grid");
    	var count = $(".layui-tab-title>li[lay-id]");
    	var uidArray = new Array();//预览打开得窗口，避免重复打开
    	for(var i=0;i<count.length;i++){
    		uidArray.push($(count[i]).attr("lay-id"));
    	}
	     
    	var index = row_uid+grids;
    	if(isInArray(uidArray,row_uid+grids)){
    		var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    		element.tabChange('demo', index);	
    	}else{
    		uidArray.push(row_uid+grids);
    		var officeType = ".xls,.xlsx,.doc,.docx,.ppt,.pptx";
    		var picType = ".png,.jpg,.jpeg,.gif";
    		urlTemp = '';
    		var row = nui.get(grids).getRowByUID(row_uid);  //获取所有选中的行对象
    		rowTemp = row;
    		var _this_title = row.fileName;
    		var filetype ; //文件类型
    		var i = row.fileNewName.lastIndexOf(".");
    		if(i > -1){
    			filetype = row.fileNewName.substring(i).toLowerCase();
    		}
    		if(officeType.indexOf(filetype) >= 0){
    			urlTemp = "https://view.officeapps.live.com/op/view.aspx?src="+amepath+"file/"+row.filePath.substring(row.filePath.lastIndexOf("upload")+7,row.filePath.length);
    		}else if(filetype == ".pdf") {
    			urlTemp = app+"/ame_common/medioPreview.jsp"; 
    		}else if(picType.indexOf(filetype) >= 0){
    			urlTemp = app+"/ame_common/picturePreview.jsp"; 
    		}else{
    			urlTemp = "该文件暂不支持预览";
    		}
    		var _this_content;
    		if(urlTemp == "该文件暂不支持预览"){
    			_this_content = "该文件暂不支持预览"
    		}else{
    			_this_content = '<iframe src="'+urlTemp+'" style="width:100%;height:100%;" scrolling="auto" frameborder="0"></iframe>';
    		}
    		if(isagain){
    			layui.use(['element'],function(){
    				var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    				//一些事件监听
    				element.tabAdd('demo', {
    					title: _this_title,
    					content: _this_content,
    					id: index
    				});
    				
    				element.on('tabDelete(demo)', function(data){
    					var node = data.elem;
    					console.log(data)
    					var l = node[0].childNodes[0].childNodes.length;//得到当前的Tab大容器
    					if(l == 0){
    						layer.closeAll();
    					}
    				});
    				element.tabChange('demo', index);	
    			});
    		}else{
    			var html = '<div class="layui-tab" lay-filter="demo" lay-allowClose="true"><ul class="layui-tab-title">';
    			html += '</ul><div class="layui-tab-content"></div></div>'
    				layer.open({
    					type: 1, 
    					content: html, //这里content是一个普通的String
    					area: ['100%', '100%'],
    					shade: 0,
    					title:false,
    					move: '.layui-tab-content',
    					moveOut: true,
    					maxmin: false,
    					resize:true,
    					success : function (a) {
    						isagain = true;
    						layui.use(['element'],function(){
    							var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    							//一些事件监听
    							element.tabAdd('demo', {
    								title: _this_title,
    								content: _this_content,
    								id: index
    							});
    							element.tabChange('demo', index);
    							element.on('tabDelete(demo)', function(data){
    		    					var node = data.elem;
    		    					console.log(data)
    		    					var l = node[0].childNodes[0].childNodes.length;//得到当前的Tab大容器
    		    					if(l == 0){
    		    						layer.closeAll();
    		    					}
    		    				});
    						});
    					},
    					end : function(layero, index){
    						i = 0;
    						isagain = false;
    						uidArray = [];//关闭窗口清空数组
    					}
    				});
    		}
    	}
    }
    
    function isInArray(arr,value){
        for(var i = 0; i < arr.length; i++){
            if(value === arr[i]){
                return true;
            }
        }
        return false;
    }