<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-11-05 16:49:12
  - Description:短信信息查询
-->
<head>
<title>短信查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
</head>
<body>
<div  class="nui-panel" title="短信信息查询" width="auto">
		<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right">发送对象：</td>
						<td>
							<input name="map/receivername" class="nui-textBox"  id="receivername"/>
						</td>
						<td align="right">发送手机：</td>
						<td>
							<input name="map/telphone" class="nui-textBox"  id="telphone"/>
						</td>
						<td align="right">短信内容：</td>
						<td>
							<input name="map/smscontent" class="nui-textBox"  id="smscontent"/>
						</td>
						<td align="right">发送时间：</td>
						<td>
							<input name="map/sendtimeMin" class="nui-datepicker" format="yyyy-MM-dd" style="width:100px;" id="sendtimeMin"/>
							&nbsp;至
							<input name="map/sendtimeMax" class="nui-datepicker" format="yyyy-MM-dd"  style="width:100px;" id="sendtimeMax"/>
						</td>
					</tr>
					<tr>
						<td align="right">状态：</td>
						<td>
							<input class="nui-dictcombobox" dictTypeId="SMS_SEND_STATUS"  name="map/sendstatus" id="sendstatus" showNullItem="true" nullItemText="全部"/>
						</td>
						<td align="right">短信业务类型：</td>
						<td>
							<input class="nui-dictcombobox" dictTypeId="SMS_BIZ_TYPE"  name="map/smsbiztype" id="smsbiztype" showNullItem="true" nullItemText="全部"/>
						</td>
						<td align="right">短信平台代码：</td>
						<td>
							<input name="map/smsplatformno" class="nui-textBox"  id="smsplatformno"/>
						</td>
						<td></td>
						<td>
						</td>
					</tr>
	            </table> 
	             <table style="width:90%;">
		            <tr>
		                <td align="center" style="width:100%;">
		                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
							<a class="nui-button" iconCls="icon-reload" id="reset" onclick="reset()" >重置</a>
		                </td>
		            </tr>
	        	</table>          
	        </div>
	    </div>
	    <div class="nui-fit">
		<!-- 短信信息列表-->
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:450px;" allowResize="false" dataField="data" showSummaryRow="true" allowCellWrap="true"
	    	url="com.primeton.eos.ame_common.smsPlatform.querySmsSendInfoWithPage.biz.ext" sizeList="[10,20,50,100]" multiSelect="true" frozenStartColumn="0" pageSize="20">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="smsno" width="30" align="center" headerAlign="center">编号</div> 
				<div field="sendtime" width="100" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss">发送时间</div>			
				<div field="receivername" width="70" align="center" headerAlign="center">发送对象姓名</div>
				<div field="telphone" width="70" align="center"  headerAlign="center">发送手机号码</div>
				<div field="smscontent" width="320" align="left"  headerAlign="center">发送内容</div>
				<div field="count" width="25" align="center" headerAlign="center" dataType="int" summaryType="sum">条数</div>
				<div field="wordnumber" width="25" align="center" headerAlign="center" >字数</div>	
				<div field="sendstatus" width="70" align="center" headerAlign="center" renderer="doStatus">状态</div>	
				<div field="smsplatformno" width="85" align="center"  headerAlign="center">短信平台代码</div>
				<div field="smsbiztype" width="50" align="center"  headerAlign="center" renderer="doBizType">业务类型</div>
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
    
    //短信发送状态
    function doStatus(e){
     	return nui.getDictText('SMS_SEND_STATUS',e.value);
    }
    
    //短信业务类型
    function doBizType(e){
    	return nui.getDictText('SMS_BIZ_TYPE',e.value);
    }
    
    //查询短信信息
    function search(){
		var data = form.getData(); 
		//数据库确认年月格式为int类型，monthpicker类型是date类型，所以要转换
	  	grid.load(data); //datagrid加载数据
    }
    //重置
    function reset(){
    	form.reset();
    }
    
</script>
</html>