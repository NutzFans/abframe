<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
<%
	String skin="skin1";
	String contextPath=request.getContextPath();
%>

<%! 
	String getJsVersion() {
		boolean isDebug = true;
	
		// 随机生成JS版本
		if(isDebug) {
			return Double.toString(Math.random());
		}
		
		return "V1.0";
	}
%>
<script>
	(function(){
		nui.context='<%=contextPath %>/';
		// 禁用页面回退
		window.onload=function(){  
	    	document.getElementsByTagName("body")[0].onkeydown = function(){  
	        	//获取事件对象  
	        	var elem = event.relatedTarget || event.srcElement || event.target ||event.currentTarget;   
	        	if(event.keyCode==8){//判断按键为backSpace键  
	                //获取按键按下时光标做指向的element  
	                var elem = event.srcElement || event.currentTarget;   
	                  
	                //判断是否需要阻止按下键盘的事件默认传递  
	                var name = elem.tagName;  
	                  
	                if(name!='INPUT' && name!='TEXTAREA'){  
	                    return _stopIt(event);  
	                }  
	                var type_e = elem.type.toUpperCase();  
	                if(name=='INPUT' && (type_e!='TEXT' && type_e!='TEXTAREA' && type_e!='PASSWORD' && type_e!='FILE')){  
	                        return _stopIt(event);  
	                }  
	                if(name=='INPUT' && (elem.readOnly==true || elem.disabled ==true)){  
	                        return _stopIt(event);  
	                }  
	            }  
	        };  
	    };  

	})();
	
	function _stopIt(e){  
        if(e.returnValue){  
            e.returnValue = false ;  
        }  
        if(e.preventDefault ){  
            e.preventDefault();  
        }                 
  
        return false;  
	}  
	
	var data={};
	nui.DataTree.prototype.dataField='data';
	
	// 往cookie里写入表单令牌
	function writeToken(page_name, uuid) {
		$.cookie(page_name, uuid);
	}
	
	// 获取页面表单令牌
	function hasToken(page_name) {
		return $.cookie(page_name);
	}
	
	// 获取uuid
	function uuid() {
		return '<%=UUID.randomUUID().toString() %>';
	}
	
	/**
	 * 获取服务器当前日期
	 */
	function getNowDate() {
		var currentDate = new Date(<%=new java.util.Date().getTime()%>);
		var year = currentDate.getFullYear();
		var month = currentDate.getMonth() + 1;
		month = month < 10 ? '0' + month : month;
		var day = currentDate.getDate() < 10 ? '0'+currentDate.getDate() : currentDate.getDate();
		return year + '-' + month + '-' + day;
	}
	
	/**
	 * 获取服务器当前时间
	 */
	function getNowTime() {
		var currentDate = new Date(<%=new java.util.Date().getTime()%>);
		var year = currentDate.getFullYear();
		var month = currentDate.getMonth() + 1;
		month = month < 10 ? '0' + month : month;
		var day = currentDate.getDate() < 10 ? '0'+currentDate.getDate() : currentDate.getDate();
		var hour = currentDate.getHours() < 10 ? '0'+currentDate.getHours() : currentDate.getHours();
		var minute = currentDate.getMinutes() < 10 ? '0'+currentDate.getMinutes() : currentDate.getMinutes();
		var second = currentDate.getSeconds() < 10 ? '0'+currentDate.getSeconds() : currentDate.getSeconds();
		return year + '-' + month + '-' + day + " " + hour + ":" + minute + ":" + second;
	}
	
	//下拉输入筛选（全局搜索查看例子）
	function onComboValidation(e) {
        var items = this.findItems(e.value);
        if (!items || items.length == 0) {
            e.isValid = false;
            e.errorText = "输入值不在下拉数据中";
            
            nui.get(e.sender.id).setValue("");
			//nui.get(e.sender.id).focus();
        }
    }
    
    	
    /* 是否为电话号码 */
    function isTeleNumber(v) {
        var re1 = new RegExp("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$");
        var re2 = new RegExp("^(0\\d{2}-\\d{8}(-\\d{1,4})?)|(0\\d{3}-\\d{7,8}(-\\d{1,4})?)$");
        if (re1.test(v)) return true;
        else if(re2.test(v)) return true;
        
        return false;
    }
    /* 是否汉字 */
    function isChinese(v) {
        var re = new RegExp("^[\u4e00-\u9fa5]+$");
        if (re.test(v)) return true;
        return false;
    }
	
	/**
	 * 关闭窗口
	 * 
	 */
	function closeCancel() {
        close_window("cancel");
	}
	function closeOk() {
		close_window("ok");
	}
	function close_window_directly() {
        close_window("cancel");
	}
	function close_window(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
	}
	
	// 提示框
	function showTips(content, state) {
		if(state) {
			nui.showTips({content: content, state: state, x: "center", y: "center"});
		}
		else {
			nui.showTips({content: content, state: "success", x: "center", y: "center"});
		}
	}
	
	 function clog(object) {
	 	console.log(object);
	 }
	 	 
	 function ajaxCommon(params){
	 	if(typeof(params.async) == "undefined") {
	 		params.async = true;
	 	}
	 
	 	var msgBoxId = nui.loading("正在处理...", "请稍后");
		nui.ajax({
	        url: params.url,
	        data: params.data,
	        type: 'POST',
	        async: params.async,
	        cache: false,
	        contentType: 'text/json',
	        success: function (data) {
	        	nui.hideMessageBox(msgBoxId);
	        	if(data.exception) {
	        		clog(data.exception.message);
	        		nui.alert(data.exception.message);
	        	}
	        	else {
	        		if(params.success) {
	        			params.success(data);
	        		}
	        	}
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
				if(params.error) {
	        		params.error(jqXHR, textStatus, errorThrown);
	        	}
	        	nui.hideMessageBox(msgBoxId);
	        }
	    });
	}
	 
	
	function ajaxCommonWithoutMsgBox(params){
		nui.ajax({
	        url: params.url,
	        data: params.data,
	        type: 'POST',
	        cache: false,
	        contentType: 'text/json',
	        success: function (data) {
	        	if(data.exception) {
	        		clog(data.exception.message);
	        		nui.alert(data.exception.message);
	        	}
	        	else {
	        		if(params.success) {
	        			params.success(data);
	        		}
	        	}
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
				if(params.error) {
	        		params.error(jqXHR, textStatus, errorThrown);
	        	}
	        }
	    });
	}
	 
	 // 获取用户对象(同步)
	 function ajaxGetUserObject(params, showMsgBox) {
	 	var msgBoxId = nui.loading("正在处理...", "请稍后");
		nui.ajax({
	        url: "com.eos.xiancommon.userObject.getUserObject.biz.ext",
	        type: 'POST',
	        async: false,
	        cache: false,
	        contentType: 'text/json',
	        success: function (data) {
	        	nui.hideMessageBox(msgBoxId);
	        	params.success(data.userObject);
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	        	nui.hideMessageBox(msgBoxId);
	        	params.error();
	        }
	    });
	}
	
	function ajaxGetEmpId() {
		var userId;
		
		ajaxGetUserObject({
			"success": function(userObject) {
				userId = userObject.userId;	
			}
		});
		
		return userId;
	}
	
	function isSysadmin() {
		var userId = ajaxGetEmpId();
		if(userId == 1) {
			return true;
		}
		else {
			return false;
		}
	}
	
	function sysadminBug(callback) {
		if(isSysadmin()) {
			if(callback) {
				callback();
			}
		}
	}
	
	function ajaxGetUserName() {
		var userName;
		
		ajaxGetUserObject({
			"success": function(userObject) {
				userName = userObject.userRealName;	
			}
		});
		
		return userName;
	}
	
	//////////////////////////////////////////
	// 
	//            ————表单控件————
	// 
	/////////////////////////////////////////
	// 设置表单只读
	function setFormReadonly(form) {
		var fields = form.getFields();
        for (var i = 0, l = fields.length; i < l; i++) {
            var c = fields[i];
            if(c.setReadOnly) c.setReadOnly(true);
            if(c.setBorderStyle) c.setBorderStyle("border-left:0;border-right:0;border-top:0;");
        }
        nui.repaint(document.body);
	}
	// 设置表单
	function setFormEnable(form) {
		var fields =  form.getFields();
        for (var i = 0, l = fields.length; i < l; i++) {
            var c = fields[i];
            if(c.setReadOnly) c.setReadOnly(false);
        }
        nui.repaint(document.body);
	}
	function setFormReadonlyForPrint(form) {
		var fields = form.getFields();
        for (var i = 0, l = fields.length; i < l; i++) {
            var c = fields[i];
            if(c.setReadOnly) c.setReadOnly(true);
            if(c.setBorderStyle) c.setBorderStyle("border:0;border-bottom:solid 1px #000000;");
        }
        nui.repaint(document.body);
	}
	function setFormReadonlyForPrintWithOutBorder(form) {
		var fields = form.getFields();
        for (var i = 0, l = fields.length; i < l; i++) {
            var c = fields[i];
            if(c.setReadOnly) c.setReadOnly(true);
            if(c.setBorderStyle) c.setBorderStyle("border:0;");
        }
        nui.repaint(document.body);
	}
	
	// 获取DataGrid的列
	function getDataGridColumns(datagrid) {
		var datagridColumns = datagrid.getColumns();
		var columns = [];
		
		for(var i = 0; i < datagridColumns.length; ++i) {
			if(datagridColumns[i].field) {
				columns.push({header: datagridColumns[i].header, field: datagridColumns[i].field});
			}
		}
		
		return columns;
	}
	
	// 导出Excel API
	function exportDataToExcel(datagrid, queryData) {
		var json = nui.encode({
			bizUrl: datagrid.getUrl().replace(".biz.ext", ""), 
			queryData: queryData, 
			columns: getDataGridColumns(datagrid)
		});
		var jsonForCount = nui.encode({
			bizUrl: datagrid.getUrl().replace(".biz.ext", ""), 
			queryData: queryData
		});
		
		ajaxCommon({
			url: "com.eos.xiancommon.exportTableToExcel.getExportCount.biz.ext",
			data: jsonForCount,
			success: function(data) {
				if(parseInt(data.total) > 5000) {
					nui.confirm("您要导出的数据超过5000条，将会需要较长时间，确认导出？", "导出确认", function(action) {
						if(action == "ok") {
							ajaxCommon({
								url: "com.eos.xiancommon.exportTableToExcel.export.biz.ext",
								data: json,
								success: function(data) {
									window.open('<%=request.getContextPath() %>/export-data/' + data.url.replace("\\", '/'));
								}
							});
						}
					})
				}
				else{
					ajaxCommon({
						url: "com.eos.xiancommon.exportTableToExcel.export.biz.ext",
						data: json,
						success: function(data) {
							window.open('<%=request.getContextPath() %>/export-data/' + data.url.replace("\\", '/'));
						}
					});
				}
			}
		})
	}
	
	// 检查按钮权限
	function checkButtonAuthorized(buttonIds, pageUrl) {
		setControlVisible(buttonIds, false);
		ajaxCommon({
			url: "com.censtar.ciss.base.sysadmin.buttonRole.checkButtonRole.biz.ext",
			data: nui.encode({"buttonIds": buttonIds}) + nui.encode({"pageUrl": pageUrl}),
			success: function(data) {
				if(data && data.buttonRoles) {
					for(var i = 0; i < data.buttonRoles.length; ++i) {
						nui.get(data.buttonRoles[i].buttonId).setVisible(data.buttonRoles[i].authorized);
					}
				}
			}
		});
	}
	
	// 设置控件只读
	function setControlReadonly(control) {
        if(control.setReadOnly) control.setReadOnly(true);
        if(control.setBorderStyle) control.setBorderStyle("border-left:0;border-right:0;border-top:0;");
	}
	// 设置控件可用
	function setControlDisreadonly(control) {
        if(control.setReadOnly) control.setReadOnly(false);
        if(control.setBorderStyle) control.setBorderStyle("border:solid 1px #909aa6;");
	}
	function setControlReadonlyByName(ctrlName) {
		var control = nui.getbyName(ctrlName);
		setControlReadonly(control);
	}
	function setDataGridReadonly(grid) {
		grid.set({
			allowCellEdit: false,
			allowCellSelect: false
		});
	}
	function setControlEnabled(ctrlId, enabled) {
		var control = nui.get(ctrlId);
		control.setEnabled(enabled);
	}
	// 设置控件是否必选
	function setControlRequired(nameOrId, required) {
		if(nameOrId) {
			var ctrl = nui.getbyName(nameOrId);
			
			if(!ctrl) {
				ctrl = nui.get(nameOrId);
			}
			
			if(!ctrl) return;
			if(ctrl.setRequired) {
				ctrl.setRequired(required);
			}
		}
	}
	// 设置控件值
	function setControlValue(ctrlName, value) {
		var ctrl;
		
		ctrl = nui.getbyName(ctrlName);
		if(!ctrl) ctrl = nui.get(ctrlName);
		if(!ctrl) return;
		
		if(ctrl.setValue) {
			ctrl.setValue(value);
		}
	}
	function setControlText(ctrlName, text) {
		nui.getbyName(ctrlName).setText(text);
	}
	function setControlValueAndText(ctrlName, text) {
		setControlValue(ctrlName, text);
		setControlText(ctrlName, text);
	}
	// 获取控件值
	function getControlValue(ctrlName) {
		return nui.getbyName(ctrlName).getValue();
	}
	// 绑定控件单击事件
	function onControlClick(ctrlId, handler) {
		nui.get(ctrlId).on("click", handler);
	}
	// 验证表单并设置错误字段焦点
	function validateForm(form) {
		form.validate();
		if(!form.isValid()) {
			var errorCtrls = form.getErrors();
			if(errorCtrls && errorCtrls.length > 0) {
				if(errorCtrls[0].focus) {
					errorCtrls[0].focus();
				}
			}
		}
	}
	// 激活页签
	function activeTab(tabsId, indexOrName) {
		var tabs = nui.get(tabsId);
		tabs.activeTab(tabs.getTab(indexOrName));
	}
	// 移除页签
	function removeTab(tabsId, indexOrName) {
		if(nui.get(tabsId).getTab(indexOrName)){
			nui.get(tabsId).removeTab(indexOrName);
		}
	}
	// 移除包含指定字符的页签
	function removeTabByTitleString(tabsId, queryString) {
		var i = 0;
		var tabs = nui.get(tabsId);
		
		for(var i = 0; i < 50; ++i) {
			var tab = tabs.getTab(i);
			if(tab) {
				if(tab.title.indexOf(queryString) >= 0) {
					tabs.removeTab(i);
					break;
				}
			}
			else {
				break;
			}
		}
	}
	// 添加标签到指定位置
	function addTab(tabsId, title, url, index) {
		var tabs = nui.get(tabsId);
		var tab = {title: title, name: title, url: url};
		
		if(index) {
			tabs.addTab(tab, index);
		}
		else {
			tabs.addTab(tab);
		}
		
		var addedTab = tabs.getTab(title);
		tabs.loadTab(url, addedTab);
	}
	
	// 移除DataGrid中已经存在的数据(根据id判断)
	function removeDatagridData(datagrid, data, columnNameData, columnNameGrid) {
		if(!datagrid) return;
		
		var datagridData = datagrid.getData();
		var resultData = [];
		var hasTheRow = false;
		
		for(var i = 0; i < datagridData.length; ++i) {
			for(var j = 0; j < data.length; ++j) {
				if(datagridData[i][columnNameData] == data[j][columnNameGrid]) {
					hasTheRow = true;
					break;
				}
				else {
					hasTheRow = false;
				}
			}
			if(!hasTheRow) {
				resultData.push(datagridData[i]);
				hasTheRow = false;
			}
		}
		
		datagrid.setData(resultData);
	}
	// 批量设置是否可见
	function setControlVisible(ctrls, visible) {
		for(var i = 0; i < ctrls.length; ++i) {
			nui.get(ctrls[i]).setVisible(visible);
		}
	}
	// 批量设置是否可用
	function setControlEnable(ctrls, enable) {
		for(var i = 0; i < ctrls.length; ++i) {
			nui.get(ctrls[i]).setEnabled(enable);
		}
	}
	
	// 添加审批tab
	function addApproveDtlTab(tabs, processInstId, index) {
		var url = nui.context + "base/approve_dtl/approve_dtl_list.jsp?processInstId=" + processInstId;
		ajaxCommon({
			url: "com.censtar.ciss.wf.approveDtl.count.biz.ext",
			data: nui.encode({pid: processInstId}),
			async: false,
			success: function(data) {
				var title = "审批信息";
				title += '[<span style="color:#0000FF;">' + data.total + "</span>]";
				addTab(tabs, title, url, index);
			}
		});
	}
	function addApproveDtlTabByBizId(tabs, bizId, index) {
		ajaxCommon({
			url: "com.censtar.ciss.wf.wfBiz.getProcessInstIdByBizId.biz.ext",
			data:nui.encode({"bussId":bizId}),
			async: false,
			success: function(data) {
				addApproveDtlTab(tabs, data.processInstId, index);
			}
		});
	}
	
	//添加流程图
	function addLiuChengTu(tabs, processInstId, index) {
		var url = nui.context + "/coframe/workclient/graph.jsp?processInstID=" + processInstId;
		addTab(tabs, "流程图[" + processInstId + "]", url, index);
	}
	// 根据业务ID加载流程图
	function addLiuChengTuByBizId(tabs, bizId, index) {
		ajaxCommon({
			url: "com.censtar.ciss.wf.wfBiz.getProcessInstIdByBizId.biz.ext",
			data:nui.encode({"bussId":bizId}),
			async: false,
			success: function(data) {
				addLiuChengTu(tabs, data.processInstId, index);
			}
		});
	}
	
	// 添加电子签名
	function addSignature(tabs, bizId, index) {
		var url = nui.context + "/service/workorder/signature/signature_view.jsp?id=" + bizId;
		addTab(tabs, "客户签名", url, index);
	}
	
	// 添加附件
	// @params bizId 业务id
	// @params editEnabled 是否可上传、删除
	// @parmas showCount 是否显示数量
	// @params deleteEnabled 是否允许删除
	function addAttachment(tabs, bizId, editEnabled, showCount, deleteEnabled, index) {
		var url = nui.context + "/xiancommon/resources/fileupload/attachment_list.jsp?bizId=" + bizId;
		if(editEnabled) {
			url += "&enabled=" + editEnabled;
			if(deleteEnabled) {
				url += "&d=" + true;
			}
		}
		
		if(showCount) {
			ajaxCommon({
				url: "com.eos.xiancommon.attachment.count.biz.ext",
				data: nui.encode({bizId: bizId}),
				async: false,
				success: function(data) {
					var title = "附件";
					title += '[<span style="color:#0000FF;">' + data.count + "</span>]";
					addTab(tabs, title, url, index);
				}
			});
		}
		else {
			addTab(tabs, "附件", url, index);
		}
		
	}
	
	/**
	 * 显示页签中内容数量
	 * @param tabsId 页签组件id
	 * @params tabName 页签名称
	 * @params count 数量
	 */
	function showTabCount(tabsId, tabName, title, count) {
		var tabs = nui.get(tabsId);
		var tab = tabs.getTab(tabName);
		tabs.updateTab(tab, {title: title + '[<span style="color:#0000FF;">' + count + "</span>]"});
	}
	
	//////////////////////////////////////////
	// 
	//            ————运算————
	// 
	/////////////////////////////////////////
	function addFloat(num1, num2) {
		if(!num1) num1 = 0;
		if(!num2) num2 = 0;
		num1 = parseFloat(num1);
		num2 = parseFloat(num2);
		
		return parseFloat(num1 + num2).toFixed(2);
	}
	
	function subFloat(num1, num2) {
		if(!num1) num1 = 0;
		if(!num2) num2 = 0;
		num1 = parseFloat(num1);
		num2 = parseFloat(num2);
		
		return parseFloat(num1 - num2).toFixed(2);
	}
	
	function mulFloat(num1, num2) {
		if(!num1) num1 = 0;
		if(!num2) num2 = 0;
		num1 = parseFloat(num1);
		num2 = parseFloat(num2);
		
		return parseFloat(num1 * num2).toFixed(2);
	}
	
	function divFloat(num1, num2) {
		num1 = parseFloat(num1);
		num2 = parseFloat(num2);
		
		return parseFloat(num1 / num2).toFixed(2);
	}
	function addInt(num1, num2) {
		num1 = parseInt(num1, 10);
		num2 = parseInt(num2, 10);
		
		return parseInt(num1 + num2);
	}
	function subInt(num1, num2) {
		num1 = parseInt(num1, 10);
		num2 = parseInt(num2, 10);
		
		return parseInt(num1 - num2);
	}
	
	// 设置日期最大时间
	function setDateMaxTime(dateStr) {
		var date = nui.parseDate(dateStr);
		date.setDate(date.getDate() + 1);
		date.setHours(0);
		date.setMinutes(0);
		date.setSeconds(0);
		
		return nui.formatDate(date, "yyyy-MM-dd HH:mm:ss");	
	}
	// 设置日期最小时间
	function setDateMinTime(dateStr) {
		var date = nui.parseDate(dateStr);
		date.setDate(date.getDate());
		date.setHours(0);
		date.setMinutes(0);
		date.setSeconds(0);
		
		return nui.formatDate(date, "yyyy-MM-dd HH:mm:ss");	
	}
	// 获取两个日期之间的天数
	function getDuringDays(sDate1,  sDate2) {
//        var  aDate,  oDate1,  oDate2, iDays;
//       aDate  =  sDate1.split("-");
//        oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0]);    //转换为12-18-2002格式  
//        aDate  =  sDate2.split("-");
//        oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0]);  
		var oDate1,  oDate2, iDays;
		oDate1=Date.parse(sDate1.replace('/-/g','/'));    
		oDate2=Date.parse(sDate2.replace('/-/g','/')); 

		iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24);    //把相差的毫秒数转换为天数  
		return  iDays;
	}
	// 获取这个月的第一天
	function getFirstDayOfThisMonth() {
		var date = new Date();
		date.setDate(1);
		date.setHours(0);
		date.setMinutes(0);
		date.setSeconds(0);
		
		return nui.formatDate(date, "yyyy-MM-dd HH:mm:ss");	
	}
	// 获取这个月的最后一天
	function getLastDayOfThisMonth() {
	 	var date=new Date();
		var currentMonth = date.getMonth();
		var nextMonth = ++currentMonth;
		var nextMonthFirstDay=new Date(date.getFullYear(),nextMonth,1);
		var oneDay=1000 * 60 * 60 * 24;
		
		var lastDate = new Date(nextMonthFirstDay-oneDay);
		lastDate.setHours(23);
		lastDate.setMinutes(59);
		lastDate.setSeconds(59);
		
		return nui.formatDate(lastDate, "yyyy-MM-dd HH:mm:ss");	
	}
	// 获取上个月的第一天
	function getFirstDayOfPreviousMonth() {
		var date = new Date();
		// 设置为本月第一天
		date.setDate(1);
		date.setHours(0);
		date.setMinutes(0);
		date.setSeconds(0);
		// 设置为上月最后一天
		date.setTime(date.getTime() - 3600);
		date.setDate(1);
		date.setHours(0);
		date.setMinutes(0);
		date.setSeconds(0);
		
		return nui.formatDate(date, "yyyy-MM-dd HH:mm:ss");	
	}
	// 获取上个月的最后一天
	function getLastDayOfPreviousMonth() {
		var date = new Date();
		// 设置为本月第一天
		date.setDate(1);
		date.setHours(0);
		date.setMinutes(0);
		date.setSeconds(0);
		// 设置为上月最后一天
		date.setTime(date.getTime() - 3600);
		date.setHours(23);
		date.setMinutes(59);
		date.setSeconds(59);
		
		return nui.formatDate(date, "yyyy-MM-dd HH:mm:ss");	
	}
	
	//页面生成UUID
	function getUUID() {
	    function S4() {
	       return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
	    }
	    return (S4()+S4()+S4()+S4()+S4()+S4()+S4()+S4());
	}
	
	//获取流程实例ID
	function ajaxGetProcessInstIdByBizId(params) {
		params.url = "com.censtar.ciss.wf.wfBiz.getProcessInstIdByBizId.biz.ext";
		ajaxCommon(params);
	}
	
	// 设置为空时默认值
	function setNullDefaultNum(num, defaultValue) {
		if(typeof(num) == "undefined") {
			return defaultValue;
		}	
		else if(num === null) {
			return defaultValue;
		}
		
		return num;
	}
	
	// 作废单据
	function detachBussForm(id, callback) {
		nui.confirm("单据作废后将无法再恢复，确定作废?", "系统提示", function(action) {
			if(action == "ok") {
				ajaxCommon({
					url: "com.censtar.ciss.base.service.bussForm.detach.biz.ext",
					data: nui.encode({"id": id}),
					success: function() {
						if(callback) {
							callback();
						}
					}
				});
			}
		});
	}
		// 作废单据
	function detachBussForm1(id) {
		nui.confirm("单据作废后将无法再恢复，确定作废?", "系统提示", function(action) {
			if(action == "ok") {
				ajaxCommon({
					url: "com.censtar.ciss.base.service.bussForm.detach.biz.ext",
					data: nui.encode({"id": id}),
					success: function() {
						closeCancel();
					}
				});
			}
		});
	}
	
	var DX = function (num) {
	  var strOutput = "";
	  var strUnit = '仟佰拾亿仟佰拾万仟佰拾元角分';
	  num += "00";
	  var intPos = num.indexOf('.');
	  if (intPos >= 0)
	    num = num.substring(0, intPos) + num.substr(intPos + 1, 2);
	  strUnit = strUnit.substr(strUnit.length - num.length);
	  for (var i=0; i < num.length; i++)
	    strOutput += '零壹贰叁肆伍陆柒捌玖'.substr(num.substr(i,1),1) + strUnit.substr(i,1);
	    return strOutput.replace(/零角零分$/, '整').replace(/零[仟佰拾]/g, '零').replace(/零{2,}/g, '零').replace(/零([亿|万])/g, '$1').replace(/零+元/, '元').replace(/亿零{0,3}万/, '亿').replace(/^元/, "零元");
	};
</script>
