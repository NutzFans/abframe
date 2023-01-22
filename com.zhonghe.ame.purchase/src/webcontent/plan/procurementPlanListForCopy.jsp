<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>采购计划列表</title>
</head>
<body>
        <div  id="form1">
		  <div class="nui-toolbar"  style="border-bottom:0;padding:0px;">
			  <table align="center" border="0" width="100%" class="form_table">
			<tr>
		          <td >
		          	<input class="nui-hidden" name="criteria._expr[1].ischange" value="1"/>
		          	<input class="nui-hidden" name="criteria._expr[2].status" value="2"/>
		          	<input class="nui-hidden" name="criteria._expr[3].isAdopt" value="1"/>
		          	<input class="nui-hidden" name="criteria._expr[4].year" id="newYear"/>
		          	<input class="nui-hidden" name="criteria._expr[5].type"  id="type">
		          	<input class="nui-hidden" name="criteria._expr[6].needOrgId"  id="orgseq2">
		          	<input class="nui-hidden" name="criteria._expr[7].putunder"  id="putunder">
		          	
		          	
			        <input class="nui-hidden" name="criteria._expr[8]._property" value="needOrgId"/>
			        <input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
			        <input class="nui-hidden" name="criteria._expr[8]._value" id="orgids2"/>
		          </td>
		          <td class="form_label" align = "right">采购计划名称</td>
		           <td>
					 <input name="criteria._expr[9].name" id="namePro" class="nui-textbox"  style="width:90px;"/>
					 <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
		           </td>
		          <td class="form_label" align = "right">采购计划编号</td>
		           <td>
					 <input name="criteria._expr[10].code" id="codePro" class="nui-textbox"  style="width:90px;"/>
					 <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
		           </td>
		            <td colspan="9" align="center">
			            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
			            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
			        </td>
		       </tr>
		      </table>
			</div>
		</div>
    	<div id="datagrid1"    sizeList="[10,20,50,100]" showPager="true" dataField="data" 
    	sortMode="client"  pageSize="10" multiSelect="true" allowSortColumn=true
    	class="nui-datagrid" style="width:100%;height:300px;" url="com.zhonghe.ame.purchase.purchaseplan.selsetPlanItems.biz.ext" >
			 <div property="columns">
	       		<div  type="checkcolumn"></div>
		       	<div type="indexcolumn" align="center" headerAlign="center">序号</div>
	        	<div field="putunderName"  align="center" headerAlign="center" allowSort="true">归口部门</div>
	        	<div field="name" width="160" align="center" headerAlign="center" allowSort="true">采购计划名称</div>
	            <div field="code" width="120" align="center" headerAlign="center" allowSort="true">采购计划编号</div>
	            <div field="materialName" width="100" align="center" headerAlign="center" allowSort="true" >采购物项名称</div>
	            <div field="needOrgName" width="100" align="center" headerAlign="center" allowSort="true" >采购单位</div>
	            <div field="needOrgId" width="80" align="center" headerAlign="center" allowSort="true" visible="false">采购单位</div>
	            <div field="type" width="60" align="center" headerAlign="center" allowSort="true" renderer="dictIshavebak">采购类型</div>
	            <div field="year" width="50" align="center" headerAlign="center" allowSort="true" >计划年份</div>
	            <div field="budgetAmount" width="70" align="center" headerAlign="center" allowSort="true">预算金额(万元)</div>
	            <div field="sumamount"  width="80" align="center" headerAlign="center" allowSort="true">可立项金额(万元)</div>
	        </div>
        </div>
	<div style="text-align: center;padding: 5px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">确定</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 80px;">关闭</a>
	</div>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
		nui.get("newYear").setValue(getYear());
		
		init();
		function init() {
			var putunder = "<%=request.getParameter("putunder")%>";
			var type = <%=request.getParameter("type")%>;
			nui.get("newYear").setValue(getYear());
			if(!!putunder){
				nui.get("putunder").setValue(putunder);
			}
			nui.get("type").setValue(type);
			//按钮权限的控制
			getOpeatorButtonAuth("checkview"); //操作按钮权限初始化
			//code:对应功能编码，map：对于机构的查询条件
			
			/* 去掉归口部门 */
			nui.get("putunder").setValue('');
			
			var json = {"code":"xz_cgjh","map":{"property":"status","op":"=","value":"running"}};
			ajaxCommon({
				"url": "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				"data": json,
				"success": function(data) {
					if (data.orgs) {
						if (data.orgs.length == 0) {
						
						}
						//根据情况选择一种
						nui.get("orgids2").setValue(data.orgids);
					}
					search();
				}
			});
		}
    	var type = <%=request.getParameter("type")%>;
		function search() {
	    	
			var form = new nui.Form("#form1");
			
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		
	function reset(){
		/* var form = new nui.Form("#form1");
		form.reset(); */
		nui.get("namePro").setValue('');
		nui.get("codePro").setValue('');
		search()
	}
		
    function onOk() {
        var row = grid.getSelecteds();
        if(type==2&&row.length>1){
        	showTips("二级集采一个立项只能对应一个计划");
        	return;
        }
        for(var i = 0;i<row.length; i++ ){
        	if(i>0){
        		if(row[i].putunder!=row[i-1].putunder){
        			showTips("请重新归口部门相同的计划")
        		 	return
        		}
        	}
        	if(row[i].sumamount<=0){
        		showTips("存在可立项金额为0的计划，请重新选择")
        		 return
        	}
        }
        closeOk();        
    }
    
    function GetData() {
        var row = grid.getSelecteds();
        return row;
    }
    
	function dictIshavebak(e) {
		return nui.getDictText('ZH_PURCHASE',e.value);//设置业务字典值
	}
	
	function getStatus(e) {
		return nui.getDictText('ZH_FLOW_TYPE',e.value);//设置业务字典值
	}
	
	function zhContractType(e) {
		return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
	}
	
	function onRowDblClick(e) {
		onOk();
	}
	
</script>
</body>
</html>