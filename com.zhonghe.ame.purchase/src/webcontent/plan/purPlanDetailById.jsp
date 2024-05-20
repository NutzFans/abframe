<%@page pageEncoding="UTF-8"%>
<%@include file="/purchase/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>采购计划申请查看</title>
<meta name="renderer" content="webkit">
<script src="<%=request.getContextPath()%>/common/nui/warterMark.js" type="text/javascript"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
<style type="text/css">
.layui-form-label {
	width: 130px !important;
	text-align: left !important;
}

.layui-input-block {
	margin-left: 130px !important;
}

.layui-elem-quote {
	font-weight: bold;
}

.layui-textarea {
	height: 20px;
	min-height: 20px !important;
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
	<div style="margin: 0 auto; width: 98%; height: auto;">
		<form class="layui-form layui-form-pane" lay-filter="dataFrm" id="dataFrm">
			<h2 id="name" align="center"></h2>
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<blockquote class="layui-elem-quote" style="width: 97%">
					基本信息
					<i id="status" class="layui-icon" style="font-size: 15px; float: right; color: #5FB878;">审批通过</i>
				</blockquote>
				<div class="layui-row">
					<div class="layui-col-xs12">
						<label class="layui-form-label" style="width: 120px">计划名称</label>
						<div class="layui-input-block">
							<input type="text" name="name" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>

				<div class="layui-row">
					<div class="layui-col-xs6">
						<label class="layui-form-label">申请人</label>
						<div class="layui-input-block">
							<input type="text" name="infomantUser" disabled="disabled" class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6">
						<label class="layui-form-label">申请单位</label>
						<div class="layui-input-block">
							<input type="text" name="needOrgName" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs6">
						<label class="layui-form-label">申请时间</label>
						<div class="layui-input-block">
							<input type="text" name="createdTime" disabled="disabled" placeholder="yyyy-MM-dd" class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6">
						<label class="layui-form-label">财务预算科目</label>
						<div class="layui-input-block">
							<input type="text" name="title" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs6">
						<label class="layui-form-label">计划年度</label>
						<div class="layui-input-block">
							<input type="text" name="year" disabled="disabled" class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6">
						<label class="layui-form-label">采购类型</label>
						<div class="layui-input-block">
							<input type="text" name="type" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs6">
						<label class="layui-form-label">计划金额(万元)</label>
						<div class="layui-input-block">
							<input type="text" name="budgetAmount" id="budgetAmount" disabled="disabled" class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6">
						<label class="layui-form-label">变更后计划金额</label>
						<div class="layui-input-block">
							<input type="text" name="newBudgetAmount" id="newBudgetAmount" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs12">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-block">
							<textarea autoHeight="true" name="remark" disabled="disabled" class="layui-textarea"></textarea>
						</div>
					</div>
				</div>
				<div id="changeReasonDiv" class="layui-row">
					<div class="layui-col-xs12">
						<label class="layui-form-label">调整原因</label>
						<div class="layui-input-block">
							<textarea autoHeight="true" name="changeReason" disabled="disabled" class="layui-textarea"></textarea>
						</div>
					</div>
				</div>

			</fieldset>
		</form>
		<fieldset class="layui-elem-field layui-field-title" id="fieldsetFileGrid" style="margin-top: 20px;">
			<blockquote class="layui-elem-quote">
				附件信息&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='downloadZipFile();' style='color: #1b3fba'>打包下载</a>
			</blockquote>
			<table class="layui-hide" id="fileGrid"></table>
		</fieldset>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<blockquote class="layui-elem-quote">计划明细(单位万元)</blockquote>
			<table class="layui-hide" id="grid"></table>
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
 			id = <%=request.getParameter("id")%> ;
 			$("#changeReasonDiv").hide();
 			form.render();
 			getData();
 			function getData(){
				$.ajax({
				    url: "purchase/plan/com.zhonghe.ame.purchase.purchaseItems.queryPurPlanDetailById.biz.ext",
				    data: {id: id},
				    type: "POST",//或 “GET”
				    dataType: "json",
				    success: function(data) {
				    	var formData = data.purPlan;
				    	formData.createdTime = layui.util.toDateString(formData.createdTime,'yyyy-MM-dd')
				    	if(formData.type =="1"){
				    		formData.type = "一级集采"
				    	}else if(formData.type == "2"){
				    		formData.type = "二级集采"
				    	}else if(formData.type =="3"){
				    		formData.type = "自行采购"
				    	}
				    	if(formData.changeReason != null && formData.changeReason !=""){
				    		$("#changeReasonDiv").show();
				    	}
				    	form.val("dataFrm",formData);
				    	processInstID= formData.processid;
				    	 document.getElementById("name").innerHTML = formData.name;
							//textarea 自适应高度
							var status = formData.status;
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
				    }
				});
 			}
  
		var gridInt = table.render({
		    elem: '#grid'
		    ,url: 'com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext'
		    ,where: {"planId": id} //如果无需传递额外参数，可不加该参数
				,cellMinWidth: 90
  			,method: 'post' //如果无需自定义HTTP类型，可不加该参数
		    ,cols: [[
		      {field:'code', title: '计划编号'}
		      ,{field:'materialName', title: '物项名称'}
		      ,{field:'purchaseFirstName', title: '物项大类名称'}
		      ,{field:'purchaseTwoName', title: '中类名称'}
		      ,{field:'newNumber', title: '数量'}
		      ,{field:'oldBudgetAmount', title: '原预算金额'}
		      ,{field:'newBudgetAmount', title: '变更后金额'}
		      ,{field:'sumamount', title: '已立项金额'}  
		      ,{field:'sumamountRate', title: '计划执行情况'}
		      ,{field:'remark', width:300, title: '备注'}  
		    ]]
		    ,parseData: function(res){ //res 即为原始返回的数据
			    return {
			      "code": "0", //解析接口状态
			      "data": res.purPlanItem //解析数据列表
			    };
			  }
		  });
		  
		 var fileGridInt =  table.render({
		    elem: '#fileGrid'
		    ,url: 'com.primeton.eos.ame_common.file.getFiles.biz.ext'
		    ,where: {"groupid": "PURCHASEPLAN","relationid":id,"sortField":"fileTime","sortOrder":"desc"}//如果无需传递额外参数，可不加该参数
  			,method: 'post' //如果无需自定义HTTP类型，可不加该参数
		    ,cols: [[
		      {field:'fileName',width:700, title: '附件名称' ,templet: "<div>{{getdetail(d)}}</div>"}
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
		
		function Implementation1 (d){
			var num1 = parseFloat(d.sumamount);
			var num2 = parseFloat(d.budgetamounts);
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
		
		function downloadZipFile() {
			if (!confirm("是否确认打包下载？")) {
				return;
			}
			var relationId = id;
			var fileCatalog = 'PurchasePlan';
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
						var fileName = "采购计划_" + document.getElementById("name").innerHTML + "_附件.zip";
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