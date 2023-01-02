<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): huangqj
  - Date: 2015-05-15 16:12:21
  - Description:
-->
<head>
<title>Title</title>
<h:css href="/css/style1/style-custom.css"/>
</head>
<body>
<form name="form1">
  <w:panel id="panel1" width="100%" title="人员数据转移">
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label" colspan="4" style="color: red;">本操作主要处理普元、云动互转的数据，假定原来人员在云动，工号为cc0001，转到普元，新工号1000。那么只需要在原工号中输入cc0001，在新工号中输入1000，点击开始处理，就会将cc0001的银行卡、年假、报销单数据、工时数据全部转移到1000上。</td>
      </tr>
      <tr>
        <td class="form_label">原工号</td>
        <td colspan="1">
          <h:text property="temp/olduserid"/>
        </td>
        <td class="form_label">新工号</td>
        <td colspan="1">
          <h:text property="temp/newuserid"/>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="4" class="form_bottom">
          <input type="button" class="button" value="开始处理" onclick="doEmpDeal();">
        </td>
      </tr>
    </table>
  </w:panel>
</form>
<script>
	function doEmpDeal(){
		var olduserid = $name("temp/olduserid").value;
		var newuserid = $name("temp/newuserid").value;
		if(olduserid == null || olduserid == ""){
			alert("原工号必填！");
			return;
		}
		if(newuserid == null || newuserid == ""){
			alert("新工号必填！");
			return;
		}
		if(confirm("请确认是否将"+olduserid+"的所有报销单数据、银行卡帐户信息、年假信息、工时数据都转移到"+newuserid+"上？")){
			if(confirm("本操作很重要，请再次确认！")){
				var myAjax = new Ajax("com.primeton.eos.common.expQuery.empDeal.biz");
				myAjax.addParam("olduserid", olduserid);
				myAjax.addParam("newuserid", newuserid);
				myAjax.submit();
				var result = myAjax.getValue("root/data/result");
				var wxresult = myAjax.getValue("root/data/wxresult");
				if(result == "-1"){
					alert("原工号对应的人员找不到，请检查！");
					return;
				}else if(result == "-2"){
					alert("新工号已经被别人占了，请检查！");
					return;
				}else{
					if(wxresult){
						alert("数据处理完毕，但微信企业号人员同步失败。失败原因："+wxresult);
					}else{
						alert("数据处理完毕，请检查！");
					}
					return;
				}
			}
		}
	}
</script>
</body>
</html>