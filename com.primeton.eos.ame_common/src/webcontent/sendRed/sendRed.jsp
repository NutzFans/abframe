<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-09-12 16:02:04
  - Description:
-->
<head>
<title>发送红包</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{
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
<div class="nui-fit">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>发送红包</legend>
		<div style="padding:5px;">
			<form id="form1" method="post">
				<input class="nui-hidden" name="temp.agentid" value='5'/>
		        <div style="padding-left:11px;padding-bottom:5px;">
		            <table style="table-layout:fixed;width:100%">
		            	<tr>
		            		<td align="right">活动名称：</td>
		                    <td>    
		                        <input name="temp.actName" class="nui-textbox" required="true" value='阿米加' vtype="maxLength:32"/>
		                    </td>
		                    <td></td>
		                </tr>
		                <tr>
		                	<td align='right'>祝福语：</td>
		                    <td >    
		                        <input name="temp.wishing" class="nui-textbox" style="width:100%;" required="true" vtype="maxLength:128"/>
		                    </td>
		                    <td></td>
		                </tr>
		                <tr>
		                    <td align="right">红包类型：</td>
		                    <td >    
		                        <input id="amounttype" name="temp.amounttype" class="nui-dictcombobox" dictTypeId="RED_AMOUNT_TYPE" required="true" value="0" onvaluechanged="ontypeChange"/>
		                    </td>
		                    <td></td>
	                 	</tr>
	                 	<tr id='box'>
	                 		<td align="right" >红包金额(元)：</td>
		                    <td >    
		                       	<input id="amount"  name="temp.totalAmount" class="nui-spinner" format="0.00" minValue="0.01" maxValue='200' onvaluechanged="onMoneyChange1" required="true"/>
		                    </td>
		                    <td></td>
	                 	</tr>
	                 	<tr id="fix" style="display: none;">
		                	<td align="right">最小金额(元)：</td>
		                    <td> 
		                    	<input id="minamount" name="temp.minamount" class="nui-spinner" format="0.00"  minValue="0.01" required="true"/>   
		                    </td>
		                    <td></td>
		                </tr>
		                <tr id='fix1' style="display: none;">
		                	<td align="right">最大金额(元)：</td>
		                    <td >    
		                    	<input id="maxamount" name="temp.maxamount" class="nui-spinner"  format="0.00" minValue="1" maxValue='200' required="true" onvaluechanged="onMoneyChange2"/>
		                    </td>
		                    <td></td>
		                </tr>
	                 	<tr>
		            		<td align="right">发送对象：</td>
		            		<td>    
			                    <input id="lookup2" class="mini-textboxlist" placeholder='请输入姓名搜索' name="temp.userid" searchField="name" style="width:100%"
		        						url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" value="" text=""
		        						textField="EMPNAME" valueField="USERID"/>
			                </td>
			                <td></td>
		            	</tr>
		                 <tr>
		                    <td align="right">备注：</td>
		                    <td>
		                    	<input id="remark" name="temp.remark"  style="width:100%;" class="nui-textbox" required="true"/>
		                    </td>
		                    <td></td>
		                </tr>
		            </table>
		        </div>
		        <div style="text-align:center;padding:10px;">               
		            <div class="nui-button" id='ddd' onclick="CloseWindow('cancel')" disabled = "disabled" style="margin-right:20px;">发送红包</>       
		        </div>        
		    </form>
	   	</div>
   	</fieldset> 
   	</div> 
</body>
<script type="text/javascript">
	nui.parse();
	//固定金额还是随机金额
	function ontypeChange(){
		if(this.text=='固定金额'){;
			document.getElementById('fix').style.display = 'none';
			document.getElementById('fix1').style.display = 'none';
			document.getElementById('box').style.display = '';
		}else{
			document.getElementById('fix').style.display = '';
			document.getElementById('fix1').style.display = '';
			document.getElementById('box').style.display = 'none';
		}
    }
    //红包金额与最大金额
    function onMoneyChange1(){
		nui.get("maxamount").setValue(this.value);
    }
    //最大金额与红包金额
    function onMoneyChange2(){
		nui.get("amount").setValue(this.value);
    }
    function CloseWindow(action) {
        if (action == "cancel" ) {
            if (!confirm("是否发送红包？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow){
            return window.CloseOwnerWindow(action);
        } else {
            window.close(); 
            onOk();
        }
    }
	function onOk() {
		//定义变量接受form表单数据
		var form = new nui.Form("#form1");
		var data = form.getData(); 
		var tp = data.temp;
		//判断活动名称是否为空
		if(tp.actName==''){
			nui.alert("请确认活动名称是否填写！");
			return;
		}
		//判断祝福语是否为空
		if(tp.wishing==''){
			nui.alert("请确认祝福语是否填写！");
			return;
		}
		//判断发送对象是否为空
		if(tp.userid==''){
			nui.alert("请确认发送对象是否填写！");
			return;
		}
		//判断红包备注是否填写
		if(tp.remark==''){
			nui.alert("请确认红包备注是否填写！");
			return;
		}
	  	sendRed();
	}
	function sendRed(){
		nui.get('ddd').disable();
		//定义变量接受form表单数据
		var form = new nui.Form("#form1");
		var json = form.getData();
		var red = json.temp;
		var type = nui.get('amounttype').text;
		var totalAmount;
		var max;
		var min;
		if(type=='固定金额'){
			totalAmount = red.totalAmount;
			max = 0;
			min = 0;
		}else if(type=='随机金额'){
			min = nui.get("minamount").getValue();
			max = nui.get("maxamount").getValue();
			if(min>max||min==max){
				nui.alert("请确认最大金额大于最小金额！");
				return;
			}
			totalAmount = 0;
		}
		var data = {
			userid:red.userid,actName:red.actName,remark:red.remark,
			sendName:'普元阿米加',totalAmount:totalAmount,totalNum:'1',
			wishing:red.wishing,agentid:5,max:max,min:min
		};
		form.loading(".....");
		nui.ajax({
			url: "com.primeton.eos.ame_common.weChatPlatform.sendRed.biz.ext",
			type: 'POST',
			data: data,	
			contentType: 'text/json',
            success: function (o) {
            	if(o.status=='0'){
            		nui.alert("红包发送成功。");
            		nui.get("ddd").enable();
            	}else if(o.status=='1'){
            		nui.alert("红包发送失败。");
            		nui.get("ddd").enable();
            	}else if(o.status=='2'){
            		nui.alert("红包发送失败，接口调用失败。");
            		nui.get("ddd").enable();
            	}else if(o.status=='3'){
            		nui.alert("接口调用成功，保存记录出现异常。");
            		nui.get("ddd").enable();
            	}
            	form.unmask();
            }
		})
	}
	//求随机数
	function selectfrom (lowValue,highValue){
		var choice=highValue-lowValue;
		var money = Math.random()*choice+lowValue;
		return money.toFixed(2);
	}
	//人员选择清除
	function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
    }
</script>
</html>