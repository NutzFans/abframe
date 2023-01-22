<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table style="width:100%;">
	<tr>
		<td align="right" style="width:100px;">招聘职位分类：</td>
		<td align="left" style="width:180px;">
			<input name="omRecruit.recposition" id="recposition"  class="nui-dictcombobox" onvaluechanged="setPositionName" shownullItem="true" allowInput="true" dictTypeId="AME_POSITION_MEMO"  required="true" width="140px"/>
		</td>
		<td align="right" style="width:100px;">招聘职位名称：</td>
		<td align="left" style="width:175px;">
			<input name="omRecruit.recpositionname" id="recpositionname" class="nui-textbox" width="140px" required="true"/>
		</td>
		<td align="right" style="width:100px;">岗位级别：</td>
    	<td align="left" style="width:175px;">    
        	<input name="omRecruit.joblevel" class="nui-dictcombobox"  dictTypeId="AME_TECH" width="140px" required="true"/>
    	</td>
    	<td align="right" style="width:100px;">招聘人数：</td>
		<td align="left" style="width:140px;">
			<input name="omRecruit.recnum" class="nui-spinner"  minValue="1" maxValue="250" required="true" vtype="int" width="140px"/>
		</td>
	</tr>
	<tr>
		<td align="right">工作地点：</td>
    	<td align="left">    
        	<input name="omRecruit.workplace" class="nui-dictcombobox" required="true" multiSelect="true"  dictTypeId="AREA4CLRY" width="140px"/>
    	</td>
		<td align="right">优先级别：</td>
		<td align="left">
			<input name="omRecruit.priority" class="nui-dictcombobox" required="true" dictTypeId="MIS_EMERLEVEL" width="140px" />
		</td>
		<td align="right" >期望入职日期：</td>
		<td align="left" >
			<input name="omRecruit.hopedate" class="nui-datepicker" width="140px"/>
		</td>
		<td align="right">是否采用猎头：</td>
		<td align="left">
			<input name="omRecruit.isheadhunting" class="nui-dictcombobox" required="true" dictTypeId="MIS_YN" width="140px"/>
		</td>
	</tr>
	<tr>
		<td align="right" >员工属性：</td>
    	<td align="left" >    
        	<input name="omRecruit.position" id="position" class="nui-dictcombobox" required="true" dictTypeId="EMP_TYPE" width="140px"/>
    	</td>
    	<td align="right" >人员性质：</td>
		<td align="left" >
			<input name="omRecruit.jobtype" class="nui-dictcombobox" dictTypeId="AME_EMPTYPE2" required="true" width="140px" />
		</td>
		<td align="right">招聘部门：</td>
		<td align="left" >
			<input class="nui-combobox"name="omRecruit.orgid" id="orgid" url="com.primeton.eos.ame_fee.cashflow.getAllOrg.biz.ext" filterType="like" 
			textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" 
			allowInput="true"  required="true" width="140px" >
		</td>
		<td align="right">申请人：</td>
		<td align="left">
			<input name="omRecruit.applyuserid" id="applyuserid"  class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" allowInput="false" width="140px"  required="true"/>
		</td>
	</tr>
	<tr>
		<td align="right">主考官：</td>
		<td align="left">
			<input id="interviewer" class="mini-textboxlist"  name="omRecruit.interviewer" searchField="name"
			url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext" value="" text=""
			textField="EMPNAME" valueField="USERID" required="true" width="140px"/>
		</td>
		<td align="right" id="hctype">HC类型：</td>
		<td align="left" >
			<input name="omRecruit.hctype" id="hctype1" class="nui-dictcombobox" required="true" dictTypeId="RECRUIT_HCTYPE"  width="140px" />
		</td>
		<td align="right" id="isreferrer">是否支持内推：</td>
		<td align="left" >
			<input name="omRecruit.isreferrer" id="isreferrer1" class="nui-dictcombobox" dictTypeId="MIS_YN" required="true" width="140px" onvaluechanged="selectRefferexpmouldno" value='1'/>
		</td>
		<td align="right" id="refferexpmouldnoname">内推奖励模板：</td>
		<td align="left">
			<input name="omRecruit.refferexpmouldno" id="refferexpmouldno" class="nui-buttonedit" onbuttonclick="showRefferexpmouldno" showClose="false" allowInput="false"  width="140px" required="true"  value="1"text="1"/>
		</td>
	</tr>
	<tr>	
	    <td  id="recruitPerson" align="right">招聘专员：</td>
		<td  id="recruitPerson1" align="left">
			<input id="recuserid" class="mini-textboxlist"  name="omRecruit.recuserid" searchField="name"
			url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
			textField="empname" valueField="userid" required="true" width="140px" />
		</td>
	</tr>
	<tr>
		<td align="center"  colspan="4">工作职责描述：</td>
		<td align="center"  colspan="4">职位要求描述：</td>
	<tr>
	<tr>
		<td align="center" colspan="4">    
	    	<input name="omRecruit.workduties" id="workduties" class="nui-textarea" style="width:500px;height:120px"/>
		</td>
    	<td align="center" colspan="4">    
        	<input name="omRecruit.recdesc" id="recdesc" class="nui-textarea" style="width:510px;height:120px;"/>
    	</td>
	</tr>
	<tr>
    	<td align="center" colspan="4">需求背景：</td>
		<td align="center" colspan="4">其他说明：</td>
	<tr>
	<tr>
    	<td align="center" colspan="4">    
        	<input name="omRecruit.recbackground" class="nui-textarea" emptyText="可以补充说明本次招聘面向的项目等背景" style="width:500px;height:40px" maxLength="500">
    	</td>
    	<td align="center" colspan="4">    
        	<input name="omRecruit.remark" class="nui-textarea" style="width:510px;height:40px" maxLength="200">
    	</td>
	</tr>
</table>
<script type="text/javascript">
	function selectRefferexpmouldno(e){
		      if(e.value == 1){
		          document.getElementById("refferexpmouldnoname").style.display="";
		          document.getElementById("refferexpmouldno").style.display="";  
		          nui.get("refferexpmouldno").setValue(1);
		          nui.get("refferexpmouldno").setText(1);
		      }else{
		          document.getElementById("refferexpmouldnoname").style.display="none";
		          document.getElementById("refferexpmouldno").style.display="none"; 
		          nui.get("refferexpmouldno").setValue(null);
		          nui.get("refferexpmouldno").setText(null);
		      }
	}
	function showRefferexpmouldno(){
		    var btnEdit = this;
		    nui.open({
				url:"<%=request.getContextPath() %>/abframe/org/recruit/SelectrefferExpMould.jsp",
				title: "选择内推费用管理模板",
				width: 800,
				height: 400,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);  
						btnEdit.setValue(data.refferexpmouldno); 
						btnEdit.setText(data.refferexpmouldno);
					}
				}
			})
	}
</script>	