<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2017-01-06 10:09:19
  - Description:
-->
<head>
	<title>外包人员项目变更</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post">
			<input name="purOutperson.outperno" id="outperno" class="nui-hidden" />
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包人员基本信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" width="100px">姓名：</td>
							<td id="outpername" style="width:100px"></td>
							<td align="right" style="width:100px;">身份证号码：</td>
							<td id="outpercartno" style="width:170px"></td>
							<td align="right" style="width:100px;">性别：</td>
							<td id="gender" style="width:100px"></td>
							<td align="right" style="width:100px;">学历：</td>
							<td id="degree" style="width:100px"></td>
						</tr>
						<tr><td align="right" style="width:100px;">毕业时间：</td>
							<td id="gradudate" style="width:100px"></td>
							<td align="right" style="width:100px;">联系电话：</td>
							<td id="linktel"style="width:170px" ></td>
							<td align="right" style="width:100px;">供应商：</td>
							<td colspan="3" id="custid" style="width:340px"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">联系邮箱：</td>
							<td colspan="3" id="linkemail" style="width:308px"></td>
							<td align="right" style="width:100px;">备注：</td>
							<td colspan="3" id="memo" style="width:340px;height: 22px;"></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<!-- 外包人员归属项目列表 -->
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>参与的项目列表</legend>
			<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                    	<a class="nui-button" id="adjustProject" iconCls="icon-edit" onclick="adjustProject()">调整项目</a>
		                    	<a class="nui-button" id="addNewProject" iconCls="icon-add" onclick="addNewProject()">增加新服务项目</a>
		                    	<a class="nui-button" id="adjustInputratio" iconCls="icon-edit" onclick="adjustInputratio()">调整投入比重</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
			<div id="purProjOutper_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="purProjOutper" 
				 showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
				 url="com.primeton.eos.ame_pur.outperson.queryProjByReport.biz.ext" showFooter="false" 
				 onselectionchanged="selectionChanged">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="projoutid" align="center" headerAlign="center" visible="false">编号</div>
					<div field="custid1" align="center" headerAlign="center" visible="false">服务客户编号</div>
					<div field="projectname" width="200" align="left" headerAlign="center" >服务项目
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
					<div field="custname" width="auto" align="left" headerAlign="center">服务客户
						<input property="editor" class="nui-textbox" readonly="readonly"/>
					</div>
					<div field="startdate" width="80" align="center" renderer="onDealDate" headerAlign="center">服务开始日期</div>
					<div field="expenddate" width="80" align="center" renderer="onDealDate" headerAlign="center">预计结束日期</div>
					<div field="actenddate" width="80" align="center" dateFormat="yyyy-MM-dd" headerAlign="center">实际结束日期</div>
					<div field="currentstatus" width="90" align="center" headerAlign="center" renderer="dictGetStatus">服务状态</div>
					<div field="inputratio" width="60" align="center" headerAlign="center">投入比重</div>
					<div field="manager" width="80" align="center" headerAlign="center" displayField="managername">汇报对象</div>
				</div>
			</div>
		</fieldset>
	</div>
	
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<!-- <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a> -->
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	
	<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
	  	var purProjOutper_grid = nui.get("purProjOutper_grid");
	  	var suppliersname = "";
	  	/* //昨天的时间
		var day1 = new Date();
		day1.setFullYear(2017,0,1);
		day1.setTime(day1.getTime()-24*60*60*1000);
		var s1 = day1.getFullYear()+"-" + (day1.getMonth()+1) + "-" + day1.getDate();
		alert(s1); */
		//当选择列时
        function selectionChanged(){
            var rows = purProjOutper_grid.getSelecteds();
            if(rows.length>1){ 
                nui.get("adjustProject").disable();
                nui.get("addNewProject").disable();
            }else{
                nui.get("adjustProject").enable();
                nui.get("addNewProject").enable();
            }
        }
		/* init();
    	function init(){
    	} */
    	
	    function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "editProjectChange"){
		    	var json = nui.encode({purOutperson: {outperno: data.outperno}});
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_pur.outperson.getPurOutpersonDetail.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                	//加载附件设置参数
	                    form.setData(o);
	                    document.getElementById("outpername").innerHTML= o.purOutperson.outpername == null ? "" : o.purOutperson.outpername;
	                    document.getElementById("outpercartno").innerHTML= o.purOutperson.outpercartno == null ? "" : o.purOutperson.outpercartno;
	                    document.getElementById("gender").innerHTML= o.purOutperson.gender == null ? "" : nui.getDictText("ABF_GENDER",o.purOutperson.gender);
	                    document.getElementById("degree").innerHTML= o.purOutperson.degree == null ? "" : nui.getDictText("DEGREE",o.purOutperson.degree);
	                    document.getElementById("gradudate").innerHTML= o.purOutperson.gradudate == null ? "" : o.purOutperson.gradudate;
	                    document.getElementById("linktel").innerHTML= o.purOutperson.linktel == null ? "" : o.purOutperson.linktel;
	                    document.getElementById("custid").innerHTML= o.purOutperson.ryzjglcustname == null ? "" : o.purOutperson.ryzjglcustname;
	                    document.getElementById("linkemail").innerHTML= o.purOutperson.linkemail == null ? "" : o.purOutperson.linkemail;
	                    document.getElementById("memo").innerHTML= o.purOutperson.memo == null ? "" : o.purOutperson.memo;
	                    suppliersname = o.purOutperson.ryzjglsuppliersname;
	                    form.isChanged(false);
	                	//编辑时,加载外包人员归属项目列表
	                	var outperno = nui.get("outperno").getValue();
	                	purProjOutper_grid.sortBy("startdate","desc");
	                	purProjOutper_grid.load({purOutperson: {outperno: outperno,"iden": "changeProject"}},function(){
	                		//修改前的数据
	                		updateBeforeData = purProjOutper_grid.getData();
	                		updateBeforeData = nui.clone(updateBeforeData);
	                	});
	                	
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}
    	}
    	
    	//设置业务字典值-人员状态
		function dictGetStatus(e){
			return nui.getDictText('AME_OUTPERSTATUS',e.value);
		}
		
		//人员订单关系表，计算单位
		function dictOutperType(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
		}
		
		
		/**
		 *	调整项目
		 */
		function adjustProject(){
			var outperno = nui.get("outperno").getValue();
			var outpername = document.getElementById("outpername").innerHTML;
			var row = purProjOutper_grid.getSelected();
    		if (row) {
	      		nui.open({
		            url: "<%=request.getContextPath() %>/ame_pur/outperson/adjustProject.jsp",
		            title: "调整项目",
		            width: 700,
		            height: 420,
		            onload: function () {
						var iframe = this.getIFrameEl();
						var data = {"action": "adjustProject","projoutid": row.projoutid,"projectname": row.projectname,
							"custname": row.custname,"expenddate": row.expenddate,"startdate": row.startdate,
							"outperno": outperno,"outpername": outpername,"suppliersname": suppliersname};
						iframe.contentWindow.SetData(data);
					},
					ondestroy: function (action) {
						if(action=="ok"){
							purProjOutper_grid.reload();
		                }
					}
				});
			} else {
				nui.alert("请选中一条记录","提示");
			}
		}
		
		/**
		 *	增加新服务项目
		 */
		function addNewProject(){
			var outperno = nui.get("outperno").getValue();
			var outpername = document.getElementById("outpername").innerHTML;
			var row = purProjOutper_grid.getSelected();
			var dataRow = purProjOutper_grid.getData().length;
			if(dataRow == 0){
				nui.open({
		            url: "<%=request.getContextPath() %>/ame_pur/outperson/addNewProject.jsp",
		            title: "增加新服务项目",
		            width: 700,
		            height: 420,
		            onload: function () {
						var iframe = this.getIFrameEl();
						var data = {"action": "addNewProject",
							"outperno": outperno,"outpername": outpername,"suppliersname": suppliersname,"dataRow": 0};
						iframe.contentWindow.SetData(data);
					},
					ondestroy: function (action) {
						if(action=="ok"){
							purProjOutper_grid.reload();
		                }
					}
				});
			}else{
	    		if (row) {
		      		nui.open({
			            url: "<%=request.getContextPath() %>/ame_pur/outperson/addNewProject.jsp",
			            title: "增加新服务项目",
			            width: 700,
			            height: 420,
			            onload: function () {
							var iframe = this.getIFrameEl();
							var data = {"action": "addNewProject","projoutid": row.projoutid,"projectname": row.projectname,
								"custname": row.custname,"expenddate": row.expenddate,"inputratio": row.inputratio,
								"startdate": row.startdate,"expenddate": row.expenddate,"outperno": outperno,
								"outpername": outpername,"suppliersname": suppliersname};
							iframe.contentWindow.SetData(data);
						},
						ondestroy: function (action) {
							if(action=="ok"){
								purProjOutper_grid.reload();
			                }
						}
					});
				} else {
					nui.alert("请选中一条记录","提示");
				}
			}
		}
		
		/**
		 *	调整投入比重
		 */
		function adjustInputratio(){
			var outperno = nui.get("outperno").getValue();
			var outpername = document.getElementById("outpername").innerHTML;
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_pur/outperson/adjustInputratio.jsp",
	            title: "调整投入比重",
	            width: 900,
	            height: 420,
	            onload: function () {
					var iframe = this.getIFrameEl();
					var data = {"action": "adjustInputratio","outperno": outperno,"outpername": outpername,
						"suppliersname": suppliersname};
					iframe.contentWindow.SetData(data);
				},
				ondestroy: function (action) {
					if(action=="ok"){
						purProjOutper_grid.reload();
	                }
				}
			});
		}
		
		function onCancel(e) {
        	var rows = purProjOutper_grid.getChanges();
        	if(rows.length > 0){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
        
        //标准方法接口定义
        function CloseWindow(action) {
        	var rows = purProjOutper_grid.getChanges();
            if (action == "close" && rows.length > 0) {
            	if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
	</script>
</body>
</html>