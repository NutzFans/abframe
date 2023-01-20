// 选择人员弹窗 单选
function selectOmEmployee(){
	var btnEdit = this;
    nui.open({
        url:contextPath+"/machine/SelectEmployee.jsp",
        title: "选择主持人",
        width: 650,
        height: 380,
        ondestroy: function (action) {
            if (action == "ok") {
                var iframe = this.getIFrameEl();
                var data = iframe.contentWindow.GetData();
                data = nui.clone(data);    //必须
                if (data) {
                    if(nui.getbyName("hysq.zcrid")) {nui.getbyName("hysq.zcrid").setText(data.empname);nui.getbyName("hysq.zcrid").setValue(data.userid);}
                }
            }

        }
    });
}

// 选择人员弹窗 多选
function selectOmEmployee_project(){
	var btnEdit = this;
    nui.open({
        url:contextPath+"/machine/selectOmEmployee_project.jsp",
        title: "选择参会人员",
        width: 650,
        height: 380,
        ondestroy: function (action) {
            if (action == "ok") {
                var iframe = this.getIFrameEl();
                var data = iframe.contentWindow.GetData();
                data = nui.clone(data);    //必须
                if (data) {
                	var sChr=nui.getbyName("hysq.chryid").text;
                	var sChrId=nui.getbyName("hysq.chryid").value;
                    for(var i=0;i<data.length;i++){
                    	var oData=data[i];
                    	if(sChr.indexOf(oData.empname) == -1){
                    		sChr+=oData.empname+";";
                        	sChrId+=oData.empid+";";
                    	}
                    }
                    if(nui.getbyName("hysq.chryid")) {nui.getbyName("hysq.chryid").setText(sChr);nui.getbyName("hysq.chryid").setValue(sChrId);}
                }
            }

        }
    });
}
