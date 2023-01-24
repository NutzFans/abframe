<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>供应商信息列表查询</title>
<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
</style>
</head>
<body>
	<div id="form1" style="height: 95%">
		    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
		    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
		    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
		     <input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
		     <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
		     <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
  			<input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
	      <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
	      <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
            <table style="width:100%;">
            	<tr>
                    <td style="width:30%;">
                        <a class="nui-button" id="gys_addBtn" iconCls="icon-add" onclick="add()">增加</a>
                        <a class="nui-button" id="gys_updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
                        <a class="nui-button" id="gys_delbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
                        <a class="nui-button" id="gys_saveBtn" iconCls="icon-save" onclick="save()">保存</a>
                        <a class="nui-button" id="gys_exportExcel" iconCls="icon-download" onclick="onExportExcel()">导出</a>
                    </td>
                    <td align="right" colspan="15">
                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
                   </td>
                </tr>
             </table>           
	<div class="nui-fit">
    <div id="datagrid1" class="nui-datagrid" style="width: 100%;height: 100%;" allowCellSelect="true" 
	    		showPager="true" allowCellEdit="true" multiSelect="true"  dataField="purSuppliers" 
	    		showFilterRow="true"
	    		 sizeList="[10,20,50,100,200]" allowResize="true" pageSize="20" 
	    		 url="com.zhonghe.ame.purchase.purSupplier.querySuppliers.biz.ext">
		<div property="columns">
		    <div type="checkcolumn" width="25"></div>
			<div type="indexcolumn" align="center" headerAlign="center">序号</div>
			<div field="custid" width="0" visible="false">客户ID</div>		
			<div field="custname" width="180" align="left" headerAlign="center"  renderer="getDetail">供应商名称
				<input name="criteria._expr[0].custname" property="filter" class="nui-textbox" width="100%" onvaluechanged="search""/>
			</div>
			<div field="linkman" width="60" align="center"  headerAlign="center" >联系人
				<input name="criteria._expr[1].linkman" property="filter" class="nui-textbox"  width="100%" onvaluechanged="search"/>
			</div>
			<div field="linktel" width="110" align="left"  headerAlign="center" >联系电话
				<input name="criteria._expr[2].linktel" property="filter" class="nui-textbox"  width="100%" onvaluechanged="search"/>
			</div>			
			<div field="custtype" width="110" align="center" headerAlign="center" renderer="dictcusttype">供应商类型
				<input name="criteria._expr[4].custtype" class="nui-dictcombobox" multiSelect="true"  dictTypeId="AME_SUPTYPE" property="filter" showNullItem="true" width="100%" onvaluechanged="search""/>
			</div>
			<div field="isqualified" width="110" align="center" headerAlign="center" renderer="dictstatus" >是否合格
				<input name="criteria._expr[3].isqualified" property="filter" multiSelect="true" class="nui-dictcombobox" dictTypeId="MIS_YN" width="100%" showNullItem="true" onvaluechanged="search""/>
				<input  property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN" showNullItem="true" />
			</div>
			<div field="isgroupqualified" width="110" align="center" headerAlign="center" renderer="dictstatus" >是否合格(集团)
				<input name="criteria._expr[10].isgroupqualified" property="filter" multiSelect="true" class="nui-dictcombobox" dictTypeId="MIS_YN" width="100%" showNullItem="true" onvaluechanged="search""/>
				<input  property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN" showNullItem="true" />
			</div>
			<div field="effectiveEndTime" width="110" align="center" headerAlign="center" dateFormat="yyyy-MM-dd">合格有效期
				<input name="effectiveEndTime" property="editor" class="nui-datepicker"  />
			</div>
			<div field="appraise" width="110" align="center" headerAlign="center" renderer="onAppraise">综合评价
				<input name="criteria._expr[5].appraise" class="nui-dictcombobox" multiSelect="true" dictTypeId="ZH_APPRAISE" property="filter" showNullItem="true" width="100%" onvaluechanged="search""/>
				<input name="appraise" property="editor" class="nui-dictcombobox" dictTypeId="ZH_APPRAISE" showNullItem="true" />
			</div> 
			<div field="inspect" width="110" align="center" headerAlign="center" renderer="inspect">年度监督检查
				<input name="criteria._expr[6].inspect" class="nui-dictcombobox" multiSelect="true" property="filter" width="100%" dictTypeId="ZH_INSPECT" showNullItem="true" onvaluechanged="search"/>
				<input name="inspect" property="editor" class="nui-dictcombobox" dictTypeId="ZH_INSPECT" showNullItem="true" />
			</div>
			<div field="misconduct" width="110" align="center" headerAlign="center" allowSort="true">不良行为
				<input  name="criteria._expr[7].misconduct" property="filter" class="nui-textbox" style="width:100%;"onvaluechanged="search" />
				<input  name="misconduct" property="editor" class="nui-textarea" style="width:100%;" />
			</div>
			<div field="blackList" width="90" align="center" headerAlign="center"  renderer="dictstatus" allowSort="true">黑名单
				<input  name="criteria._expr[8].blackList" property="filter"  class="nui-dictcombobox" style="width:100%;" dictTypeId="ZH_YN" showNullItem="true"onvaluechanged="search" />
				<input  name="blackList" property="editor" class="nui-dictcombobox" dictTypeId="ZH_YN"  style="width:100%;" />
			</div>
			<div field="greyList" width="90" align="center" headerAlign="center" renderer="dictstatus" allowSort="true">灰名单
				<input  name="criteria._expr[9].greyList" property="filter"  class="nui-dictcombobox"style="width:100%;" dictTypeId="ZH_YN" showNullItem="true"onvaluechanged="search" />
				<input  name="greyList" property="editor"class="nui-dictcombobox" dictTypeId="ZH_YN"  style="width:100%;" />
			</div>
			<div field="createDate"  align="center" headerAlign="center" dateFormat="yyyy-MM-dd"allowSort="true">创建时间
			</div>
			<div field="inflag" width="60" align="center"  headerAlign="center" >创建人
				<input name="criteria._expr[8].inflag" property="filter" class="nui-textbox"  width="100%" onvaluechanged="search"/>
			</div>
		</div>
		</div>
	</div>
	</div>

	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
	<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	search()
    	//按钮权限的控制
	    getOpeatorButtonAuth("gys_delbtn,gys_addBtn,gys_saveBtn,gys_updateBtn,gys_exportExcel");
		function dictstatus(e) {
			return nui.getDictText('ZH_QUALIFIED',e.value);//设置业务字典值
		}
		function dictcusttype(e) {
			return nui.getDictText('AME_SUPTYPE',e.value);//设置业务字典值
		}
		function onAppraise(e) {
			return nui.getDictText('ZH_APPRAISE',e.value);//设置业务字典值
		}
		function inspect(e){
			return nui.getDictText('ZH_INSPECT',e.value);//设置业务字典值
		}
    	function search() {
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		  	grid.sortBy("custid","desc");
		}
		function reset(){
			form.reset();
			grid.load();
			
		}
		 function GetData() {
	        var row = grid.getSelected();
	        return row;
    	}
		function add() {        	
            nui.open({
                url: "<%=request.getContextPath() %>/purchase/purSupplier/savePurSupplier.jsp",
                title: "新增供应商信息", 
				width: 830,
	            height: 400,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
		            grid.reload();
                }
            });
        }
        function remove() {
        	//删除权限
		    var rows = grid.getSelecteds();   //获取所有选中的行对象
		    var data = {purSuppliers:rows};
		    var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
				nui.confirm("确定删除选中记录？","提示",function (action) {            
                if (action == "ok") {
                	
                	nui.ajax({
		                url: "com.primeton.eos.ame_pur.PurSupplier.deletepurSuppliers.biz.ext",
		                type: "post",
		                data: json, 
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                	grid.reload();
		                },
		                error: function () {
		                   nui.alert("删除失败");
	                    }
	                });                
                 }              	
               })
            } else {
                nui.alert("请至少选中一条记录");
            }
        }
        function edit() {
    		var row = grid.getSelected();
		    
    		if (row) {
      		nui.open({
	            url: "<%=request.getContextPath() %>/purchase/purSupplier/savePurSupplier.jsp",
	            title: "编辑供应商信息",
	            width: 830,
	            height: 400,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "edit", custid: row.custid };
	              iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	                if(action=="ok"){
	                  grid.reload();
	                }
	            }
            });
            } else {
              nui.alert("请选中一条记录","提示");
            }
        }
        
        function save(){
        	var datas = grid.getChanges();
        	clog(datas)
        	ajaxCommon({
				url:"com.zhonghe.ame.purchase.purSupplier.saveSuppliers.biz.ext",
				data:{param:datas},
				success: function (o) {
               		grid.reload();
            }})
        }
        
        function onExportExcel(){
				var data = form.getData();
				exportExcel({
					url: "com.primeton.eos.ame_pur.PurOtherSettlePay.exportPurSupplier.biz.ext",
					fileName:"供应商记录",
					data:data
				})
        }
        
        function getDetail(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){
	 		var selectRow = grid.getSelected();
	 		
      		nui.open({
	            url: "<%=request.getContextPath() %>/purchase/purSupplier/purSupView.jsp",
	            title: "供应商信息查看",
	            width: 830,
	            height: 400,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "edit", custid: selectRow.custid };
	              iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	                if(action=="ok"){
	                  grid.reload();
	                }
	            }
            });
	    }
	    
  </script>
</body>
</html>