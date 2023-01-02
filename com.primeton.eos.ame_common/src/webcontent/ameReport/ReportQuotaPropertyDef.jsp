<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-07-09
  - Description:
-->
<head>
<title>报表属性定义</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
</style>
</head>
<body>
<div class="nui-fit">
   <div title="报表属性定义" style="padding: 30px 0;">
	 	<form id="form1" method="post" >
	 	    <input class="nui-hidden" id="reportcode" name="reportquota.reportcode"/>
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
	                <td align="right" style="width:120px">指标编码：</td>
					<td>
						<input name="reportquota.reportquotacode" class="nui-textbox" id="reportquotacode" required="true"style="width:200px" readOnly="true" onvaluechanged="judgeReportquotacode(e)"/>
					</td>
					<td align="right" style="width:120px">指标名称：</td>
					<td>
						<input name="reportquota.reportquotaname" id="reportquotaname" class="nui-textbox" required="true" style="width:200px"/>
					</td>
				</tr>
				<tr>
				    <td align="right" style="width:120px">指标序列：</td>
					<td >
						<input name="reportquota.quotaseq" id="quotaseq" class="nui-textbox"  readOnly="true"style="width:200px"/>
					</td>
					<td align="right" style="width:120px">父指标序列：</td>
					<td>
						<input name="reportquota.parentquotacode" class="nui-textbox" id="parentquotacode"  readOnly="true" style="width:200px" />
					</td>
				</tr>
				<tr>
				    <td align="right" style="width:120px">取数方式：</td>
					<td>
						<input name="reportquota.quotaaccesstype" id="quotaaccesstype" class="nui-dictcombobox" dictTypeId="QUOTA_ACCESSTYPE"  onvaluechanged="QuotaAccesstype(e)" showNullItem="true" style="width:200px"/>
					</td>
					<td align="right" style="width:120px">单位：</td>
					<td >
						<input name="reportquota.quotaunit" id="quotaunit" class="nui-dictcombobox" dictTypeId="QUOTA_UNIT" style="width:200px"showNullItem="true" />
				    </td>
				</tr>
				<tr>
					<td align="right" style="width:120px">计算规则：</td>
					<td colspan="3">
						<input name="reportquota.computerule"  id="computerule" class="nui-textarea" style="width:530px;height:60px" />
					</td>
				</tr>
				<tr>
				    <td align="right" style="width:120px">显示规则：</td>
					<td >
						<input name="reportquota.showrule" id="showrule" class="nui-dictcombobox" dictTypeId="REPORT_SHOWRULE" showNullItem="true" style="width:200px" onvaluechanged="judgeshowrule(e)"/>
					</td>
				    <td align="right" style="width:120px">排序：</td>
					<td >
						<input name="reportquota.quotasort" id="quotasort" class="nui-textbox" style="width:200px" />
				    </td>
				</tr>
				<tr>
				    <td align="right" style="width:120px">小数位：</td>
					<td >
						<input name="reportquota.smallnumber" id="smallnumber" class="nui-textbox" style="width:200px" />
				    </td>
				    <td align="right" style="width:120px">是否显示：</td>
					<td >
						<input name="reportquota.isshow" id="isshow"class="nui-dictcombobox" dictTypeId="MIS_YN"  style="width:200px" value="1"/>
				    </td>
				</tr>
				<tr>
					<td align="right" style="width:120px">备注：</td>
					<td colspan="3">
						<input class="nui-textbox" name="reportquota.quotaremark" id ="quotaremark" style="width:530px"/>
					</td>
				</tr>
        	</table>
        </form>
    </div>    
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="ok()" iconCls="icon-ok"  style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button closeBtn" onclick="onCancel('cancel')" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
	var form = new nui.Form("form1");
	form.setChanged(false);
	var quotaseq = '<%=request.getParameter("quotaseq") %>';
	var reportcode = '<%=request.getParameter("reportcode") %>';
	var parentquotacode = '<%=request.getParameter("parentquotacode") %>';
	var isFlag = '<%=request.getParameter("isFlag") %>';
	if(quotaseq != null && quotaseq != 'null'){
		$(".closeBtn").hide();
	}else{
	    nui.get("reportquotacode").setReadOnly(false); 
	    nui.get("quotaseq").setReadOnly(true);
	    nui.get("parentquotacode").setReadOnly(true);
	}
	setData();
	function setData(){
	    if(parentquotacode != null && parentquotacode != 'null'){
	         nui.get("reportcode").setValue(reportcode);
	         nui.get("parentquotacode").setValue(parentquotacode);
	        /*  if(isFlag == 1){
			   nui.get("quotaaccesstype").setReadOnly(true);
			   nui.get("computerule").setRequired(false);
		       nui.get("computerule").setReadOnly(true); 
		       nui.get("showrule").setReadOnly(true); 
		       nui.get("smallnumber").setReadOnly(true); 
	         } */
	    }else{
	        nui.get("quotaaccesstype").setRequired(true);
			var json = {quotaseq:quotaseq};
			nui.ajax({
				url: "com.primeton.eos.ame_common.ameReport.queryReportQuotaDetail.biz.ext",
	            type: "post",
	            data: json,
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	                 form.setData(text);
	                 if(text.reportquota.quotaaccesstype == '2'){
				       nui.get("computerule").setRequired(true); 
				       nui.get("computerule").setReadOnly(false); 
				     }else if(text.reportquota.quotaaccesstype == '1'){
				       nui.get("computerule").setRequired(false);
				       nui.get("computerule").setReadOnly(true); 
				       nui.get("showrule").setReadOnly(true); 
				       nui.get("smallnumber").setReadOnly(true); 
				     }else{
				       nui.get("quotaaccesstype").setRequired(false); 
				       nui.get("quotaaccesstype").setReadOnly(true);
				       nui.get("computerule").setReadOnly(true); 
				       nui.get("showrule").setReadOnly(true); 
				       nui.get("smallnumber").setReadOnly(true);
				     }
	            }
			});
		}
	}
	//保存应用信息
	function ok(){
	    if (!form.isChanged()) {
	        nui.alert("数据未修改，无需保存");
	        return;
        }
	    var quotaaccesstype = nui.get("quotaaccesstype").getValue();
	    if(quotaaccesstype == null  || quotaaccesstype == ''){
	       nui.get("computerule").setValue('');
		   nui.get("showrule").setValue('');
		   nui.get("smallnumber").setValue('');
	    }
		var reportquota = form.getData();
		if(quotaseq != null && quotaseq != 'null'){
		    var url = 'com.primeton.eos.ame_common.ameReport.updateReportQuota.biz.ext';
		    var maskmessage = '正在编辑报表指标，请稍等...';
		    var message = '修改失败。请检查相关字段信息';
		    var message1 = '修改成功。';
		}else{
		    var url = 'com.primeton.eos.ame_common.ameReport.addReportQuota.biz.ext';
		    var maskmessage = '正在新增报表指标，请稍等...';
		    var message = '新增失败。请检查相关字段信息';
		    var message1 = '新增成功。';
		}
		form.validate();
        if (form.isValid()==false) {
        	nui.alert("请填写必填项。")
        	return;
        }else{
			var json = nui.encode({"reportquota":reportquota.reportquota});
		    form.mask(maskmessage);
	    	nui.ajax({
	    			url: url,
	    			data: json,
	    			type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
	    			    form.unmask();
	    			    if(text.result == "1"){
	            			nui.alert(message);
	            		}else{
	            		    if(quotaseq == null || quotaseq == 'null'){
							   nui.alert(message1,"操作提示",function (action){
				                    if(action == "ok"){
				                       CloseWindow("ok");
				                    }
	                           })
							}else{
							   nui.alert(message1);
							   parent.search();
	            		       parent.tabs.loadTab("<%=request.getContextPath() %>/ame_common/ameReport/ReportQuotaPropertyDef.jsp?quotaseq="+reportquota.reportquota.quotaseq,parent.tabs.tabs[2]);
							}
	            		}
	    			}
	    	});
        }
	}
	function onCancel(e) {
    	var data = form.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action == "yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
		}
    }
    function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	function QuotaAccesstype(e){
	    if(e.value == '2'){
	      nui.get("computerule").setRequired(true); 
	      nui.get("computerule").setReadOnly(false); 
	      nui.get("showrule").setRequired(true);
	      nui.get("showrule").setReadOnly(false); 
	      nui.get("smallnumber").setRequired(false);
	      nui.get("smallnumber").setReadOnly(false); 
	    }else{
	      nui.get("computerule").setValue('');
	      nui.get("computerule").setRequired(false);
	      nui.get("computerule").setReadOnly(true); 
	      nui.get("showrule").setValue('');
	      nui.get("showrule").setRequired(false);
	      nui.get("showrule").setReadOnly(true); 
	      nui.get("smallnumber").setValue('');
	      nui.get("smallnumber").setReadOnly(true);
	    }
	}
	function judgeshowrule(e){
	  var showrule = e.value;
	  if(e.value == '2' || e.value == '3'){
	      nui.get("smallnumber").setRequired(true); 
	  }else{
	      nui.get("smallnumber").setRequired(false); 
	  }
	}
	function judgeReportquotacode(e){
	    var isjudge = 1;
	    var ishave = 0;
	    var reportquotacode = e.value;
		var json = {"reportcode":reportcode,"reportquotacode":reportquotacode,"isjudge":isjudge};
		nui.ajax({
				url: "com.primeton.eos.ame_common.ameReport.queryReportQuotaDetail.biz.ext",
				type: 'POST',
				data:json,
				async: false,
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.reportquota.reportquotacode){
		    			ishave = 1;
		    		}
	            }
	     });
	     if(ishave == 1){
			nui.alert("您输入的报表编码已存在，请重新填写！");
			nui.get("reportquotacode").setValue('');
			return;
    	 }
	}
  </script>
</html>