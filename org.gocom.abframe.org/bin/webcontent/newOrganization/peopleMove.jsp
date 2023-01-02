<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-30 13:28:47
  - Description:
-->
<head>
<title>人员数据转移</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
</style>
</head>
<body>
<div class="nui-fit">
	<div id='panel1' class='nui-panel' title='提示' style='width: 100%;height: auto;' showToolbar='false' showCollapseButton='true' showFooter='flase' >
		<table>
			<tr>
				<td id='processinfo'>本操作主要处理普元、云动互转的数据，假定原来人员在云动，工号为cc0001，转到普元，新工号1000。那么只需要在原工号中输入cc0001，在新工号中输入1000，点击开始处理，就会将cc0001的银行卡、年假、报销单数据、工时数据全部转移到1000上。</td>
			</tr>
		</table>
	</div>
	<div title="人员数据转移" style="padding: 0;margin: 10px auto;">
	 	<form id="form1" method="post" >
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
					<td align="right" style="width:100px">原工号：</td>
					<td>
						<input class="nui-textbox" id="olduserid" name="olduserid" required="true" style="width:150px"/>
					</td>
					<td align="right"  style="width:100px">新工号：</td>
					<td>
						<input class="nui-textbox" id="newuserid" name="newuserid" required="true" style="width:150px"/>
					</td>
				</tr>
        	</table>
        </form>
  	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="ok()" iconCls="icon-reload"  style="margin-right:20px;">开始转移</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	//保存应用信息
	function ok(){
		var form = new nui.Form("#form1");
		var data = form.getData();
		var olduserid = data.olduserid;
		var newuserid = data.newuserid;
		if(olduserid == null || olduserid =="" || newuserid ==null || newuserid ==""){
			nui.alert("请填写必填项。");
			return;
		}
        if (form.isValid() == false) {
        	nui.alert("请填写必填项。");
        	return;
        }else{
        	save(data);
        }
	}
	
	function save(data){
		nui.confirm("请确认是否将"+data.olduserid+"的所有报销单数据、银行卡帐户信息、年假信息、工时数据都转移到"+data.newuserid+"上？", "确定？",
            function (action) {
                if (action == "ok") {
                    nui.ajax({
						url: "com.primeton.eos.common.expQuery.empDeal.biz.ext",
						type: 'POST',
						data:{olduserid:data.olduserid,newuserid:data.newuserid},
						contentType: 'text/json',
			            success: function (result) {
			            	if(result.result == "-1"){
								nui.alert("原工号对应的人员找不到，请检查！");
								return;
							}else if(result.result == "-2"){
								nui.alert("新工号已经被别人占了，请检查！");
								return;
							}else{
								if(result.wxresult){
									nui.alert("数据处理完毕，但微信企业号人员同步失败。失败原因："+wxresult);
								}else{
									nui.alert("数据处理完毕，请检查！");
								}
								return;
							}
			            }
					})
                } else {
                    return;
                }
            }
        );
	}
</script>
</html>