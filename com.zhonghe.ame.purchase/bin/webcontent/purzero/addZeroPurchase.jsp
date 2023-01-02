<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>新增零星采购</title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
<div class="nui-fit" >
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 98%;">
				<legend>零星采购信息</legend>
				<form id="form1" method="post">
					<div style="padding: 5px; margin-left:5%;">
				<table style="table-layout: fixed;" id="table_file">
            	<tr>
            		<td width="120px" class="form_label" align="right">零星采购名称：</td>
	                <td >
	                    <input id="purchaseName" name="purchaseName" class="nui-textbox" required="true" style="width: 200px"/>
	                </td>
	                <td width="120px"  class="form_label" align="right">部门负责人：</td>
					<td >
						<input name="manager" id="manager"  class="nui-buttonedit" allowInput="false" emptyText="请点击...选择"
							onbuttonclick="selectManager" style="width: 200px" required="true"/>
						<input name="managerName" id="managerName"  class="nui-hidden"/>
							
					</td>
	                <td width="120px" class="form_label leader" align="right" style="display:none">分管领导：</td>
	                <td >
	                    <input name="leader" id="leader"  class="nui-buttonedit leader" allowInput="false" emptyText="请点击...选择"
							onbuttonclick="selectLeader" style="width: 200px;display:none" required="true"/>
						<input name="leaderName" id="leaderName"  class="nui-hidden" />
	                </td>
            	</tr>
            	<tr>
            		<td  width="120px" class="form_label" align="right">编号：</td>
	                <td >
	                    <input id="purchaseCode" name="purchaseCode" class="nui-textbox" emptyText="系统自动生成" readonly="readonly"style="width: 200px"/>
	                </td>
	                <td  width="120px" c class="form_label" align="right">总金额(万元)：</td>
	                <td >
						<input name="totalAmount" id="totalAmount"  style="width: 200px" class="nui-textbox" readonly="readonly"/>
	                </td>
	                <td width="100px" class="form_label" align="right">采购单位：</td>
                    <td >
                    	<input name="orgId" id="orgId" class="nui-combobox" required="true" 
								url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
								filterType="like" textField="orgname" valueField="orgid" value="<%=userOrgId %>"
								dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:240px;" readonly="readonly" />    
                    </td>
	                
            	</tr>
            	<tr>
            		<td class="form_label" align="right">申请原因：</td>
	                 <td  colspan="7">    
                        <input style="width:100%;height: 40px;" name="applyReason" class="nui-textarea" id="remark"  required="true"/>
                    </td>
            	</tr>
            </table>
        </div>
        </form>
     <fieldset  style="height:100%; border:solid 1px #aaa;width: 95%; ">
     		<a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a> 
          	<a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a> 
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="changeValueon">
	            <div property="columns">
	                <div field="itemName"  width="130" align="center" headerAlign="center"  vtype="required">采购物项名称
							<input name="itemName" property="editor"  class="nui-textbox"  width="100%"/>
	                </div>
	               <div  field="brandSpec" width="130" align="center" headerAlign="center"  >品牌/型号/规格
							<input  name="brandSpec" property="editor"  class="nui-textbox"   width="100%"/>
	                </div>
	                <div   field="unit"  width="80" align="center" headerAlign="center"  >单位
							<input  name="unit" property="editor"  class="nui-textbox" style="width:100%;" />
	                </div>
	                <div  field="onePrice" align="center" headerAlign="center"  vtype="float" >
	                		<h4 style="color:red">单价(万元)</h4>
							<input name="onePrice" property="editor"  class="nui-textbox" width="100%"/>
	                </div>
	                <div  field="num" align="center" headerAlign="center"   vtype="required">数量
							<input  name="num" property="editor"  class="nui-spinner" minValue="0"  maxValue="999999999"  width="100%"/>
	                </div>
	                <div   field="totalPrice" width="130" align="center" headerAlign="center"  >
	                		<h4 style="color:red">总价(万元)</h4>
							<input name="totalPrice" property="editor"  class="nui-textbox"  readonly="readonly" width="100%"/>
	                </div>
	                <!-- <div  field="plansimplementtime"  width="130" align="center" headerAlign="center"  >拟实施时间
							<input id="plansimplementtime" name="plansimplementtime" property="editor"  class="nui-datepicker"  />
	                </div> -->
	            </div>
	        </div>
			</fieldset>
        </fieldset>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
	   <a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>  
<script type="text/javascript">
	    nui.parse();
	    var form = new nui.Form("#form1");
	    var grid_traveldetail = nui.get("grid_traveldetail");
	   	var type;
	   	nui.get("orgId").setText(userOrgName)
	   	function changeValueon(e){
			var record = e.record;
			if(e.field=="num"||e.field=="onePrice"){
				if(record.num!=null && record.onePrice!=null){
					var totalPrice1 =mulFloat(record.num,record.onePrice).toString() ;
					 grid_traveldetail.updateRow(e.row,{
							totalPrice:totalPrice1
                  	}); 
	                  	totalAmount();
				}else{
					 grid_traveldetail.updateRow(e.row,{
					 totalPrice:""
              	}); 
				
				}
			}
	   	}
	   	
	   	//math.evaluate()
	   	//选择部门领导
	   	 function selectManager(){
	   	 	var btnEdit = this;
	   	 	selectUser(function(data){
	   	 		btnEdit.setValue(data.userid);
                btnEdit.setText(data.empname);
                nui.get("managerName").setValue(data.empname)
	   	 	})
         }
        //选择分管领导
	   	function selectLeader(){
	   	 	var btnEdit = this;
	   	 	selectUser(function(data){
	   	 		btnEdit.setValue(data.userid);
                btnEdit.setText(data.empname);
                nui.get("leaderName").setValue(data.empname)
	   	 	})
        }
	   	function onOk(e){
    	    type=e;
    	    var judge = getJudge();
    		var formData = form.getData(),gridData = grid_traveldetail.getData();
    		formData.type = type;
    		formData.isreport = (judge==2?"Y":"N");
			
    		if(!form.validate()||gridData.length<1){
				nui.alert("请检查表单和采购明细填写是否完整!");
				return;
			}
			
			grid_traveldetail.validate();
       		if (grid_traveldetail.isValid() == false) {
                var error = grid_traveldetail.getCellErrors()[0];
                grid_traveldetail.beginEditCell(error.record, error.column);
                return;
            }
			var json = nui.encode({"purZero":formData,"purZeroItem":gridData});
			if(type==1){
				info="是否提交？"
			}else{
				info="是否暂时保存？"
			}
			if(!confirm(info)){
		        nui.get("saveReimb").enable();
       		 	nui.get("creatReimbProcess").enable();
				return;
			}else{
				ajaxCommon({
					"url": "com.zhonghe.ame.purchase.purchaseItems.addPurZero.biz.ext",
					"data": json,
					"success": function(data) {
						showTips("新增零星采购成功");
						closeOk();
					}
				});	
            }
        }
	   	
	
	function addTicket(){
    	var rowS = {name: "New Row"} 
		grid_traveldetail.addRow(rowS);
    }
    
    
    function removeTicket(){
		var rows = grid_traveldetail.getSelecteds();
        if (rows.length>0) {
            grid_traveldetail.removeRows(rows, true);
            totalAmount();
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
	
	//计算总金额
	function totalAmount(){
		var tempData = grid_traveldetail.data;
    	var a=tempData.length;
    	var b=0;
    	for(var i=0;i<a;i++){
    		if(!!tempData[i].totalPrice&&tempData[i].totalPrice>0){
    			b = addFloat(b,tempData[i].totalPrice)
    		}else{
    			var x = 0;
    			b = addFloat(b,x)
    		}
    	}
 		nui.get("totalAmount").setValue(b)
 		if(b>5){
			 $(".leader").css("display","");
		}else if(b<5){
			 $(".leader").css("display","none"); 
            nui.get("leader").setText("");
            nui.get("leader").setValue("")
            nui.get("leaderName").setValue("")
		}
	}
	
</script>
</body>
</html>