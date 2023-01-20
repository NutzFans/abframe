<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-09-05 11:27:25
  - Description:
-->
<head>
<title>客户信息</title>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
	.asLabel
    {
        border:0;background-color:#F5F5F5;cursor:default;    
    }
</style>
</head>
<body>
<div class="nui-fit">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>客户基本资料</legend>
		<div style="padding:5px;">
			<div id="formcust">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width: 130px">
							客户名称：
						</td>
						<td  id="custname" class = "asLabel"  style="font-weight: 700;width: 260px"></td>
						
						<td align="right" style="width: 130px;">客户类型：</td>
						<!-- <td >
		            		<input id='status' class="asLabel" required="true" name="custinfo.customertype" dictTypeId="ZH_KHLX"  showNullItem="true" nullItemText=""  style="width: 168px;"/>
					    </td> -->
					    <td  id="customertype" class = "asLabel"  style="font-weight: 700;width: 260px"></td>
					    
					    
					    <td align="right" style="width: 130px">
							公司网址：
						</td>
						<td id='website'  style="width: 260px" class = "asLabel"></td>
						
					</tr>
					<tr>
						<td align="right" style="width: 130px">
							联系电话：
						</td>
						<td  id="telephone" class = "asLabel"  style="font-weight: 700;width: 260px"></td>
						
						<td align="right" style="width: 130px;">传真：</td>
						<!-- <td >
		            		<input id='status' class="asLabel" required="true" name="custinfo.customertype" dictTypeId="ZH_KHLX"  showNullItem="true" nullItemText=""  style="width: 168px;"/>
					    </td> -->
					    <td  id="fax" class = "asLabel"  style="font-weight: 700;width: 260px"></td>
					    
					    
					    <td align="right" style="width: 130px">
							统一服务电话：
						</td>
						<td id='servphone'  style="width: 260px" class = "asLabel"></td>
						
					</tr>
					</tr>
					<tr>
						<td align="right" style="width: 130px">
							联系地址：
						</td>
						<td colspan="5"  id='address' class = "asLabel">
						</td>
					</tr>
					
					<tr>
						<td align="right" style="width: 130px">
							经营范围：
						</td>
						<td colspan="3"  style="height: 40px"id='busiscope' class = "asLabel">
						</td>
						
						<td align="right" style="width: 130px">
							联系人
						</td>
						<td id='contacts' class = "asLabel" >
						</td>
						
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							备注：
						</td>
						<td id='comments' colspan="5" style="height: 40px"  class = "asLabel"></td>
					</tr>
					
				</table>
			</div>
		</div>
	</fieldset>
	<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:auto;height:100%">
	    <div title="相关附件">
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</div>
	</div>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
<script type="text/javascript">
	nui.parse();
	var custid = '<%=request.getParameter("custid") %>';
	var datagrid6 = nui.get("datagrid6");
	var datagrid4 = nui.get("datagrid4");
	var datagrid5 = nui.get("datagrid5");
	var projectGrid = nui.get("project—grid");//项目查询
	var groupid = 'MIS_CUSTINFO';
	var isCommerce = false; //商务
	var isFinance = false;//财务
	var isPMO = false;//PMO
	init();
	SetData(custid);
	
	function init(){
		<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
			var roleid = "<b:write iterateId='roles' property='roleid'/>";
			if(roleid == "commerce"){
				isCommerce = true;
			}
			if(roleid == 'finance'){
				isFinance = true;
			}
			if(roleid == 'PMO'){
				isPMO = true;
			}
		</l:iterate>
		/* if(isCommerce == false&&isFinance == false&&isPMO == false){//不是商务不是财务不是PMO，不能查看合同金额及合同链接
			datagrid6.hideColumn("prodmon");
			datagrid6.hideColumn("servmon");
			datagrid6.hideColumn("contsum");
		} */
	}
	
	//页面进入时调用的方法
    function SetData(data) {
		var json = nui.encode({custid:data});
		//客户基本信息
        nui.ajax({
            url: "com.primeton.eos.ame_common.curstinfo.custinfoview.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	var o = o.custinfo;
            	//nui.get("grid_001").load({"groupid":groupid,"relationid":o.custid});
            	document.getElementById("custname").innerHTML = o.custname== null ? "":o.custname;  
            	document.getElementById("customertype").innerHTML = nui.getDictText('ZH_GROUP',o.customertype); 
            	/* document.getElementById("status").innerHTML = nui.getDictText('MIS_YN',o.status); */
            	document.getElementById("address").innerHTML = o.address == null ? "":o.address;
            	/* document.getElementById("custnum").innerHTML = o.custnum == null ? "":o.custnum; */
            	document.getElementById("telephone").innerHTML = o.telephone == null?"":o.telephone;
            	document.getElementById("fax").innerHTML = o.servphone == null?"":o.servphone;
            	document.getElementById("servphone").innerHTML = o.servphone == null?"":o.servphone;
            	document.getElementById("website").innerHTML = o.website == null?"":o.website;
            	document.getElementById("comments").innerHTML = o.comments == null?"":o.comments;
            	document.getElementById("contacts").innerHTML = o.contacts == null?"":o.contacts;
            	document.getElementById("busiscope").innerHTML = o.busiscope == null?"":o.busiscope;
            	//附件查询
				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"MIS_CUSTINFO","relationid":o.custid});
				grid_0.sortBy("fileTime","desc");
            }
        });
       /*  //客户对应项目
        var projectJson =  {"criteria":{"_expr":[{"_value":custid,"_property":"custid","_op":"="}]}};
        projectGrid.load(projectJson);
        //客户对应合同
        datagrid6.load({custid:data});
        datagrid6.sortBy("contreg", "desc");//asc
        //客户对应联系人
        datagrid4.load({custid:data});
        //客户对应系统
        datagrid5.load({custid:data}); */
    }
    
    function onTitleRenderer(e) {
    	if(isCommerce == true||isFinance == true||isPMO == true){//不是商务不是财务不是PMO，不能查看合同金额及合同链接
    		return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}else{
			return e.value;
		}
	}
	function doView(){
		var grid = nui.get("datagrid6"); 
		var selectRow = grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条合同数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
		window.open(executeUrl, "合同查看", "fullscreen=1");
	}
    //关闭窗口
	function onCancel(e) {
        window.close();
    }
    //客户类型业务字典
	function custtype(e){
		return nui.getDictText('MIS_INDUSTRY',e.value);
	}
	//性别业务字典
	function gender(e){
		return nui.getDictText('gender',e.value);
	}
	//项目当前阶段业务字典
	function mis_phase(e){
		return nui.getDictText('MIS_PHASE',e.value);
	}
	//系统上线业务字典
	function mis_developphase(e){
		return nui.getDictText('MIS_DEVELOPPHASE',e.value);
	}
	//目前版本业务字典
	function MIS_YN(e){
		return nui.getDictText('MIS_YN',e.value);
	}
	//合同类型业务字典
	function MIS_CONTRACTTYPE(e){
		return nui.getDictText('MIS_CONTRACTTYPE',e.value);
	}
	//服务模块业务字典
	function CS_SERVMODULE(e){
		return nui.getDictText('CS_SERVMODULE',e.value);
	}
	//服务期限业务字典
	function CS_SERVTERM(e){
		return nui.getDictText('CS_SERVTERM',e.value);
	}
	//使用版本业务字典
	function CS_PRODUCTSERIES(e){
		return nui.getDictText('CS_PRODUCTSERIES',e.value);
	}
	function onGenderRenderer(e) {
        return nui.getDictText('CONT_ORG',e.value);
    }
    function onGender1Renderer(e) {
        return nui.getDictText('CS_CONTRACTTYPE',e.value);
    }
    //项目名称添加跳转
    function getProjectNameDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkProjectName();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    
    //查询项目详情
    function checkProjectName(){
    	var selectRow = projectGrid.getSelected();
		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
		window.open(executeUrl);
    }
    
    //项目类型业务字典
    function dictGetType(e){
			return nui.getDictText('PROJECT_TYPE',e.value);
	}
	
	//项目内部状态业务字典
	function dictGetStatus(e){
		return nui.getDictText('MIS_PROJSTATUS',e.value);
	}
	
	//项目外部状态业务字典
	function dictGetOutStatus(e){
		return nui.getDictText('MIS_PROJOUTSTATUS',e.value);
	}
	
	//预算状态
	function dictIspassbud(e){
		return nui.getDictText('AME_ISPASSBUD',e.value);
	}
	
	//合计
	function drawContarctSum(e){
		if (e.field == "prodmon" || e.field == "servmon"|| e.field == "contsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
</script>
</html>