<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 石浩
  - Date: 2017-05-02 11:41:21
  - Description:
-->
<head>
	<title>编辑微信红包模板</title>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
</head>
<body>
	 <form id="form1" method="post">
        <div style="padding-left:11px;padding-bottom:5px;">
        	<input class="nui-hidden" id="id" name="temp.id"/>
        	<input class="nui-hidden" id="status" name="temp.status"/>
            <table style="table-layout:fixed;">
                <tr>
                    <td style="width:70px;">商户名称：</td>
                    <td style="width:150px;">    
                        <input name="temp.sendname" class="nui-textbox" required="true" vtype="maxLength:32"/>
                    </td>
                    <td style="width:70px;">活动名称：</td>
                    <td style="width:150px;">    
                        <input name="temp.actname" class="nui-textbox"  required="true" vtype="maxLength:32"/>
                    </td>
                </tr>
                <tr>
                   <td style="width:85px;"><span>红包类型：</span></td>
                    <td >    
                        <input id="amounttype" name="temp.amounttype" class="nui-dictcombobox" dictTypeId="RED_AMOUNT_TYPE" required="true" value="0" onvaluechanged="ontypeChange"/>
                    </td>
                    <td >状态：</td>
	                <td >    
	                    <input name="temp.status" class="nui-dictcombobox" dictTypeId="ABF_STATUS" required="true"/>
	                </td>
                 </tr>
                 <!-- 固定金额 -->
                <tr id="fix">
                	<td style="width:85px;"><span>红包金额(元)：</span></td>
                    <td >    
                       	<input id="amount"  name="temp.amount" class="nui-spinner" format="0.00" minValue="0.01" maxValue="200" required="true"/>
                    </td>
                </tr>
                <!-- 随机金额 -->
                <tr id="random">
                	<td style="width:85px;"><span>最小金额(元)：</span></td>
                    <td > 
                    	<input id="minamount" name="temp.minamount" class="nui-spinner" format="0.00"  minValue="0.01" maxValue="200" required="true"/>   
                    </td>
                    <td style="width:85px;"><span>最大金额(元)：</span></td>
                    <td >    
                    	<input id="maxamount" name="temp.maxamount" class="nui-spinner" format="0.00" minValue="0.01" maxValue="200" required="true"/>
                    </td>
                </tr>
                <!-- 随机金额 -->
                <tr id="odd">
                	<td style="width:85px;"><span>中签率：</span></td>
                    <td >    
                       	<input id="probability" style="width:85px;"  name="temp.probability" class="nui-textbox" emptyText="录入整数"  required="true" intErrorText="请输入整数" vtype="range:1,10000" minErrorText="1"/>/10000
                    </td>
                </tr>
                 <tr>
                    <td >祝福语：</td>
                    <td colspan="3">    
                        <input name="temp.wishing" class="nui-textbox" style="width:93%;" required="true" vtype="maxLength:128"/>
                    </td>
                   
                </tr>
               
                <tr>
                    <td><span>适用应用：</span></td>
                    <td >    
                        <input name="temp.appid" class="nui-dictcombobox" dictTypeId="AME_WE_APP" required="true"/>
                    </td>
                    <td><span>适用范围：</span></td>
                    <td >    
                        <input name="temp.type" class="nui-dictcombobox" dictTypeId="WE_RED_RANGE" required="true"/>
                    </td>
                   
                </tr> 
                <tr>
	                <td >开始日期：</td>
	                <td >    
	                    <input id="startdate" name="temp.startdate" class="nui-datepicker"  />
	                </td>
	                <td >结束日期：</td>
	                <td >    
	                    <input id="enddate" name="temp.enddate" class="nui-datepicker"  />
	                </td>
            	</tr>  
            	<tr>
	                
	                 <td >备注：</td>
                    <td colspan="3">    
                        <input name="temp.remark" class="nui-textbox" required="true"  vtype="maxLength:128" style="width:93%;"/>
                    </td>
            	</tr>         
            </table>
        </div>
        <div style="text-align:center;padding:10px;">               
            <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
            <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>       
        </div>        
    </form>
</body>
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#form1"); 
    //修改
    function onOk(){
    	form.validate();
    	if (!form.isValid()){
    	 return false;
    	}
    	//日期判断
    	var startdate = nui.get("startdate").getValue();
    	var enddate = nui.get("enddate").getValue();
    	if(startdate){
    		if(enddate){
    			if(startdate>enddate){
		    	    alert("开始日期不能大于结束日期");
		    		return false;
	    		}
    		}
    	}
    	var data = form.getData(false,true);
    	var datas = nui.encode(data);
    	$.ajax({
    	        type:"POST",
	            url: "com.primeton.eos.ame_common.weChatPlatform.updateRedEnvelopeTemp.biz.ext",
	            dataType: 'json',
	            data: datas,
	            contentType : "text/json",
	            success: function (text) {
	                alert("修改成功");
	            	CloseWindow("SUCC")
	            }
		 });  
    }
    
    function SetData(rows){
    	form.setData({temp:rows});
    	init();
    }
    
    function init(){
       var type = nui.get("amounttype").getValue();
       if(type==0){//固定金额
       	  $("#fix").show();
       	  $("#random").hide(); 
       	  $("#odd").hide();
       }else if(type==1){//随机金额
       	  $("#fix").hide();  
       	  $("#random").show(); 
       	  $("#odd").show(); 
       }
    }
    
    function ontypeChange(){
		init(); 
    }
    //关闭窗口
    function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
    }
    
    function onCancel(){
    	CloseWindow("cancel");
    }
</script>
</html>