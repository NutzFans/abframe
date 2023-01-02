<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common.jsp"%>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2019-12-09 
  - Description:
-->
<head>
<title >面试评价模板设置</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;padding: 0px;width: 100%;height: 100%;">
	    <div class="nui-splitter" style="width:100%;height: 100%;">
	        <div size="90" showCollapseButton="true">
	            <div style="width:100%;">
	                <div class="nui-toolbar" style="borborder-bottom:0;padding:0px;">
	                    <table style="width:100%;">
	                        <tr>
	                            <td style="width:20%;height: 100%;">面试评价模板</td>
	                        </tr>
	                     </table>           
	                </div>
	            </div> 
	            <div id="form1" style="margin: 15px 0;">
	                <input class="nui-hidden" name="criteria._entity" />
	                <table style="width:100%;height: 100%;" class="table">
	                    <tr>
	                        <td align="right">模板名称：</td>
	                        <td align="left">
	                            <input class="nui-textbox" name="mould._expr[0]._value" id="mouldname" style="width: 120px;" onenter="onKeyEnter"/>
	                            <input class="nui-hidden" name="mould._expr[0]._property" value="mouldname"/>
	                            <input class="nui-hidden" name="mould._expr[0]._op" value="like"/>
	                        </td>
	                        <td align="right">职位分类：</td>
	                        <td align="left">
	                            <input class="nui-dictcombobox" dicttypeid="AME_POSITION_MEMO" name="mould._expr[1]._value" multiSelect="true" showNullItem="true" style="width: 160px;"  onenter="onKeyEnter"/>
	                            <input class="nui-hidden" name="mould._expr[1]._property" value="position1"/>
	                            <input class="nui-hidden" name="mould._expr[1]._op" value="in"/>
	                        </td>
	                    </tr>
	                </table>
	                <table style="width:100%;margin-top: 10px;">
	                    <tr>
	                        <td align="center">
	                            <a class="nui-button" iconCls="icon-search" onclick="query()">查询</a>
	                            <a class="nui-button" iconCls="icon-reload" style="margin:0 20px;" onclick="reset()">重置</a>
	                        </td>
	                    </tr>
	                </table>
	            </div>
	            <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	                <table>
	                    <tr>
	                        <td>
	                            <a class="nui-button" iconCls="icon-add" onclick="addRow()">新增</a>
	                            <!-- <a class="nui-button" iconCls="icon-edit" onclick="edit()">修改</a> -->
	                            <a class="nui-button" iconCls="icon-remove" onclick="reMoveRow('grid')">删除</a>
	                            <a class="nui-button" id="okbutton" iconCls="icon-ok" onclick="onOk()">保存</a>
	                        </td>
	                    </tr>
	                </table>
	            </div> 
	            <div id="datagrid" class="nui-datagrid" style="width:100%;height:375px;"  allowResize="true" allowCellSelect="true" allowCellEdit="true"
	                url="com.primeton.eos.ame_permanage.ame_interview.QueryInterviewMould.biz.ext" dataField="moulds" oncellclick="view"
	                multiSelect="true" pageSize="10" sizeList="[10,20,30,50]" allowAlternating="true"  allowCellWrap="true">
	                <div property="columns" >
	                	<div type="checkcolumn" width="10px"></div>
	                    <div field="mouldname" width='50' allowSort="true" headerAlign="center" >模板名称
	                         <input property="editor" class="nui-textbox" required="true"/>
	                    </div>
	                    <div field="position" displayField="positionname"  headerAlign="center" align='left' >适用招聘职位分类
	                         <input property="editor" class="nui-combobox" multiSelect="true"  valueFromSelect="true" allowInput="true" textField="positionname" valueField="position" dataField="mouldPositons" 
	                          url="com.primeton.eos.ame_permanage.ame_interview.QueryMouldPositons.biz.ext" />
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- 左边 -->
	        
	        <!-- 右边-->
	        <div size="100"  showCollapseButton="true" > 
	        <!-- 
                <div class="nui-toolbar" style="borborder-bottom:0;padding:0px;">
                    <table style="width:100%;">
                        <tr><td style="width:20%;">评价项</td></tr>
                    </table>           
                </div>
                
                  
	              //网格显示未添加的面试评价模板 
	             <div id="datagrid1" class="nui-datagrid" style="width:100%;height:280px;" url="com.primeton.eos.ame_permanage.ame_interview.QueryMouldEvaluationtype.biz.ext" dataField="evaluations"
                     showPager="false" allowAlternating="true" allowCellSelect="true" allowCellEdit="true" multiSelect="true">
                     <div property="columns">
                     <div type="checkcolumn"></div>
                        <div field="evaluationtype" width="50px" align="center" header="评价项大类" headerAlign="center" renderer="getevaluation"></div>
						<div field="evaluationsubtype" width="50px" align="left" header="评价项小类" headerAlign="center"  renderer="getsubevaluation"></div>
                    </div>
                 </div>  
                 
                  //机构树展现未添加的面试评价模板  
	            <ul id="tree1" class="nui-tree" style="width:100%;height: 35%;padding:5px;" resultAsTree ="false" ondrawnode="setIcon"
	                showTreeIcon="true" textField="dicttypename" dataField="eosEntrys"  onnodeclick="changeMould" idField="treeid" 
	                parentField="treeparentid"  allowDrop="true" allowLeafDropIn="true"
	                expandOnLoad="true">      
	            </ul>
                -->
                <!-- <div class="nui-panel" style="width:100%;" id="mould" title="面试评价模板设置"> -->
                <div class="nui-toolbar" style="borborder-bottom:0;padding:0px;">
                    <table style="width:100%;">
                        <tr><td style="width:20%;" id="setmould">面试评价设置</td></tr>
                    </table>           
		            <div class="nui-toolbar" >
		                <table style="width:100%;">
		                    <tr>
		                        <td align="left">
			                        <!-- <a class="nui-button" id="okbutton" iconCls="icon-jiantou1" onclick="addmailAll()">下移</a>
			                        <a class="nui-button" id="okbutton" iconCls="icon-jiantou2" onclick="removemailAll()">上移</a> -->
			                        <a class="nui-button" iconCls="icon-add" onclick="addRow2()">新增</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="reMoveRow('grid1')">删除</a>
			                        <a class="nui-button" id="okbutton" iconCls="icon-ok" onclick="onOk1()">保存</a>
				                </td>
		                    </tr>
		                </table> 
		            <div id="datagrid1" class="nui-datagrid" style="width:100%;height:460px;" url="com.primeton.eos.ame_permanage.ame_interview.QueryMouldEvaluationtype.biz.ext" dataField="evaluations"
	                      showPager="false" allowAlternating="true" allowCellSelect="true" allowCellEdit="true" multiSelect="true" allowSortColumn="true">
	                    <div property="columns">
	                    <div type="checkcolumn" width="10px"></div> 
	                        <div field="evaluationtype" width="30px" align="center" header="评价项大类" headerAlign="center" renderer="getevaluation" allowSort="true"></div>
							<div field="evaluationsubtype" width="90px" align="left" header="评价项小类" headerAlign="center"  renderer="getsubevaluation" allowSort="true"></div>
							<div field="sortno" width="20px" align="center"  headerAlign="center" header="排序" allowSort="true">
								<input property="editor" class="nui-textbox"/>
							</div>
	                    </div>
	                </div>
	              </div> 
             </div> 
          </div> 
       </div>   
</body>	 
<script type="text/javascript">
	nui.parse();
	var tree = nui.get("tree1");
    var grid = nui.get("datagrid");
    var grid1 = nui.get("datagrid1");
    query();
    //查询
    function query(){
        var form = new nui.Form("#form1");
        var data = form.getData(); //获取表单JS对象数据
        grid.load(data); //datagrid加载数据
    }
    //重置
    function reset(){
        var form = new nui.Form("#form1");
        form.reset();
        grid.load();
    }
    //回车触发事件
    function onKeyEnter(){
    	query();
    }
    //新增行
	function addRow(){
		var newRow = {};
		grid.addRow(newRow);
	}
	//删除行
	function reMoveRow(t){
	   if(t == 'grid'){
		    var rows = grid.getSelecteds();
	        if (rows.length>0){
	            grid.removeRows(rows, true);
	            view();
	         }else{
	        	nui.alert("请至少选中一条记录！");
	        }
	   }else{
	       if(t == 'grid1'){
		    var rows = grid1.getSelecteds();
	        if (rows.length>0) {
	            grid1.removeRows(rows, true);
	         }else{
	        	nui.alert("请至少选中一条记录！");
	        }
	      }
	   }
	}
	function addRow2(){
		var selectRow = grid.getSelected();
        if(!selectRow){
            nui.alert("请选中一条模板！");
            return false;
        }else{
            var evaluationmouldid = selectRow.evaluationmouldid;
            var grid1_data = grid1.getData();
	        var json = {"type":"0",evaluationmouldid:evaluationmouldid};
	        nui.ajax({
	            url: "com.primeton.eos.ame_permanage.ame_interview.QueryMouldEvaluationtype.biz.ext",
	            type: 'POST',
	            data:json,
	            contentType: 'text/json',
	            success: function (data) {
	                var evaluations = data.evaluations;
	                var url = "<%=request.getContextPath() %>/ame_permanage/ame_interview/newInterviewMould.jsp";
	                var title = "新增面试评价项";
	                nui.open({
						url: url,
						title: title,
						width: 400,
						height: 350,
						onload: function () {
							var iframe = this.getIFrameEl();
							if(iframe.contentWindow.init) {
								var data ={"evaluations": evaluations,"grid1_data":grid1_data};
								iframe.contentWindow.init(data);
							}
						},
						ondestroy: function (action){
						    if (action == "ok") {
		                        var iframe = this.getIFrameEl();
		                        var data = iframe.contentWindow.GetData();
		                        var ch1 = nui.clone(data);    //必须
		                        if (ch1) {
		                           for(var i=0;i<ch1.length;i++){
		                                 if(ch1[i].dicttypeid == "AME_EVALUATION_SUB"){
		                                     grid1.addRow({evaluationtype:ch1[i].parentid,evaluationsubtype:ch1[i].dictid,sortno:ch1[i].sortno}, 0);
		                                 }
				                   }
		                        }
	                        }
					    }
					});
	            }
	        }); 
        }
	}
	//确定保存或更新
	function onOk() {
	   saveData();
	}
	function saveData(){
		var editList = grid.getChanges('modified');
		var addList = grid.getChanges('added');
		var removeList = grid.getChanges('removed');
		if(addList.length >0 ){
			if(!check(addList)){
				return false;
			}
		}
		if(editList.length >0 ){
			if(!check(editList)){
				return false;
			}
		}
		if(editList.length == 0 && addList.length == 0 && removeList.length == 0){
			nui.alert("请调整之后再做保存。");
			return;
		}
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '保存中...'
        });
		var json = {editList:editList,addList:addList,removeList:removeList};
		nui.ajax({
			url:"com.primeton.eos.ame_permanage.ame_interview.saveInterviewMould.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				nui.unmask();
				repeatpostionnames = text.repeatpostionnames;
				if(text.result == '1'){
				    if(repeatpostionnames == "" || repeatpostionnames == null || repeatpostionnames == 'null'){
				       nui.alert("保存成功。");
				    }else{
				       var str = repeatpostionnames;
				       var strArr = '';
					   var n = 33;
					   for (var i = 0, l = str.length; i < l/n; i++) {
							 var a = str.slice(n*i, n*(i+1)) +  "</br>";
							 var strArr = strArr + a;
					   }
					   var messages = "保存成功。以下招聘职位的面试评价模板重复设置：</br>" + strArr;
				       nui.alert(messages);
					}
					query();
				}else{
					nui.alert("保存失败。");
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
	        }
		});
	}
	function check(data){
		var bolen = true;
		$.each(data,function(i,v){
			if(v.mouldname == "" || v.mouldname == null){
				bolen = false;
				nui.alert("模板名称不能为空");
				return false
			}
			if(v.position == "" || v.position == null){
				bolen = false;
				nui.alert("职位分类不能为空");
				return false
			}
		})
		return bolen;
	}
	//查看评价项
    function view(){
        var selectRow = grid.getSelected();
        if(!selectRow){
            var json = {"type":"1",evaluationmouldid:null};
            grid1.sortBy("sortno","desc");
            grid1.load(json);
            return false;
        }else{
            var evaluationmouldid = selectRow.evaluationmouldid;
            var mouldname = selectRow.mouldname;
            document.getElementById("setmould").innerHTML = mouldname + '的面试评价设置';
			var json = {"type":"1",evaluationmouldid:evaluationmouldid};
			grid1.sortBy("sortno","asc");
	        grid1.load(json);
	        /* var json0 = {"type":"0",evaluationmouldid:evaluationmouldid};
	        var json1 = {"type":"1",evaluationmouldid:evaluationmouldid}; 
	        nui.ajax({
	            url: "com.primeton.eos.ame_permanage.ame_interview.QueryMouldEvaluationtype.biz.ext",
	            type: 'POST',
	            data:json,
	            contentType: 'text/json',
	            success: function (data) {
	                var data = data.evaluations;
	                tree.loadList(data,"treeid","treeparentid");
	            }
	        }); */
        }
    }
    //保存评价项
    function onOk1(){
        var selectRow1 = grid.getSelected();
        if(selectRow1){
        var evaluationmouldid = selectRow1.evaluationmouldid;
    	var editList = grid1.getChanges('modified');
		var addList = grid1.getChanges('added');
		var removeList = grid1.getChanges('removed');
		if(editList.length == 0 && addList.length == 0 && removeList.length == 0){
			nui.alert("请调整之后再做保存。");
			return;
		}
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '保存中...'
        });
		var json = {editList:editList,addList:addList,removeList:removeList,"evaluationmouldid":evaluationmouldid};
		nui.ajax({
			url:"com.primeton.eos.ame_permanage.ame_interview.saveMouldEvaluationtype.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				nui.unmask();
				if(text.result == '1'){
					nui.alert("保存成功。");
					view();
				}else{
					nui.alert("保存失败。");
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
	        }
		}); 
	  }	 
    }
    grid1.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //设置行样式   
	    if("sortno" == field ){
	    	e.cellStyle = "background: yellow";
	    }
	});
    //职位字典
    function getposition(e) {
    	return nui.getDictText("AME_POSITION_MEMO",e.value);
    }
    //评价项大类
    function getevaluation(e) {
    	return nui.getDictText("AME_EVALUATION",e.value);
    }
    //评价项小类
    function getsubevaluation(e) {
    	return nui.getDictText("AME_EVALUATION_SUB",e.value);
    }
    <%--
    //增加业务字典(type)
    function add(){
        var addUrl = "<%=request.getContextPath() %>/ame_permanage/ame_interview/newInterviewMould.jsp";
        nui.open({
            url: addUrl,
            title: "新增面试评价模板", 
            width: 400, 
            height: 250,
            onload: function () {
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	query();
                	tree.loadList("","treeid","treeparentid");
	            }
            }
        });
    }
     //修改业务字典(type)
    function edit(){
        var selectRow = grid.getSelected();
        if(!selectRow){
            nui.alert('请选择要修改的的面试评价模板！');
            return;
        }else{
            var editUrl = "<%=request.getContextPath() %>/ame_permanage/ame_interview/newInterviewMould.jsp?evaluationmouldid="+selectRow.evaluationmouldid+"&mouldname="+selectRow.mouldname+"&position="+selectRow.position;
            nui.open({
                url: editUrl,
                title: "修改面试评价模板", 
                width: 400, 
                height: 250,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "edit"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                	if(action == "save"){
                		tree.loadList("","treeid","treeparentid");
                		query();
                	}
                    
                }
            });
        }
    } 
    //删除业务字典(type)
    function del(){
        var rows = grid.getSelecteds(); 
        var data = {moulds:rows};
        var json = nui.encode(data);
        if(rows.length > 0){
            //确认是否删除
            if (confirm("您确定要删除选中的面试评价模板吗？")) {
            nui.ajax({
                url: "com.primeton.eos.ame_permanage.ame_interview.deleteMould.biz.ext",
                type: 'POST',
                data:json,  
                contentType: 'text/json',
                success: function (data) {
                    if(data.reCode==1){
                        nui.alert('删除成功！');
                        query();
                        tree.loadList("","treeid","treeparentid");
                    }else{
                        nui.alert('删除失败！请联系信息技术部。');
                    }
                }
            });
          } 
        }else{
            nui.alert('请选择要删除的面试评价模板！');
            return;
        }
    }--%>
    /* //设置图片
    function setIcon(e){
    	var isLeaf= e.isLeaf;
    	var nodeName = e.node.dicttypename;
    	if(nodeName=='面试评价项'){
    		e.iconCls = "icon-expand";
    	}else if(!isLeaf){
            e.iconCls = "icon-organization";
        }else{
            e.iconCls = "icon-collapse";
        }
    } 
    function changeMould(e){
        var isLeaf = e.isLeaf;
        if(isLeaf){
    	     var node = tree.getSelectedNode();
    	     if(e.node.parentid == "dictid" || e.node.parentid == null){
    	          return false;
    	     }else{
    	          grid1.addRow({evaluationtype:node.parentid,evaluationsubtype:node.dictid,sortno:node.sortno}, 0);
    	          tree.removeNode(node,false);
    	     }
        }else{
             dicttypename = e.node.dicttypename;
             var ch1 = e.node.children;
             if(dicttypename == "面试评价项"){
                for(var i=0;i<ch1.length;i++){
                   var ch2 = ch1[i].children;
                   if(ch2){
	                   for(var j=0;j<ch2.length;){
	                       grid1.addRow({evaluationtype:ch2[j].parentid,evaluationsubtype:ch2[j].dictid,sortno:ch2[j].sortno}, 0);
	                       tree.removeNode(ch2[j],false);
	                   }
                   } 
               }
             }else{
                  var ch1 = e.node.children;
                  for(var i=0;i<ch1.length;){
                      if(ch1[i].parentid){
                         grid1.addRow({evaluationtype:ch1[i].parentid,evaluationsubtype:ch1[i].dictid,sortno:ch1[i].sortno}, 0);
                      }
                      tree.removeNode(ch1[i],false);
                   }
             }
        }
        
    }
    function changeMould1(){
             var item = grid1.getSelected();
             var cell = grid1.getCurrentCell();
             if(cell[1].field !="sortno"){
                  var addNode = {"dictid":cell[0].evaluationsubtype,"dicttypeid":"AME_EVALUATION_SUB","dicttypename":nui.getDictText("AME_EVALUATION_SUB",cell[0].evaluationsubtype),"expanded":"true","parentid":cell[0].evaluationtype,"sortno":cell[0].sortno};
                  var ch1 = tree.data[0].children[0];
                  var ch2 = tree.data[0].children[1];
                  if(cell[0].evaluationtype == "0"){
                     tree.addNode(addNode, "add",ch1);
                     grid1.removeRow(item, false);
                  }
                  if(cell[0].evaluationtype == "1"){
                     tree.addNode(addNode, "add",ch2);
                     grid1.removeRow(item, false);
                  } 
             }else{
                 return false;
             }
    }
    function addmailAll(){
         var evaluations = tree.getData()[0];
         if(evaluations){
             var ch1 = evaluations.children;
	         for(var i=0;i<ch1.length;i++){
	               var ch2 = ch1[i].children;
	               if(ch2){
	                  for(var j=0;j<ch2.length;){
	                   	grid1.addRow({evaluationtype:ch2[j].parentid,evaluationsubtype:ch2[j].dictid,sortno:ch2[j].sortno}, 0);
	                   	tree.removeNode(ch2[j],false);
	                  }
	                }
	         } 
	      }    
    }
    function removemailAll(){
         var evaluations = grid1.getData();
         grid1.removeRows(evaluations,false);
         if(evaluations.length>0){
            var ch1 = tree.data[0].children[0];
            var ch2 = tree.data[0].children[1];
            for(var i=0;i<evaluations.length;i++){
	            if(evaluations[i].evaluationtype == "0"){
	                 var addNode = {"dictid":evaluations[i].evaluationsubtype,"dicttypeid":"AME_EVALUATION_SUB","dicttypename":nui.getDictText("AME_EVALUATION_SUB",evaluations[i].evaluationsubtype),"expanded":"true","parentid":evaluations[i].evaluationtype,"sortno":evaluations[i].sortno};
			         tree.addNode(addNode, "add",ch1);
		        }
			    if(evaluations[i].evaluationtype == "1"){
			         var addNode = {"dictid":evaluations[i].evaluationsubtype,"dicttypeid":"AME_EVALUATION_SUB","dicttypename":nui.getDictText("AME_EVALUATION_SUB",evaluations[i].evaluationsubtype),"expanded":"true","parentid":evaluations[i].evaluationtype,"sortno":evaluations[i].sortno};
			         tree.addNode(addNode, "add",ch2);
			    }
           } 
         }
    } */
</script>
</html>