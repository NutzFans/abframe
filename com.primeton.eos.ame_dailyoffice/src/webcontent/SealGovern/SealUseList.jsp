<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zhengquan
  - Date: 2019-05-06 12点21分
  - Description:
-->
<head>
<title>印章使用列表查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-panel" title="印章使用管理" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>印章名称：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:220px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="yysyyjwjmc"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right"><span>流程类型：</span></td>
		            	<td align="left">
		            		<input style="width:220px;" showNullItem="true" class="nui-dictcombobox" value="" name="criteria._expr[1]._value" dictTypeId="YZLX" />
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="lclx"/>
						</td>
						<td align="right"><span>印章类型：</span></td>
		            	<td align="left">
		            		<input style="width:220px;" showNullItem="true" class="nui-dictcombobox" value="" name="criteria._expr[2]._value" id="yzlx" />
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="yzlxmc"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>申请日期：</span></td>
		            	<td align="left">
						    <input class="mini-datepicker" style="width:220px;" nullValue="null" format="yyyy-MM-dd" allowInput="false"
							showTime="false" showClearButton="false" name="criteria._expr[3]._value"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="yzsqrq"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
						</td>
						<td align="right"><span>所属组织：</span></td>
		            	<td align="left">
		            		<input id="yybmEdit"  name="criteria._expr[4]._value" style="width:220px;" class="nui-combobox" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"
								filterType="like"  textField="orgname" valueField="orgseq"  dataField="orgs" valueFromSelect="true"  showNullItem="true" allowInput="true"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="orgname"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
						</td>
						<td align="right"><span>创建人：</span></td>
		            	<td align="left">
		            		<input name="criteria._expr[5]._value" class="nui-textbox"  style="width:220px;"/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="username"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
		    			<td align="center" colspan="15">
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
	                    <td style="width:20%;" id="BtnControl">
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="addYzsy()">添加印章使用单</a>
	                        <a class="nui-button" id="addBtn1" iconCls="icon-add" onclick="addFgsYzsy()">添加分公司印章使用单</a>
	                        <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                    </td>
	                </tr>
                 </table>
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:320px;" allowResize="true" dataField="yzgl" showPager="true"
	    url="com.primeton.eos.ame_dailyoffice.yzglHandle.querySealUseList.biz.ext" sizeList="[10,20,50,100,200,500,1000]"  idField="yzglid" multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="6"></div>
				<div type="indexcolumn" align="center" headerAlign="center" width="6">编号</div>
				<div field="yysyyjwjmc" width="12" align="center" headerAlign="center" allowSort="false" renderer="getDetail">名称</div>
				<div field="dh" width="12" align="center" headerAlign="center" allowSort="false">单号</div>	
				<div field="username" width="12" align="center" headerAlign="center" allowSort="false">创建人</div>		
				<div field="yzsqrq" width="12" align="center" headerAlign="center"allowSort="false">申请日期</div>	
				<div field="orgname" width="12" align="center" headerAlign="center" allowSort="false">所属组织</div>	
				<div field="lclxmc" width="12" align="center" headerAlign="center" allowSort="false"  >流程类型</div>
				<div field="yzlxmc" width="12" align="center" headerAlign="center" allowSort="false">印章类型</div>
				<div field="lczt" width="12" align="center" headerAlign="center" allowSort="false">流程状态</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    	nui.parse();
    	<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		Map attr = user.getAttributes();
			DataObject[] roles = (DataObject[]) attr.get("roles");
			Boolean isAllControl = false;
			Boolean isMicroControl = false;
			for(int i=0;i<roles.length;i++){
				String rolesTemp = roles[i].getString("roleid");
				if(rolesTemp.equals("sealkeeper")||rolesTemp.equals("eosadmin")){
					isAllControl=true;
				}
			}
    	%>
    	var isAllControl = <%=isAllControl %>;
 		document.getElementById("BtnControl").style.display="none";
 		nui.get("addBtn").setEnabled(false);
 		nui.get("addBtn1").setEnabled(false);
		nui.get("updateBtn").setEnabled(false);
		nui.get("deltbtn").setEnabled(false);
		if(isAllControl==true){
			document.getElementById("BtnControl").style.display="";
			nui.get("addBtn").setEnabled(true);
			nui.get("addBtn1").setEnabled(true);
			nui.get("updateBtn").setEnabled(true);
			nui.get("deltbtn").setEnabled(true);
		}	
		
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
    		var dataYzlx = [{"id": "法人章","text": "法人章"},{"id": "公章","text": "公章"},{"id": "合同章","text": "合同章"},{"id": "项目专用章","text": "项目专用章"},{"id": "其他章","text": "其他章"}];
			nui.get("yzlx").setData(dataYzlx);
    		var userid = "<%=nowuserid %>";
    		grid.load();
		}
    		
		function dictyzlx(e) {
			return nui.getDictText('AME_YZSQ',e.value);//设置业务字典值
		}
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			var nui_orgViso = nui.get("yybmEdit");
			data.criteria._expr[4]._value = strSplit(nui_orgViso.text,"-");
			//data.criteria._expr[3]._value = data.criteria._expr[3]._value.substring(0,10);
		  	grid.load(data); //datagrid加载数据
		}
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}
		function addYzsy() {      	
            nui.open({
                url: "<%=request.getContextPath() %>/ame_dailyoffice/SealGovern/DetailSealUse.jsp",
                title: "新增印章使用单", 
				width: 1100,
	            height: 600,
                onload: function () {
               	  var iframe = this.getIFrameEl().contentWindow;
               	  iframe.type = "add";
               	  iframe.username = "<%=nowusername %>";
				  iframe.userid = "<%=nowuserid %>";
	              iframe.init();
                },
                ondestroy: function (action) {
                    grid.reload();
                }
            });
        }
        function addFgsYzsy() {      	
            nui.open({
                url: "<%=request.getContextPath() %>/ame_dailyoffice/FgsSealCovern/DetailFgsSealUse.jsp",
                title: "新增分公司印章使用单", 
				width: 1100,
	            height: 600,
                onload: function () {
               	  var iframe = this.getIFrameEl().contentWindow;
               	  iframe.type = "add";
               	  iframe.username = "<%=nowusername %>";
				  iframe.userid = "<%=nowuserid %>";
	              iframe.init();
                },
                ondestroy: function (action) {
                    grid.reload();
                }
            });
        }
        function remove() {
		    var rows = grid.getSelecteds();   //获取所有选中的行对象
		    var data = {yzgl:rows};
		    var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
				//判断选择的案件是否有正在运行中的，若有则提示，并返回
				var flag = false;
				$.each(rows,function(){
					if(this.currentstate == "2"){
						flag = true;
						return false;
					}
					return true;
				});
				if(flag){
					alert("您选择中的案件中至少有一条正在运行中，不容许删除，请重新检查案件并选择。");
					return;
				}
            	if (confirm("确定删除选中记录？")) {
	                grid.loading("操作中，请稍后......");
	                nui.ajax({
		                url: "com.primeton.eos.ame_dailyoffice.yzglHandle.deleteYzsyData.biz.ext",
		                type: "post",
		                data: json, 
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                	if(text.flag ==true){
		                	alert("删除成功！");
		                	grid.reload();
		                	}else{
		                	alert("删除失败！");
		                	}
		                },
		                error: function () {
	                    }
	               });
                }
            } else {
                nui.alert("请至少选中一条记录","提示");
            }
        }
        function edit() {
    		var row = grid.getSelecteds();
    		if(row.length == 1){
	    		row = row[0];
	    		var state = row.currentstate;
	    		if(state == "2"){
	    			alert("此印章使用单还在审批中，不能编辑！");
	    			return;
	    		}
	    		var executeUrl = "";
	    		if(row.lclx == "YZSY"){
		 			executeUrl = "<%=request.getContextPath() %>/ame_dailyoffice/SealGovern/DetailSealUse.jsp?yzglid=" + row.yzglid;
		 		}else{
		 			executeUrl = "<%=request.getContextPath() %>/ame_dailyoffice/FgsSealCovern/DetailFgsSealUse.jsp?yzglid=" + row.yzglid;
		 		}
	          		nui.open({
			            url: executeUrl,
			            title: "编辑用章信息",
			            width: 1100,
			            height: 600,
			            onload: function () {
			              var iframe = this.getIFrameEl().contentWindow;
			              iframe.type = "update";
			              iframe.init();
			            },
			            ondestroy: function (action) {
			                  grid.reload();
			            }
		            });
            }else{
              nui.alert("只能选中一条记录","提示");
            }
        }
        function getDetail(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){
	 		var selectRow = grid.getSelected();
	 		var executeUrl = "";
	 		if(selectRow.lclx == "YZSY"){
	 			executeUrl = "<%=request.getContextPath() %>/ame_dailyoffice/SealGovern/DetailSealUse.jsp?yzglid=" + selectRow.yzglid;
	 		}else{
	 			executeUrl = "<%=request.getContextPath() %>/ame_dailyoffice/FgsSealCovern/DetailFgsSealUse.jsp?yzglid=" + selectRow.yzglid;
	 		}
			nui.open({
				url: executeUrl,
				title: "详细信息",
				width: "750px",
				height: "550px",
				allowResize: false,
				onload: function() {
					var iframe = this.getIFrameEl().contentWindow;
					iframe.type = "view";
					iframe.init();
				},
				ondestroy: function(action) {
					if(action == "ok") {}
				}
			});
	    }
	    function getStateByProcessinstid(processinstid){
	    	var state = '';
	        var json = {"processinstid":processinstid};
	    	nui.ajax({
                url: "com.primeton.eos.ame_dailyoffice.yzglHandle.getStateByProcessinstid.biz.ext",
                type: "post",
                data: json, 
                cache: false,
                async:false,
                contentType: 'text/json',
                success: function (text) {
                	if(text.state){
                		state = text.state;
                	}
                },
                error: function () {
                }
           });
           return state;
	    }
	    //截取symbol后面的字符串
		function strSplit(str,symbol){
			var arr = str.split(symbol);
			return arr[1];
		}
  </script>
</body>
</html>