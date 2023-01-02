<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2017-03-08 14:06:02
  - Description:
-->
<head>
	<title>公司员工微信企业号账号信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="公司员工微信企业号账号信息" width="100%">
		   <form id="form1" method="post" style="width:100%">
			<div class="nui-toolbar" >
				<table style="width:100%;">
					<tr>
						<td align="right">姓名：</td>
						<td>
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="empname"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						     <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right">用户帐号：</td>
						<td>
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="userid"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right">绑定状态：</td>
						<td>
							<input name="criteria._expr[0]._value" class="nui-dictcombobox"  shownullItem="true" dictTypeId="AME_WXSTATUS" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="status"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
						</td>
					</tr>
					<tr>
						<td align="right">一级部门：</td>
						<td>
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width:150px;" />
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="syb"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
						<td align="right">人员在职状态：</td>
						<td>
							<input name="criteria._expr[4]._value" class="nui-dictcombobox"  shownullItem="true" dictTypeId="ABF_EMPSTATUS" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="empstatus"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
						</td>
					</tr>
	            </table> 
	             <table style="width:90%;">
		            <tr>
		                <td align="center" style="width:100%;">
		                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
							<a class="nui-button" iconCls="icon-reload" id="reset" onclick="reset()" >重置</a>
							<a class="nui-button" iconCls="icon-expand" id="inits" onclick="inits()" >微信人员初始化</a>
		                </td>
		            </tr>
	        	</table>          
	        </div>
	    </form>
		<!-- 考勤统计信息列表
		-->
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:330px;"  url="com.primeton.eos.ame_common.ameAttendance.queryWxlist.biz.ext" 
	         dataField="datas" pageSize="10" sizeList="[10,20,50,100]" showPager="true">
			<div property="columns">
				<div field="empname" width="80" align="center"  headerAlign="center" allowSort="true">人员姓名</div>
				<div field="userid" width="80" align="center"  headerAlign="center" allowSort="true">用户账号</div>
				<div field="mobileno" width="100" align="center"  headerAlign="center" allowSort="true">手机号码</div>
				<div field="oemail" width="100" align="center"  headerAlign="center" allowSort="true">邮箱</div>
				<div field="weixinid" width="80" align="center"  headerAlign="center" allowSort="true">企业号账号</div>
				<div field="mobile" width="100" align="center"  headerAlign="center" allowSort="true">企业号登记手机</div>
				<div field="email" width="100" align="center"  headerAlign="center" allowSort="true" >企业号登记邮箱</div>
				<div field="status" width="70" align="center" headerAlign="center" renderer="getdict"  allowSort="true">绑定状态</div>	
			</div>
	   </div>	
	</div>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	init();
	function init(){
	//考勤统计详细页面传参
			grid.load();
			grid.sortBy("empname","asc");
	}
		
	//考勤查询
	function search(){
		var data = form.getData(); 
		grid.load(data);
	}
	
	//重置
	function reset(){
		form.reset();
		grid.load();
	}
    function getdict(e){
    	return nui.getDictText('AME_WXSTATUS',e.value);//设置业务字典值
    }
    function inits(){
    	var json = "";
    	form.loading("数据初始化中。。。。。");
    	if(confirm("是否确定初始化微信人员数据？")){
    		nui.ajax({
                url: "com.primeton.eos.ame_common.ameAttendance.initWxlist.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             		if(o.result == "1"){
             			alert("数据初始化失败！");
             			form.unmask();
             			return;
             		}else{
             			alert("数据初始化成功！");
             			grid.load();
             			form.unmask();
             		}
             	},
         		error: function () {
                	alert("error");
                	form.unmask();
                }
            })
    	}else{
			form.unmask();    	
    	}
    }
</script>
</body>
</html>