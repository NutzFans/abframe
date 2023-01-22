<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): EPCNB299
  - Date: 2015-07-09 16:27:01
  - Description:
-->
<head>
<title>查询知识库信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>知识点标题：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="kbtitle"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td> 
						<td align="right"><span>知识点类型：</span></td>
		            	<td align="left">
						    <input class="nui-dictcombobox" name="criteria._expr[1]._value" dictTypeId="MIS_KBASE" style="width:100px;" />
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="kbtype"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/> 
						</td>
					</tr>
					<tr>
						<td align="right"><span>知识点提交人：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[2]._value" class="nui-textbox"  style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="kbsubmitor"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right"><span>知识点提交日期：</span></td>
		            	<td align="left">
						    <input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="kbsubmitdate"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
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
	                    <td style="width:20%;">
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:415px;" allowResize="true" dataField="kbases" 
	    url="com.primeton.eos.ame_common.kbasecomponent.mis_querykbase.biz.ext" idField="kbid" multiSelect="true" pageSize="15">
			<div property="columns">
				<div type="checkcolumn" width="10"></div>
				<div field="kbid" width="0" headerAlign="center">知识点id</div>
				<div field="kbtitle"width="50" headerAlign="center" renderer="getDetail" allowSort="true">知识点标题</div>
				<div field="kbtype" width="50" renderer="dictKbasetype" align="center" headerAlign="center" allowSort="true">知识点类型</div>
				<div field="kbsubmitor" width="50"headerAlign="center" allowSort="true">知识点提交人</div>
				<div field="kbsubmitdate" width="50" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">知识点提交日期</div>
			</div>
		</div>
		<script type="text/javascript">
			var form = new nui.Form("form1");
	    	nui.parse();
	    	var grid = nui.get("datagrid1");
	    	init();
	    	function init(){
	    		grid.load();//页面进行加载刷新
	    		grid.sortBy("kbid","desc");
	    	}
	    	
	    	
	    	function search() {
				var form = new nui.Form("form1");
				var data = form.getData(); //获取表单JS对象数据
			  	grid.load(data); //datagrid加载数据
			}
			function reset(){
				var form = new nui.Form("form1");
				form.reset();
				grid.load();
			}
			function dictKbasetype(e) {
				return nui.getDictText('MIS_KBASE',e.value);//设置业务字典值
			}
			function add() {        	
	            nui.open({
	                url: "<%=request.getContextPath() %>/ame_common/kbase/mis_addkbase.jsp",
	                title: "新增信息", width: 800, height: 400,
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
			    var data = {kbases:rows};
			    var json = nui.encode(data);     //序列化成json字符串
				if (rows.length> 0) {
	            	if (confirm("确定删除选中记录？")) {
		                grid.loading("操作中，请稍后......");
		                nui.ajax({
			                url: "com.primeton.eos.ame_common.kbasecomponent.mis_deletekbase.biz.ext",
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
	            url: "<%=request.getContextPath() %>/ame_common/kbase/mis_editkbase.jsp",
	            title: "编辑数据",
	            width: 800,
	            height: 550,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = row;
	              //直接从页面获取，不用去后台获取
	              iframe.contentWindow.setData(data);
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
            function getDetail(e){
            	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
            }
            function checkDetail(){
		 		var selectRow = grid.getSelected();
				var executeUrl = "<%=request.getContextPath() %>/ame_common/kbase/mis_detailkbase.jsp?kbid=" + selectRow.kbid + "&kbtype=" + selectRow.kbtype;
				window.open(executeUrl, "知识库详细信息", "fullscreen=1");
		    }
	  </script>
</body>
</html>