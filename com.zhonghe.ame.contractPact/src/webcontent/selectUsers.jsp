<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>用户选择</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div style="width: auto; height: 100%; padding: 5px; overflow: hidden;">
		<div id="form1">
			<input class="nui-hidden" name="sortField" value="empid" />
			<input class="nui-hidden" name="sortOrder" value="asc" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">员工姓名:</td>
						<td style="width: 105px">
							<input class="nui-textbox" name="criteria._expr[0].empname" onenter="onKeyEnter" style="width: 100px;" />
							<input class="nui-hidden" name="criteria._expr[0]._op" value="like" />
							<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all" />
						</td>
						<!-- <td style="width: 30px; text-align: right;">部门:</td>
						<td style="width: 105px">
							<input class="nui-hidden" name="criteria._expr[1]._property" value="orgid" />
							<input class="nui-hidden" name="criteria._expr[1]._op" value="=" id="jjj" />
							<input class="nui-hidden" name="criteria._expr[1]._ref" value="" id="kkk" />
							<input class="nui-hidden" name="criteria._ref[0]._id" value="5" />
							<input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
							<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgname" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like" />
							<input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="orgname" onvaluechanged="changeusername(e)" style="width: 100px;" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all" />
						</td> -->
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="nui-fit">
			<div id="grid1" class="nui-datagrid" style="width: 100%; height: 240px" idField="empid" dataField="omEmployees" multiSelect="true" onrowdblclick="onRowDblClick" onselect="onSelectEmp" ondeselect="onDeselectEmp">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="userid" width="80" headerAlign="center" allowSort="true">员工帐号</div>
					<div field="empname" width="80" headerAlign="center" allowSort="true">员工姓名</div>
					<div field="orgname" width="100" headerAlign="center" allowSort="true">部门名称</div>
				</div>
			</div>
		</div>

		<div style="text-align: center; padding: 5px; border-top: 0px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" style="width: 80px;" iconCls="icon-ok">确定</a>
			<a class="nui-button" onclick="onCancel()" style="width: 80px;" iconCls="icon-close">关闭</a>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var url = "com.primeton.eos.machine.machine.queryEmployee.biz.ext"
		var grid = nui.get("grid1");
		grid.setUrl(url);
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data);
		grid.sortBy("userid", "asc");
		var selectMap = new Map();
		
		function search() {
			var data = form.getData();
			grid.load(data);
		}

		function GetData() {
			return selectMap.values();
		}

		function onKeyEnter(e) {
			search();
		}

		function onRowDblClick(e) {
			onOk();
		}
		
		function onSelectEmp(e){
			row = e.record;
			selectMap.put(row.userid, row);
		}
		
		function onDeselectEmp(e){
			row = e.record;
			selectMap.remove(row.userid);
		}

		function CloseWindow(action) {
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
		}

		function onOk() {
			CloseWindow("ok");
		}

		function onCancel() {
			CloseWindow("cancel");
		}

		function changeusername(e) {
			if (!(nui.get("orgname").getValue() == "" || nui.get("orgname").getValue() == null)) {
				nui.get("jjj").setValue("in");
				nui.get("kkk").setValue("5");
			} else {
				nui.get("jjj").setValue("=");
				nui.get("kkk").setValue("");
			}
		}
		
		// 自定义Map结构对象,解决IE10以下不支持ES6语法中Map结构的情况
		function Map() {
			this.elements = new Array();
			// 获取Map元素个数
			this.size = function() {
					return this.elements.length;
				},
				// 判断Map是否为空
				this.isEmpty = function() {
					return (this.elements.length < 1);
				},
				// 删除Map所有元素
				this.clear = function() {
					this.elements = new Array();
				},
				// 向Map中增加元素（key, value)
				this.put = function(_key, _value) {
					if (this.containsKey(_key) == true) {
						if (this.containsValue(_value)) {
							if (this.remove(_key) == true) {
								this.elements.push({
									key: _key,
									value: _value
								});
							}
						} else {
							this.elements.push({
								key: _key,
								value: _value
							});
						}
					} else {
						this.elements.push({
							key: _key,
							value: _value
						});
					}
				},
				// 向Map中增加元素（key, value)
				this.set = function(_key, _value) {
					if (this.containsKey(_key) == true) {
						if (this.containsValue(_value)) {
							if (this.remove(_key) == true) {
								this.elements.push({
									key: _key,
									value: _value
								});
							}
						} else {
							this.elements.push({
								key: _key,
								value: _value
							});
						}
					} else {
						this.elements.push({
							key: _key,
							value: _value
						});
					}
				},
				// 删除指定key的元素，成功返回true，失败返回false
				this.remove = function(_key) {
					var bln = false;
					try {
						for (i = 0; i < this.elements.length; i++) {
							if (this.elements[i].key == _key) {
								this.elements.splice(i, 1);
								return true;
							}
						}
					} catch (e) {
						bln = false;
					}
					return bln;
				},

				// 删除指定key的元素，成功返回true，失败返回false
				this.delete = function(_key) {
					var bln = false;
					try {
						for (i = 0; i < this.elements.length; i++) {
							if (this.elements[i].key == _key) {
								this.elements.splice(i, 1);
								return true;
							}
						}
					} catch (e) {
						bln = false;
					}
					return bln;
				},

				// 获取指定key的元素值value，失败返回null
				this.get = function(_key) {
					try {
						for (i = 0; i < this.elements.length; i++) {
							if (this.elements[i].key == _key) {
								return this.elements[i].value;
							}
						}
					} catch (e) {
						return null;
					}
				},

				// set指定key的元素值value
				this.setValue = function(_key, _value) {
					var bln = false;
					try {
						for (i = 0; i < this.elements.length; i++) {
							if (this.elements[i].key == _key) {
								this.elements[i].value = _value;
								return true;
							}
						}
					} catch (e) {
						bln = false;
					}
					return bln;
				},

				// 获取指定索引的元素（使用element.key，element.value获取key和value），失败返回null
				this.element = function(_index) {
					if (_index < 0 || _index >= this.elements.length) {
						return null;
					}
					return this.elements[_index];
				},

				// 判断Map中是否含有指定key的元素
				this.containsKey = function(_key) {
					var bln = false;
					try {
						for (i = 0; i < this.elements.length; i++) {
							if (this.elements[i].key == _key) {
								bln = true;
							}
						}
					} catch (e) {
						bln = false;
					}
					return bln;
				},

				// 判断Map中是否含有指定key的元素
				this.has = function(_key) {
					var bln = false;
					try {
						for (i = 0; i < this.elements.length; i++) {
							if (this.elements[i].key == _key) {
								bln = true;
							}
						}
					} catch (e) {
						bln = false;
					}
					return bln;
				},

				// 判断Map中是否含有指定value的元素
				this.containsValue = function(_value) {
					var bln = false;
					try {
						for (i = 0; i < this.elements.length; i++) {
							if (this.elements[i].value == _value) {
								bln = true;
							}
						}
					} catch (e) {
						bln = false;
					}
					return bln;
				},

				// 获取Map中所有key的数组（array）
				this.keys = function() {
					var arr = new Array();
					for (i = 0; i < this.elements.length; i++) {
						arr.push(this.elements[i].key);
					}
					return arr;
				},

				// 获取Map中所有value的数组（array）
				this.values = function() {
					var arr = new Array();
					for (i = 0; i < this.elements.length; i++) {
						arr.push(this.elements[i].value);
					}
					return arr;
				};

			/**
			 * map遍历数组
			 * @param callback [function] 回调函数；
			 * @param context [object] 上下文；
			 */
			this.forEach = function forEach(callback, context) {
				context = context || window;

				//IE6-8下自己编写回调函数执行的逻辑
				var newAry = new Array();
				for (var i = 0; i < this.elements.length; i++) {
					if (typeof callback === 'function') {
						var val = callback.call(context, this.elements[i].value, this.elements[i].key, this.elements);
						newAry.push(this.elements[i].value);
					}
				}
				return newAry;
			}

		}		
	</script>
</body>
</html>