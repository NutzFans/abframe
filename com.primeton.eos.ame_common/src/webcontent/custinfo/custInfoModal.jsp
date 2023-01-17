<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-09-05 11:27:25
  - Description:
-->
<head>
<title>客户信息</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
</style>
</head>
<body>
<div class="nui-fit" id="formcust">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>客户基本资料</legend>
		<div>
			<div id='form1'>
				<input name="custinfo.files" id="fileids" class="nui-hidden"/><!-- 附件 -->
				<input class="nui-hidden" name="custinfo.custid"/><!-- 客户主键id -->
				<table style="table-layout:fixed;">
					<tr>
						<td align="right">
							客户名称：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.custname"  required="true" style="width:100%"/>
						</td>
						<td align="right">
							客户简称：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.custjc"  required="true" style="width:100%"/>
						</td>
						<td align="right"  width="120">
							商务客户编号：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.custnum" id=""  style="width:150px;"/>
						</td>
						<td align="right" width="120">
							企业性质：
						</td>
						<td>
							<input class="nui-dictcombobox" name="custinfo.custnature"  dictTypeId="MIS_CUSTNATURE"  showNullItem="true" nullItemText="全部"  style="width:150px;"/>
						</td>
					</tr>
					<tr>
						<td align="right" width="120">
							客户类型：
						</td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="custinfo.custtype" dictTypeId="MIS_INDUSTRY"  showNullItem="true" nullItemText="全部"  style="width: 100%"/>
					    </td>
					 	<td align="right" style="width: 80px;">是否OEM客户：</td>
						<td align="left">
		            		<input id='oem' class="nui-dictcombobox" name="custinfo.isoem" dictTypeId="MIS_YN"  showNullItem="true" nullItemText="全部"  style="width:100%"/>
					    </td>
						<td align="right">
							重要性：
						</td>
						<td align="left">
		            		<input class="nui-dictcombobox" name="custinfo.grade" dictTypeId="MIS_IMPORTANT"  showNullItem="true" nullItemText="全部"  style="width: 100%"/>
					    </td>
					    <td align="right">
							大客户经理：
						</td>
		                <td align="left">    
		                    <input class="nui-buttonedit" style="width:150px" name="custinfo.custmanager" 
		                    id="custmanager" value="" text="" onbuttonclick="onButtonEdit" showClose="true" 
		                    oncloseclick="onCloseClick" allowInput="false"/>
		                </td>
					</tr>
					<tr>
						<td align="right" style="width: 120px">
							开户银行：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.accoutbank" id=""  style="width:100%;"/>
						</td>
						<td align="right">
							户名：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.accoutname" style="width:100%"/>
						</td>
						<td align="right">账号：</td>
						<td>
							<input class="nui-textbox" name="custinfo.accountid" id=""  style="width:150px;"/>
						</td>
						<td align="right" >
							税务登记证号：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.taxnumb" id=""  style="width: 100%"/>
						</td>
					</tr>
					<tr>
						<td align="right">
							联系电话：
						</td>
						<td>
							<input name="custinfo.telephone" id="" class="nui-textbox" style="width: 150px"/>
						</td>
						<td align="right">
							传真：
						</td>
						<td>
							<input name="custinfo.fax" id="" class="nui-textbox" style="width: 150px"/>
						</td>
						<td align="right">
							统一服务电话：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.servphone" id="" style="width: 100%"/>
						</td>
						<td align="right">
							公司网址：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.website" id="" style="width: 100%"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">
							联系地址：
						</td>
						<td colspan="3">
							<input class="nui-textbox" name="custinfo.address"  style="width:100%;"/>
						</td>
						<td align="right">
							邮编：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.postcode" id=""  style="width:150px;"/>
						</td>
						<td align="right">
							组织机构代码：
						</td>
		            	<td align="left">
		            		<input class="nui-textbox" name="custinfo.orgnum" style="width: 100%"/>
					    </td>
					</tr>
					<tr>
						<td align="right">
							注册资本：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.registercap" id="registercap" style="width: 80%" inputStyle="text-align: right;"onblur="validate('registercap')"/>万元
						</td>
						<td align="right" width="120">
							法人代表：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.legalperson" id=""  style="width: 100%"/>
						</td>
						<td align="right">
							营业执照注册号：
						</td>
						<td>
							<input name="custinfo.license" class="nui-textbox" style="width: 100%"/>
						</td>
						<td align="right">
							营业执照到期时间：
						</td>
			            <td>
				        	<input class="nui-datepicker" name="custinfo.licenseenddate" style="width: 100%"/>
				        </td>
					</tr>
					<tr>
						<td align="right">
							公司人数：
						</td>
		            	<td align="left">
		            		<input class="nui-textbox" name="custinfo.compnum" style="width: 100%"/>
					    </td>
						<td align="right">
							服务人员人数：
						</td>
						<td>
							<input class="nui-textbox" name="custinfo.servnum" id=""  style="width: 100%"/>
						</td>
						<td align="right">
							所属集团客户：
						</td>
						<td colspan="3">
							<input name="custinfo.groupno" id="groupno" onbuttonclick="selectCustmer" class="nui-buttonedit" style="width: 100%" allowInput="false" />
						</td>
					</tr>
					<tr>
						<td align="right">
							经营范围：
						</td>
						<td colspan="3">
							<input name="custinfo.busiscope" id="" class="nui-textarea" style="width:100%;height: 40px;" />
						</td>
						<td align="right" style="width: 100px">
							分支机构：
						</td>
						<td colspan="3">
							<input name="custinfo.suborg" id="" class="nui-textarea" style="width:100%;height: 40px;"/>
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
					<tr>
						<td align="right" style="width: 80px;">是否有效：</td>
						<td align="left">
		            		<input id='status' class="nui-dictcombobox" required="true" name="custinfo.status" dictTypeId="MIS_YN"  showNullItem="true" nullItemText="全部"  style="width: 80px;"/>
					    </td>
					</tr>
				</table>
			</div>
		</div>
	</fieldset>
	<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
		<legend>财务信息</legend>
		<table border="0" cellspacing="1" cellpadding="1" style="width:700px;"><!-- style="border:1px solid #A8A8A8; width:700px;" -->
			<tr>
				<td style="width:120px"></td>
				<td align="center" style="width:160px">去年</td>
				<td align="center" style="width:160px">过去两年</td>
				<td align="center" style="width:160px">过去三年</td>
			</tr>
			<tr>
				<td align="right" style="width:120px">年份:</td>
				<td style="width:160px" align="center"><input name="custinfo.lastyear" id='lastyear' class="nui-textbox"  style="width:120px;" inputStyle="text-align:center;"/></td>
				<td style="width:160px" align="center"><input name="custinfo.twoago" id='twoago' class="nui-textbox"  style="width:120px" inputStyle="text-align:center;"/></td>
				<td style="width:160px" align="center"><input name="custinfo.threeago" id='threeago' class="nui-textbox" style="width:120px" inputStyle="text-align:center;"/></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">营业额(万元):</td>
				<td style="width:160px" align="center"><input name="custinfo.lastyearincome" id="lastyearincome" class="nui-textbox" style="width:120px"/></td>
				<td style="width:160px" align="center"><input name="custinfo.twoagoincome" id="twoagoincome" class="nui-textbox" style="width:120px"/></td>
				<td style="width:160px" align="center"><input name="custinfo.threeagoincome" id="threeagoincome" class="nui-textbox" style="width:120px"/></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">利润总和(万元):</td>
				<td style="width:160px" align="center"><input name="custinfo.lastyearprofit" id="lastyearprofit" class="nui-textbox" style="width:120px"/></td>
				<td style="width:160px" align="center"><input name="custinfo.twoagoprofit" id="twoagoprofit" class="nui-textbox" style="width:120px"/></td>
				<td style="width:160px" align="center"><input name="custinfo.threeagoprofit" id="threeagoprofit" class="nui-textbox" style="width:120px"/></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">上年度固定资产原值:</td>
				<td style="width:160px" align="center"><input name="custinfo.lastproperty" id="lastproperty" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">上年度固定资产净值:</td>
				<td style="width:160px" align="center"><input name="custinfo.lastpropertynet" id="lastpropertynet" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">上年度流动资金:</td>
				<td style="width:160px" align="center"><input name="custinfo.lastfloat" id="lastfloat" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">上年度长期负债:</td>
				<td style="width:160px" align="center"><input name="custinfo.lastlongdebt" id="lastlongdebt" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">上年度短期负债:</td>
				<td style="width:160px" align="center"><input name="custinfo.lastshortdebt" id="lastshortdebt" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">上年净利润:</td>
				<td style="width:160px" align="center"><input name="custinfo.lastnetprofit" id="lastnetprofit" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
			</tr>
		</table>
	</fieldset>
	<fieldset id='field5' style="border:solid 1px #aaa;padding:3px;">
		<legend>公司业务情况</legend>
		<table>
			<tr>
				<td align="right" style="width:120px">公司简介:</td>
				<td><input name="custinfo.compdesc" id="custinfo.compdesc" class="nui-textarea" style="width:550px"/></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">主营产品:</td>
				<td><input name="custinfo.mainprod" id="custinfo.mainprod" class="nui-textarea" style="width:550px"/></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">代理产品:</td>
				<td><input name="custinfo.agentprod" id="custinfo.agentprod" class="nui-textarea" style="width:550px"/></td>
			</tr>
		</table>
	</fieldset>
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		<legend>资质和凭证</legend>
		<table style="table-layout:fixed;" id="table_file3">
			<tr>
				<td align="right" style="width:120px">资质1:</td>
				<td><input name="custinfo.qualify1" id="qualify1" class="nui-textbox" style="width:100%"/></td>
				<td align="right" style="width:120px">资质1有效期:</td>
				<td><input name="custinfo.qualify1exp" id="qualify1exp" class="nui-datepicker" style="width:100%"/></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">资质2:</td>
				<td><input name="custinfo.qualify2" id="qualify2" class="nui-textbox" style="width:100%"/></td>
				<td align="right" style="width:120px">资质2有效期:</td>
				<td><input name="custinfo.qualify2exp" id="qualify2exp" class="nui-datepicker" style="width:100%"/></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">资质3:</td>
				<td><input name="custinfo.qualify3" id="qualify3" class="nui-textbox" style="width:100%"/></td>
				<td align="right" style="width:120px"">资质3有效期:</td>
				<td><input name="custinfo.qualify3exp" id="qualify3exp" class="nui-datepicker" style="width:100%"/></td>
			</tr>
			<tr>
				<td align="right" style="width:120px">资质备注:</td>
				<td colspan="3"><input name="custinfo.qualifycomm" id="qualifycomm" class="nui-textarea" style="width:100%"/></td>
			</tr>
		</table>
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
	            url: "com.primeton.eos.ame_common.curstinfo.custinfoview.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	form.setData(o);
	            	nui.get("groupno").setText(o.custinfo.custname1);
	            	var grid_0 = nui.get("grid_0");
					grid_0.sortBy("fileTime","desc");
	            	grid_0.load({"groupid":"MIS_CUSTINFO","relationid":data});
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
	  	document.getElementById("fileCatalog").value="custinfo";
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
            url: "com.primeton.eos.ame_common.curstinfo.addCustInfo.biz.ext",
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
	
	//点击选择大客户经理时的方法
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
        if (action == "cancel" ) {
            if (!confirm("是否关闭？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    //选择服务客户弹窗
	function selectCustmer(){
		var btnEdit = this;
		nui.open({
			url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
		    title: "选择客户",
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