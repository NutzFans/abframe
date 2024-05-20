<%@page pageEncoding="UTF-8"%>
<%@include file="/purchase/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>采购立项打印页面</title>
<meta name="renderer" content="webkit">
<script src="<%=request.getContextPath()%>/common/nui/warterMark.js" type="text/javascript"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
<style type="text/css">
.layui-form-label {
	width: 145px !important;
	text-align: left !important;
}

.layui-input-block {
	margin-left: 145px !important;
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
	<div style="margin: 0 auto; width: 900px; height: auto;">
		<div align="right">
			<button type="button" id="checkview" class="layui-btn" onclick="preview()">打印</button>
		</div>
		<form class="layui-form layui-form-pane" lay-filter="dataFrm" id="dataFrm">
			<h3 id="name" align="center"></h3>
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<blockquote class="layui-elem-quote" style="width: 97%">
					基本信息
					<i id="status" class="layui-icon" style="font-size: 15px; float: right; color: #5FB878;">审批通过</i>
				</blockquote>

				<div class="layui-row">
					<div class="layui-col-xs12">
						<label class="layui-form-label" style="width: 120px">立项名称</label>
						<div class="layui-input-block">
							<input type="text" name="proAppName" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>

				<div class="layui-row">
					<div class="layui-col-xs12">
						<label class="layui-form-label">申请人</label>
						<div class="layui-input-block">
							<input type="text" name="createdUsername" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs12">
						<label class="layui-form-label">采购需求单位</label>
						<div class="layui-input-block">
							<input type="text" name="proAppOrgName" disabled="disabled" class="layui-input">
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
						<label class="layui-form-label">立项编号</label>
						<div class="layui-input-block">
							<input type="text" name="proAppCode" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-12">
						<label class="layui-form-label">涉密协作配套</label>
						<div class="layui-input-block">
							<input type="text" name="isSmpt" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs6">
						<label class="layui-form-label">所属项目名称</label>
						<div class="layui-input-block">
							<input type="text" name="projectId" disabled="disabled" class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6">
						<label class="layui-form-label">立项金额(万元)</label>
						<div class="layui-input-block">
							<input type="text" name="proAppApplyPrice" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs6">
						<label class="layui-form-label">集采类型</label>
						<div class="layui-input-block">
							<input type="text" name="type" disabled="disabled" class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6">
						<label class="layui-form-label">费用来源</label>
						<div class="layui-input-block">
							<input type="text" name="costFrom" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs6">
						<label class="layui-form-label">采购方式</label>
						<div class="layui-input-block">
							<input type="text" name="purchasMode" disabled="disabled" class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6">
						<label class="layui-form-label">物项类别</label>
						<div class="layui-input-block">
							<input type="text" name="proAppObjType" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs6">
						<label class="layui-form-label">是否招标限价</label>
						<div class="layui-input-block">
							<input type="text" name="tenderLimit" disabled="disabled" class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6">
						<label class="layui-form-label">招标限价金额</label>
						<div class="layui-input-block">
							<input type="text" name="limit" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs6">
						<label class="layui-form-label">是否电子采购</label>
						<div class="layui-input-block">
							<input type="text" name="isDzcg" disabled="disabled" class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6">
						<label class="layui-form-label">电采平台发布公告</label>
						<div class="layui-input-block">
							<input type="text" name="isGb" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>

				<div class="layui-row">
					<div class="layui-col-xs6">
						<label class="layui-form-label">供应商选取范围</label>
						<div class="layui-input-block">
							<input type="text" name="supplierScope" disabled="disabled" class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6">
						<label class="layui-form-label">合同/订单性质</label>
						<div class="layui-input-block">
							<input type="text" name="nature" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>

				<div class="layui-row">
					<div class="layui-col-xs12">
						<label class="layui-form-label">供应商信息</label>
						<div class="layui-input-block">
							<input type="text" name="supplierName" disabled="disabled" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs12">
						<label class="layui-form-label">选择此供应商原因</label>
						<div class="layui-input-block">
							<textarea autoHeight="true" name="supplierReason" disabled="disabled" class="layui-textarea"></textarea>
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs12">
						<label class="layui-form-label">立项范围</label>
						<div class="layui-input-block">
							<textarea autoHeight="true" name="proAppRange" disabled="disabled" class="layui-textarea"></textarea>
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs12">
						<label class="layui-form-label">采购方式理由</label>
						<div class="layui-input-block">
							<textarea autoHeight="true" name="wayReason" disabled="disabled" class="layui-textarea"></textarea>
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs12">
						<label class="layui-form-label">相关情况说明</label>
						<div class="layui-input-block">
							<textarea autoHeight="true" name="remark" disabled="disabled" class="layui-textarea"></textarea>
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
 			id = <%=request.getParameter("id")%> ;
 			form.render();
 			getData();
 			function getData(){
				$.ajax({
				    url: "com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext",
				    data: {id: id},
				    type: "POST",//或 “GET”
				    dataType: "json",
				    success: function(data) {
			    	var formData=data.proApp[0];
				    	formData.createdTime = layui.util.toDateString(formData.createdTime,'yyyy-MM-dd')
				    	//设置字典值
				    	formData.isSmpt = nui.getDictText('ZH_YN',formData.isSmpt)
				    	formData.classified = nui.getDictText('ZH_CLASSIFIED',formData.classified)
				    	formData.costFrom = nui.getDictText('ZH_COST_FROM',formData.costFrom)
				    	formData.type = nui.getDictText('ZH_PURCHASE',formData.type)
				    	formData.proAppObjType = nui.getDictText('MIS_APPOBJTYPE',formData.proAppObjType)
				    	formData.purchasMode = nui.getDictText('ZH_CGFS',formData.purchasMode)
				    	formData.tenderLimit = nui.getDictText('ZH_YN',formData.tenderLimit)
				    	formData.isDzcg = nui.getDictText('ZH_YN',formData.isDzcg)
				    	formData.isGb = nui.getDictText('ZH_YN',formData.isGb)
				    	formData.supplierScope = nui.getDictText('ZH_SUPPLIER_SCOPE',formData.supplierScope)
				    	
				    	form.val("dataFrm",formData);
				    	processInstID= formData.processid;
				    	 document.getElementById("name").innerHTML = formData.proAppName;
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
		    ,url: 'com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext'
		    ,where: {"pid": id} //如果无需传递额外参数，可不加该参数
				,cellMinWidth: 90
  			,method: 'post' //如果无需自定义HTTP类型，可不加该参数
		    ,cols: [[
		      {field:'code',width:185, title: '计划编号'}
		      ,{field:'planName', width:255, title: '计划名称'}
		      ,{field:'materialName', width:250, title: '采购物项名称 '}
		      ,{field:'budgetAmount',width:90, title: '预算金额'}
		      ,{field:'amount',width:110, title: '立项金额'}  
// 		      ,{field:'needOrgName', width:100, title: '采购单位'}
		    ]]
		    ,parseData: function(res){ //res 即为原始返回的数据
			    return {
			      "code": "0", //解析接口状态
			      "data": res.datas //解析数据列表
			    };
			  }
		  });
		  
		 var fileGridInt =  table.render({
		    elem: '#fileGrid'
		    ,url: 'com.primeton.eos.ame_common.file.getFiles.biz.ext'
		    ,where: {"groupid": "proAppCost","relationid":id,"sortField":"fileTime","sortOrder":"desc"}//如果无需传递额外参数，可不加该参数
  			,method: 'post' //如果无需自定义HTTP类型，可不加该参数
		    ,cols: [[
// 		      {field:'fileId', title: '附件ID' }
		      {field:'fileName',width:690, title: '附件名称' ,templet: "<div>{{getdetail(d)}}</div>"}
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
//     	var grid = nui.get("grid_0");
//     	var selectRow = grid.getSelected();
		
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
        document.getElementById('checkview').style.display="none";
        /* window.document.body.innerHTML = document.documentElement.innerHTML; */
        print();
        document.getElementById('checkview').style.display="";
    };
    
    //字典转换
    function status(name,DictDatas){
         	var dictName ;
        	DictDatas.forEach((item, index, checkStatus) => {
			     if(item.dictID == name){
			        dictName = item.dictName;
			     }
		     })
		     return dictName;
		};
    
	  function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e);
		}
		
		function downloadZipFile() {
			if (!confirm("是否确认打包下载？")) {
				return;
			}
			var relationId = id;
			var fileCatalog = 'proAppCost';
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
						var fileName = "采购立项_" + document.getElementById("name").innerHTML + "_附件.zip";
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