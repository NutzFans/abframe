<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
	UserObject user = (UserObject) session.getAttribute("userObject");
	String username = user.getUserName();
	String userno = user.getUserId();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2017-01-10 15:17:08
  - Description:
-->
<head>
	<title>调整投入比重</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post">
			<input class="nui-hidden" id="outperno" />
			<input class="nui-hidden" id="outpername" />
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<div id="purProjOutper_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="purProjOutper" 
				 showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
				 url="com.primeton.eos.ame_pur.outperson.queryProjByReport.biz.ext" showFooter="false" 
				 oncellendedit="inputratioendedit">
				<div property="columns">
					<div field="projoutid" align="center" headerAlign="center" visible="false">编号</div>
					<div field="custid1" align="center" headerAlign="center" visible="false">服务客户编号</div>
					<div field="projectname" width="200" align="left" headerAlign="center" >服务项目
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
					<div field="custname" width="auto" align="left" headerAlign="center">服务客户
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
					<div field="currentstatus" width="90" align="center" headerAlign="center" renderer="dictGetStatus">服务状态</div>
					<div field="inputratio" width="60" align="center" headerAlign="center">投入比重
						<input property="editor" class="nui-spinner" minValue="0" maxValue="2" changeOnMousewheel="false" 
							showButton="false" inputStyle="text-align: right" style="width: 50px" />
					</div>
					<div field="startdate" width="100" align="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" headerAlign="center">调整日期
						<input property="editor" class="nui-datepicker" style="width: 100%" />
					</div>
					<div field="startdateOld" width="80" align="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" headerAlign="center">入场日期
					</div>
					<div field="enddate" width="80" align="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" headerAlign="center">离场日期
					</div>
					<div field="manager" width="80" align="center" headerAlign="center" displayField="managername">汇报对象</div>
				</div>
			</div>
			</fieldset>
		</form>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		form.setChanged(false);
		var purProjOutper_grid = nui.get("purProjOutper_grid");
		var oldDatas;
		var suppliersname = "";
		
		function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "adjustInputratio"){
		    	nui.get("outperno").setValue(data.outperno);
		    	nui.get("outpername").setValue(data.outpername);
		    	purProjOutper_grid.sortBy("startdate","desc");
            	purProjOutper_grid.load({purOutperson: {outperno: data.outperno,"iden": "changeProject"}},function(){
            		oldDatas = nui.clone(purProjOutper_grid.getData());
            	});
            	suppliersname = data.suppliersname;
    		}
    	}
    	
    	purProjOutper_grid.on("drawcell", function (e) {
            var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
            //格式化日期
            if (field == "birthday") {
                if (nui.isDate(value)) e.cellHtml = nui.formatDate(value, "yyyy-MM-dd");

            }
            //给投入比重，增加背景色
            if (field == "inputratio" || field == "startdate") {
                e.cellStyle = "background: cyan";
            }
        });
    	
    	/**
    	 * 投入比重编辑
    	 */
    	function inputratioendedit(e){
    		/* var datas = purProjOutper_grid.getData();
    		var suminputratio = 0;
			for(var i=0;i<datas.length;i++){
				var inputratio = datas[i].inputratio;
				if(inputratio){
					if(!isNaN(inputratio)){
						suminputratio += parseFloat(inputratio);
					}
				}
			}
			suminputratio = parseFloat(suminputratio);
			if(suminputratio > 2){
				nui.alert("投入比重之和不能大于2！");
				return;
			} */
			
    	}
    	
    	/**
	     * 保存
	     */
	    function onOk(){
	    	var datas = purProjOutper_grid.getData();
    		/* var suminputratio = 0;
			for(var i=0;i<datas.length;i++){
				var inputratio = datas[i].inputratio;
				if(inputratio){
					if(!isNaN(inputratio)){
						suminputratio += parseFloat(inputratio);
					}
				}
			}
			suminputratio = parseFloat(suminputratio);
			if(suminputratio > 2){
				nui.alert("投入比重之和不能大于2！");
				return;
			} */
	    	var outperno = nui.get("outperno").getValue();
			var outpername = nui.get("outpername").getValue();
			var changeRows = purProjOutper_grid.getChanges();
			<%-- //变更信息
			var updateMessage = "外包人员【" + outpername + "】从【" + oldprojectname + "】调整到【" + projectname + 
				"】，原项目离场日期是：" + oldactenddate + "，新项目入场日期是：" + startdate + "，预计离场日期是：" + 
				expenddate + "，汇报对象是：" + manager + "。";
			updateMessage += "操作者是" + "<%=username %>" + "。"; --%>
			var updateMessage = "合作伙伴【"+ suppliersname +"】的外包人员【" + outpername + "】";
			for(var i = 0;i < changeRows.length;i ++){
				if(changeRows[i].startdate < changeRows[i].startdateOld){
					nui.alert("调整日期不能小于入场日期！");
					return;
				}
				for(var j = 0;j < oldDatas.length;j ++){
					if(changeRows[i].projoutid == oldDatas[j].projoutid){
						updateMessage += "，在项目【"+changeRows[i].projectname+"】的投入比例从"+oldDatas[j].inputratio+
							"调整到"+changeRows[i].inputratio+"，调整日期为"+changeRows[i].startdate.substring(0,10);
					}
				}
			}
			updateMessage += "。操作者是" + "<%=username %>" + "。";
	    	var json = nui.encode({"outperno": outperno,"outpername": outpername,"changeRows": changeRows,"updateMessage": updateMessage});
	    	if(changeRows != ""){
		    	nui.confirm("确认调整投入比重？", "确定？",
		            function (action) {            
		                if (action == "ok") {
					    	form.loading("数据处理中...");
				        	nui.ajax({
				        		url: "com.primeton.eos.ame_pur.outperson.adjustInputratio.biz.ext",
				                data: json,
				                type: 'POST',
				                cache: false,
				                contentType: 'text/json',
				                success: function (o) {
				                	form.unmask();
				                	o = nui.clone(o);
				                	var returnJson = nui.decode(o);
									if(returnJson.exception == null){
				                		nui.alert("保存成功！","操作提示",function(){
				                			CloseWindow("ok");
				                		});
				                	}else{
				                		nui.alert("保存失败！");
				                	}
				                },
				                error: function (jqXHR, textStatus, errorThrown) {
				                    alert(jqXHR.responseText);
				                    CloseWindow();
				                }
				        	});
				        }
					}
				);
			}else{
				nui.alert("未做调整，不需要保存！");
				return;
			}
	    }
    	
    	//设置业务字典值-人员状态
		function dictGetStatus(e){
			return nui.getDictText('AME_OUTPERSTATUS',e.value);
		}
		
		//设置日期格式
		function onDealDate(e){
			if(e.cellHtml){
				return e.cellHtml.substring(0,10);
			}
		}
		
    	function onCancel(e) {
        	if(purProjOutper_grid.isChanged()){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action == "yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
        
        //标准方法接口定义
        function CloseWindow(action) {
            if (action == "close" && purProjOutper_grid.isChanged()) {
            	if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
    </script>
</body>
</html>