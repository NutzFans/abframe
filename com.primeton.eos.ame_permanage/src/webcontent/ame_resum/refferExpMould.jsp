<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-04-09
  - Description:
-->
<head>
<title>内推费用管理模板</title>
<%@include file="/common/common.jsp"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fix">

  <div class="nui-panel" title="内推费用管理模板" style="width:100%;">
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td align="left">
                    <a class="nui-button" iconCls="icon-add" onclick="addRow()">新增</a>
                    <a class="nui-button" iconCls="icon-remove" onclick="reMoveRow()">删除</a>
                    <a class="nui-button" id="okbutton" iconCls="icon-ok" onclick="onOk()">保存</a>
                </td>
            </tr>
        </table>
     </div>  
        <div id="grid_refferexpmould" class="nui-datagrid" style="width:100%;height:auto;" dataField="refferexpMould" allowAlternating="true" allowCellEdit="true" multiSelect="true" oncellendedit="changexiaoji"
    	 url="com.primeton.eos.ame_resume.resumeManage.queryRefferexpMould.biz.ext"  showPager="false"   allowCellSelect="true"  onselectionchanged="onShowRowDetail">
		</div>
		<div id="br">
		  <br/>
		</div>
		<div id="omRecruitList_Form" style="display:none;">
		     <div class="nui-toolbar" id="isFinance" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
				            <a class="nui-button" id="omRecruitList_addRec" iconCls="icon-add" onclick="addRec()">关联</a>
			                <a class="nui-button" id="omRecruitList_removeBtn" iconCls="icon-remove" onclick="remove()">解除</a>
				        </td>
	                </tr>
	            </table>           
	        </div>
		     <div id="grid_recruitlist" sizeList="[10,20,50,100,200,500]" showPager="true" dataField="omRecruits"
	        	showSummaryRow="true" class="nui-datagrid" style="width:100%;height:auto;" ondrawcell="ondrawOmRecList"
	        	url="org.gocom.abframe.org.recruit.omRecruitList.biz.ext"  ondrawsummarycell="onDrawSummaryCell"
	        	multiSelect="true" allowSortColumn=true allowCellWrap="false">
	            <div property="columns">
	            	<div type="checkcolumn"></div>
	            	<!--<div field="refferexpmouldno" width="80" headerAlign="center" align="center">内推模板编号</div>-->
	            	<div field="recruitno" width="80" headerAlign="center" align="center" renderer="getDetail">需求编号</div>
	                <div field="orgname" width="120" align="left" headerAlign="center" allowSort="true">招聘部门</div>
	                <div field="recposition" width="85" align="left" headerAlign="center" allowSort="true" renderer="getPositionname">招聘职位分类</div>
	                <div field="recpositionname" width="120" align="left" headerAlign="center" allowSort="true">招聘职位名称</div>
	                <div field="recnum" width="60" align="right" headerAlign="center" allowSort="true" summaryType="sum"  >招聘数量</div>
	                <div field="finishnum" width="60" align="right" headerAlign="center" allowSort="true" summaryType="sum"  >已完成数</div>
	                <div field="propdate" width="80" align="center" allowSort="true" dateFormat="yyyy-MM-dd" headerAlign="center">提出时间</div>
					<div field="hopedate" width="80" align="center" allowSort="true" dateFormat="yyyy-MM-dd" headerAlign="center">期望入职时间</div>
	                <div field="status" width="80" align="center" headerAlign="center" allowSort="true" renderer="getRecruitStatus">招聘状态</div>
	                <div field="approvalstatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="getApprovalStatus">需求审批状态</div>
	                <div field="workplace" width="60" align="center" headerAlign="center" allowSort="true" renderer="getWorkspace">工作地点</div>
	                <div field="remark" width="200" align="left" headerAlign="center" allowSort="true">备注</div>
	            </div>
	        </div>
		</div>
	</div>
</div>	
<script type="text/javascript">
	nui.parse();
	var grid_refferexpmould = nui.get("grid_refferexpmould");
	var grid_recruitlist = nui.get("grid_recruitlist");
	var eventtypes;
	var refferexpmouldno;
	refferExpMould();
	function refferExpMould(){
	    var grid = getColumns();
        grid_refferexpmould.set({columns:grid});
        grid_refferexpmould.load();
	}
    //动态获取列
    function getColumns() {
        var flag = true;
    	var result = [];
    	/* result.push({type:'expandcolumn',width:10}); */
    	result.push({type:'checkcolumn',width:10});
		result.push({field:'refferexpmouldno',width:20,align:'center',headerAlign:'center',header:'编号'});
		var result_eventtype =[];
    	nui.ajax({
            url: "com.primeton.eos.ame_resume.resumeManage.getRefferEventtype.biz.ext",
			type: 'POST',
			async:false,
			contentType: 'text/json',
            success: function (o) {
            	eventtypes = o.eventtypes;
            	if(eventtypes.length==0){//没有数值
            		flag=false;
            	}
				for(var i = 0 ; i< eventtypes.length; i++){
		    		result_eventtype.push({field:eventtypes[i].dictid,width:40,align:'right',headerAlign:'center',summaryType:'sum',header:eventtypes[i].dictname,numberFormat:'0.0',editor: { type: "textbox",onvaluechanged:'changeData'}});
				}
            }
        });
        if(flag){
    	        result_eventtype.push({field:'xj',width:30,align:'right',headerAlign:'center',header:'小计',numberFormat:'0.0',summaryType:'sum',renderer:"sumRender"});
        }
        result.push({headerAlign:'center',header:' 奖励事件',columns:result_eventtype});
        result.push({field:'status',width:20,align:'center',headerAlign:'center',header:'状态',editor: { type: "dictcombobox",dictTypeId:"ABF_STATUS"},renderer:"getStatus"});
        result.push({field:'mouldremark',width:100,align:'left',headerAlign:'center',header:'备注',editor: { type: "textarea"}});
        return result;
	}
	//新增行
	function addRow(){
	    var refferexpmould = nui.get("grid_refferexpmould").getData();
	    var Maxno = Math.max.apply(Math, refferexpmould.map(function(o) {return o.refferexpmouldno}));
	    if(Maxno == '-Infinity'){
	         Maxno = 0;
	    }
	    
		var newRow = {refferexpmouldno:Maxno+1,status:1,mouldremark:null};
		grid_refferexpmould.addRow(newRow);
	}
	//删除行
	function reMoveRow(t){
	    var rows = grid_refferexpmould.getSelecteds();
        if (rows.length>0){
            grid_refferexpmould.removeRows(rows, true);
         }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
	//确定保存或更新
	var removerefferexpmouldno = [];
	function onOk() {
	    var editLists = [];
	    var addLists = [];
	    var removeLists = [];
	    var addListss = grid_refferexpmould.getChanges('added');
	    var editListss = grid_refferexpmould.getChanges('modified');
	    var removeListss = grid_refferexpmould.getChanges('removed');
	    if(addListss.length >0 ){
		    pushrow(addListss,addLists);
		}
		if(editListss.length >0 ){
			pushrow(editListss,editLists);
		}
		if(removeListss.length >0 ){
			pushrow(removeListss,removeLists);
		}
		if(editListss.length == 0 && addListss.length == 0 && removeListss.length == 0){
			nui.alert("请调整之后再做保存。");
			return;
		}
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '保存中...'
        });
        var json = {addLists:addLists,editLists:editLists,removeLists:removeLists,removerefferexpmouldno:removerefferexpmouldno};
		saveData(json); 
	}
	function saveData(json){
		nui.ajax({
			url:"com.primeton.eos.ame_resume.resumeManage.saverefferExpMould.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				nui.unmask();
				if(text.result == '-1'){
				    nui.alert("保存失败。","提示",function(e){
	        			grid_refferexpmould.load();
	        		})
				}else{
					nui.alert("保存成功。","提示",function(e){
	        			grid_refferexpmould.load();
	        		})
				}
			},
			error: function (jqXHR, textStatus, errorThrown){
	        }
		});
	}
	function pushrow(selectRow,arr){
	    var out = [];
	    var reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
		for (var i = 0 ; i < selectRow.length ; i++){
		    out.push(selectRow[i].refferexpmouldno);
			if(eventtypes.length>0){
				for(var key in selectRow[i]){
					if(key.indexOf('A')!=-1){
						if(reg.test(selectRow[i][key])){
							var obj = {};
							var eventtype = key.substring(1);
							obj = createObj(eventtype,selectRow[i].refferexpmouldno,selectRow[i][key],selectRow[i].mouldremark,selectRow[i].status);
							arr.push(obj);
						}
					}
				}
			}
		}
		if(selectRow[0]._state == 'removed'){
		    removerefferexpmouldno = out; 
		}
	}
	//工厂赋值修改的对象
	function createObj(eventtype,refferexpmouldno,rewardmoney,mouldremark,status){
		var o = new Object();
	    o.eventtype = eventtype;
	    o.refferexpmouldno = refferexpmouldno;
	    o.rewardmoney = rewardmoney;
	    o.mouldremark = mouldremark;
	    o.status = status; 
	    if(parseFloat(rewardmoney)==0){
	    	o.rewardmoney = null;
	    }else{
	    	o.rewardmoney = parseFloat(rewardmoney);
	    }
	    return o;
	}
	//实时计算“小计”
	function changexiaoji(e){
	    var reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
	    var xiaoji = 0;
		var selectRow = e.record;
		for(var key in selectRow){
			if(key.indexOf('A')!=-1){
				if(reg.test(selectRow[key])){
					xiaoji = xiaoji + parseFloat(selectRow[key]);
				}
			}
		}
		var rowData = {xj: xiaoji};
		grid_refferexpmould.updateRow(selectRow,rowData);
	}
	var omRecruitList_Form = document.getElementById("omRecruitList_Form");
	function onShowRowDetail(e) {
	    var selectRow = grid_refferexpmould.getSelected();
	    refferexpmouldno = selectRow.refferexpmouldno;
        //查询关联招聘需求
        if(selectRow.refferexpmouldno ==null || selectRow.refferexpmouldno ==""){
        	return;
        }else{
            var json = {refferexpmouldno:selectRow.refferexpmouldno,flag:2};
            grid_recruitlist.load(json);
			$('#omRecruitList_Form').show();
        } 
	}
	function getStatus(e){
		return nui.getDictText('ABF_STATUS',e.value);
	}
	function changeData(e){
		var reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
		if(!reg.test(e.value)){
			e.value = "";
			e.cellHtml = "";
			nui.alert("输入非正确字符，请重新输入。");
		}
	}
	function ondrawOmRecList(e){
    	var record = e.record;
    	var date = new Date();
    	var dateTime = Date.parse(date);
    	var hopetime = Date.parse(record.hopedate);
    	var status = record.status;
    	var isin = (status =='0' || status =='1')?true:false;
    	if(dateTime > hopetime && isin){
    		e.rowStyle = "background-color: #FF99CC";
    	}
    }
	function onDrawSummaryCell(e){
		var result = e.result;
	    var grid = e.sender;
	    if (e.field == "orgname") {
	        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
	    }
	    if (e.field == "recnum"||e.field=="finishnum") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	}
	function getDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='getOmRecruitDetail();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function getOmRecruitDetail(){
    	var selectRow = grid_recruitlist.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/abframe/org/recruit/omRecruitDetail.jsp?recruitid=" + selectRow.recruitid;
		window.open(executeUrl);
    }
    function addRec(){
		var btnEdit = this;
	    nui.open({
			url:"<%=request.getContextPath() %>/abframe/org/recruit/SelectRecruitno.jsp?isflag=1&refferexpmouldno="+refferexpmouldno,
			title: "关联招聘需求编号",
			width: 780,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					data = iframe.contentWindow.BindRecruitno();
					data = nui.clone(data);   //必须
					json = {omRecruits:data,refferexpmouldno:refferexpmouldno};
					if (data.length > 0) {
			            nui.confirm("确定要给当前招聘需求记录添加内推奖励模板？","操作提示",function (action){
			                if(action == "ok"){
			                        grid_recruitlist.loading("操作中，请稍后......");
					                nui.ajax({
					                    url: "com.primeton.eos.ame_resume.resumeManage.bindRefferxpMouldRecruits.biz.ext",
					                    type: "post",
					                    data: json, 
					                    cache: false,
					                    contentType: 'text/json',
					                    success: function (text) {
					                    	grid_recruitlist.unmask();
					                		if(text.result == "success"){
							                	nui.alert("添加成功。","提示",function(e){
							        			    grid_recruitlist.reload();
							        		    })
						                	}else{
						                		nui.alert("添加失败。","提示",function(e){
							        			    grid_recruitlist.reload();
							        		    })
						                	}
					                    },
					                    error: function () {
					                    }
					                });
			                   }
			                 })
			         }else{
			            nui.alert("请选中一条记录");
			         }
				}
			}
		});
	}
    //解除
	function remove() {            
        var rows = grid_recruitlist.getSelecteds();
        var data = {omRecruits:rows,refferexpmouldno:refferexpmouldno};
        var json = nui.encode(data);
        if (rows.length > 0) {
            nui.confirm("确定要删除当前招聘需求中的内推奖励模板？","操作提示",function (action){
                if(action == "ok"){
                        grid_recruitlist.loading("操作中，请稍后......");
		                nui.ajax({
		                    url: "com.primeton.eos.ame_resume.resumeManage.deleteRefferxpMouldRecruits.biz.ext",
		                    type: "post",
		                    data: json, 
		                    cache: false,
		                    contentType: 'text/json',
		                    success: function (text) {
		                    	grid_recruitlist.unmask();
		                		if(text.result == "success"){
				                	nui.alert("删除成功。","提示",function(e){
				        			    grid_recruitlist.reload();
				        		    })
			                	}else{
			                		nui.alert("删除失败。","提示",function(e){
				        			    grid_recruitlist.reload();
				        		    })
			                	}
		                    },
		                    error: function () {
		                    }
		                });
                   }
                 })
         }else{
            nui.alert("请选中一条记录");
         }
    }
	function getRecruitStatus(e){
		return nui.getDictText('RECRUIT_STATUS',e.value);
	}
	//职位类型
	function getPositionname(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);
	}
	function getWorkspace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	function getApprovalStatus(e){
		return nui.getDictText('RECRUIT_APPROVAL_STATUS',e.value);
	}
 </script>   
</body>
</html>