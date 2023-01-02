<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>

<head>
	<title>评审报告信息 </title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-barcode.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<style type="text/css">
	    <!--body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } -->
	    .base_div{
            text-align: left;
		    font-size: 14px;
		    font-weight: bold;
		    background: #F6F6F6;
		    padding: 8px;
		    border-bottom: 1px solid #999;
        }
        body { 
        	-webkit-print-color-adjust: exact; 
        }
        div
     	{
	         white-space:normal;
	         word-break:break-all;
	         word-wrap:break-word; 
         }

        table tr{
        	height: 28px;
        }
        table, table tr td{
		    font-size: 12px;
        }<d:checkbox/>
    </style>
</head>
<body style="overflow-y: scroll;">
<div title="付费合同打印" style="height: auto;">
    <div id="pipi" class="nui-panel"
         style="font-size: 20px; width: 840px; height: 30px; margin: 0 auto;    text-align: center;"
         align="left"></div>
    <div class="" title="" style="width: 788px;margin: 0 auto;font-size: 14px;border:1px solid #999999;">
        <div class="base_div">评审报告信息</div>
        <form id="form1" method="post">
            <input name="files" id="fileids" class="nui-hidden"/>
            <input name="files1" id="fileids1" class="nui-hidden"/>
            <input class="nui-hidden" name="id"/>
            <div style="padding: 5px;">
                <table style="table-layout: fixed;">
                    <tr>
                        <td align="right" style="width: 140px">评审报告编号：</td>
                        <td colspan="7">
                            <input enabled="false" name="reportName" id="reportName" class="nui-textbox" style="width: 100%" />
                        </td>
                    </tr>
                    <td align="right" style="width:160px">采购立项编号：</td>
                    <td><input enabled="false" name="proappId" id="proappId" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 560px" /></td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 120px">采购计划编号：</td>
                        <td ><input enabled="false" name="planId" id="planId" class="nui-buttonedit" style="width: 560px;"  /> </td>
                    </tr>

                    <tr></tr>
                    <tr></tr>
                    <tr></tr>
                    <tr>
                        <td class="form_label"  align="right" style="width:140px;">评审报告说明：</td>
                        <td id="remark" colspan="5" style="height: 68px;background:#F0F0F0;border:1px solid #A5ACB5"></td>
                    </tr>
                </table>
            </div>
        </form>
        <div title="评审报告附件">
            <jsp:include page="/ame_common/detailFile.jsp" />
        </div>
        <div class="nui-panel" id="d3" title="审批意见列表" style="width: 788px;height: auto;">
            <div id="datagrid4" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
                 url="com.zhonghe.ame.purchase.common.queryPlanApproval.biz.ext"  idField="id" allowResize="true"
                 allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="false">
                <div property="columns">
                    <div type="indexcolumn" align="center" headerAlign="center">序号</div>
                    <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
                    <div field="workitemname" width="120" align="center" headerAlign="center">处理环节</div>
                    <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
                    <div field="auditstatus" renderer="onCheckRenderer" width="60" align="center" headerAlign="center">处理结果</div>
                    <div field="auditopinion" width="20%" headerAlign="center"  align="left">审批意见</div>
                    <div field="time" width="110" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    
    nui.parse();
    var id ;
    init();
    var grid4 = nui.get("datagrid4");
    function init(){
        id = <%= request.getParameter("id") %> ;
        var json = nui.encode({"id":id});
        nui.ajax({
            url: "com.zhonghe.ame.purchase.purchaseReviewReport.queryReviewReport.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (o) {
                console.log(o.reviewReport[0]);
                var result=o.reviewReport[0];
                nui.get("reportName").setValue(result.code);
                nui.get("proappId").setValue(result.proappId);
                nui.get("proappId").setText(result.proAppCode);
                nui.get("planId").setValue(result.planId);
                nui.get("planId").setText(result.purchaseNumber);
                $("#remark").html(result.remark);

                document.getElementById("pipi").innerHTML="【报告名称："+result.reportName+"】";

                var grid_0 = nui.get("grid_0");
                grid_0.load({"groupid":"purReviewReport","relationid":result.id});
                grid_0.sortBy("fileTime","desc");
                var processInstID = result.processid;
                grid4.sortBy("time", "desc");
                grid4.load({processInstID:processInstID});

            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
    }

    function selectProjectList(){
        //var allpurProj = purProjOutper_grid.getData();
        var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
            title: "选择项目",
            width: 850,
            height: 420,
            allowResize: false,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.projectId);
                        btnEdit.setText(data.projectName);
                    }
                }
            }
        });
    }
    
    function selectOmEmployee(){
        var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择报销人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                    }
                }

            }
        });
    }
    
    function selectOmEmployee1(){
        var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择报销人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {

                        btnEdit.setValue(data.userid);

                        btnEdit.setText(data.empname);

                    }
                }

            }
        });
    }

    function onOk(){


        //定义变量接受form表单数据
        var form = new nui.Form("#form1");
        var data = form.getData();


        document.getElementById("fileCatalog").value="purReviewReport";
        /* document.getElementById("fileCatalog1").value="purFile"; */

        <!--form4.submit();-->
        form2.submit();
    }
    
    function SaveData(){

        var form = new nui.Form("#form1");
        var data = form.getData();
        data.files = nui.get("fileids").getValue();
        var json = nui.encode({'reviewReport':data});
        console.log(data);
        if(!confirm("是否提交？")){
            return;
        }else{
            nui.ajax({
                url: "com.zhonghe.ame.purchase.purchaseReviewReport.addReviewReport.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                    console.log(text.result);
                    if(text.result == "1"){
                        nui.alert("提交成功",null,function(){
                            window.CloseOwnerWindow("save");
                        });
                    }else{
                        nui.alert("提交失败",null,function(){
                            window.CloseOwnerWindow("save");
                        });
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
        }
    }
    
    function SaveData1(){
    }

    function onButtonEdit(e) {
        var btnEdit = this;
        mini.open({
            url: "/default/purchase/project/procurementProAppList.jsp",
            title: "采购立项列表",
            width: '73%',
            height: '75%',
            ondestroy: function (action) {
                if (action == "ok") {

                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = mini.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.id);
                        btnEdit.setText(data.proAppCode);

                        nui.get("planId").setValue(data.planId);
                        nui.get("planId").setText(data.purchaseNumber);
                        btnEdit.doValueChanged();

                    }
                }

            }
        });

    }

    function onCancel(e) {
        CloseWindow("cancel");
    }
    
    //标准方法接口定义
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
    
    function preview() {
        document.getElementById('checkview').style.display="none";
        /* window.document.body.innerHTML = document.documentElement.innerHTML; */
        print();
        document.getElementById('checkview').style.display="";
    };

</script>
</body>
</html>
