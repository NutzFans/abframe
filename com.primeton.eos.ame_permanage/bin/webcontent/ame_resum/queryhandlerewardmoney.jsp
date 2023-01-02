<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-04-20 11:39:24
  - Description:
-->
<head>
<title>queryhandlerewardmoney</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	内推奖励查询与管理
                    </td>
                </tr>
             </table>           
        </div>
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<table>
    		<tr>
			 	<td align="right"  style="width:50px;">推荐人：</td>
			 	<td>
			 		<input class="nui-hidden" name="criteria._expr[0]._property" value="referrername" />
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
			        <input class="nui-textbox" name="criteria._expr[0]._value" style="width:100px;" id="emp" />
					<input class="nui-hidden" name="criteria._expr[1]._property" value="referrer" />
					<input class="nui-hidden" name="criteria._expr[1]._op" value="="/>	
					<input class="nui-hidden" name="criteria._expr[1]._value" id="referrer" />
			    </td>
			    <td align="right" style="width:90px;" ><span>受益部门：</span></td>
				<td align="left">
				    <input name="criteria._expr[2]._value" class="nui-combobox" style="width: 200px" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs"  shownullItem="true" allowInput="true" />
					<input class="nui-hidden" name="criteria._expr[2]._property" value="orgseq"/>
		 		 	<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
		 		 	<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="end"/>
                    
                    <input class="nui-hidden" name="criteria._expr[3]._property" value="benefitorgid"/>
			        <input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
			        <input class="nui-hidden" name="criteria._expr[3]._value" id="benefitorgids"/>
				</td>
				<td align="right" style="width:90px;">产生时间：</td>
            	<td align="left">
            		<input class="nui-datepicker" id="min1" name="criteria._expr[4]._min" style="width:98px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="criteria._expr[4]._max" style="width:98px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="criteria._expr[4]._property" value="createdate"/>
		 		 	<input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
				</td>
				<td align="right" style="width:110px;">招聘需求编号：</td>
				<td align="left">
			        <input name="criteria._expr[5]._value" style="width:120px;" class="nui-textbox" allowInput="true" />
	            	<input class="nui-hidden" name="criteria._expr[5]._property" value="recruitno"/>
			        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					<input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
				</td>
    		</tr>
    		<tr>
    		    <td align="right" style="width:100px;">处理状态：</td>
            	<td align="left">
            	    <input class="nui-dictcombobox" name="criteria._expr[6]._value" style="width:100px" id="rewardstatus" showNullItem="true"  dictTypeId="AME_REWARDSTATUS" multiselect="true">
		 		 	<input class="nui-hidden" name="criteria._expr[6]._property" value="rewardstatus"/>
		 		 	<input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
				</td>
		 		<td align="right">推荐人部门：</td>
                <td align="left"> 
                   <input class="nui-hidden" name="criteria._expr[7]._property" value="referrerorgid"/>
			       <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
                   <input class="nui-combobox" name="criteria._expr[7]._value"  style="width: 200px" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
					textField="orgname" valueField="orgid" dataField = "allorgs" valueFromSelect="true" allowInput="true"/>  
                </td>
			    <td align="right">发放日期：</td>
            	<td align="left">
				    <input class="nui-datepicker" id="min3" name="criteria._expr[8]._min" style="width:98px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max3" name="criteria._expr[8]._max" onenter="onKeyEnter" style="width:98px"/>
		 		 	<input class="nui-hidden" name="criteria._expr[8]._property" value="paydate"/>
                    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
				</td>
				<td align="right" style="width:100px;">奖励事件：</td>
            	<td align="left">
            	    <input class="nui-dictcombobox" name="criteria._expr[9]._value" style="width:120px" id="eventtype" showNullItem="true"  dictTypeId="REFFER_EVENTTYPE" multiselect="true">
		 		 	<input class="nui-hidden" name="criteria._expr[9]._property" value="eventtype"/>
		 		 	<input class="nui-hidden" name="criteria._expr[9]._op" value="in"/>
				</td>
    		</tr>
    		<tr>
    		   <td align="right"  style="width:50px;">被推荐人：</td>
			   <td>
			 		<input class="nui-hidden" name="criteria._expr[10]._property" value="empname" />
			        <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
			        <input class="nui-textbox" name="criteria._expr[10]._value" style="width:100px;"  />
			   </td>
			   <td align="right"  style="width:50px;">确认发放人：</td>   
			   <td>
			 		<input class="nui-hidden" name="criteria._expr[11]._property" value="payempname" />
			        <input class="nui-hidden" name="criteria._expr[11]._op" value="like"/>
			        <input class="nui-textbox" name="criteria._expr[11]._value" style="width:100px;"  />
			   </td>
			</tr>
    		<tr>
    			<td align="center" colspan="8">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
    			</td>
    		</tr>
    	</table>
    </div>
</div>
<div style="width:100%;">
<div class="nui-toolbar"  style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a  id="queryhandlerewardmoney_addbutton" class="nui-button" iconCls="icon-add" onclick="addReward()">新增奖励</a>
	                        <a  id="queryhandlerewardmoney_editbutton" class="nui-button" iconCls="icon-edit" onclick="editReward()">奖励编辑</a>
	                        <a  id="queryhandlerewardmoney_surebutton" class="nui-button" iconCls="icon-ok" onclick="sureReward()">奖励确认</a>
	                        <a  id="queryhandlerewardmoney_cancelbutton" class="nui-button" iconCls="icon-cancel" onclick="cancelReward()">奖励取消</a>
	                        <a  id="queryhandlerewardmoney_surepaybutton" class="nui-button" iconCls="icon-ok" onclick="surepayReward()">确认奖励发放</a>
			                <a class="nui-button" id="queryhandlerewardmoney_export" iconCls="icon-download" onclick="exportReferrerReward()">导出内推奖励信息</a>
				        </td>
	                </tr>
	            </table>           
	       </div>
</div>
<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true" frozenStartColumn="0" frozenEndColumn="6"
    dataField="queryhandlerewardmoney" multiSelect="true" pageSize="20" sizeList="[10,20,50,100,200,500]" allowAlternating="true"
    url='com.primeton.eos.ame_permanage.ame_becomeregulae.queryhandlerewardmoney.biz.ext'>
    <div property="columns">
    	<div type="checkcolumn" width="22"></div>
    	<div field="referrername" headerAlign="center" align="center" width="75">推荐人</div>
    	<div field="eventtype" name = "eventtype" width="90px" headerAlign="center" align="center" renderer="eventType">奖励事件 </div>
      	<div field="rewardmoney" headerAlign="center" align="right"  width="80" dataType="currency" summaryType="sum">奖励金额</div>
      	<div field="rewardstatus" headerAlign="center" align="center" width="80" renderer="rewardStatus">处理状态</div>
      	<div field="recruitno" width="80" headerAlign="center" align="center" renderer="getDetail">需求编号</div>
      	<div field="position" width="80" headerAlign="center" align="center" renderer="getEmptype">员工属性</div>
      	<div field="directpersons" headerAlign="center" align="center" width="80">直属下属人数</div>
      	<div field="empname" headerAlign="center" align="center" width="80">被推荐人</div>
      	<div field="referrerorgname" headerAlign="center" align="center" width="100">推荐人所在部门</div>
      	<div field="referrersyqname" headerAlign="center" align="center" width="95">推荐人一级部门</div>
      	<div field="beneforgname" headerAlign="center" align="center" width="80">受益部门</div>
      	<div field="benefsyqname" headerAlign="center" align="center" width="80">受益一级部门</div>
      	<div field="benefsybname" headerAlign="center" align="center" width="80">受益二级部门</div>
      	<div field="sureempname" headerAlign="center" align="center" width="75">确认人</div>
    	<div field="payempname" headerAlign="center" align="center" width="80">确认发放人</div>
      	<div field="createdate" headerAlign="center" align="center" width="120" renderer = "ondealdate">产生时间</div>
      	<div field="suredate" headerAlign="center" align="center"  width="120" renderer = "ondealdate">确认时间</div>
      	<div field="surepaydate" headerAlign="center" align="center"  width="120" renderer = "ondealdate">确认发放时间</div>
      	<div field="paydate" headerAlign="center" align="center"  width="80" >发放日期</div>
      	<div field="rewardremark" headerAlign="center" align="left"  width="200" >备注</div>
    </div>
</div>
<div id="win1" class="nui-window" title="内推奖励取消备注（可不填）" style="width:300px;height:170px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div style="padding:5px;">
	    		<input name="rewardremark" id="rewardremark" class="nui-textarea" style="width: 260px;height:80px;margin-left: 10px;"/>
	    	</div>
		    <div property="footbar" style="padding:5px;margin-left: 90px;margin-top: 8px;">
		        <input type='button' value='确定' onclick="writeRemark()" style="vertical-align: bottom;"/>
		        <input type='button' value='关闭' onclick="hideWindow()" style="vertical-align: bottom;margin-left: 20px"/>
		    </div>
</div>
<div id="win2" class="nui-window" title="奖励发放日期" style="width:100px;height:120px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div style="padding:5px;">
	    		<input name="paydate" id="paydate" class="nui-datePicker" style="width: 100px;margin-left: 10px;"/>
	    	</div>
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='确定' onclick="surePaydate()" style="vertical-align: bottom;"/>
		        <input type='button' value='关闭' onclick="hideDate()" style="vertical-align: bottom;margin-left: 20px"/>
		    </div>
	  </div>
<div id="win3" class="nui-window" title="奖励编辑" style="width:100px;height:120px;"
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div style="padding:5px;">
	    		<input name="editreward" id="editreward" class="nui-textbox" style="width: 100px;margin-left: 10px;"/>
	    	</div>
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='确定' onclick="sureeditReward()" style="vertical-align: bottom;"/>
		        <input type='button' value='关闭' onclick="hideeditReward()" style="vertical-align: bottom;margin-left: 20px"/>
		    </div>
</div>	  
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
	<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
	<input type="hidden" name="downloadFile" filter="false"/>
	<input type="hidden" name="fileName" filter="false"/>
</form>
</body>
<script type="text/javascript">
	nui.parse();	
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var nowusername = '<%=nowusername %>';
	var nowuserid = '<%=nowuserid %>';
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	init();
    function init(){
            //按钮权限的控制
            getOpeatorButtonAuth("queryhandlerewardmoney_addbutton");//操作按钮权限初始化 
            getOpeatorButtonAuth("queryhandlerewardmoney_editbutton");//操作按钮权限初始化 
	        getOpeatorButtonAuth("queryhandlerewardmoney_surebutton");//操作按钮权限初始化 
	        getOpeatorButtonAuth("queryhandlerewardmoney_cancelbutton");//操作按钮权限初始化 
	        getOpeatorButtonAuth("queryhandlerewardmoney_surepaybutton");//操作按钮权限初始化 
	        getOpeatorButtonAuth("queryhandlerewardmoney_export");//操作按钮权限初始化 
	    	var json = {"code":"queryhandlerewardmoney","map":{"property":"status","op":"=","value":"running"}};
	    	nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("referrer").setValue('<%=nowuserid %>');
						}
						var isall;//是否拥有全公司的权限
						for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
								isall = "1";
								break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
							nui.getbyName("criteria._expr[3]._op").setValue("=");
	        				nui.getbyName("criteria._expr[3]._value").setValue("");
						}else{
							nui.get("benefitorgids").setValue(text.orgids);
						}
						nui.get("orgseq").setData(text.orgs);
					}else{
						// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("referrer").setValue('<%=nowuserid %>');
					}
					search();
				}
			});
    }
    function search() {
        var data = form.getData(); //获取表单JS对象数据
        grid.sortBy("createdate","desc"); 
        grid.load(data); //datagrid加载数据
    }
    function reset(){
		form.reset();
		init();
	}
    //内推奖励确认
    function sureReward(){
    	var rows = grid.getSelecteds();
        if(rows.length > 0){
        	for(var i = 0; i < rows.length; i++){
        		if(rows[i].rewardstatus != "0"){
        			nui.alert("所选的记录中，只能针对处理状态为创建的内推奖励进行确认！");
		            return;
        		}
        	}
        	sureRewardSettle(rows);
        }else{
            nui.alert("请选择处理状态为创建的内推奖励进行确认，允许多条！");
        }
    }
    function sureRewardSettle(rows){
	    	nui.confirm("确定要“确认”选择的内推奖励？","内推奖励操作提示",function(action){
                if(action=="ok"){
                    var json = nui.encode({"queryhandlerewardmoney":rows});
                    grid.loading("正在确认选择的内推奖励,请稍等...");
                    nui.ajax({
                        url:"com.primeton.eos.ame_permanage.ame_becomeregulae.sureRewardmoney.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var rewardmoneyJson = nui.decode(text);
                            grid.unmask();
                            if(rewardmoneyJson.result == null){
                            	nui.alert("共：" + (rows.length) + "条数据被选中，全部确认成功！", "系统提示",function(){
                                    grid.reload();
                                });
                            }else{
                                nui.alert("共：" + (rows.length) + "条数据被,其中" + (rewardmoneyJson.count) + "条确认成功，" + (rows.length - rewardmoneyJson.count) + "条确认失败！", "系统提示",function(){
                                	grid.reload();
                                });
                            }
                        }
                    }); 
                }
          });
	}
	//内推奖励取消
	var cancelRewardRows = "";
    function cancelReward(){
    	var rows = grid.getSelecteds();
        if(rows.length > 0){
        	for(var i = 0; i < rows.length; i++){
        		if(rows[i].rewardstatus != "0" && rows[i].rewardstatus != "1"){
        			nui.alert("所选的记录中，只能针对处理状态为创建或者已确认状态进行取消！");
		            return;
        		}
        	}
        	cancelRewardRows = rows;
        	showAtPos();
        }else{
            nui.alert("请选择处理状态为创建或者已确认状态的内推奖励进行取消，允许多条！");
        }
    }
    function showAtPos() {
        var win = nui.get("win1");
        win.showAtPos("center", "middle");
    }
    function writeRemark(){
    	hideWindow();
    	cancelRewardSettle(cancelRewardRows);
    }
    function hideWindow() {
            /* nui.get("rewardremark").setValue(''); */
	        var win = nui.get("win1");
	        win.hide();
	}
    function cancelRewardSettle(rows){
	    	nui.confirm("确定要“取消”选择的内推奖励？","内推奖励操作提示",function(action){
                if(action=="ok"){
                    var json = nui.encode({"queryhandlerewardmoney":rows,"rewardremark":nui.get("rewardremark").getValue()});
                    grid.loading("正在取消选择的内推奖励,请稍等...");
                    nui.ajax({
                        url:"com.primeton.eos.ame_permanage.ame_becomeregulae.cancelRewardmoney.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var rewardmoneyJson = nui.decode(text);
                            grid.unmask();
                            if(rewardmoneyJson.result == null){
                            	nui.alert("共：" + (rows.length) + "条数据被选中，内推奖励取消成功！", "系统提示",function(){
                            	    nui.get("rewardremark").setValue('');
                                    grid.reload();
                                });
                            }else{
                                nui.alert("共：" + (rows.length) + "条数据被,其中" + (rewardmoneyJson.count) + "内推奖励取消成功，" + (rows.length - rewardmoneyJson.count) + "内推奖励取消失败！", "系统提示",function(){
                                    nui.get("rewardremark").setValue('');
                                	grid.reload();
                                });
                            }
                        }
                    }); 
                }
          });
	}
	
	//奖励编辑
	var editRewardMoney = "";
	function editReward(){
	        var selectRow = grid.getSelecteds();
		    if(selectRow.length > 1 || selectRow.length ==0){
			      nui.alert("请选择一条记录进行");
			      return;
		    }
		    if(selectRow[0].rewardstatus != "0"){
		          nui.alert("所选的记录中，只能针对处理状态为创建的内推奖励进行编辑！");
		          return;
		    }
		    var rewardmoney = selectRow[0].rewardmoney;
	        nui.get("editreward").setValue(rewardmoney);
	        editRewardMoney = selectRow[0];
	        showReward();
	}
	function showReward(){
        var win = nui.get("win3");
        win.showAtPos("center", "middle");
    }
	function sureeditReward(){
    	hideeditReward();
    	editRewardSettle(editRewardMoney);
    }
    function hideeditReward() {
	        var win = nui.get("win3");
	        win.hide();
	}
	function editRewardSettle(row){
	    	nui.confirm("确定要编辑奖励金额？","内推奖励操作提示",function(action){
                if(action=="ok"){
                    var json = nui.encode({"queryhandlerewardmoney":row,"rewardmoney":nui.get("editreward").getValue()});
                    grid.loading("正在编辑内推奖励金额,请稍等...");
                    nui.ajax({
                        url:"com.primeton.eos.ame_permanage.ame_becomeregulae.editRewardMoney.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var rewardmoneyJson = nui.decode(text);
                            grid.unmask();
                            if(rewardmoneyJson.result == 1){
                            	nui.alert("内推奖励金额编辑成功！", "系统提示",function(){
                            	    nui.get("editreward").setValue('');
                                    grid.reload();
                                });
                            }else{
                                nui.alert("内推奖励金额编辑失败，请重新编辑！", "系统提示",function(){
                            	    nui.get("editreward").setValue('');
                                    grid.reload();
                                });
                            }
                        }
                    }); 
                }
          });
	}
	//内推确认奖励发放
	var surepayRows = "";
    function surepayReward(){
    	var rows = grid.getSelecteds();
        if(rows.length > 0){
        	for(var i = 0; i < rows.length; i++){
        		if(rows[i].rewardstatus != "1"){
        			nui.alert("所选的记录中，只能针对处理状态为已确认的内推奖励记录进行确认发放！");
		            return;
        		}
        	}
        	if(nui.get("paydate").getValue() == ""){
	        	nui.get("paydate").setValue(new Date());
        	}
        	surepayRows = rows;
        	showDate();
        }else{
            nui.alert("请选择处理状态为已确认的内推奖励记录进行确认发放，允许多条！");
        }
    }
    function showDate(){
        var win = nui.get("win2");
        win.showAtPos("center", "middle");
    }
    function surePaydate(){
    	hideDate();
    	surepayRewardSettle(surepayRows);
    }
    function hideDate() {
	        var win = nui.get("win2");
	        win.hide();
	}
    function surepayRewardSettle(rows){
	    	nui.confirm("确认要“发放”选择的内推奖励？","内推奖励操作提示",function(action){
                if(action=="ok"){
                    var json = nui.encode({"queryhandlerewardmoney":rows,"paydate":nui.get("paydate").getValue()});
                    grid.loading("正在确认发放选择的内推奖励,请稍等...");
                    nui.ajax({
                        url:"com.primeton.eos.ame_permanage.ame_becomeregulae.surepayRewardmoney.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var rewardmoneyJson = nui.decode(text);
                            grid.unmask();
                            if(rewardmoneyJson.result == null){
                            	nui.alert("共：" + (rows.length) + "条数据被选中，全部确认发放成功！", "系统提示",function(){
                                    grid.reload();
                                });
                            }else{
                                nui.alert("共：" + (rows.length) + "条数据被,其中" + (rewardmoneyJson.count) + "条确认发放成功，" + (rows.length - rewardmoneyJson.count) + "条确认发放失败！", "系统提示",function(){
                                	grid.reload();
                                });
                            }
                        }
                    }); 
                }
          });
	}
	//新增奖励
	function addReward(){
		nui.open({
            url: "/default/ame_permanage/ame_resum/RewardInput.jsp",
            title: "新增内推奖励", 
            width: 800, 
            height: 400,
            onload: function () {
            },
            ondestroy: function (action) {
        		grid.reload();
            }
        });
	}
	
	//回车触发事件
    function onKeyEnter(){
    	search();
    }
    function rewardStatus(e){
		return nui.getDictText('AME_REWARDSTATUS',e.value);//内推简历是否确认
	}
	function eventType(e){
		return nui.getDictText('REFFER_EVENTTYPE',e.value);//内推简历是否确认
	}
	function getEmptype(e){
		return nui.getDictText('EMP_TYPE',e.value);//内推简历是否确认
	}
	//日期格式化---时分秒的格式化
    function ondealdate(e){
		if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,16);
		}else{
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm");
		}
	}
	function exportReferrerReward(){
    	if(!confirm("是否确认导出？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_becomeregulae.exportReferrerReward.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "内推奖励信息";
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
	        	var month = myDate.getMonth()+1;
	        	var day = myDate.getDate();
	        	var hours = myDate.getHours();
	        	var minutes = myDate.getMinutes();
	        	var seconds = myDate.getSeconds();
	        	var curDateTime = year;
	        	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
					}
	        	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
					}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
					}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
				}
				fileName = fileName + "_" + curDateTime + ".xls";
				var frm = document.getElementById("viewlist1");
	        	frm.elements["downloadFile"].value = filePath;
	        	frm.elements["fileName"].value = fileName;
			    frm.submit();
	        },
	        error: function () {
	        	alert("error");
	        }
		});
    }
    function getDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='getOmRecruitDetail();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function getOmRecruitDetail(){
    	var selectRow = grid.getSelected();
		var executeUrl = "/default/abframe/org/recruit/omRecruitDetail.jsp?recruitid=" + selectRow.recruitid;
		window.open(executeUrl);
    }
</script>
</html>