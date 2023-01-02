<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-07-12 10:59:11
  - Description:
-->
<head>
	<title>银行信息列表</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<tr>
					<td align="right">银行名称：</td>
					<td align="left">
						<input class="nui-dictcombobox" name="criteria._expr[0]._value" id="banknamedict" dictTypeId="BANKNAME" multiSelect="true" style="width:120px;"/>
						<input class="nui-hidden" name="criteria._expr[0]._property" value="banknamedict"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="in"/>
					</td>
					<td align="right"><span>银行帐号：</span></td>
	            	<td align="left">
					    <input name="criteria._expr[1]._value" id="bankacct" class="nui-textbox" style="width:120px;"/>
				        <input class="nui-hidden" name="criteria._expr[1]._property" value="bankacct" />
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
					</td>
					<td align="right"><span>单位/个人名称：</span></td>
	            	<td align="left">
					    <input name="criteria._expr[2]._value" id="username" class="nui-textbox" style="width:120px;"/>
				        <input class="nui-hidden" name="criteria._expr[2]._property" value="username" />
				        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					</td>
				</tr>
				<tr>
	    			<td align="center" colspan="6">
                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>	
                   </td>
                </tr>
	        </table>
		</div>           
    </div>
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
        	<tr>
                <td style="width:20%;">
                    <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
                    <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="edit()">编辑</a>
                    <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="remove()">删除</a>
                </td>
            </tr>
         </table>           
    </div>
	<div class="nui-fit">
		<div id="datagrid1" class="nui-datagrid" dataField="omemployeeaccts" style="width:100%;height:100%;" 
        	url="com.primeton.eos.ame_pur.settlePay.queryBankInfo.biz.ext" sizeList="[5,15,25,50]" ondrawcell="isDefalut"
        	pageSize="5" showPageInfo="true" multiSelect="false" allowSortColumn="false" onrowdblclick="onRowDblClick">
            <div property="columns">
                <div type="checkcolumn" width="30">请选择</div>
                <div field="empid" headerAlign="center" allowSort="true" visible="false">empid</div>
                <div field="username" headerAlign="center" allowSort="true" >单位/个人名称</div>
                <div field="banknamedict" headerAlign="center" allowSort="true" width="60" align="center" renderer="banknameDict">银行名称</div>
                <div field="bankacct" headerAlign="center" allowSort="true" >银行帐号</div>
                <div field="banktype" width="80" align="center" headerAlign="center" renderer="banktypeDict">账户类型</div>
                <div field="bankname" width="100" align="left" headerAlign="center"  >账户开户行</div>
                <div field="isdefault" width="60" headerAlign="center" align="center"allowSort="true" >是否默认</div>
            </div>
        </div>
	</div>
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;margin-right:20px;" onclick="onOk()">确定</a>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a>
    </div>
</body>
<script type="text/javascript">
    nui.parse();
	var form = new nui.Form("#form1");
    var grid = nui.get("datagrid1");
        
       /*  
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		}
        var custid = getUrlParam("custid"); */
    function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return unescape(r[2]); 
		return null; 
	}
    var empid = getUrlParam("empid");
    var expusername;

    function SetData(data){
    	data = nui.clone(data);
    	expusername =data.expusername;
    	
        //console.log(expusername)
    }
    
	init();
	
	function init(){
		var data = form.getData();
		data.empid = empid;
		grid.load(data);
		
	}
		
    function GetData() {
		var row = grid.getSelected();
		//console.log(row);
		var username=row.username;
		return row;
	}

    //重新刷新页面
    function refresh(){
        var form = new nui.Form("#form1");
        var json = form.getData(false,false);
        json.empid = empid;
        grid.load(json);//grid查询
    }

    //查询
    function search() {
        var form = new nui.Form("#form1");
        var json = form.getData();
        json.empid = empid;
        grid.load(json);//grid查询
    }
        
    function onRowDblClick() {
		onOk();
	}
	
	function onOk() {
		CloseWindow("ok");
	}
		
	function onCancel() {
		CloseWindow("cancel");
	}

    //重置查询条件
    function reset(){
        form.reset();
        var data = form.getData();
		data.empid = empid;
		grid.load(data);
    }

    //enter键触发查询
    function onKeyEnter(e) {
        search();
    }

    //当选择列时
    function selectionChanged(){
        var rows = grid.getSelecteds();

        if(rows.length>1){
            nui.get("update").disable();
        }else{
            nui.get("update").enable();
        }
    }
        
    function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
		
	function add(){
		nui.open({
            url: "<%=request.getContextPath() %>/ame_pur/settlepay/bankInfoInput.jsp?empid="+empid,
	        title: "新增"+expusername+"账户", 
	        width: 650, 
	        height: 280,
	        onload: function () {
	            var iframe = this.getIFrameEl();
	            var data = { action: "new", empid:empid};
	            iframe.contentWindow.SetData(data);
	        },
	        ondestroy: function (action) {
	            var data = form.getData();
				data.empid = empid;
	    		grid.load(data);
	        }

	    });
	}

	function edit(){
		var row = grid.getSelected();
		if (row) {
	  		nui.open({
	            url: "<%=request.getContextPath() %>/ame_pur/settlepay/bankInfoInput.jsp",
	            title: "编辑"+expusername+"银行账户",
	            width: 650,
	            height: 280,
	            onload: function () {
					var iframe = this.getIFrameEl();
					var data = {action: "edit", empid: row.empid, bankacct: row.bankacct };
					iframe.contentWindow.SetData(data);
				},
				ondestroy: function (action) {
					var data = form.getData();
					data.empid = empid;
		    		grid.load(data);
				}
			});
		} else {
			nui.alert("请选中一条记录","提示");
		}
	}

	function remove(){
		var rows = grid.getSelecteds();   //获取所有选中的行对象
	    var data = {omemployeeaccts: rows};
	    var json = nui.encode(data);     //序列化成json字符串
		if (rows.length> 0) {
			nui.confirm("确定删除选中记录？", "确定？",
	            function (action) {            
	                if (action == "ok") {
	                    nui.ajax({
			                url: "com.primeton.eos.common.omemployeeacctbiz.deleteOmEmployeeAccts.biz.ext",
			                type: "POST",
			                data: json, 
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                	if(text.exception == null){
			                		nui.alert("删除成功！",null,function(){
			                			var data = form.getData();
										data.empid = empid;
							    		grid.load(data);
			                		});
			                	}else{
			                		nui.alert("删除失败！");
			                	}
			                },
			                error: function (err) {
			                	nui.alert("错误" + err);
		                    }
		               });
	                } else {
	                    return;
	                }
	            }
			);
	    } else {
	        alert("请至少选中一条记录");
	    }
	}
	
	//是否默认账户
	function isDefalut(e){
		if(e.field == "isdefault"){
			if(e.record.isdefault == "1"){
				e.cellHtml = "默认账户";
			}else if(e.record.isdefault == "0"){
				e.cellHtml = '<a href="javascript:void(0)" onclick="setDefault('+JSON.stringify(e.record).replace(/"/g, '&quot;')+')">设为默认</a>'
			}
		}
	}
	
	//设置为默认账户
	function setDefault(e){
		var json = {defaultAcct:e,empid:e.empid};
		nui.ajax({
            url: "com.primeton.eos.common.omemployeeacctbiz.setDefaultAcct.biz.ext",
            type: "POST",
            data: json, 
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	//console.log(text);
            	if(text.reCode){
            		nui.alert("设置成功。","提示",function(e){
            			search();
            		})
            	}else{
            		nui.alert("设置失败，请联系信息技术部。")
            	}
            },
            error: function (err) {
            	nui.alert("错误" + err);
            }
       });
	}
	
	function banknameDict (e) {
		return nui.getDictText("BANKNAME",e.value);
	}
	
	function banktypeDict (e) {
		return nui.getDictText("BANKACCTTYPE",e.value);
	}
</script>
</html>