<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-07-02 13:50:55
  - Description:
-->
<head>
<title>修改信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<form id="form1" method="post" >
		<input name="server.servid" id="servId" class="nui-hidden" />
		<input id="server.misServuserinfos" class="nui-hidden" />
		<input id="server.misServapps" class="nui-hidden" />
		<input id="server.misServdbs" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>基本信息</legend>
        	<div>
            	<table>
	                <tr>
                    	<td  align="right">服务器名称：</td>
	                    <td >    
	                        <input name="server.servname" id=servname class="nui-textbox" required="true"/>
	                    </td> 
	                    <td align="right">服务器类型：</td>
	                     <td >    
	                       <input name="server.servtype" id=servtype class="nui-dictcombobox" dictTypeId="MIS_SERVTYPE" required="true" onvaluechanged="onNameFilterChanged(this.value)">
	                     </td>
	                     <td align="right">服务器IP：</td>
	                    <td>    
	                        <input name="server.servip" allowInput="true"  class="nui-textbox" required="true"/>	                        
	                     </td>
                     </tr>   	                     
	                 <tr>        
	                   <td align="right">服务器硬盘(GB)：</td>
	                    <td >    
	                       <input name="server.servhardware"class="nui-textbox"/>
	                    </td>    
	                    <td align="right">服务器内存(GB)：</td>
	                    <td >    
	                        <input name="server.servmemory" class="nui-textbox"/>
	                    </td>
	                    <td align="right">服务器CPU(个)：</td>
	                    <td >    
	                        <input name="server.servcpu" class="nui-textbox"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td align="right">服务器负责人：</td>
	                    <td >    
	                      <input name="server.servuserid" allowInput="false" id=servusername onbuttonclick="showEmployee" class="nui-buttonedit"/>
	                     
	                    </td>
	                    <td align="right">录入人：</td>
						<td>
							<input id="insertuser" name="server.insertuser" class="nui-textbox" required="true" allowInput="true"/>							
						</td>
				 
						 <td align="right">录入日期：</td>
						<td>
							<input name="server.insertdate"class="nui-datepicker" id="insertdate" required="true" allowInput="true"/>
						</td>
					</tr>
					<tr> 
						<td align="right">服务器操作系统：</td>
	                    <td >    
	                       <input name="server.servos" allowInput="true"  class="nui-textbox" required="true"/>
	                    </td> 
						<td align="right">服务器MAC地址：</td>
	                    <td >    
	                        <input name="server.servmacid" class="nui-textbox"/>
	                    </td>
                    </tr>
                    <tr>	
						<td align="right">最后修改人：</td>
						<td>
							<input id="lastmoduser" name="server.lastmoduser" class="nui-textbox" required="true" allowInput="true"/>							
						</td>
						<td align="right">最后修改日期：</td>
						<td>
							<input name="server.lastmoddate"class="nui-datepicker" id="lastmoddate" required="true" allowInput="true"/>
						</td>	
					</tr>		
                    <tr>
	                    <td id=temp1 align="right">对应资产编号：</td>
	                    <td id=temp2 >    
	                      <input name="server.assetid" allowInput="false" id="assetnum" onbuttonclick="showAssetnum" class="nui-buttonedit"/>
	                    </td>
	                    <td id=temp3 align="right">对应实体服务器：</td>
	                    <td id=temp4 >    
	                      <input name="server.exservid" allowInput="false" id="exserver" onbuttonclick="showExserver" class="nui-buttonedit"/>	                      
	                      
	                    </td>
						<td id=temp5 align="right">机柜号：</td>
						<td id=temp6>
							<input id="cabinet" name="server.cabinet" class="nui-textbox" allowInput="true"/>
						</td>
					</tr>					
                    <tr>
						<td align="right">服务器主要用途：</td>
	                     <td colspan="5">    
	                        <input name="server.servuse" class="nui-textbox" style="width:403px;" allowInput="true" required="true"/>
	                     </td>
                     </tr>
                     <tr>
	                     <td align="right">服务器用途描述：</td>
	                     <td colspan="5">    
	                        <input name="server.servusecomm" class="nui-textarea" style="width:403px;" allowInput="true"/>
	                     </td>
                     </tr>
                     <tr>
	                    <td align="right">备注：</td>
						<td colspan="5">
							<input id="bookername" name="server.remark" class="nui-textarea" style="width:403px;" allowInput="true"/>
						</td>	
					</tr>					
				</table>
			</div>
		</fieldset>
	</form>	
		<div class="nui-tabs" id="tab1" activeIndex="0" style="width:100%;height:220px;">
        <div title="服务器登录用户信息">
      		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
              <tr>
       			<td style="width:100%;">
               		 服务器登录用户信息表
                </td>
                <td>
                  <a class="nui-button "  iconCls="icon-add" onclick="gridAddRow('grid_0')"  plain="true" tooltip="增加">
                    &nbsp;
                  </a>
                </td>
                <td>
                  <a class="nui-button " iconCls="icon-remove" onclick="gridRemoveRow('grid_0')"  plain="true" tooltip="删除">
                    &nbsp;
                  </a>
                </td>
              </tr>
            </table>
          </div>
          <div id="grid_0" class="nui-datagrid" style="width:100%;height:150px;" showPager="false" sortMode="client"  dataField="server.misServuserinfos" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
            <div property="columns">
              <div type="checkcolumn">
              </div>
              <div field="servname" width="40px">
               	服务器登录用户名
                <input class="nui-textbox" property="editor"/>
              </div>
              <div field="servpassword" width="40px">
               	服务器登录密码
                <input class="nui-textbox" type=password property="editor"/>
              </div>
              <div field="remark" width="100px">
               	备注
                <input class="nui-textbox" property="editor"/>
              </div>
            </div>
          </div>
        </div>
        <div title="服务器应用信息">
          <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
              <tr>
               <td style="width:100%;">
                服务器应用信息表
                </td>
                <td >
                  <a class="nui-button "  iconCls="icon-add" onclick="gridAddRow('grid_1')"  plain="true" tooltip="增加">
                    &nbsp;
                  </a>
                </td>
                <td >
                  <a class="nui-button " iconCls="icon-remove" onclick="gridRemoveRow('grid_1')"  plain="true" tooltip="删除">
                    &nbsp;
                  </a>
                </td>
              </tr>
            </table>
          </div>
          <div id="grid_1" class="nui-datagrid" style="width:100%;height:150px;" showPager="false" sortMode="client" dataField="server.misServapps" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
            <div property="columns">
              <div type="checkcolumn">
              </div>
               <div field="appchname" width="140px">
               	应用中文名称
                <input class="nui-textbox" property="editor"/>
              </div>
              <div field="appinstallpath" width="150px">
               	应用安装路径
                <input class="nui-textbox" property="editor"/>
              </div>
              <div field="appaccessoutpath" width="120px">
               	应用外网访问地址
                <input class="nui-textbox" property="editor"/>
              </div>
              <div field="appaccessinnerpath" width="250px">
               	应用内网访问地址
                <input class="nui-textbox" property="editor"/>
              </div>
              <div field="appport" width="60px">
               	应用端口号
                <input class="nui-textbox" property="editor"/>
              </div>
              <div field="appname" width="50px">
               	应用名
                <input class="nui-textbox" property="editor"/>
              </div>
              <div field="governorpwd" width="90px">
               	GOVERNOR密码
                <input class="nui-textbox" property="editor"/>
              </div>
              <div field="adminuser" width="80px">
               	管理员用户名
                <input class="nui-textbox" property="editor"/>
              </div>
              <div field="adminpwd" width="60px">
               	管理员密码
                <input class="nui-textbox" property="editor"/>
              </div>
              <div field="ishavebak" width="60px" renderer="getIshavebak">
               	是否有备份
                <input class="nui-dictcombobox" dictTypeId="ABF_YESORNO" property="editor"/>
              </div>
              <div field="appbakpath" width="100px">
               	备份文件存放路径
                <input class="nui-textbox" property="editor"/>
              </div>
              <div field="baktype" width="60px" renderer="getBaktype">
               	备份机制
                <input class="nui-dictcombobox" dictTypeId="MIS_BAKTYPE" property="editor"/>
              </div>
               <div field="appuse" width="80px">
               	应用主要用途
                <input class="nui-textbox" property="editor"/>
              </div>
            </div>
          </div>
        </div>
         <div title="服务器数据库信息">
          <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
              <tr>
               <td style="width:100%;">
                服务器数据库信息
                </td>
                <td>
                  <a class="nui-button "  iconCls="icon-add" onclick="gridAddRow('grid_2')"  plain="true" tooltip="增加">
                    &nbsp;
                  </a>
                </td>
                <td>
                  <a class="nui-button " iconCls="icon-remove" onclick="gridRemoveRow('grid_2')"  plain="true" tooltip="删除">
                    &nbsp;
                  </a>
                </td>
              </tr>
            </table>
          </div>
          <div id="grid_2" class="nui-datagrid" style="width:100%;height:150px;" showPager="false" sortMode="client"  dataField="server.misServdbs" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
            <div property="columns">
              <div type="checkcolumn">
              </div>
               <div field="dbtype" width="70px" renderer="getDbtype">
               	数据库类型
                <input class="nui-dictcombobox" dictTypeId="MIS_DBTYPE" property="editor"/>
               </div>
               <div field="dbversion" width="80px">
              	 数据库版本号
                <input class="nui-textbox" property="editor"/>
               </div>
               <div field="dbinstallpath" width="90px">
               	数据库安装路径
                <input class="nui-textbox" property="editor"/>
               </div>
               <div field="dbport" width="80px">
               	数据库端口号
                <input class="nui-textbox" property="editor"/>
               </div>
               <div field="dbname" width="60px">
               	数据库名
                <input class="nui-textbox" property="editor"/>
               </div>
               <div field="dbuser" width="80px">
               	数据库用户名
                <input class="nui-textbox" property="editor"/>
               </div>
               <div field="dbpassword" width="70px">
               	数据库密码
                <input class="nui-textbox" property="editor"/>
               </div>
               <div field="dbuse" width="90px">
               	数据库主要用途
                <input class="nui-textbox" property="editor"/>
               </div>
               <div field="isautobak" width="80px" renderer="getIsautobak">
               	是否自动备份
                 <input class="nui-dictcombobox" dictTypeId="ABF_YESORNO" property="editor"/>
               </div>
               <div field="dbbakpath" width="80px">
               	备份存放路径
                <input class="nui-textbox" property="editor"/>
               </div>
               <div field="baktype" width="60px" renderer="getBaktype">
               	备份机制
                <input class="nui-dictcombobox" dictTypeId="MIS_BAKTYPE" property="editor"/>
               </div>            
            </div>
          </div>
        </div>
      </div>
      <div class="nui-toolbar" style="padding:0px;" borderStyle="border:0;">
        <table width="100%">
          <tr>
            <td style="text-align:center;" colspan="4">
              <a class="nui-button" iconCls="icon-save" onclick="onOk()">
                保存
              </a>
              <span style="display:inline-block;width:25px;">
              </span>
              <a class="nui-button" iconCls="icon-cancel" onclick="onCancel()">
                取消
              </a>
            </td>
          </tr>
        </table>
      </div>
  <script type="text/javascript">
      nui.parse();
      var form = new nui.Form("#form1");
      var tab1 = nui.get("tab1"); 
      var grid0 = nui.get("grid_0");
	  var grid1 = nui.get("grid_1");
	  var grid2 = nui.get("grid_2");  
      function onOk() {
            SaveData();
        }
      function gridAddRow(datagrid){
        var grid = nui.get(datagrid);
        grid.addRow({});
      }
      function gridRemoveRow(datagrid) {
        var grid = nui.get(datagrid);
        var rows = grid.getSelecteds();
        if (rows.length > 0) {
          grid.removeRows(rows, true);
        }
      }
	  function getIshavebak(e){
	  	return nui.getDictText('ABF_YESORNO',e.value);//设置业务字典值
	  }
	   function getIsautobak(e){
	  	return nui.getDictText('ABF_YESORNO',e.value);//设置业务字典值
	  }
	  function getBaktype(e){
	  	return nui.getDictText('MIS_BAKTYPE',e.value);//设置业务字典值
	  }
	  function getDbtype(e){
	  	return nui.getDictText('MIS_DBTYPE',e.value);//设置业务字典值
	  }	  
      function gridReload(datagrid){
        var grid = nui.get(datagrid);
        grid.reload();
      } 
      function setData(data){
        data = nui.clone(data);  
        var json = {server: {servid: data.servid}};     
        nui.ajax({
          url:"com.primeton.eos.server.servercomponent.getServer.biz.ext",
          type:'POST',
          data:json,
          cache:false,
          contentType:'text/json',
          success:function(o){  	         
            	nui.parse();
            	nui.get("grid_0").loadData(o.server.misServuserinfos);
    			nui.get("grid_1").loadData(o.server.misServapps);
    			nui.get("grid_2").loadData(o.server.misServdbs);     
            	var temp1=nui.get("assetnum");
            	var temp2=nui.get("servname");
            	var temp3=nui.get("cabinet");
            	var temp4=nui.get("servusername");
            	var temp5=nui.get("exserver");
	            temp1.setValue(o.server.assetid);
	            temp1.setText(o.server.assetnum);
	            temp2.setValue(o.server.servname);		            		   
	            temp3.setValue(o.server.cabinet);	           
	            temp4.setText(o.server.servusername);
	            temp5.setValue(o.server.exservid);	           
	            temp5.setText(o.server.exserver);
            	showEmpAndOrg(o.server.servtype);
            form.setData(o);
            form.setChanged(false);
            nui.get("lastmoddate").setValue(new Date());
            nui.get("insertdate").disable();
            nui.get("insertuser").disable();           
            nui.get("lastmoduser").disable();
        	nui.get("lastmoddate").disable();
        	nui.get("servtype").disable(); 
             <%
       		UserObject user = (UserObject) session.getAttribute("userObject");
       		String username = user.getUserName();
       		String userno = user.getUserId();
        %>
        		nui.getbyName("server.lastmoduser").setValue('<%=userno %>');
        		nui.getbyName("server.lastmoduser").setValue('<%=username %>'); 	           
          }
          });
         
        }      
       function SaveData() {		
    	var servId = nui.get("servId").getValue();    	
		var saveURL = "com.primeton.eos.server.servercomponent.updateServer.biz.ext";
		var data1 = grid0.getData();
       	var data2 = grid1.getData();
       	var data3 = grid2.getData();
		var o = form.getData();
		o.server.misServuserinfos = data1;
       	o.server.misServapps = data2;
       	o.server.misServdbs = data3;	
        var json = nui.encode(o);
        nui.ajax({
            url: saveURL,
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	var returnJson = nui.decode(text);
              if(returnJson.exception == null){
                CloseWindow("saveSuccess");
              }else{
                nui.alert("保存失败", "系统提示", function(action){
                  if(action == "ok" || action == "close"){
                    //CloseWindow("saveFailed");
                  }
                  });
                }            
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow("error");
            }
        });
    }
          function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        function onCancel(e) {
            CloseWindow("cancel");
        }
        function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.userid);
		                btnEdit.setText(data.empname);       		                
					}
				}
				nui.get("servusername").validate();
			}
		});
	}
	 function showAssetnum(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/server/MIS_selectAssetnum.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.id);
		                btnEdit.setText(data.assetnum);   
					}
				}
				nui.get("assetnum").validate();				
			}
		});
	}
	function showExserver(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/server/MIS_selectExserver.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.servid);
		                btnEdit.setText(data.servname);		                
					}
				}
				nui.get("exserver").validate();				
			}
		});
	}
	function onNameFilterChanged(e){
    	var tempType=e;
    	showEmpAndOrg(tempType);
    }
     function showEmpAndOrg(tempType){
    	if(tempType == 1){   		
			document.getElementById("temp1").style.display = "";
			document.getElementById("temp2").style.display = "";
			document.getElementById("temp3").style.display = "none";
			document.getElementById("temp4").style.display = "none";
			document.getElementById("temp5").style.display = "";
			document.getElementById("temp6").style.display = "";			
			nui.get("assetnum").setValue("");
			nui.get("exserver").setValue("");
			nui.get("cabinet").setValue("");
		
    	} else {
    		document.getElementById("temp1").style.display = "none";
			document.getElementById("temp2").style.display = "none";
			document.getElementById("temp3").style.display = "";
			document.getElementById("temp4").style.display = "";
			document.getElementById("temp5").style.display = "none";
			document.getElementById("temp6").style.display = "none";			
			nui.get("assetnum").setValue("");
			nui.get("exserver").setValue("");
			nui.get("cabinet").setValue("");			
    	} 
    }
      </script>  
</body>
</html>