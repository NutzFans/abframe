<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>员工面板</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body> 
  <div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;">
    <div id="form1">
    	<input class="nui-hidden" name="sortField" value="projectid"/>
		<input class="nui-hidden" name="sortOrder" value="desc"/>
    		<table style="width:100%;">
				<tr>
	            	<td><span>应用系统名称：</span></td>
	            	<td>
	            		<input class="nui-textbox" name="criteria._expr[0].projectname" onEnter='onKeyEnter'/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				    </td>
	            	<td><span>所属行业：</span></td>
	            	<td>
	            		<input class="nui-dictcombobox" name="criteria._expr[1].industry" dictTypeId="MIS_INDUSTRY" showNullItem="true" nullItemText="全部"/>
				    </td>
	            	<td><span>销售服务阶段：</span></td>
	            	<td>
	            		<input class="nui-dictcombobox" name="criteria._expr[2].curstage" dictTypeId="MIS_PHASE" showNullItem="true" nullItemText="全部"/>
				    </td>
	            	<td><span>销售姓名：</span></td>
	            	<td>
	            		<input class="nui-textbox" name="criteria._expr[3].salesname"/>
				        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
				    </td>
				</tr>
				<tr>
					<td><span>合同编号：</span></td>
	            	<td>
	            		<input class="nui-textbox" name="criteria._expr[7].contractnum" id="contractnum"/>
				        <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
				    </td>
	            	<td><span>系统上线情况：</span></td>
	            	<td>
	            		<input class="nui-dictcombobox" name="criteria._expr[4].releaseflag" dictTypeId="MIS_DEVELOPPHASE" showNullItem="true" nullItemText="全部"/>
				    </td>
	            	<td><span>合作伙伴：</span></td>
	            	<td>
	            		<input class="nui-textbox" name="criteria._expr[5].partnername" />
				        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
				    </td>
					<td><span>最终用户：</span></td>
	            	<td>
	            		<input class="nui-textbox" name="criteria._expr[6].endusername"/>
				        <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
				    </td>
				</tr>
				<tr><td align="center" colspan="6"><a class="nui-button" iconCls="icon-search" onclick="search()">查找</a></td></tr>
		    </table>
      <input class="nui-hidden" name="criteria._entity" value="com.primeton.csoms.mis_cs2.selectsys.SystemQueryEntity"/>
    </div>
  </div>
  <div class="nui-fit">
    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" idField="custid" url="com.primeton.mis.contract.contract.querySystem.biz.ext" dataField="systems" sizeList=[5,10,20,50,100] multiSelect="false" pageSize="10"   >
      <div property="columns" >
        <div type="checkcolumn">
        </div>
        <div field="projectname" width="210" allowSort="true" headerAlign="center" >应用系统名称</div>
        <div field="contractnum" width="75" allowSort="true" headerAlign="center" >合同编号</div>
        <div field="salesname" width="60" allowSort="true" headerAlign="center" >所属销售姓名</div>
        <div field="partnername" width="180" headerAlign="center" allowSort="true">合作伙伴</div>
        <div field="endusername" width="180" headerAlign="center">最终用户</div>
        <div field="industry" renderer="onIndusRenderer" align="right" width="80" headerAlign="center" allowSort="true">所属行业</div>
        <div field="curstage" renderer="onCurstageRenderer" align="right" width="80" headerAlign="center" allowSort="true">销售服务阶段</div>
        <div field="servnum" align="right" width="80" headerAlign="center" allowSort="true">服务编号</div>
      </div>
    </div>
    <script>
        function onIndusRenderer(e) {
            return nui.getDictText('MIS_INDUSTRY',e.value);
        }
        function onCurstageRenderer(e) {
            return nui.getDictText('MIS_PHASE',e.value);
        }
    </script>
  </div>
  <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
    <a class="nui-button" style="width:60px;" onclick="onOk()">
      确定
    </a>
    <span style="display:inline-block;width:25px;">
    </span>
    <a class="nui-button" style="width:60px;" onclick="onCancel()">
      取消
    </a>
  </div>
  <script type="text/javascript">
    nui.parse();
    var grid = nui.get("datagrid1");
    
    var contnum = '<%=request.getParameter("contnum") %>';
	if(contnum=='null'){
		
	}else{
		nui.get("contractnum").setValue(contnum);
	}
    
    search();
    function search(){
      var form = new nui.Form("#form1");
      var data = form.getData(true,true);
      grid.load(data);
    }
    function GetData() {
      var row = grid.getSelected();
      var data = {};
      data.id = row.projectid;
      data.text = row.projectname;
      return data;
    }
    function onKeyEnter(e) {
      search();
    }
    //////////////////////////////////
    function CloseWindow(action) {
      if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
      else window.close();
    }
    function onOk() {
      var row = grid.getSelected();
      if (!row) {
        alert("请选中一条记录");
        return;
      }
      CloseWindow("ok");
    }
    function onCancel() {
      CloseWindow("cancel");
    }
  </script>
</body>
</html>
