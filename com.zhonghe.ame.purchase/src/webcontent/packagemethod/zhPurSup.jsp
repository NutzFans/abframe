<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>供应商信息列表查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-panel" title="供应商管理" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr align="center">
						<td align="right" style="width:220px;"><span>供应商名称：</span></td>
		            	<td align="left" style="width:280px;">
						    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:204px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						    
						</td> 
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="purSuppliers" 
	    	allowCellEdit="true" url="com.zhonghe.ame.purchase.purSupplier.querySuppliers.biz.ext" sizeList="[10,20,50,100,200,500,1000,10000]"
	    	 idField="appid" multiSelect="false"> 
	    	 
			<div property="columns">
				<div type="checkcolumn" width="25"></div>	
				<div field="custname" width="180" align="left" headerAlign="center" allowSort="true">供应商名称
					<input property="editor" class="nui-textbox" style="width:100%;" />
				</div>
				<div field="custtype" width="110" align="center" headerAlign="center" renderer="dictcusttype">供应商类型</div>
				<div field="isqualified" width="110" align="center" headerAlign="center" renderer="dictstatus" >是否合格供应商</div>
				<div field="registercap" width="75" align="center" headerAlign="center" allowSort="true">注册资金(万元)</div>							
				<div field="linkman" width="60" align="center"  headerAlign="center"  allowSort="true">供应商联系人</div>
				<div field="linktel" width="110" align="left"  headerAlign="center" allowSort="true">供应商联系电话</div>			
			</div>
		</div>
	</div>
	<div style="text-align: center;padding: 5px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">确定</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
		/**供应商查询*/
		var form = new nui.Form("#form1");
    	nui.parse();
    	var grid = nui.get("datagrid1");
    	//init();
    	grid.load();
    	function init(){
    		grid.load();
			grid.sortBy("custid","desc");
		}
		function dictstatus(e) {
			return nui.getDictText('MIS_YN',e.value);//设置业务字典值
		}
		function dictcusttype(e) {
			return nui.getDictText('AME_SUPTYPE',e.value);//设置业务字典值
		}
		function dictcity(e) {
			return nui.getDictText('MIS_AREA',e.value);//设置业务字典值
		}
		function dictinflag(e){
			return nui.getDictText('PUR_INFLAG',e.value);//设置业务字典值
		}
    	function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}
		 function GetData() {
	        var row = grid.getSelected();
	        return row;
    	}
		function onOk() {
		
        var row = grid.getSelected();
        CloseWindow("ok");        
    }
		 function CloseWindow(action) {
    	      
	    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	    else window.close();            
	}
    function onCancel(e) {
    	CloseWindow("cancel");
	}
		function add() {        	
            nui.open({
                url: "<%=request.getContextPath() %>/ame_pur/PurSupplier/ModifyPurSupplier.jsp",
                title: "新增供应商信息", 
				width: 830,
	            height: 550,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
		            grid.reload();
                }
            });
        }
        function remove() {
        	//删除权限
		    /* var row = grid.getSelected();  
		    if(row.status != 2){//供应商状态为无效：2，（终止：3）
		    	alert("供应商只有在状态为无效时才可以删除！");
		    	return;
		    } */
		    var rows = grid.getSelecteds();   //获取所有选中的行对象
		    var data = {purSuppliers:rows};
		    var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
            	if (confirm("确定删除选中记录？")) {
	                grid.loading("操作中，请稍后......");
	                nui.ajax({
		                url: "com.primeton.eos.ame_pur.PurSupplier.deletepurSuppliers.biz.ext",
		                type: "post",
		                data: json, 
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                	grid.reload();
		                },
		                error: function () {
	                    }
	               });
                }
            } else {
                alert("请至少选中一条记录");
            }
        }
        function edit() {
    		var row = grid.getSelected();
		    if(row.status ==0){ //新增：0，审核中：1，有效：2，无效：3，终止4
		    	alert("供应商正在审核不可以编辑！");
		    	return;
		    }
    		if (row) {
      		nui.open({
	            url: "<%=request.getContextPath() %>/ame_pur/PurSupplier/ModifyPurSupplier.jsp",
	            title: "编辑供应商信息",
	            width: 830,
	            height: 550,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "edit", custid: row.custid };
	              iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	                if(action=="saveSuccess"){
	                  grid.reload();
	                }
	            }
            });
            } else {
              nui.alert("请选中一条记录","提示");
            }
        }
        
        function exportSupplier(){
    		var iscust = nui.get("iscust").getValue();
    		if(iscust){
    			if(iscust == "1"){
    				nui.get("custop").setValue("notnull");
    			}else{
    				nui.get("custop").setValue("null");
    			}
    		}else{
    			nui.get("custop").setValue("=");
    		}
        	var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			
	    	nui.confirm("确认导出？", "确定？",
	        function (action) {
	        	if(action=='ok'){
					grid.loading("操作中，请稍后......");
					nui.ajax({
		    			url: "com.primeton.eos.ame_pur.PurOtherSettlePay.exportPurSupplier.biz.ext",
				        type: "post",
				        data: data,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		grid.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "供应商记录";
				        	var myDate = new Date();
				        	var year = myDate.getFullYear();
				        	var month = myDate.getMonth()+1;
				        	var day = myDate.getDate();
				        	var hours = myDate.getHours();
				        	var minutes = myDate.getMinutes();
				        	var seconds = myDate.getSeconds();
				        	var curDateTime = year;
				        	if(month>9){
								curDateTime = curDateTime + "" + month;
							}else{
								curDateTime = curDateTime + "0" + month;
								}
				        	if(day>9){
								curDateTime = curDateTime + day;
							}else{
								curDateTime = curDateTime + "0" + day;
								}
							if(hours>9){
								curDateTime = curDateTime + hours;
							}else{
								curDateTime = curDateTime + "0" + hours;
								}
							if(minutes>9){
								curDateTime = curDateTime + minutes;
							}else{
								curDateTime = curDateTime + "0" + minutes;
								}
							if(seconds>9){
								curDateTime = curDateTime + seconds;
							}else{
								curDateTime = curDateTime + "0" + seconds;
							}
							fileName = fileName + "_" + curDateTime + ".xls";
							var frm = document.getElementById("viewlist1");
				        	frm.elements["downloadFile"].value = filePath;
				        	frm.elements["fileName"].value = fileName;
						    frm.submit();
				        },
				        error: function () {
				     		grid.unmask();
				        	alert("error");
				        }
					});
	        		
	        	}
	        });
        }
        
        function getDetail(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/ame_pur/PurSupplier/DetailPurSupplier.jsp?id=" + selectRow.custid;
			window.open(executeUrl, "供应商详细信息", "fullscreen=1");
	    }
	    //当选择列时
	    /* function selectionChanged(){
	        var rows = grid.getSelecteds();
	        var status = rows[0].status;
	        if(rows.length>0){
	    		if(rows[0].purstatus==0){
	    			nui.get("deltbtn").enable();
	    		}else{
	    			nui.get("deltbtn").disable();
	    		}
	        }else{
	        	nui.get("updateBtn").enable();
	        }
	    } */
  </script>
</body>
</html>