<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2016-06-20 16:08:29
  - Description:
-->
<head>
	<title>人员定额成本级别</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div style="width:100%;height:50%;padding:0px;margin:0px;">
	    <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                       	人员定额成本级别列表
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
	<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
					    <td align="right"><span>部门：</span></td>
		            	<td align="left">
		            	   <input name="criteria._expr[0]._value" class="nui-combobox" style="width:180px;" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs"  shownullItem="true" 
							    allowInput="true" />
							<input class="nui-hidden" name="criteria._expr[0]._property" value="orgseq"/>
				 		 	<input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
				 		 	<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="end"/>
		                    
		                    <input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[1]._value" id="orgids"/>
					    </td>
						<td align="right"><span>人员姓名：</span></td>
		            	<td align="left">
		            	    <input class="nui-hidden" name="criteria._expr[2]._property" value="username" />
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					        <input class="nui-textbox" name="criteria._expr[2]._value" style="width:140px;" id="emp" />
					        <input class="nui-hidden" name="criteria._expr[2]._rule" value="all"/>
					        <input class="nui-hidden" name="criteria._expr[3]._property" value="userid" />
					        <input class="nui-hidden" name="criteria._expr[3]._value" id="userid" />	
							<input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
					    </td>
						<td align="right"><span>当前有效状态：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="ABF_STATUS" id="currentstate" shownullItem="true" style="width:100px;" value="1"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="currentstate"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
						</td>
					</tr>
					<tr>
					 	<td align="right"><span>成本套别：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[5]._value" class="nui-combobox"  textField="percostname" valueField="percostid" dataField ="percosts" url="com.primeton.rdmgr.labor.mispricebiz.queryPercost.biz.ext" id="percost" shownullItem="true" style="width:180px;" onvaluechanged="getdegrees"/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="percostid"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
						</td>
					    <td align="right"><span>人员级别：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[6]._value" class="nui-combobox"  textField="degreename" valueField="degree" dataField = "degrees" id="degree" shownullItem="true" style="width:140px;" allowInput="true"/>
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="degree"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
						</td>
						<td align="right"><span>在职状态：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="ABF_EMPSTATUS" id="empstatus" shownullItem="true" style="width:100px;" value="on"/>
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="empstatus"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="="/>
						</td>
					</tr>
				    <tr>
		    			<td align="center" colspan="13">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a> 
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		            	<a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
                        <a class="nui-button" id="exportCurrentExcel" iconCls="icon-download" onclick="exportCurrent">导出</a>       
                    </td>
                </tr>
            </table>           
        </div>
    </div> 
    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="emplevels"
        url="com.primeton.rdmgr.labor.mispricebiz.queryEmplevel.biz.ext"   allowResize="true" pageSize="20" sizeList="[10,20,50,100,500]" 
        allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
        <div property="columns"> 
            <div type="checkcolumn"></div>
            <div field="orgname" width="120" allowSort="true">部门</div>
            <div field="userid"  width="80" headerAlign="center" allowSort="true">人员登录名</div>
            <div field="empcode"  width="70" headerAlign="center" allowSort="true">人员工号</div>
            <div field="username"  width="60" headerAlign="center" allowSort="true">人员姓名</div>
            <div field="percostname" width="140" headerAlign="center" allowSort="true">成本套别</div> 
            <div field="degreename" width="70" headerAlign="center" allowSort="true">人员级别</div> 
            <div field="startdate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">有效开始日期 </div>
            <div field="enddate" width="80" headerAlign="center"  dateFormat="yyyy-MM-dd" allowSort="true">有效截止日期</div>    
            <div field="currentstate" width="80" renderer="getdict" align="center" headerAlign="center" allowSort="true">当前有效状态 </div>
            <div field="isworkrate" width="80" renderer="getdict1" align="center" headerAlign="center" allowSort="true">是否统计工时率 </div>  
            <div field="empstatus" width="60" renderer="getdictstatus" align="center" headerAlign="center" allowSort="true">在职状态 </div>           
            <div field="outdate" width="80"   dateFormat="yyyy-MM-dd" allowSort="true">离职日期</div>    
        </div>
    </div>
    <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
			<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
			<input type="hidden" name="downloadFile" filter="false"/>
			<input type="hidden" name="fileName" filter="false"/>
		</form>
    <script type="text/javascript">
        nui.parse();
        var form = new nui.Form("#form1");
        var grid = nui.get("datagrid1");
        var degrees = [];
        <% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	    %>
	    init();
	    function init(){
	            var json = {"code":"emplevel","map":{"property":"status","op":"=","value":"running"}};
	    	nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("emp").setValue('<%=nowusername %>');
							nui.get("userid").setValue('<%=nowuserid %>');
							nui.get("emp").setReadOnly(true);
						}
						var isall;//是否拥有全公司的权限
						for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
								isall = "1";
								break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
							nui.getbyName("criteria._expr[1]._op").setValue("=");
	        				nui.getbyName("criteria._expr[1]._value").setValue("");
						}else{
							nui.get("orgids").setValue(text.orgids);
						}
						nui.get("orgseq").setData(text.orgs);
					}else{
						// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("emp").setValue('<%=nowusername %>');
							nui.get("userid").setValue('<%=nowuserid %>');
							nui.get("emp").setReadOnly(true);
					}
					     search();
				}
			});
	    }
      	function search() {	    		
				var data = form.getData(); //获取表单JS对象数据
				grid.sortBy("orgname","asc");
			  	grid.load(data); //datagrid加载数据
		}
        function add() {        	
	            nui.open({
	                url: "<%=request.getContextPath() %>/labor/manager/modifyEmplevel.jsp",
	                title: "新增人员级别", 
					width: 650,
		            height: 370,
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
			    var rows = grid.getSelecteds();   //获取所有选中的行对象
			    var data = {emplevels:rows};
			    var json = nui.encode(data);     //序列化成json字符串
				if (rows.length> 0) {
					for(var i=0;i<rows.length;i++){
			    		if(rows[i].currentstate==1){
			    			alert("不能删除人员状态为有效的记录");
			    			return false;
			    		}
			   		}
	            	if (confirm("确定删除选中记录？")) {
		                grid.loading("操作中，请稍后......");
		                nui.ajax({
			                url: "com.primeton.rdmgr.labor.mispricebiz.deleteEmplevel.biz.ext",
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
        		if (row) {
          		nui.open({
		            url: "<%=request.getContextPath() %>/labor/manager/modifyEmplevel.jsp",
		            title: "编辑定额成本套别",
		            width: 650,
		            height: 370,
		            onload: function () {
		              var iframe = this.getIFrameEl();
		              var data = {action: "edit", emplevelid: row.emplevelid };
		              iframe.contentWindow.SetData(data);
		            },
		            ondestroy: function (action) {
		                if(action=="save"){
		                  grid.reload();
		                }
		            }
	            });
	            } else {
	              nui.alert("请选中一条记录","提示");
	            }
	        }
        function getdict(e){
				return nui.getDictText('ABF_STATUS',e.value);//设置业务字典值
		}
		function getdict1(e){
				return nui.getDictText('MIS_YN',e.value);//设置业务字典值
		}
	    function getdictstatus(e) {
	        return nui.getDictText('ABF_EMPSTATUS',e.value);//设置业务字典值
	    }
	  	function reset(){
				form.reset();
				init();
	    }
		function exportCurrent(){
				 <%--var form = new nui.Form("#form1");
		         var json = form.getData();--%>
	         var rows = grid.getSelecteds(); 
		     var data = form.getData();
				nui.ajax({
	                url: "com.primeton.rdmgr.labor.mispricebiz.exportEmplevels.biz.ext",
	                type: "post",
	                data: data,
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	             		nui.unmask();
	                	var filePath = o.downloadFile;
	                	var fileName = "empLevel";
	                	var myDate = new Date();
	                	var year = myDate.getYear();
	                	var month = myDate.getMonth()+1;
	                	var day = myDate.getDate();
	                	var hours = myDate.getHours();
	                	var minutes = myDate.getMinutes();
	                	var seconds = myDate.getSeconds();
	                	var curDateTime = year;
	                	if(month>9){
							curDateTime = curDateTime + "" + month;
							//alert(curDateTime);
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
	                	alert("error");
	                }
	            });	
		    } 
		   //得到级别下拉框
		    function getdegrees(e){
		    	var json = {"manage":{"percostid":e.value}};
		    	if(!(e.value == '' || e.value == null)){
			    	nui.ajax({
						url:"com.primeton.rdmgr.labor.mispricebiz.getdegrees.biz.ext",
						data:json,
						type:'POST',
		                async:false,
						contentType:'text/json',
						success:function(text){
							degrees = text.degrees;
							nui.get("degree").setData(degrees);
							nui.get("degree").setValue(null);
						}
					});
		    	}else{
		    		nui.get("degree").setData(null);
					nui.get("degree").setValue(null);
		    	}
		    }
    </script>
</body>
</html>