//选择服务客户弹窗
function selectCustmer(){
	var btnEdit = this;
	nui.open({
		url:url+"/contract/contract/MisCustinfo_lookup.jsp",
	    title: "选择服务客户",
	    width: 650,
	    height: 380,
	    ondestroy: function (action) {
	        if (action == "ok") {
	            var iframe = this.getIFrameEl();
	            var data = iframe.contentWindow.GetData();
	            data = nui.clone(data);    //必须
	            if (data) {
	            	//改动(王林琼)
	                //btnEdit.setValue(data.custid);
	            	nui.get("custid").setValue(data.id);
	                btnEdit.setValue(data.text);
	                btnEdit.setText(data.text);
	            }
	        }
	    }
	    });
}

//选择所属集团客户
function selectGroupCustmer(){
	var btnEdit = this;
	nui.open({
		url:url+"/contract/contract/MisCustinfo_lookup.jsp",
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

function changeCustName(){
	var custname2 = nui.get("custname2").getValue();
	if(custname2==null || custname2==""){
		return;
	}
    nui.get("custid").setValue(null);
	nui.get("custname1").setValue(custname2);
	nui.get("custname1").setText(custname2);
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