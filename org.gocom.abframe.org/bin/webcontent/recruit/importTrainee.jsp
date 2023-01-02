<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2020-06-24 15:01:37
  - Description:
-->
<head>
<title>实习生转正导入</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	 .myIndex{
        background:#FFF68F;
    }
</style>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;"  id="form1">
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	实习生转正信息查询
                    </td>
                </tr>
             </table>           
        </div>
    </div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<table style="width:100%;">
    		<tr>
			 	<td align="right" nowrap="nowrap" style="width: 90px">人员姓名：</td>
			 	<td>
			 		<input class="nui-textbox" name="criteria._expr[0]._value" style="width: 100px" id = "intendname" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="criteria._expr[0]._property" value="intendname"/>
                    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
			    </td>
				<td align="right" >登录名：</td>
            	<td align="left">
				    <input class="nui-textbox" name="criteria._expr[1]._value" style="width: 100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="criteria._expr[1]._property" value="userid"/>
                    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
				</td>
			 	<td align="right">所属公司：</td>
            	<td align="left" >
				   	<input class="nui-dictcombobox"  name="criteria._expr[2]._value"  style="width: 100px" dictTypeId="company" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="criteria._expr[2]._property" value="company"/>
                    <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
				</td>
				<td align="right">所属机构：</td>
	        	<td align="left">
				    <input class="nui-hidden" name="criteria._expr[3]._property" value="inorgid"/>
			        <input class="nui-hidden" name="criteria._expr[3]._op" value="=" id="tempcond1"/>
			        <input class="nui-hidden" name="criteria._expr[3]._ref" value="" id="tempcond2"/>
			        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>					        
			        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
			        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
			        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
			        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
			        <input class="nui-combobox" id="orgid"  name="criteria._ref[0]._expr[0]._value"  style="width:170px;"  
					textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"  onvaluechanged="changeOrg"/>
			        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all" />	
			        
                    <input class="nui-hidden" name="criteria._expr[4]._property" value="inorgid"/>
			        <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
			        <input class="nui-hidden" name="criteria._expr[4]._value" id="orgids" />
				</td>
		    </tr>
		    <tr>
		    	<td align="right">招聘专员:</td>
				<td align="left">					        
	            	<input class="nui-hidden" name="criteria._expr[5]._property" value="intendrecempnames"/>
			        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
			        <input class="nui-textbox" name="criteria._expr[5]._value"  allowInput="true"  style="width:120px;"/>
					<input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>							
				</td>
    			<td align="center" colspan="6">
    				<a class="nui-button"  onclick="search()" iconCls="icon-reload">数据加载</a>
    			</td>
			</tr>
	    </table>
    </div>
    <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
	    <table style="width:auto;" >
	        <tr>
	            <td style="width:100%;">
	                <a class="nui-button" iconCls="icon-remove" onclick="removeRow('datagrid1')" plain="true">删除</a>
					<a class="nui-button" iconCls="icon-ok" onclick="confirm()" style="width:160px;margin-right:20px;">导入实习生转正拟入职</a> 
	            </td>
	        </tr>
	    </table>           
	</div>
    <div id="datagrid1"dataField="IntendTrainees" frozenStartColumn="0" frozenEndColumn="5" 
	class="nui-datagrid" style="width:100%;height:430px;" ondrawsummarycell="doCountSum1"
	url="org.gocom.abframe.org.recruitApproval.recruitApproval.queryIntendTrainee.biz.ext"  multiSelect="true" 
	allowResize="true" allowCellEdit="true" allowCellSelect="true" showPager="false" showSummaryRow="true" >
    <div property="columns">
    	<div type="checkcolumn"></div>	
                <div field="intendname" width="60" align="center" headerAlign="center" allowSort="true" renderer="getResume">姓名</div>
                <div field="inorgname" width="120" align="center" headerAlign="center" >入职部门</div>
                <div field="managername" width="50" align="center" headerAlign="center" >主管</div>
                <div field="interdate" width="84" align="center" headerAlign="center" allowSort="true"  dateFormat="yyyy-MM-dd" renderer="onDealDate" cellCls="myIndex">拟入职日期
            	 	<input property="editor"class="nui-datepicker" width="100%" dateFormat="yyyy-MM-dd"/>
                </div>
                <div field="recruitid" displayField="recruitno" width="80" headerAlign="center" align="center"  renderer="getDetail" cellCls="myIndex">需求编号
                	<input property="editor" class="nui-buttonedit" onbuttonclick=showRecuit />
                </div>
                <div field="actdate" width="0" align="center" headerAlign="center" allowSort="true">实际入职日期</div>
                <div field="intendjobtype" width="80" align="center" headerAlign="center" allowSort="true" renderer="getJobType">人员性质
                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_EMPTYPE2" style="width: 150px;"/>
                </div>
                <div field="intendpositiontype" width="80" align="center" headerAlign="center" allowSort="true" renderer="getPosition">员工属性</div>
                <div field="position" width="120" align="center" headerAlign="center" allowSort="true" renderer="getPositionname">职位分类
                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_POSITION_MEMO" style="width: 150px;"/>
            	</div>
                <div field="positionname" width="120" align="center" headerAlign="center" allowSort="true" >职位名称
                	<input property="editor" class="nui-textbox" style="width: 150px;"/>
            	</div>
                <div field="intendrecempnames" width="100" align="center" headerAlign="center" allowSort="true" >招聘专员</div>
                <div field="gender" width="40" align="center" allowSort="true" headerAlign="center" renderer="getGender">性别
                	<input property="editor" class="nui-dictcombobox" dictTypeId="ABF_GENDER" style="width: 150px;"/>
            	</div>
                <div field="education" width="60" align="center" headerAlign="center" allowSort="true" renderer="getEducation">学历
                	<input property="editor" class="nui-dictcombobox" dictTypeId="DEGREE" style="width: 150px;"/>
            	</div>
                <div field="intendworkplace" width="70" align="center" headerAlign="center" renderer="getWorkspace">工作地点
                	<input property="editor" class="nui-dictcombobox" dictTypeId="AREA4CLRY" style="width: 150px;"/>
            	</div>
                <div field="welfare" width="80" align="center" headerAlign="center" renderer="getWorkspace">福利缴纳地
                	<input property="editor" class="nui-dictcombobox" dictTypeId="AREA4CLRY" style="width: 150px;"/>
            	</div>
                <div field="recruitway" width="120" align="center" headerAlign="center" allowSort="true" renderer="getrecruitway">招聘渠道</div>
            </div>
        </div>
        <div style="text-align:center;padding:10px;" class="nui-toolbar">
			<a class="nui-button" onclick="onCancel" style="width:60px;margin-right:20px;">取消</a>  
		</div>
    </div>
</div>
</body>
<script type="text/javascript">
	nui.parse();	
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	
	//获取当前登陆人 的id,name
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	
	init();
    function init(){
    	var json = {"code":"omIntendJoin","map":{"property":"status","op":"=","value":"running"}};
    	nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				var authorgs=text.orgs;
	    		var authorgids = text.orgids;
	    		if(text.orgs){
					if(authorgs.length==0){
						// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("intendname").setValue('<%=nowusername %>');
						nui.get("intendname").setReadOnly(true);
					}
		    		var isall;
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
						nui.get("orgids").setValue("");
					}else{
						nui.get("orgids").setValue(authorgids);
					}
						nui.get("orgid").setData(authorgs);
					}else{
						// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("intendname").setValue('<%=nowusername %>');
						nui.get("intendname").setReadOnly(true);
					}
			    	search();
		     	}				
		});
	}
	
	//受益部门值改变时判断是否为空，如果为空则取消ref
	function changeOrg(e){
		if(e.value==null || e.value==""){
			nui.get("tempcond1").setValue("=");
			nui.get("tempcond2").setValue("");
		}else{
			nui.get("tempcond1").setValue("in");
			nui.get("tempcond2").setValue("1");
		}
	}
	
	function search() {
        var data = form.getData(); //获取表单JS对象数据
        grid.load(data); //datagrid加载数据
    }
    
    //删除
	function removeRow(grid) {
	    var rows = nui.get(grid).getSelecteds();
	    if (rows.length > 0) {
	        nui.get(grid).removeRows(rows, true);
	    }
	}
	
	function confirm(){
		var omIntendJoin = grid.getSelecteds();
		var json = {"omIntendJoins":omIntendJoin};
    	if(omIntendJoin.length<=0 && omIntendJoin.length<=0){
    		nui.alert("请选中要导入拟入职的实习生转正数据。");
    		return;
    	}
		for(var i=0;i<omIntendJoin.length;i++){
			if(omIntendJoin[i].interdate == null || omIntendJoin[i].interdate == ''){
				nui.alert("拟入职日期必填！");
    			return;
			}
			if(omIntendJoin[i].recruitid == null || omIntendJoin[i].recruitid == ''){
				nui.alert("需求编号必选！");
    			return;
			}
		}
		nui.confirm("确认加载"+omIntendJoin.length+"条数据？", "确定？",
			function (action) {
    			if(action=='ok'){
    				nui.ajax({
				        type:'get',
				        data:json,
				        cache: false,
				        showModal: false,
				        async :false,
				        contentType: 'text/json',
				        url:'org.gocom.abframe.org.recruitApproval.recruitApproval.saveIntendTrainee.biz.ext',
				        success:function(o){
				            if(o.result>=0){
				            	nui.alert("数据更新成功，更新了"+o.result+"条数据。");
						        search();
				            }else{
				            	nui.alert("数据更新失败，请联系信息技术部！");
				            }
				        },
				        error:function(jqXHR, textStatus, errorThrown){
				            nui.alert("error:" + jqXHR.responseText);
				        }
				    });
    			}
		});
	}
	
	function onCancel(e) {
    	var data = form.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action=="yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
		}
    }
    function CloseWindow(action){
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
    
    function onDealDate(e){
		var date = e.value;
		if(date){
			return e.cellHtml.substring(0,10);
		}
	}
	
	
	function showRecuit(e){
		var btnEdit = this;
	    nui.open({
			url:"/default/abframe/org/recruit/SelectRecruitno.jsp",
			title: "选择招聘需求编号",
			width: 780,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data); 
					btnEdit.setValue(data.recruitid);
		            btnEdit.setText(data.recruitno);
				}
			}
		});
	}
	    
	function getGender(e){
		return nui.getDictText('ABF_GENDER',e.value);
	}
	function getJobType(e){
		return nui.getDictText('AME_EMPTYPE2',e.value);
	}
	function getPosition(e){
		return nui.getDictText('EMP_TYPE',e.value);
	}
	function getIntendStatus(e){
		return nui.getDictText('INTEND_STATUS',e.value);
	}
	function getEducation(e){
		return nui.getDictText('DEGREE',e.value);
	}
	function getWorkspace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	//职位类型
	function getPositionname(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);
	}
	function getrecruitway(e){
		return nui.getDictText('RECRUIT_WAY',e.value);
	}
	
	//设置合计行样式---数字靠右等
	function doCountSum1(e){
        var result = e.result;
        var grid = e.sender;
     	//服务端汇总计算
        if (e.field == "inorgname" && result.total != null && result.total != '') {                
            var s = "<div align='center'><b>"
            s +=    "共加载" + result.total +"条数据<br/>"
                    + "</b></div>";
            e.cellHtml = s;
    	}
	}
</script>
</html>