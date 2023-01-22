<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/purchase/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>z重点任务投票</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="nui-fit">
		<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>重点任务投票</legend>
			<form id="form1" method="post" >
				<table style="table-layout: fixed;" id="table_file1">
					<tr>
						<td align="right" style="width: 160px">名称:</td>
						<td>
							<input readOnly="readOnly" class="nui-textbox" name="keytaskName" id="keytaskName" style="width: 425px" required="true">
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 160px">所属单位:</td>
						<td>
						<input id="combo1" class="nui-combobox" style="width: 425px;"
							textField="ORGNAME" valueField="ORGID" emptyText="请选择单位..." url="com.zhonghe.ame.imptask.keytask.queryOrgEmp.biz.ext"
							required="false" allowInput="true" dataField="EmpOrgs" 
							showNullItem="true" nullItemText="请选择单位..." />
						</td>
						
						<td align="right" style="width: 160px">投票结束时间:</td>
						<td style="width: 130px">
							<input name="finishtime" id="voteFinshtime" class="nui-datepicker" style="width: 150px" required="true" readOnly="readOnly" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 160px">备注:</td>
						<td colspan="6">
						<input class="nui-textarea" dictTypeId="ZH_TASK_STATUS" name="remake" id="remake"
							shownullItem="true" style="width: 900px;" required="true"
							readOnly="readOnly" />
					</tr>
				</table>
			</form>
		</fieldset>
		<fieldset style="border: solid 1px #aaa; padding: 3px; width: 99%;"
			align="center">
			<legend>被投票重点任务</legend>
			<div id="grid_traveldetail" class="nui-datagrid"
				style="width: 100%; height: 55%;" allowCellSelect="true"
				url="com.zhonghe.ame.imptask.keyTaskVote.queryKeytaskById.biz.ext"
				dataField="keytask" showPager="false" allowCellEdit="true"
				multiSelect="true">
				<div property="columns" name="temp123"  valueField="keytaskList">
					<div field="keytaskIds" width="832px" align="center" headerAlign="center">重点任务名称</div>
					<div field="custName" displayField="custName" width="100" align="center" headerAlign="center" renderer="getValue">
						排名 <input id="activityid" property="editor"name="criteria._expr[1]._value" changeOnMousewheel="false"
							class="nui-spinner" minValue="1" onvaluechanged="check" />
					</div>
				</div>
			</div>
		</fieldset>
	</div>
	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="appButton"
			style="width: 60px; margin-right: 20px;">确定</a> 
		<a class="nui-button" onclick="onCancel('cancel')" style="width: 60px;">关闭</a>
	</div>

	<script type="text/javascript">

		nui.parse();
    	var form = new nui.Form("form1");
    	var id = <%=request.getParameter("id")%>;
    	var gaid22 = nui.get("datagrid22");
    	var grid_traveldetail = nui.get("grid_traveldetail");
    	var size=0;
    	var monthData = [];
    	
	
		init();
		function init(){                         //
			var data = {"id":id};			
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.zhonghe.ame.imptask.keyTaskVote.queryKeytaskById.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
						var a=o.keytask[0].keytaskList.split(",")
						size=a.length;
			            form.setData(o.keytask[0]);
			            var keyTask = o.keytask[0];
				        for(var i=0;i<size;i++){
							monthData.add ({keytaskIds: a[i]},)		
						} 
						grid_traveldetail.setData(monthData)
			    }
			});
		}

		
	function check(){
		var spinner = nui.get("activityid");
		var val = spinner.getValue();
		var arr=grid_traveldetail.data;
		var maxValue = arr.length;
		if(val>maxValue){
		  nui.alert("排名超出被投票单位总数");
		  return;
		}
	}
	
	
	
   //判断数组是否有重复值
	function isRepeat(ary) {
    var nary = ary.sort();
    for (var i = 0; i < ary.length; i++) {
        if (nary[i] == nary[i + 1]) {
              return true;
	        }else{
	          return false;
	        }
	    }
	}
	
		
	function submit(){
    			var data = form.getData();
    			var arr=grid_traveldetail.data;
    			var obj= {};
    			var a=[];
    			var b=0;
    			for(var i=0;i<arr.length;i++){
    				a.add(arr[i].custName);
    			}
    			var s = a.join(",")+",";
    			for(var i=0;i<a.length;i++){
    				if(a[i]!=undefined&&a[i]!=""){
    				
    					if(s.replace(a[i]+",","").indexOf(a[i]+",")>-1) {
    						b=1;	
							nui.alert("参与投票重点任务排名不能重复");
							break;
						}
    				}else{
    					b=1;
    					nui.alert("参与投票重点任务排名不能为空");
    					break;
    				}
    			}
    			var json = nui.encode({"data":arr,"id":id,"orgid":nui.get("combo1").getValue()});
    			if(nui.get("combo1").getValue() == "") {
    				nui.showTips({
					   content:"请选择所属单位",
					   state: "success",
					   x:"center",
					   y:"center",
					   timeout: 2000.
					});
					return;
    			}
    			//console.log(combo);  
		  		console.log(json);
		  		if(b==0){
					if(!confirm("确认提交")){
	        				return;
	        			}else{	
			    		 nui.ajax({
			                url: "com.zhonghe.ame.imptask.keyTaskVote.addKeytaskDetails.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                	 if(text.result==1){
			                	 nui.alert("提交成功","系统提示",function(){
					        		CloseWindow("ok");
					        	 });
			                	 }else if (text.result == 2){
			                	 nui.showTips({
					           			content:"不能重复提交投票哦",
					           			state: "success",
					           			x:"center",
					           			y:"center",
					           			timeout: 2000.
					           		});
			                	 }else if (text.result == 3){
			                	 nui.showTips({
					           			content:"被投票部门不能与投票部门重复",
					           			state: "success",
					           			x:"center",
					           			y:"center",
					           			timeout: 2000.
					           		});
			                	 } else if (text.result == 4){
			                	 nui.showTips({
					           			content:"投票已超时不能再投票",
					           			state: "success",
					           			x:"center",
					           			y:"center",
					           			timeout: 2000.
					           		});
			                	 } else {
			                	 	nui.alert("提交投票失败,请联系工作人员","系统提示", function(action){
								});
			                	 }
			                },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                }
			            });  
			            }
    				}  	
    	}
	
	function CloseWindow(action) {            
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    function onCancel(e) {
        CloseWindow("cancel");
    }  
    //设置日期格式
	function onDealDate(e){
		if(e.cellHtml){
			return e.cellHtml.substring(0,10);
		}
	}
	 function getDate() {
        let today = new Date();
        // console.log(today):  Wed Jul 17 2019 17:48:53 GMT+0800 (中国标准时间)
        let date = today.toLocaleString().replace(/下午/, " ");
        // console.log(today.toLocaleString()):  2019/7/17 下午5:48:53 
        return date;
    }
    document.write(getDate());
   	</script>
</body>
</html>