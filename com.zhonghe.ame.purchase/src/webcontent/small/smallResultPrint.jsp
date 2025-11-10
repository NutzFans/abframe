<%@page pageEncoding="UTF-8"%>
<%@include file="/purchase/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>打印页面</title>
<meta name="renderer" content="webkit">
<script src="<%=request.getContextPath()%>/common/nui/warterMark.js" type="text/javascript"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
<style type="text/css">
.layui-table,.layui-table-view {
	margin: 0px;
}

.layui-elem-quote {
	font-weight: bold;
}

.layui-table-cell {
	font-size: 14px;
	padding: 0 5px;
	height: auto;
	overflow: visible;
	text-overflow: inherit;
	white-space: normal;
	word-break: break-all;
}
</style>
</head>
<body>
	<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
	<div style="margin: 0 auto; width: 900px; height: auto;">
		<div align="right">
			<button type="button" id="checkview" class="layui-btn" onclick="preview()">打印</button>
		</div>
		<form class="layui-form layui-form-pane" lay-filter="dataFrm" id="dataFrm">
			<h3 id="name" align="center"></h3>
			<blockquote class="layui-elem-quote" style="width: 97%">
				 基本信息【小额采购 - 结果确认】
				<i id="status" class="layui-icon" style="font-size: 15px; float: right; color: #5FB878;">审批通过</i>
			</blockquote>

			<div class="layui-row">
				<div class="layui-col-xs12">
					<label class="layui-form-label" style="width: 170px">小额采购名称</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="purchaseName" disabled="disabled" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-col-xs6">
					<label class="layui-form-label" style="width: 170px">经办人</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="createName" disabled="disabled" class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6">
					<label class="layui-form-label" style="width: 170px">采购单位</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="secondaryOrgname" disabled="disabled" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-xs6">
					<label class="layui-form-label" style="width: 170px">申请时间</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="createdTime" disabled="disabled" placeholder="yyyy-MM-dd" class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6">
					<label class="layui-form-label" style="width: 170px">编号</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="purchaseCode" disabled="disabled" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-xs6">
					<label class="layui-form-label" style="width: 170px">供应商名称</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="contractor" disabled="disabled" class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6">
					<label class="layui-form-label" style="width: 170px">预计采购时间</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="purchaseDate" disabled="disabled" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-xs6">
					<label class="layui-form-label" style="width: 170px">立项金额(万元)</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="totalAmount" disabled="disabled" class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6">
					<label class="layui-form-label" style="width: 170px">最终成交金额(万元)</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="finalAmount" disabled="disabled" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-col-xs6">
					<label class="layui-form-label" style="width: 170px">
						一体化平台计划编码
					</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="ydhptXqjhCode" disabled="disabled" class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6">
					<label class="layui-form-label" style="width: 170px">是否已有年度采购计划</label>
					<div class="layui-input-block" style="margin-left: 170px">
						<input type="text" name="isPlan" disabled="disabled" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-row">
				<div class="layui-col-xs12">
					<div class="layui-form-text">
						<label class="layui-form-label">申请原因、市场调研情况或比价情况</label>
						<div class="layui-input-block">
							<textarea autoHeight="true" name="applyReason" disabled="disabled" class="layui-textarea"></textarea>
						</div>
					</div>
				</div>
			</div>
		</form>
		<fieldset class="layui-elem-field layui-field-title" id="fieldsetFileGrid" style="margin-top: 20px;">
			<blockquote class="layui-elem-quote">
				附件信息
			</blockquote>
			<table class="layui-hide" id="fileGrid"></table>
			<table class="layui-hide" id="fileGridExtend"></table>
		</fieldset>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<blockquote class="layui-elem-quote">计划明细(单位万元)</blockquote>
			<table class="layui-hide" id="grid"></table>
		</fieldset>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<blockquote class="layui-elem-quote">审批记录</blockquote>
			<table class="layui-hide" id="approvalGrid"></table>
		</fieldset>
	</div>

	<form name="exprotZipFileFlow" id="exprotZipFileFlow" action="com.primeton.eos.ame_common.ameExportZip.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script src="<%=request.getContextPath()%>/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
	<script>
 		layui.use([ 'jquery', 'layer', 'form', 'table'], function() {
 			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
 			var processInstID;
 			var zeroId;
 			id = <%=request.getParameter("id")%> ;
 			form.render();
 			getData();
 			function getData(){
				$.ajax({
				    url: "com.zhonghe.ame.purchase.small.getSmallResult.biz.ext",
				    data: {id: id},
				    type: "POST",//或 “GET”
				    async: false,
				    dataType: "json",
				    success: function(data) {
			    		var formData=data.smallResult;
			    		zeroId = formData.zeroId;
				    	formData.createdTime = layui.util.toDateString(formData.createdTime,'yyyy-MM-dd')
				    	formData.keYanProject = nui.getDictText('ZH_YN',formData.keYanProject)
				    	formData.isPlan = nui.getDictText('ZH_YN',formData.isPlan)
				    	form.val("dataFrm",formData);
				    	processInstID= formData.processId;
				    	document.getElementById("name").innerHTML = formData.purchaseName;
							//textarea 自适应高度
							var status = formData.appStatus;
							if(status==2){
								 document.getElementById("status").innerHTML = "审批通过 ";
							}else if(status==1 ||status==0){
									document.getElementById("status").innerHTML = "审批中 ";
									document.getElementById("status").setAttribute("style", "color:#1E9FFF;font-size: 15px;float:right;");
							}else if(status==4){
									document.getElementById("status").innerHTML = "已终止 ";
									document.getElementById("status").setAttribute("style", "color:red;font-size: 15px;float:right;");
							}
				    	$(function(){
					        $.fn.autoHeight = function(){    
							        function autoHeight(elem){
							            elem.style.height = 'auto';
							            elem.scrollTop = 0; //防抖动
							            elem.style.height = elem.scrollHeight +5+ 'px';
							        }
							        this.each(function(){
							            autoHeight(this);
							            $(this).on('keyup', function(){
							                autoHeight(this);
							            });
							        });     
							    }                
							    $('textarea[autoHeight]').autoHeight();    
							})
				    	
				    	table.render({
						    elem: '#approvalGrid'
						    ,url: 'com.zhonghe.ame.purchase.common.queryApproval.biz.ext'
						    ,where: {"processInstID": processInstID,"sortField":"time","sortOrder":"desc"} //如果无需传递额外参数，可不加该参数
								,request: {
							    pageName: 'page.begin' //页码的参数名称，默认：page
							    ,limitName: 'page.count' //每页数据量的参数名，默认：limit
							  }
				  			,method: 'post' //如果无需自定义HTTP类型，可不加该参数
						    ,cols: [[
						      {field:'time', width:180, title: '处理时间',templet: "<div>{{layui.util.toDateString(d.time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
						      ,{field:'workitemname',  title: '节点名称'}
						      ,{field:'operatorname', width:90, title: '操作人'}
						      ,{field:'auditstatus', width:90, title: '处理结果',templet: "<div>{{onCheckRenderer(d.auditstatus)}}</div>"}
						      ,{field:'auditopinion',  title: '审批意见'}
						    ]]
						    ,parseData: function(res){ //res 即为原始返回的数据
							    return {
							      "code": "0", //解析接口状态
							      "data": res.misOpinions //解析数据列表
							    };
							  }
						  });
						//data为 后台传回的数据 json 格式
				    }
				});
 			}
			var gridInt = table.render({
			    elem: '#grid'
			    ,url: 'com.zhonghe.ame.purchase.purchaseItems.queryPurZeroItem.biz.ext'
			    ,where: {"zeroId": zeroId} //如果无需传递额外参数，可不加该参数
					,cellMinWidth: 90
	  			,method: 'post' //如果无需自定义HTTP类型，可不加该参数
			    ,cols: [[
			    	{field:'ythptWlCode', width:110, title: '物料编码'}
			      ,{field:'itemName', width:240, title: '采购物项名称 '}
			      ,{field:'brandSpec', width:240, title: '品牌/型号/规格'}
			      ,{field:'unit', width:60, title: '单位'}
			      ,{field:'onePrice',width:90, title: '单价(万元)'}
			      ,{field:'num',width:60, title: '数量'}  
			      ,{field:'totalPrice', width:100, title: '总价(万元)'}
			    ]]
			    ,parseData: function(res){ //res 即为原始返回的数据
				    return {
				      "code": "0", //解析接口状态
				      "data": res.purZeroItem //解析数据列表
				    };
			    }
		  });
		  
		  var fileGridInt =  table.render({
		    elem: '#fileGrid'
		    ,url: 'com.primeton.eos.ame_common.file.getFiles.biz.ext'
		    ,where: {"groupid": "purchaseZero","relationid":zeroId,"sortField":"fileTime","sortOrder":"desc"}//如果无需传递额外参数，可不加该参数
  			,method: 'post' //如果无需自定义HTTP类型，可不加该参数
		    ,cols: [[
		      {field:'fileName',width:690, title: '附件名称 - 立项相关' ,templet: "<div>{{getdetail(d)}}</div>"}
		      ,{field:'fileSize', width:200, title: '文件大小',templet: "<div>{{getFileSize(d.fileSize)}}</div>"}
		    ]]
		    ,parseData: function(res){ //res 即为原始返回的数据
			    return {
			      "code": "0", //解析接口状态
			      "data": res.files //解析数据列表
			    };
			  }
			   ,done: function(res, curr, count){
				   var data =  res.data
				   if(data.length == 0){
				   		var audio_enable = document.getElementById('fieldsetFileGrid');		//通过表格ID获取元素
							audio_enable.style.display = 'none';		
				   }
				  }
		  });
		  
		  
		  var fileGridIntExtend =  table.render({
		    elem: '#fileGridExtend'
		    ,url: 'com.primeton.eos.ame_common.file.getFiles.biz.ext'
		    ,where: {"groupid": "smallResult","relationid":id,"sortField":"fileTime","sortOrder":"desc"}//如果无需传递额外参数，可不加该参数
  			,method: 'post' //如果无需自定义HTTP类型，可不加该参数
		    ,cols: [[
		      {field:'fileName',width:690, title: '附件名称 - 结果确认相关' ,templet: "<div>{{getdetail(d)}}</div>"}
		      ,{field:'fileSize', width:200, title: '文件大小',templet: "<div>{{getFileSize(d.fileSize)}}</div>"}
		    ]]
		    ,parseData: function(res){ //res 即为原始返回的数据
			    return {
			      "code": "0", //解析接口状态
			      "data": res.files //解析数据列表
			    };
			  }
			   ,done: function(res, curr, count){
				   var data =  res.data
				   if(data.length == 0){
				   		var audio_enable = document.getElementById('fieldsetFileGrid');		//通过表格ID获取元素
							audio_enable.style.display = 'none';		
				   }
				  }
		  });	
 });
		  //附件下载
	    function getdetail(e){
	    	return "<a href='javascript:void(0)' style ='color: #1b3fba;'  onclick='checkDetail("+e.fileId+");' title='点击查看'>" + e.fileName + "</a>";
	    }
	    
	 		function checkDetail(e){
	    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+e;
				window.open(url,"_self");
	    }
	    
	    function getFileSize(e){
			var value = e;
			var unit="KB";
			if(value>0){
				value = (value/1024).toFixed(3);
				if(value >=1024){
					value = (value/1024).toFixed(3);
					unit = "MB";
				}
			}
			return value+unit;
		} 
		
		function Implementation (d){
			var num1 = parseFloat(d.sumamount);
			var num2 = parseFloat(d.newBudgetAmount);
		
		 	var num = parseFloat(num1 / num2).toFixed(2);
			num = num*100 +"%"
			
			return num
		}
		
		 setWatermark('<%=userName%>')
		//打印按钮
		function preview() {
			document.getElementById('checkview').style.display = "none";
			/* window.document.body.innerHTML = document.documentElement.innerHTML; */
			print();
			document.getElementById('checkview').style.display = "";
		};

		function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS', e);
		}

		function downloadZipFile() {
			if (!confirm("是否确认打包下载？")) {
				return;
			}
			var relationId = id;
			var fileCatalog = 'purchaseZero';
			var json = nui.encode({
				'relationId' : relationId,
				'fileCatalog' : fileCatalog
			});
			nui.ajax({
				url : "com.primeton.eos.ame_common.file_zip.fileZip.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					if (filePath != null && filePath != "") {
						var fileName = "零星采购_" + document.getElementById("name").innerHTML + "_附件.zip";
						var frm = document.getElementById("exprotZipFileFlow");
						frm.elements["downloadFile"].value = filePath;
						frm.elements["fileName"].value = fileName;
						frm.submit();
					}
				}
			})
		}
	</script>
</body>
</html>