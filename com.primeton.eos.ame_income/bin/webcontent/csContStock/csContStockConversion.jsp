<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱海翔
  - Date: 2017-12-23 10:11:04
  - Description:
-->
<head>
<title>合同收入成本记录项目已签合同转换</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div  class="mini-panel" title="待转换合同收入成本" width="auto">
		<div id="form1">
			<table style="width:100%;">
				<tr>
	            	<td>
	            		<input class="nui-hidden" name="criteria._expr[1]._value" id = "contnumPara"/>
	            		<input class="nui-hidden" name="criteria._expr[1]._property" value="contnum"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
				    </td>
				</tr>
            </table>           
	    </div>
	    <div id="contStock_grid" class="nui-datagrid" style="width:auto;height:235px;" allowResize="true" dataField="csContStocks" url="com.primeton.eos.ame_income.csContStock.queryCsContStock1.biz.ext"
	    	 showPager="false" showPageIndex="false" showPageSize="false"  idField="appid"  frozenStartColumn="0" frozenEndColumn="6">
			<div property="columns">
				<div field="yearmonth" width="55" headerAlign="center" align="center" renderer="onYearMonthrenderer">财务年月</div>
				<div field="org" width="0" renderer="dictOrgRenderer" headerAlign="center"  >事业部</div>
		        <div field="salename" width="0" headerAlign="center" >受益销售</div>
		        <div field="custjc" width="0" headerAlign="center" >客户简称</div>
				<div field="contnum" width="75" renderer="onContnumRenderer" headerAlign="center"  >合同编号</div>
		        <div field="projectname" width="140" headerAlign="center">合同项目名称</div>
		        <div field="status" align="center" width="60" headerAlign="center"  renderer="dictStatusRenderer">状态</div>
		        
		        
		        <div field="scfyRg" width="110" headerAlign="center" align="right" dataType="currency">当月生产成本-人工</div>
		        <div field="scfyWb" width="110" headerAlign="center" align="right" dataType="currency">当月生产成本-采购</div>
		        <div field="scfyBx" width="130" headerAlign="center" align="right" dataType="currency">当月生产成本-直接费用</div>
		        <div field="scfyDyze" width="130" headerAlign="center" align="right" dataType="currency">当月生产成本-当月总额</div><!-- 计算 -->
		        <div field="scfy" width="95" headerAlign="center" align="right" dataType="currency">生产成本余额</div><!-- 累计 -->
		        
		        <div field="cbjzRg" width="110" headerAlign="center" align="right" dataType="currency">当月成本结转-人工</div>
		        <div field="cbjzWb" width="110" headerAlign="center" align="right" dataType="currency">当月成本结转-采购</div>
		        <div field="cbjzBx" width="130" headerAlign="center" align="right" dataType="currency">当月成本结转-直接费用</div>
		        <div field="cbjz" width="130" headerAlign="center" align="right" dataType="currency">当月成本结转-当月结转额</div>
		        
		        
		        <div field="stockRg" width="120" headerAlign="center" align="right" dataType="currency">当月存货余额-人工</div>
		        <div field="stockWb" width="120" headerAlign="center" align="right" dataType="currency">当月存货余额-采购</div>
		        <div field="stockBx" width="130" headerAlign="center" align="right" dataType="currency">当月存货余额-直接费用</div>
		        <div field="stock" width="160" headerAlign="center" align="right" dataType="currency">当月存货余额-当月余额总计</div>
		        
		        <div field="stockJz" width="90" headerAlign="center" align="right" dataType="currency">当月存货减值</div>
		        <div field="stockNet" width="90" headerAlign="center" align="right" dataType="currency">当月存货净值</div>
		        <div field="stockJzAll" width="90" headerAlign="center" align="right" dataType="currency">累计减值</div>
			</div>
		</div>
	</div>
	<div>
		<table>
			<tr>
				<td>选择要转换的合同：</td>
				<td>
					<input class = "nui-buttonedit" id = "contnums" onclick="selectCont">
				</td>
			</tr>
		</table>
	</div>
	<div  class="mini-panel" title="已有合同的收入成本" width="auto">
	    <div id="contStock_grid1" class="nui-datagrid" style="width:auto;height:235px;" allowResize="true" dataField="csContStocks" url="com.primeton.eos.ame_income.csContStock.queryCsContStock1.biz.ext"
	    	  showPager="false" idField="appid"  frozenStartColumn="0" frozenEndColumn="6">
			<div property="columns">
				<div field="yearmonth" width="55" headerAlign="center" align="center" renderer="onYearMonthrenderer">财务年月</div>
				<div field="org" width="0" renderer="dictOrgRenderer" headerAlign="center"  >事业部</div>
		        <div field="salename" width="0" headerAlign="center" >受益销售</div>
		        <div field="custjc" width="0" headerAlign="center" >客户简称</div>
				<div field="contnum" width="75" renderer="onContnumRenderer" headerAlign="center"  >合同编号</div>
		        <div field="projectname" width="140" headerAlign="center">合同项目名称</div>
		        <div field="status" align="center" width="60" headerAlign="center"  renderer="dictStatusRenderer">状态</div>
		        
		        
		        <div field="scfyRg" width="110" headerAlign="center" align="right" dataType="currency">当月生产成本-人工</div>
		        <div field="scfyWb" width="110" headerAlign="center" align="right" dataType="currency">当月生产成本-采购</div>
		        <div field="scfyBx" width="130" headerAlign="center" align="right" dataType="currency">当月生产成本-直接费用</div>
		        <div field="scfyDyze" width="130" headerAlign="center" align="right" dataType="currency">当月生产成本-当月总额</div><!-- 计算 -->
		        <div field="scfy" width="95" headerAlign="center" align="right" dataType="currency">生产成本余额</div><!-- 累计 -->
		        
		        <div field="cbjzRg" width="110" headerAlign="center" align="right" dataType="currency">当月成本结转-人工</div>
		        <div field="cbjzWb" width="110" headerAlign="center" align="right" dataType="currency">当月成本结转-采购</div>
		        <div field="cbjzBx" width="130" headerAlign="center" align="right" dataType="currency">当月成本结转-直接费用</div>
		        <div field="cbjz" width="130" headerAlign="center" align="right" dataType="currency">当月成本结转-当月结转额</div>
		        
		        
		        <div field="stockRg" width="120" headerAlign="center" align="right" dataType="currency">当月存货余额-人工</div>
		        <div field="stockWb" width="120" headerAlign="center" align="right" dataType="currency">当月存货余额-采购</div>
		        <div field="stockBx" width="130" headerAlign="center" align="right" dataType="currency">当月存货余额-直接费用</div>
		        <div field="stock" width="160" headerAlign="center" align="right" dataType="currency">当月存货余额-当月余额总计</div>
		        
		        <div field="stockJz" width="90" headerAlign="center" align="right" dataType="currency">当月存货减值</div>
		        <div field="stockNet" width="90" headerAlign="center" align="right" dataType="currency">当月存货净值</div>
		        <div field="stockJzAll" width="90" headerAlign="center" align="right" dataType="currency">累计减值</div>
			</div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="margin-right:20px;" id="sureButton">确认转换</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	<script type="text/javascript">
		/**供应商查询*/
		var form = new nui.Form("#form1");
    	nui.parse();
    	var contStock_grid = nui.get("contStock_grid");
    	var contStock_grid1 = nui.get("contStock_grid1");
    	function setData(data){
    		var data = nui.clone(data);
    		nui.get("contnumPara").setValue(data.contnum);
    		var datas = form.getData();
    		contStock_grid.load(datas);
    		contStock_grid.sortBy("contnum","desc");
    		nui.get("contnumPara").setValue(data.contnum1);
    		nui.get("contnums").setValue(data.contnum1);
    		nui.get("contnums").setText(data.contnum1);
    		var datas = form.getData();
    		contStock_grid1.load(datas);
    		contStock_grid1.sortBy("contnum","desc");
		}
		function selectCont(e){
			var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/contract_lookup.jsp",
                title: "选择合同",
                width: 1000,
                height: 520,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.text);
                            btnEdit.setText(data.text);
                            nui.get("contnumPara").setValue(data.text);
                            var data = form.getData();
                            contStock_grid1.load(data)
                            contStock_grid1.sortBy("contnum","desc");
                        }
                    }
                }
            });
			
		}
		function onOk(){
			if (confirm("是否确认转换？")) {
            	nui.get("sureButton").disable();
            }else{
            	return false;
            }
			var contstock1 = contStock_grid.getData();
			var contstock2 = contStock_grid1.getData();
			var contnums = nui.get("contnums").getValue();
			var json = {"contstock1":contstock1,"contstock2":contstock2,"contnum":contnums};
			nui.ajax({
    			url: "com.primeton.eos.ame_income.csContStock.contStockConversion.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		if(o.result == 1){
			     		alert("转换成功");
			     		CloseWindow("ok");
		     		}else{
		     			alert("转换失败，请联系信息技术部");
		     			nui.get("sureButton").enable();
		     		}
		        },
		        error: function () {
		        	alert("error");
		        	nui.get("sureButton").enable();
		        }
			});
			
		}
		//日期显示格式
        function onYearMonthrenderer(e) {
			return e.value.substring(0,4)+"/"+e.value.substring(4,6);
        }
        function dictStatusRenderer(e) {
        	if(!nui.getDictText('AME_CONTSTOCKSTATUS',e.value)){
        		return "空字典项！";
        	}
			return nui.getDictText('AME_CONTSTOCKSTATUS',e.value);
        }
	    //查看合同详细信息
	    function onContnumRenderer(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
		function doView(){
			var selectRow = contStock_grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/newcont/newCont/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
		function onCancel(e) {
				CloseWindow("cancel");
        }
        	//标准方法接口定义
        function CloseWindow(action) {            
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
  </script>
</body>
</html>