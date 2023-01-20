<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<head>
	<title></title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>	
</head>
<body>
	<div class="nui-toolbar" style="text-align:center;" borderStyle="border:0;" id="form1">
        <table style="width:100%;">
	    	<tr>
				<td align="right" style="width:80px;"><span>乘机人：</span></td>
	        	<td align="left" style="width:80px;">
				  	<input class="nui-textbox" name="criteria._expr[0]._value" style="width:120px;" />
			        <input class="nui-hidden" name="criteria._expr[0]._property" value="passengername"/>
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			        <input class="nui-hidden" name="criteria._expr[4]._value" value="0,1" />
			        <input class="nui-hidden" name="criteria._expr[4]._property" value="isverfi"/>
			        <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
			        <input class="nui-hidden" name="criteria._expr[5]._value" value="n" />
			        <input class="nui-hidden" name="criteria._expr[5]._property" value="isrefund"/>
			        <input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
			        <input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="passengerid">
			        <input class="nui-hidden" name="criteria._or[0]._expr[0]._value" id="passengerid">
			        <input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="userid">
			        <input class="nui-hidden" name="criteria._or[0]._expr[1]._value" id="userid">
				</td>
				<td align="right" style="width:80px"><span>订票日期：</span></td>
				<td align="left">
				    <input name="criteria._expr[2]._min" class="nui-datepicker" style="width:100px;" />-<input name="criteria._expr[2]._max" class="nui-datepicker" style="width:100px;" />
				    <input class="nui-hidden" name="criteria._expr[2]._property" value="bookdate"/>
				    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
				</td>
				<td></td>
			<tr>
				<td align="right" style="width:80px"><span>航班号：</span></td>
            	<td align="left" style="width:80px;">
				    <input name="criteria._expr[1]._value" class="nui-textbox" style="width:120px;" />
				    <input class="nui-hidden" name="criteria._expr[1]._property" value="flightnumber"/>
				    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
				    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
				</td>
				<td align="right" style="width:80px"><span>航班日期：</span></td>
				<td align="left" style="width: 230px">
				    <input name="criteria._expr[3]._min" class="nui-datepicker" style="width:100px;" />-<input name="criteria._expr[3]._max" class="nui-datepicker" style="width:100px;" />
				    <input class="nui-hidden" name="criteria._expr[3]._property" value="flightdate"/>
				    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
				</td>
				<td style="width:60px;"><a class="nui-button" iconCls="icon-search" style="width:60px;" onclick="search()">查询</a></td>
			</tr>
        </table>      
    </div>
    <div class="nui-fit">
        <div id="grid1" class="nui-datagrid" style="width:100%;height:100%;"
            allowResize="true" dataField="tickets" multiSelect="false" url="com.primeton.eos.ame_fee.ticket.queryTicket.biz.ext"
            borderStyle="border-left:0;border-right:0;" onrowdblclick="onRowDblClick">
            <div property="columns">	    
        		<div type="checkcolumn"></div>
                <div field="bookdate" width="75" headerAlign="center" renderer="getDetail" dateFormat="yyyy-MM-dd" allowSort="true">订票日期</div>
				<div field="flightnumber"width="60" headerAlign="center"allowSort="true">航班号</div>
				<div field="flightdate" width="80" headerAlign="center"dateFormat="yyyy-MM-dd"allowSort="true">航班日期</div>
				<div field="passengername" width="60"headerAlign="center"allowSort="true">乘机人</div>
				<div field="empname" width="60"headerAlign="center"allowSort="true">申请人</div>
				<div field="orgname" width="100"headerAlign="center" allowSort="true">受益部门</div>
				<div field="startplace"width="60" headerAlign="center"allowSort="true">出发地</div>
				<div field="destination"width="60" headerAlign="center"allowSort="true">到达地</div>
				<div field="ticmoney"dataType="currency"currencyUnit="￥" align="right" width="75"allowSort="true" summaryType="sum" headerAlign="center">票面金额</div>
				<div field="fuelfee"dataType="currency"currencyUnit="￥" align="right" width="75"allowSort="true" summaryType="sum" headerAlign="center">燃油费</div>
				<div field="otherfee"dataType="currency"currencyUnit="￥" align="right" width="75"allowSort="true" summaryType="sum" headerAlign="center">其他</div>
				<div field="prices"dataType="currency"currencyUnit="￥" align="right" width="75"allowSort="true" summaryType="sum" headerAlign="center">合计</div>
				<div field="remark" width="100"headerAlign="center" allowSort="true">备注</div>                                    
            </div>
        </div>
	</div>  
	              
    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a>
    </div>

</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("grid1");
	var form = new nui.Form("#form1");
	<%	UserObject user = (UserObject) session.getAttribute("userObject");
		String userid = user.getUserId();
	 %>
	function setData(data){//乘机人或者申请人限定
		var data = nui.clone(data);
		if(data.userid){
			nui.get("passengerid").setValue(data.userid);
			nui.get("userid").setValue(data.userid);
		}
		search();
	}
	
	function search() {
		var data = form.getData();
		grid.load(data);
		grid.sortBy("ticketid", "desc");
	}
	
	//重置
    function reset(){
    	form.reset();
		var data = form.getData();
		grid.load(data);
		grid.sortBy("ticketid", "desc");
    }
    
	function GetData() {
		var row = grid.getSelected();
		return row;
	}
	 
	function onKeyEnter(e) {
		search();
	}
	    
	function onRowDblClick(e) {
		onOk();
	}

	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function onOk() {
		CloseWindow("ok");
	}
	function onCancel() {
		CloseWindow("cancel");
	} 
  	
</script>
</html>
