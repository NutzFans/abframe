<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>员工面板</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<%@include file="/nui/common.jsp"%>
	<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    html, body{
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body> 
	<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;">
		<div id="form1">
			<table style="width:100%;" class="table">
				<tr>
					<td class="tit">客户名称:</td>
					<td align="left">
						<input class="nui-textbox " onEnter='onKeyEnter' name="criteria._expr[1].custname"/>
						<input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						<input class="nui-hidden" name="criteria._expr[2]._value" value=""/>
				        <input class="nui-hidden" name="criteria._expr[2]._property" value="custid"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
					</td>
					<td >
						<a class="nui-button" iconCls="icon-search" onclick="search"> 查询</a>
					</td>
				</tr>
			</table>
			<input class="nui-hidden" name="criteria._entity" value="com.primeton.mis.contract.contract.MisCustinfo"/>
		</div>
	</div>
	<div class="nui-fit">
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" idField="custid" 
	    	url="com.primeton.mis.contract.contract.queryMisCustinfos.biz.ext" dataField="miscustinfos" 
	    	sizeList=[5,10,20,50,100] multiSelect="false" pageSize="10" onrowdblclick="onRowDblClick" >
			<div property="columns" >
				<div type="checkcolumn"></div>
				<div field="custid" width="60" allowSort="true" headerAlign="center" >客户ID</div>
				<div field="custname" width="250" allowSort="true" headerAlign="center" >客户名称</div>
				<div field="custtype" width="70" allowSort="true" headerAlign="center" renderer="onCusttypeRenderer">客户类型</div>
				<!-- <div field="grade" width="60" allowSort="true" headerAlign="center" renderer="onGradeRenderer">重要性</div> -->
			</div>
		</div>
	</div>
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
    	<a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
    	<span style="display:inline-block;width:25px;">
    	</span>
    	<a class="nui-button" style="width:60px;" onclick="onCancel()">取消</a>
	</div>
	<script type="text/javascript">
	    nui.parse();
	    var grid = nui.get("datagrid1");
		search();
		
	    function search(){	
			var userId="<%=request.getParameter("userId")%>";
	    	if(userId != null && userId !=''){
	    		var custid = '';//------------------------------------------------项目
	            var json_custs = ({"userid":userId});
	            nui.ajax({
	                type:'get',
	                data:json_custs,
	                async:false,
	                url:'com.primeton.rdmgr.labor.labormgr.queryOwnerCusts.biz.ext',
	                success:function(result){
	                    for(var i = 0;i<result.custs.length;i++){
	                        if(result.custs[i].custid != '1' && result.custs[i].custid != '2' && result.custs[i].custid != ''){
	                            if(custid==''){
	                            	custid=result.custs[i].custid;
	                            }else{
	                            	custid=custid+','+result.custs[i].custid;
	                            }
	                        }
	                    }
	                }
	            })
	            nui.getbyName("criteria._expr[2]._value").setValue(custid);
	    	}
			var form = new nui.Form("#form1");
			var data = form.getData(true,true);
			grid.load(data);
	    }
	
	    function GetData() {
			var row = grid.getSelected();
			var data = {};
			data.id = row.custid;
			data.text = row.custname;      
			data.accoutname = row.accoutname;      
			data.accoutbank = row.accoutbank;     
			data.taxnumb = row.taxnumb;     
			data.accountid = row.accountid;     
			data.address = row.address;     
			data.telephone = row.telephone;  
			return data;
	    }
	
	
	    function onKeyEnter(e) {
			search();
	    }
	    //////////////////////////////////
	    function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
	    }
	
	    function onOk() {
			var row = grid.getSelected();
			if (!row) {
				nui.alert("请选中一条记录");
				return;
			}
			CloseWindow("ok");
	    }
	    function onCancel() {
	      CloseWindow("cancel");
	    }
	    
	    function onCusttypeRenderer(e) {
	        return nui.getDictText('MIS_INDUSTRY',e.value);
	    }
	    function onGradeRenderer(e) {
	        return nui.getDictText('MIS_IMPORTANT',e.value);
	    }
		
		//行双击事件
		function onRowDblClick(){
			onOk();
		}
	</script>
</body>
</html>
