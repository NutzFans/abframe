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
					<tr>
						<td align="right" style="width:120px;"><span>供应商名称：</span></td>
		            	<td align="left" style="width:280px;">
						    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:204px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td> 
						<td align="right" style="width:120px;"><span>供应商编号：</span></td>
		            	<td align="left" style="width:120px;">
						    <input name="criteria._expr[1]._value" class="nui-textbox"  style="width:90px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="custnum"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td> 
						<td align="right" style="width:150px;"><span>供应商联系人：</span></td>
		            	<td align="left" style="width:180px;">
						    <input name="criteria._expr[2]._value" class="nui-textbox"  style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="linkman"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right"><span>公司联系人：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[4]._value" class="nui-textbox"  style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="infoprovider"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>登记日期：</span></td>
		            	<td align="left">
						    <input class="nui-datepicker" name="criteria._expr[3]._min" id="startTime" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" id="endTime" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[3]._property" value="createDate"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
						</td>
						<td align="right"><span>状态：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="AME_SUPSTATUS" style="width:90px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="status"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
						</td>
						
						<td align="right"><span>供应商类型：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[6]._value" class="nui-dictcombobox" dictTypeId="AME_SUPTYPE"  showNullItem="true" nullItemText="" style="width:150px;"/><!-- multiSelect="true"  -->
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="custtype"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
						</td>
						
						<td align="right" style="width: 160px;"><span>供应商所在城市：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="MIS_AREA" allowInput="true"  showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="registcity"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="="/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>成立日期：</span></td>
		            	<td align="left">
						    <input class="nui-datepicker" name="criteria._expr[13]._min" id="startTime" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[13]._max" id="endTime" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[13]._property" value="estabdate"/>
						    <input class="nui-hidden" name="criteria._expr[13]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[13]._pattern" value="yyyy-MM-dd"/>
						</td>
						<td align="right"><span>是否是客户：</span></td>
		            	<td align="left">
						    <input class="nui-dictcombobox" dictTypeId="MIS_YN" style="width:90px;" showNullItem="true" nullItemText="" id = "iscust"/>
						    <input class="nui-hidden" name="criteria._expr[10]._property" value="dycustid"/>
						    <input class="nui-hidden" name="criteria._expr[10]._op" id = "custop"/>
						</td>
						<td align="right"><span>本地化服务城市：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[12]._value" class="nui-dictcombobox" dictTypeId="MIS_AREA" allowInput="true"  showNullItem="true" nullItemText="" multiSelect="true"/>
						    <input class="nui-hidden" name="criteria._expr[12]._property" value="locservcity"/>
						    <input class="nui-hidden" name="criteria._expr[12]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[12]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>注册资本：</span></td>
						<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[8]._min" style="width:100px"/>-<input class="nui-textbox" name="criteria._expr[8]._max" style="width:100px"/>(万元)
		            		<input class="nui-hidden" name="criteria._expr[8]._property" value="registercap"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
						</td>
						<td align="right"><span>推荐指数：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[9]._value" class="nui-dictcombobox" dictTypeId="AME_REINDEX" style="width:90px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[9]._property" value="reindex"/>
						    <input class="nui-hidden" name="criteria._expr[9]._op" value="="/>
						</td>
						<td align="right"><span>入围标志：</span></td>
						<td align="left">
						    <input name="criteria._expr[14]._value" class="nui-dictcombobox" dictTypeId="PUR_INFLAG" style="width:90px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[14]._property" value="inflag"/>
						    <input class="nui-hidden" name="criteria._expr[14]._op" value="="/>
						</td>
				    </tr>
				    <tr>
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
                            <a class="nui-button" onclick="exportSupplier" iconCls="icon-download"  id="exportButton">导出</a>
	                        <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
								<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
								<input type="hidden" name="downloadFile" filter="false"/>
								<input type="hidden" name="fileName" filter="false"/>
							</form>	
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="purSuppliers" 
	    url="com.primeton.eos.ame_pur.PurSupplier.queryPurSupplier.biz.ext" sizeList="[10,20,50,100,200,500,1000,10000]" idField="appid" multiSelect="true"> <!-- onselectionchanged="selectionChanged" -->
			<div property="columns">
				<div type="checkcolumn" width="25"></div>	
				<div field="custid" width="0" >客户ID</div>		
				<div field="custname" width="180" align="left" headerAlign="center" renderer="getDetail" allowSort="true">供应商名称</div>	
				<div field="custnum" width="110" align="center" headerAlign="center"  allowSort="true">供应商编号</div>
				<div field="suppliersname" width="75" align="center" headerAlign="center" allowSort="true">供应商简称</div>							
				<div field="status" width="60" align="center"  headerAlign="center" renderer="dictstatus" allowSort="true">状态</div>
				<div field="custtype" width="110" align="left"  headerAlign="center" renderer="dictcusttype" allowSort="true">供应商类型</div>
				<div field="inflag" width="110" align="center"  headerAlign="center" renderer="dictinflag" allowSort="true">入围标志</div>
				<div field="locservcity" width="110" align="center"  headerAlign="center" renderer="dictcity" allowSort="true">本地化服务城市</div>
				<div field="linkman" width="100" align="center" headerAlign="center" allowSort="true">供应商联系人</div>
				<div field="linktel" width="100" align="center" headerAlign="center"  allowSort="true">供应商联系电话</div>	
				<div field="estabdate" width="80" align="center" headerAlign="center"allowSort="true">成立日期</div>
				<div field="createDate" width="80" align="center" headerAlign="center"allowSort="true">登记日期</div>				
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/**供应商查询*/
		var form = new nui.Form("#form1");
    	nui.parse();
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
    		grid.load();
			grid.sortBy("custid","desc");
		}
		function dictstatus(e) {
			return nui.getDictText('AME_SUPSTATUS',e.value);//设置业务字典值
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
    		var startTime = nui.get("startTime").getValue();
    		var endTime = nui.get("endTime").getValue();
    		if(startTime > endTime){
    			alert("登记日期取值区间有误！");
    			return;
    		}
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
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
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
		    var row = grid.getSelected();  
		    if(row.status != 2){//供应商状态为无效：2，（终止：3）
		    	alert("供应商只有在状态为无效时才可以删除！");
		    	return;
		    }
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