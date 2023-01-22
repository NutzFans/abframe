<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-09-05 11:27:25
  - Description:
-->
<head>
<title>竞争对手信息</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
</style>
</head>
<body>
<div class="nui-fit" id="formcust">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>竞争对手基本资料</legend>
		<div>
			<div id='form1'>
				<input name="custinfo.files" id="fileids" class="nui-hidden"/><!-- 附件 -->
				<input class="nui-hidden" name="custinfo.custid"/><!-- 竞争对手主键id -->
				<table style="table-layout:fixed;">
					<tr>
						<td align="right">
							竞争对手名称：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.custname"  required="true" style="width:260px"/>
						</td>
						
						<td align="right" ">竞争对手类型：</td>
						<td align="left">
		            		<input id='status' class="nui-dictcombobox" required="true" name="custinfo.customertype" dictTypeId="ZH_GROUP"  showNullItem="true" nullItemText=""  style="width: 260px;"/>
					    </td>
					    	<td align="right">
							公司网址：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.website" id="" style="width: 260px"/>
						</td>
					</tr>
					<tr>
						<td align="right">
							联系电话：
						</td>
						<td>
							<input name="custinfo.telephone" id="" class="nui-textbox" style="width: 260px"/>
						</td>
						<td align="right">
							传真：
						</td>
						<td>
							<input name="custinfo.fax" id="" class="nui-textbox" style="width: 260px"/>
						</td>
						
						<td align="right">
							统一服务电话：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.servphone" id="" style="width: 260px"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">
							联系地址：
						</td>
						<td colspan="5">
							<input class="nui-textbox" name="custinfo.address"  style="width:100%;"/>
						</td>	
					</tr>
					<tr>
						<td align="right">
							经营范围：
						</td>
						<td colspan="3">
							<input name="custinfo.busiscope" id="" class="nui-textarea" style="width:100%;height: 40px;" />
						</td>
						
						<td align="right">
							联系人：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.contacts" id="" style="width: 100%"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							备注：
						</td>
						<td colspan="7">
							<input name="custinfo.comments" id="" class="nui-textarea" style="width:100%;height: 40px;"/>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</fieldset>
	<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;dispaly:none;">
		<legend>相关附件</legend>
		<jsp:include page="/ame_common/inputFile.jsp"/>
	</fieldset>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width: 60px;margin-right: 20px;">保存</a>
	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div>
<script type="text/javascript">
	nui.parse();
	var custid = '<%=request.getParameter("custid")%>';
	SetData(custid);
	//页面进入时调用的方法
    function SetData(data) {
    	if(data=='null'){
    		nui.get("lastyear").setValue(formatDate(new Date())-1);
			nui.get("twoago").setValue(formatDate(new Date())-2);
			nui.get("threeago").setValue(formatDate(new Date())-3);
			nui.get("grid_0").hide();      //隐藏附件信息
			nui.get("filedetail").hide();  //隐藏相关附件表头
			nui.get("status").setValue(1);
    	}else{
	    	var form = new nui.Form("#formcust");
			var json = nui.encode({custid:data});
	        nui.ajax({
	            url: "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.competinfoview.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	form.setData(o);
	      			console.log(o);
	            	//nui.get("groupno").setText(o.custinfo.custname1);
	            	var grid_0 = nui.get("grid_0");
					grid_0.sortBy("fileTime","desc");
	            	grid_0.load({"groupid":"ZH_COMPETITOR","relationid":data});
	            }
	        });
	    }    
    }
     //日期格式化
    function formatDate (date) {
	    var y = date.getFullYear();
	    return y ;
	}
	//表单效验
	function onOk(){
		//定义变量接受form表单数据
		var form = new nui.Form("#formcust");
		var data = form.getData(); 
		var cs = data.custinfo;
	  	if(cs.custname==''||cs.custjc==''||cs.status==''){
	  		nui.alert("表单信息填写不完整，请确认必输项是否填写！");
			return;
	  	}
	  	document.getElementById("fileCatalog").value="competitor";
		form2.submit();
	}
	
	//保存数据
	function SaveData(){
		//定义变量接受form表单数据
	  	var form = new nui.Form("#formcust");
		var data = form.getData();
		var cs = data.custinfo;
		//附件ID赋值
		data.custinfo.files = nui.get("fileids").getValue();
		console.log(data);
		var json = nui.encode(data);
		nui.ajax({
            url: "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.addCommpetiorInfo.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	if(o.result==1&&cs.custid==''){
            		nui.alert("新增客戶信息成功",null,function(){
            			CloseWindow('save');
            		});
            	}else if(o.result==1){
            		nui.alert("修改客戶信息成功",null,function(){
            			CloseWindow("save");
			        });
            	}else if(cs.custid==''){
            		nui.alert("新增失败,请联系信息技术部");
            	}else{
            		nui.alert("修改失败,请联系信息技术部");
            	}
            }
        });
	}
	
	//点击选择大竞争对手经理时的方法
    function onButtonEdit(e) {
        var btnEdit = this;	
        var lookupUrl="";
    	lookupUrl = "<%=request.getContextPath() %>/ame_common/custinfo/custInfoManager.jsp";
		if (lookupUrl=="") return;
        nui.open({
			url:lookupUrl,
			title: "选择列表",
			width: 800,
			height: 420,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.empname);
		                btnEdit.setText(data.empname);
					}
				}
			}
		});
	}
	function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
    }
	//关闭窗口
	function onCancel(e) {
        CloseWindow("cancel");
    }
    function CloseWindow(action) {
        
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    //选择服务竞争对手弹窗
	function selectCustmer(){
		var btnEdit = this;
		nui.open({
			url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
		    title: "选择竞争对手",
		    width: 650,
		    height: 380,
		    ondestroy: function (action) {
		        if (action == "ok") {
		            var iframe = this.getIFrameEl();
		            var data = iframe.contentWindow.GetData();
		            data = nui.clone(data);    //必须
		            if (data) {
		                btnEdit.setValue(data.id);
		                btnEdit.setText(data.text);
		            }
		        }
		    }
		    });
	}
	//检查是否为数字
	function validate(e){  
	     var reg = new RegExp("^[0-9]*[0-9][0-9]*$");  
	     var obj = nui.get(e).getValue();
	     if(!reg.test(obj)){  
	     	alert("请输入数字!");
	     	nui.get(e).setValue("");    
	     }  
     }
</script>
</html>