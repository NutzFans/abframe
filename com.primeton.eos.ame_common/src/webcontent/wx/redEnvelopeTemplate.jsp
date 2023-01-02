<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 石浩
  - Date: 2017-04-28 10:47:44
  - Description:
-->
<head>
	<title>微信红包模板</title>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
</head>
<body>
<div  class="nui-panel" title="微信红包模板管理" width="auto" height="100%">
		<div style="width:100%;height:20;padding:0px;margin:0px;" id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right">商户名称：</td>
		            	<td align="left">
						    <input name="map/sendname" class="nui-textbox"/>
						</td> 
						
						<td align="right"><span>状态：</span></td>
		            	<td align="left">
						    <input name="map/status" class="nui-dictcombobox" showNullItem="true" nullItemText="" dictTypeId="ABF_STATUS"  />
						</td>
						
						<td align="right"><span>开始日期：</span></td>
		            	<td align="left">
						    <input name="map/startdateMin" class="nui-datepicker" format="yyyy-MM-dd" style="width:100px;" id="startdateMin"/>
							&nbsp;至
							<input name="map/startdateMax" class="nui-datepicker" format="yyyy-MM-dd"  style="width:100px;" id="startdateMax"/>
						</td>
					</tr>
					
				    <tr>
				    	<td align="right">活动名称：</td>
		            	<td align="left">
						    <input name="map/actname" class="nui-textbox" />
						</td> 
						<td align="right"><span>适用范围：</span></td>
		            	<td align="left">
						    <input name="map/type" class="nui-dictcombobox"  dictTypeId="WE_RED_RANGE" showNullItem="true" nullItemText=""/>
						</td>
				    	
						<td align="right"><span>结束日期：</span></td>
		            	<td align="left">
						    <input name="map/enddateMin" class="nui-datepicker" format="yyyy-MM-dd" style="width:100px;" id="enddateMin"/>
							&nbsp;至
							<input name="map/enddateMax" class="nui-datepicker" format="yyyy-MM-dd"  style="width:100px;" id="enddateMax"/>
						</td>
		    			<td align="center" colspan="12">
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
	    <div class="nui-fit">
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:420px;" allowResize="true" dataField="data" showPager="true" sortMode="client"
		    url="com.primeton.eos.ame_common.weChatPlatform.queryRedEnvelopeTempwithPage.biz.ext" sizeList="[10,20,50,100]"  multiSelect="false" 
		    frozenStartColumn="0" frozenEndColumn="3"> 
				<div property="columns">
					<div type="checkcolumn" width="25"></div>	
					<div field="id" width="60" align="center" headerAlign="center"  allowSort="true">模板编号</div>		
					<div field="sendname" width="68" align="center" headerAlign="center"  allowSort="true" >商户名称</div>
					<div field="actname" width="100" align="center" headerAlign="center"  allowSort="true">活动名称</div>
					<div field="amounttype" width="60" align="center"  headerAlign="center" allowSort="true" renderer="amoutType">红包类型</div>
					
					<div field="amount" width="60" align="center"  headerAlign="center" allowSort="true">金额(元)</div>
					<div field="minamount" width="72" align="center"  headerAlign="center" allowSort="true">最小金额(元)</div>
					<div field="maxamount" width="72" align="center"  headerAlign="center" allowSort="true">最大金额(元)</div>
					<div field="probability" width="60" align="center"  headerAlign="center" allowSort="true">中签率</div>
					
					<div field="startdate" width="75" align="center" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">开始日期</div>	
					<div field="enddate"width="75" align="center" headerAlign="center"   dateFormat="yyyy-MM-dd" allowSort="true">结束日期</div>						
					<div field="status"width="60" align="center" headerAlign="center" renderer="doStatus"  allowSort="true">状态</div>						
					<div field="wishing" width="140" align="center" headerAlign="center" allowSort="true">祝福语</div>
					<div field="appid" width="60" align="center" headerAlign="center" renderer="doApp" allowSort="true">适用应用</div>
					<div field="remark" width="80" align="center" headerAlign="center"   allowSort="true">备注</div>
					<div field="maker"width="60" align="center" headerAlign="center"allowSort="true">制定人</div>
					<div field="mdate"width="75" align="center" headerAlign="center"  dateFormat="yyyy-MM-dd" allowSort="true">制定时间</div>
				</div>
			</div>
		</div>
  </div>
</body>
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#form1");
    var grid = nui.get("datagrid1");
    grid.load();
    
    
    //搜索
    function search(){
    	var data = form.getData(false,true);
    	grid.load(data);
    }
    
    //重置
    function reset(){
    	form.reset();
    }
    
    //增加红包模板
    function add(){
    	nui.open({
                url: "<%=request.getContextPath() %>/ame_common/wx/addRedEnvelopeTemp.jsp",
                title: "新增微信红包模板", 
				width: 530,
	            height: 320,
                ondestroy: function (action) {
		            grid.reload();
                }
            });
    
    }
    
    function edit(){
    	var row = grid.getSelected();
    	if (row) {
	    	nui.open({
	                url: "<%=request.getContextPath() %>/ame_common/wx/editRedEnvelopeTemp.jsp",
	                title: "编辑微信红包模板", 
					width: 530,
		            height: 320,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    iframe.contentWindow.SetData(row);
	                },
	                ondestroy: function (action) {
			            grid.reload();
	                }
	            });
		  }else {
	                alert("请选中一条记录");
	      }
    }
    
    function remove(){
    	var rows = grid.getSelected();   //获取所有选中的行对象
    	if (rows) {
            	if (confirm("确定删除选中记录？")) {
	               // grid.loading("操作中，请稍后......");
	               var json = {temp:rows};
	                nui.ajax({
		                url: "com.primeton.eos.ame_common.weChatPlatform.removeRedEnvelopeTemp.biz.ext",
		                type: "post",
		                data: json, 
		                cache: false,
		                contentType: 'text/json',
		                success: function (o) {
		                		grid.reload();
		                		alert("删除成功");
		                },
		                error: function () {
	                    }
	               });
                }
            } else {
                alert("请至少选中一条记录");
            }
    
    }
    
    function doStatus(e){
    	return nui.getDictText('ABF_STATUS',e.value);
    }
    
    function doApp(e){
    	return nui.getDictText('AME_WE_APP',e.value);
    }
    
    function amoutType(e){
    	return nui.getDictText('RED_AMOUNT_TYPE',e.value);
    }
     
    
    
</script>
</html>