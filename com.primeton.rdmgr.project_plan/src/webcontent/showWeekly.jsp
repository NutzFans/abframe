<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): ganli
  - Date: 2019-05-24 14:55:51
  - Description:
-->
<head>
<title>查看周报</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
    
</head>
<body>
	<div class="nui-fit">
    	<table style="table-layout:fixed;width:100%" id="table_file1">
    		<tr>
				<td align="right"  style="width: 100%" >
					<a href='javascript:void(0)' onclick="showAllWeekly()" title="查看所有的周报" >更多周报</a>
				</td>
			</tr>
		</table>
		<fieldset id="show1.tr" style="display: none;border:solid 1px #aaa;padding:3px;">
			<table>
	            <tr>
					<td align="left" style="width:160px">提交时间：</td>
					<td style="width:250px" class = "asLabel">
						<label id="show1.ptime" style="display:inline-block;width:250px;"></label>
					</td>
					<td align="left" style="width:160px">提交人：</td>
					<td style="width:250px" class = "asLabel">
						<label id="show1.submitName" style="display:inline-block;width:150px;"></label>
					</td>
				</tr>
				<tr>
					<td align="left" colspan="4" >
						<label id="show1.weeklycont" style="display:inline-block;width:100%;"></label>
					</td>
				</tr>
			</table>
		</fieldset>
		<div style="width: 100%">&nbsp; </div>
		<fieldset id="show2.tr" style="display: none;border:solid 1px #aaa;padding:3px;">
			<table>
				<tr>
					<td align="left" style="width:160px">提交时间：</td>
					<td style="width:250px" class = "asLabel">
						<label id="show2.ptime" style="display:inline-block;width:250px;"></label>
					</td>
					<td align="left" style="width:160px">提交人：</td>
					<td style="width:250px" class = "asLabel">
						<label id="show2.submitName" style="display:inline-block;width:150px;"></label>
					</td>	
				</tr>
				<tr>
					<td align="left" colspan="4" >
						<label id="show2.weeklycont" style="display:inline-block;width:100%;"></label>
					</td>
				</tr>
			</table>
		</fieldset>
		<div style="width: 100%">&nbsp; </div>
		<fieldset id="show3.tr" style="display: none;border:solid 1px #aaa;padding:3px;">
			<table>
				<tr>
					<td align="left" style="width:160px">提交时间：</td>
					<td style="width:250px" class = "asLabel">
						<label id="show3.ptime" style="display:inline-block;width:250px;"></label>
					</td>
					<td align="left" style="width:160px">提交人：</td>
					<td style="width:250px" class = "asLabel">
						<label id="show3.submitName" style="display:inline-block;width:150px;"></label>
					</td>
				</tr>
				<tr>
					<td align="left" colspan="4" >
						<label id="show3.weeklycont" style="display:inline-block;width:100%;"></label>
					</td>
				</tr>
	        </table>
        </fieldset>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
    	nui.parse();
    	var form = new nui.Form("form1");
    	var projectNo="";
    	
    	function setFormData(data) {
		    data = nui.clone(data);
		    projectNo = data.projectNo;
		    if (data) {
	            nui.ajax({
		            url: "com.primeton.rdmgr.project_plan.projectPlanManager.query3Weekly.biz.ext",
		            type: 'POST',
		            data: {"projectNo":data.projectNo},
		            contentType: 'text/json',
		            success: function (text) {
		            	var weeklys=text.weeklys;
		            	for(var i=0;i<weeklys.length;i++){
		            		var j=i+1;
		            		document.getElementById("show"+j+".tr").style.display="inline";
		            		document.getElementById("show"+j+".ptime").innerHTML=weeklys[i].ptime+" ("+weeklys[i].weekday+")";
		            		document.getElementById("show"+j+".submitName").innerHTML=weeklys[i].submitName;
		            		document.getElementById("show"+j+".weeklycont").innerHTML=weeklys[i].weeklycont;
		            	}
		            }
		        }); 
		    }
	    }
	    
	    function showAllWeekly(){
	    	nui.open({
		        url: "<%=request.getContextPath() %>/project_plan/weeklyList.jsp",
		        title: "查看周报",
		        width: 800,
		        height: 510,
		        onload: function () { //弹出页面加载完成
		            var iframe = this.getIFrameEl();
		            iframe.contentWindow.setFormData(projectNo);
		        },
		        ondestroy: function (action) { //弹出页面关闭前
		            //search();
		        }
		    });
	    }
	    
    	function onCancel() {
	        if(window.CloseOwnerWindow){
	 			return window.CloseOwnerWindow("Cancel");
	 		}else{
	 			window.close();
	 		} 
	    }
	</script>
</html>