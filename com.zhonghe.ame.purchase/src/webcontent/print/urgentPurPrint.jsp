<%@page pageEncoding="UTF-8"%>
<%@include file="/purchase/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>打印页面</title>
  <meta name="renderer" content="webkit">
  <script src="<%= request.getContextPath() %>/common/nui/warterMark.js" type="text/javascript"></script>
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
    .layui-elem-quote{
        font-weight: bold;
		}
		.layui-textarea{
				height: 20px;
				min-height: 20px!important;
		}
	.layui-table-cell {
            font-size:14px;
            padding:0 5px;
            height:auto;
            overflow:visible;
            text-overflow:inherit;
            white-space:normal;
            word-break: break-all;
        }
	</style>
</head>
<body>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<div style="margin: 0 auto; width: 900px;height: auto;">
	<div align="right">
		<button type="button" id="checkview" class="layui-btn"  onclick="preview()">打印</button>
	</div>
  <form class="layui-form layui-form-pane" lay-filter="dataFrm" id="dataFrm" >
  	<h3 id="name" align="center"></h3>
  	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <blockquote class="layui-elem-quote" style="width: 97%">基本信息
    <i id="status" class="layui-icon" style="font-size: 15px;float:right; color: #5FB878;">审批通过</i> 
    </blockquote>
  	  
	  <div class="layui-row">
	    <div class="layui-col-xs12">
		    <label class="layui-form-label" style="width: 120px">紧急采购名称</label>
		    <div class="layui-input-block" >
		      <input type="text" name="purchaseName" disabled="disabled" class="layui-input">
		    </div>
	    </div>
	  </div>
	  
	  <div class="layui-row">
	    <div class="layui-col-xs6">
		    <label class="layui-form-label">申请人</label>
		    <div class="layui-input-block">
		      <input type="text" name="empname" disabled="disabled" class="layui-input">
		    </div>
	    </div>
	    <div class="layui-col-xs6">
		    <label class="layui-form-label">申请单位</label>
		    <div class="layui-input-block">
		      <input type="text" name="orgname" disabled="disabled" class="layui-input">
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
		    <label class="layui-form-label">紧急采购编号</label>
		    <div class="layui-input-block">
		      <input type="text" name=purchaseCode disabled="disabled" class="layui-input">
		    </div>
	    </div>
	  </div>
	  <div class="layui-row">
	    <div class="layui-col-xs6">
		    <label class="layui-form-label">合同发包方式</label>
		    <div class="layui-input-block">
		      <input type="text" name="contrctType" disabled="disabled" class="layui-input">
		    </div>
	    </div>
	  </div>
	  <div class="layui-row">
	    <div class="layui-col-xs12">
		    <label class="layui-form-label">申请原因</label>
		    <div class="layui-input-block">
		      <textarea autoHeight="true" name ="applyReason" disabled="disabled" class="layui-textarea"></textarea>
		    </div>
	    </div>
	  </div>
	  
	  </fieldset>
	   </form>
	  <fieldset class="layui-elem-field layui-field-title" id="fieldsetFileGrid"  style="margin-top: 20px;">
    	<blockquote class="layui-elem-quote">附件信息</blockquote>
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
<script src="<%= request.getContextPath() %>/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<script>
 layui.use([ 'jquery', 'layer', 'form', 'table'], function() {
 			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
 			var processInstID;
//  			var id = 916
 			id = <%= request.getParameter("id") %> ;
 			form.render();
 			getData();
 			function getData(){
				$.ajax({
				    url: "com.zhonghe.ame.purchase.purchaseItems.queryPurUrgentDetailByid.biz.ext",
				    data: {id: id},
				    type: "POST",//或 “GET”
				    dataType: "json",
				    success: function(data) {
			    	var formData=data.purUrgent;
				    	formData.createdTime = layui.util.toDateString(formData.createdTime,'yyyy-MM-dd')
				    	//设置字典值
				    	formData.contrctType = nui.getDictText('ZH_CGFS',formData.contrctType)
				    	form.val("dataFrm",formData);
				    	processInstID= formData.processid;
				    	 document.getElementById("name").innerHTML = formData.purchaseName;
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
		    ,url: 'com.zhonghe.ame.purchase.purchaseItems.queryPurUrgentItem.biz.ext'
		    ,where: {"urgentId": id} //如果无需传递额外参数，可不加该参数
				,cellMinWidth: 90
  			,method: 'post' //如果无需自定义HTTP类型，可不加该参数
		    ,cols: [[
		      {field:'firstitemvalue',width:175, title: '物项大类'}
		      ,{field:'seconditemvalue', width:215, title: '物项中类'}
		      ,{field:'brandSpec', width:200, title: '规格 '}
		      ,{field:'onePrice',width:90, title: '单价(万元)'}
		      ,{field:'number',width:110, title: '数量'}  
		      ,{field:'totalPrice', width:100, title: '总价(万元)'}
		    ]]
		    ,parseData: function(res){ //res 即为原始返回的数据
			    return {
			      "code": "0", //解析接口状态
			      "data": res.purUrgentItem //解析数据列表
			    };
			  }
		  });
		  
		 var fileGridInt =  table.render({
		    elem: '#fileGrid'
		    ,url: 'com.primeton.eos.ame_common.file.getFiles.biz.ext'
		    ,where: {"groupid": "proAppSup","relationid":id,"sortField":"fileTime","sortOrder":"desc"}//如果无需传递额外参数，可不加该参数
  			,method: 'post' //如果无需自定义HTTP类型，可不加该参数
		    ,cols: [[
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
		
		 setWatermark('<%=userName %>')
		  //打印按钮
		function preview() {
        document.getElementById('checkview').style.display="none";
        /* window.document.body.innerHTML = document.documentElement.innerHTML; */
        print();
        document.getElementById('checkview').style.display="";
    };
    
    function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e);
		}
</script>
</body>
</html>