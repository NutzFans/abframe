$(function() { 
	$("#go_top").hide();
	// 检测屏幕高度
	// scroll() 方法为滚动事件
	$(window).scroll(function() {
		if ($(window).scrollTop() > 100) {
			$("#go_top").fadeIn(500);
		} else {
			$("#go_top").fadeOut(500);
		}
	});
	initTables();
	bindEvient();
	nui.parse();
	
	$(".tableFixedHead .fixed-table-container").off('click', '.th-inner').on('click', '.th-inner', function (event) {
		$("#resultList thead .th-inner").each(function(i,item){
			if($(item).html() == event.target.innerHTML){
				$(item).click();
			}
		})
	})
    
    //表格数据加载成功时
	$("#resultList").on('load-success.bs.table',function(data){
        $("#tfootDiv").html("");
        $("#resultListHead").html("");
        
        var sTableW = $("#resultList").css("width");
		$(".fixed-table-pagination").css("width",sTableW);
		$("#resultListHead").css("width",sTableW);
		$("#resultListHead th").css("text-align","center");
		
		$("#resultListHead").html($("#resultList thead").clone(true));
		$("#tfootDiv").html($(".fixed-table-pagination").clone(true));
		
		$(window).scroll();
    });
	
	var table_height_head = $("#resultList").offset().top;
	
	//滚动事件
	$(window).scroll(function(){
		 var this_scrollTop = $(this).scrollTop();
		 
		 //判断头部何时出现
		 if(this_scrollTop > table_height_head + 80){
            $("#resultListHead").show();
         }else{
         	$("#resultListHead").hide();
         }
         
		 //判断底部何时出现
         var table_height_tfoot = $(".fixed-table-pagination").offset().top - $(this).height() + $("#tfootDiv").height();
         if(this_scrollTop < table_height_tfoot){
         	$("#tfootDiv").show();
         }else{
         	$("#tfootDiv").hide();
         }
	});
});

var searchArray = [];
function bindEvient() {
	$(".sl-value a").bind("click", function() {
		var valLast = $(this).parent().find(".choosed").attr("value");
		if (valLast) {
			delToArray(valLast);
		}
		;
		$(this).addClass("choosed").siblings().removeClass("choosed");
		var val = $(this).attr("value");
		addToArray(val);
		initTables();
	});
	$(".sl-value a .closeIcon").bind("click", function(e) {
		$(this).parent().removeClass("choosed");
		var val = $(this).parent().attr("value");
		delToArray(val);
		initTables();
		e.stopPropagation();
	});

	$("#go_top").click(function() {
		$('body,html').animate({
			scrollTop : 0
		}, 200);
		return false;
	});
}

function addToArray(val) {
	searchArray.push(val);
	$("#hideValue").val(searchArray.toString());
}

function delToArray(val) {
	searchArray.remove(val);
	$("#hideValue").val(searchArray.toString());
}

/**
 * 描   述：查询方式改为命名sql查询,条件查询随着更改
 * 参数信息：
 * 返回数据：
 * 作   者：wuguang(wuguang@geostar.com.cn)
 * 创建日期：2017-12-22
 */
function searchApprovePend() {
	var formData = new nui.Form("#approvePendForm").getData(false, false);    //获取查询条件表单内容
	var hyzt = nui.getbyName("criteria/_expr[1]/hyzt").value;
	var hysmc = nui.getbyName("criteria/_expr[2]/hysmc").value;
	
	var dHykssj = nui.getbyName("criteria/_expr[3]/hykssj").value;
	if(dHykssj != '' && dHykssj != null){
		var hykssj = nui.formatDate(nui.parseDate(dHykssj),'yyyy-MM-dd HH:mm:ss');
	}
		
	var dHyjssj = nui.getbyName("criteria/_expr[4]/hyjssj").value;
	if(dHyjssj != '' && dHyjssj != null){
		var dHyjssjFormat = nui.formatDate(nui.parseDate(dHyjssj),'yyyy-MM-dd');
		var hyjssj = dHyjssjFormat + " " + "23:59:59";
	}else{
		hyjssj = dHyjssj;
	}
	
	queryParam.hyzt = hyzt;         //将查询条件'会议主题'放进查询参数中
	queryParam.hysmc = hysmc;       //将查询条件'会议室名称'放进查询参数中
	queryParam.hykssj = hykssj;     //将查询条件'会议开始时间'放进查询参数中
	queryParam.hyjssj = hyjssj;     //将查询条件'会议结束时间'放进查询参数中
	initTables(formData);
}
// 重置查询条件
function reset() {
	var form = new nui.Form("#approvePendForm");//将普通form转为nui的form
	var form1 = new nui.Form("#keywordForm");
	$("#search-input").val('');
	form.reset();
	form1.reset();
}

function showDetailSearch(obj) {
	$(".searchDetail").slideDown(500);
	$(".searchDetail input[type='text']").val("");
	$(".search-btn").removeClass("active");
	$(".search-btn").eq(1).addClass("active");
	$(".search-btn").eq(2).addClass("active");
	$("#search-input").val("");
	//wuguang,2017-11-23,将搜索交互方式改成统一的样式
	$(".inner-box.normal").hide();
}

function returnSearch(obj) {
	//wuguang,2017-11-23,将搜索交互方式改成统一的样式
	$(".inner-box.normal").show();
	$(".searchDetail").slideUp(500);
	$(".searchDetail input[type='text']").val("");
	$(".search-btn").removeClass("active");
	$(".search-btn").eq(0).addClass("active");
	$(".search-btn").eq(1).show();
	$(".normalSearch").css({
		width : "auto"
	});
}

var rollbackData = [];
var rollbackIds = "";
queryRollback();

var queryParam = {};   //命名sql查询的查询条件
// 初始化表格
function initTables(formData,flag) {
	$("#tfootDiv").hide();
	
	if(flag == 0){
		formData = new nui.Form("#keywordForm").getData(false,false);
	}else{
		formData = new nui.Form("#approvePendForm").getData(false, false);
		if(formData["criteria/_expr[3]/hykssj"] != null && formData["criteria/_expr[3]/hykssj"] !='' ){
			formData["criteria/_expr[3]/hykssj"] = nui.formatDate(nui.parseDate(formData["criteria/_expr[3]/hykssj"]),'yyyy-MM-dd HH:mm:ss');
		} //nui.formatDate(nui.parseDate(value),'yyyy-MM-dd')
		if(formData["criteria/_expr[4]/hyjssj"] != null && formData["criteria/_expr[4]/hyjssj"] !='' ){
			/*
			 *wuguang,2017-11-21
			 *当查询条件会议结束时间和开始时间为同一天时，查不出数据，因为两个时间相同，所以这里讲结束时间改成当天的23:59:59 
			 */
			var dHyjssj = nui.formatDate(nui.parseDate(formData["criteria/_expr[4]/hyjssj"]),'yyyy-MM-dd');
			formData["criteria/_expr[4]/hyjssj"] = dHyjssj+" "+"23:59:59";
		}
	}
	
	queryParam.userid = userid;          //参数中存入当前登录用户id
	formData.queryParam = queryParam;    //将参数放入formData中
	$("#resultList").bootstrapTable('destroy');
	$('#resultList')
			.bootstrapTable(
					{
						url : 'com.geostar.gtgh.oa.officeaffairs.Hysq.queryYjsHy.biz.ext', // 请求后台的URL（*）
						method : 'post', // 请求方式（*）
						contentType:'text/json',
						striped : true, // 是否显示行间隔色
						cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
						pagination : true, // 是否显示分页（*）
						sidePagination : "server",// 分页方式：client客户端分页，server服务端分页（*）
						responseHandler : function(data) {
							return {
								rows : data.hysqs, // 总页数,前面的key必须为"total"
								total : data.total
							// 行数据，前面的key要与之前设置的dataField的值一致.
							};
						},
						sortable : true, // 是否启用排序
						sortOrder : "asc", // 排序方式
						queryParams : function(params) {
							formData.pageIndex = params.offset;
							formData.pageSize = params.limit;
							return nui.encode(formData);
						},// 传递参数（*）
						pageNumber : 1, // 初始化加载第一页，默认第一页
						pageSize : 15, // 每页的记录行数（*）  //wuguang,2017-11-18,修改每页可加载的数据条数
						pageList : [ 5, 10, 20, 40 ], // 可供选择的每页的行数（*）
						search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
						strictSearch : false,
						showColumns : false, // 是否显示所有的列
						showRefresh : false, // 是否显示刷新按钮
						minimumCountColumns : 2, // 最少允许的列数
						clickToSelect : true, // 是否启用点击选中行
						uniqueId : "ID", // 每一行的唯一标识，一般为主键列
						showToggle : false, // 是否显示详细视图和列表视图的切换按钮
						cardView : false, // 是否显示详细视图
						detailView : false, // 是否显示父子表
						columns : [
								{
									field : 'hyzt',
									title : '会议主题',
//									width : 100,
									align : 'left',
									formatter : function(value, row, index) {
										var nowTime = new Date();
										var startTime = new Date(row.hykssj);
										if(row.lczt == '0'){
											//草稿
											return '<a onClick="openHysqDetail(\''
											+ row.hysqid
											+ '\',\'edit\',\'CG\')" title='
											+ row.hyzt
											+ ' style="cursor: pointer;">'
											+ row.hyzt + '</a>'; 
										}else if(row.lczt == '2'){
											//办理中   && nowTime >= startTime
											if(rollbackIds.indexOf(row.processinstid)>-1){
												//退回
												return '<a onClick="openBackLog(\''
												+ row.hysqid
												+ '\',\''+row.processinstid+'\')" title='
												+ row.hyzt
												+ ' style="cursor: pointer;">'
												+ row.hyzt + '</a>'; // 这里添加
											}else{
												//待审批
												return '<a onClick="openHysqDetail(\''
												+ row.hysqid
												+ '\',\'view\')" title='
												+ row.hyzt
												+ ' style="cursor: pointer;">'
												+ row.hyzt + '</a>'; 
											}
										}else{
											//办结
											return '<a onClick="openHysqDetail(\''
											+ row.hysqid
											+ '\',\'view\')" title='
											+ row.hyzt
											+ ' style="cursor: pointer;">'
											+ row.hyzt + '</a>';
										}
									},
									sortable : true
								},
								{
									field : 'hysmc',
									title : '会议室',
									width : 100,
									align : 'center',
									sortable : true
								},
								{
									field : 'hykssj',
									title : '会议时间',
									width : 200,
									align : 'center',
									formatter : function(value, row, index) {
										var sValue = nui.formatDate(nui.parseDate(value),'yyyy-MM-dd HH:mm') + " - " + nui.formatDate(nui.parseDate(row.hyjssj),'HH:mm');
										return '<span title="'+sValue+'">'+sValue+'</span>';
									},
									sortable : true
								},
								{
									field : 'hysqid',
									title : '参会人',
									width : 100,
									align : 'center',
									formatter : function(value, row, index) {
										return '<a onClick="openHycyDetail(\''
										+ row.hysqid
										+ '\')" style="cursor: pointer;">参会人</a>'; 
									},
									sortable : true
								}]
					});
}
// 主题的点击弹出框
function openHysqDetail(hysqid,pageHandleType,type) {
	var url = contextPath + "/officeaffairs/hygl/hysq/hysqb.jsp?hysqid="+hysqid+
		(pageHandleType?("&pageHandleType="+pageHandleType):"")+(type?("&type="+type):"");
    window.open(url);
};
function openBackLog(hysqid,instid){
	var workItemID ="null";
	for(var index in rollbackData){
		if(instid == rollbackData[index].instid){
			workItemID = rollbackData[index].workitemid;
		}
	}
	var url = contextPath + "/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+workItemID+"&ywid="+hysqid;
	window.open(url);
}


// 取消的点击事件
function onCancelClick(instid, date, e) {
	var nowTime = new Date();
	date = new Date(date);
	if (nowTime >= date) {
		return;
	}
	instid = {
		"instid" : instid
	};
	$.ajax({
		url : "com.geostar.gtgh.oa.officeaffairs.Hysq.cancelHysq.biz.ext", // 逻辑流
		type : 'POST',
		data : nui.encode(instid),
		cache : false,
		async : false,
		contentType : 'text/json',
		success : function(text) {
			if(text.exception){
				top.window.modal("error","操作失败",initTables);
			}else{
				top.window.modal("success","操作成功",initTables);
			}
		}
	});
}

// 删除的点击事件
function onDeleteClick(data) {
	data = {
		"hysqid" : data
	};
	$.ajax({
		url : "com.geostar.gtgh.oa.officeaffairs.Hysq.deleteHysq.biz.ext", // 逻辑流
		type : 'POST',
		data : nui.encode(data),
		cache : false,
		async : false,
		contentType : 'text/json',
		success : function(text) {
			if(text.exception){
				top.window.modal("error","操作失败",initTables);
			}else{
				top.window.modal("success","操作成功",initTables);
			}
		}
	});
}

/**
 * 描   述：查询方式改为命名sql查询,条件查询随着更改（主题搜索）
 * 参数信息：
 * 返回数据：
 * 作   者：wuguang(wuguang@geostar.com.cn)
 * 创建日期：2017-12-22
 */
function keywordSearch() {
	var hyzt = $("#search-input").val();     //获取"主题关键字"输入框的的值
	var flag = 0;                           
	queryParam.hyzt = hyzt;                  //将hyzt放进查询参数json
	var formData = new nui.Form("#keywordForm").getData(false, false);
	initTables(formData, flag);
}


function queryRollback(){
	nui.ajax({
		url: "com.geostar.gtgh.oa.officeaffairs.Hysq.queryRollback.biz.ext",
	    type: "post",
	    data: {} ,
	    async : false,
	    contentType: "text/json",
	    success: function (text) {
	    	if(text.data){
		    	rollbackData = text.data;
	    		for(var i = 0;i < rollbackData.length; i++){
	    			rollbackIds += rollbackData[i].instid;
	    		}
	    	}
	    }
	});
}

function openHycyDetail(hysqid){
	nui.open({
		url: contextPath+"/officeaffairs/hygl/hycy/hycy.jsp",        //页面地址
	    title: "参会人",      //标题
	    width: 600,      //宽度
	    height: 400,     //高度
	    allowResize: false,       //允许尺寸调节
	    allowDrag: false,         //允许拖拽位置
	    showCloseButton: true,   //显示关闭按钮
	    showMaxButton: false,     //显示最大化按钮
	    showModal: true,         //显示遮罩
	    loadOnRefresh: false,       //true每次刷新都激发onload事件
	    onload: function () {       //弹出页面加载完成
	    	var iframe = this.getIFrameEl();
	        //调用弹出页面方法进行初始化
	        iframe.contentWindow.loadData(hysqid);
	    },
	    ondestroy: function (action) {  //弹出页面关闭前
	        
	    }});
}


