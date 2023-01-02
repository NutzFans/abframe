<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2016-09-19 16:17:56
  - Description:
-->
<head>
	<title>增加/修改预算信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	
    </style>
</head>
<body>
	<div class="nui-splitter" style="width: 100%;height: 100%;" id = "spl">
		<div size = "14%" showCollapseButton="true"> 
			<div>
				预算年度：<input class="nui-textbox" style="width: 40px" id="inputyear"/>  <a class="nui-button" id="sure" onclick="refreshNode()" >确认</a>
			</div>
			<ul id="tree1" class="nui-tree" url="com.primeton.eos.ame_budget.deptbudget.getOrgTree.biz.ext" 
				style="width: 100%;height: 90%;padding:5px;" ondrawnode="setIcon" 
			    showTreeIcon="true" textField="orgname" onbeforeload="onBeforeTreeLoad" dataField="orgs" onnodeclick="clickload" 
			    idField="orgid" parentField="parentorgid">        
			</ul>
		</div>
		<div size = "100%" showCollapseButton="false" maxsize = "5000"> 
			<div id="body_tab" class="nui-tabs" activeIndex="0" style="width: 100%;height:100%"  onActivechanged="changeTabs()">
			</div>
		</div>
	</div>
	<script type="text/javascript">
	nui.parse();
	var body_tab  = nui.get("body_tab");
	var orgidtemp="";
	var orgdegree="";
	var orglevel="";
	var orgtype="";
	var inputyear = "";
	var orgname = "";
	var orgseq = "";
	var parentorgid = "";
	var orgFlag = "";//判断orgid是事业部还是业单元，或者是事业部但是没有业务单元
	var budstatus = "";
	
	init();
	function init(){
		document.getElementById("body_tab").style.display = "none";
		var nodes=nui.get("tree1").getChildNodes(nui.get("tree1").getRootNode());//树节点
    	nui.get("tree1").expandNode(nodes[0]);
        var d=new Date();
		var nowyear = d.getFullYear();
    	nui.get("inputyear").setValue(nowyear);
		/* 王林琼测试tab页面懒加载方式（优化页面打开速度） */
		var sy_tab = {name: "sy_tab", id: "sy_tab", title: "损益表"};//损益表页面
		body_tab.addTab(sy_tab,0);
		var tab_service = {name: "tab_service", id: "tab_service", title: orgname+"服务成本",refreshOnClick:true,url:"<%=request.getContextPath() %>/ame_budget/deptBudget/serviceBudget.jsp"};//服务成本页面
		body_tab.addTab(tab_service,1);
		var tab_sale = {name: "tab_sale", id: "tab_sale", title: "销售成本",refreshOnClick:true,url:"<%=request.getContextPath() %>/ame_budget/deptBudget/saleBudget.jsp"};//销售成本页面
		body_tab.addTab(tab_sale,2);
		var tab_manage = {name: "tab_manage", id: "tab_manage", title: "管理成本",refreshOnClick:true,url:"<%=request.getContextPath() %>/ame_budget/deptBudget/manageBudget.jsp"};//管理成本页面
		body_tab.addTab(tab_manage,3);
		var tab_research = {name: "tab_research", id: "tab_research", title: "研发成本",refreshOnClick:true,url:"<%=request.getContextPath() %>/ame_budget/deptBudget/researchBudget.jsp"};//研发成本页面
		body_tab.addTab(tab_research,4);
		var tab_market = {name: "tab_market", id: "tab_market", title: "市场成本",refreshOnClick:true,url:"<%=request.getContextPath() %>/ame_budget/deptBudget/marketBudget.jsp"};//市场成本页面
		body_tab.addTab(tab_market,5);
		
	}
	//tab页面切换触发方法（刷新损益表数据，不加载页面）--王林琼
	function changeTabs(e){
		var tab = body_tab.getActiveTab();
		if(tab.title == "损益表"){
			top["win"].init()//调用损益表的init方法
		}
	} 
	function refreshNode(e) {
        nui.get("tree1").load();
        var nodes=nui.get("tree1").getChildNodes(nui.get("tree1").getRootNode());
    	nui.get("tree1").expandNode(nodes[0]);
    	document.getElementById("body_tab").style.display = "none";
    	document.getElementById("bmtop").style.display = "none";
    }
	function onBeforeTreeLoad(e) {
        var tree = e.sender;    //树控件
        var node = e.node;      //当前节点
        var params = e.params;  //参数对象
        var inputyear = nui.get("inputyear").getValue();//获取下一年年份
        params.year =inputyear; //后台：request对象获取"myField"  
    }
	function setIcon(e){
		 if(e.node.orgdegree == "2"){
			e.iconCls = "icon-building";
		}else if(e.node.orgdegree == "3"){
			e.iconCls = "icon-house";
		}else if (e.node.orgdegree == "1"){
			e.iconCls = "icon-bigbuilding";
		}else if (e.node.orgdegree == "4"&&e.node.orglevel == "2"){
			e.iconCls = "icon-building";
		}else{
			if(e.node.orgtype == "1"){
				e.iconCls = "icon-manage";
			}else if(e.node.orgtype == "3"){
				e.iconCls = "icon-serv";
			}else if(e.node.orgtype == "4"){
				e.iconCls = "icon-RD";
			}else if(e.node.orgtype == "5"){
				e.iconCls = "market";
			}else{
				e.iconCls = "icon-house";
			}
		}
	}
	var beforselectednode = "";//树节点选择前的节点
	//点击树节点时发生
	function clickload(e){
		document.getElementById("body_tab").style.display = "";
		orgidtemp=e.node.orgid;
		orgdegree=e.node.orgdegree;
		orglevel=e.node.orglevel;
		orgtype=e.node.orgtype;
		orgname = e.node.orgname;
		parentorgid = e.node.parentorgid;
		orgseq = e.node.orgseq;
		var body_tab=nui.get("body_tab");
		var tab_manage = body_tab.getTab("tab_manage");
		var tab1 = "";
		if(e.node.orgdegree=="1" || e.node.orgdegree=="4"){
			tab1={name: "tab_manage", id: "tab_manage", title: "公司管理成本"};
		}else if(e.node.orgdegree=="2"  ){
			tab1={name: "tab_manage", id: "tab_manage", title: "部门管理成本"};
		}else if(e.node.orgdegree=="5"){
			tab1={name: "tab_manage", id: "tab_manage", title: "部门管理成本"};
		}
		body_tab.updateTab(tab_manage,tab1);
		var tab_research = body_tab.getTab("tab_research");
		var tab2 = "";
		if(e.node.orgdegree=="1" || e.node.orgdegree=="4"){
			tab2={name: "tab_research", id: "tab_research", title: "公司研发成本"};
		}else if(e.node.orgdegree=="2" ){
			tab2={name: "tab_research", id: "tab_research", title: "部门研发成本"};
		}else if(e.node.orgdegree=="5"){
			tab2={name: "tab_research", id: "tab_research", title: "部门研发成本"};
		}
		body_tab.updateTab(tab_research,tab2);
		var sy_tab=body_tab.getTab("sy_tab");
		var tab_service = body_tab.getTab("tab_service");
		var tab_sale = body_tab.getTab("tab_sale");
		var tab_market = body_tab.getTab("tab_market");
		inputyear = nui.get("inputyear").getValue();
		var ishaveAuth = false;
		var orgseqTemp = orgseq.replace(/(^\.*)|(\.*$)/g, "");
		var orgids = orgseqTemp.split(".");
		//判断是否有权限
		nui.ajax({
            url: "com.primeton.eos.ame_budget.ame_budget.judgeAuth.biz.ext",
            type: "post",
            data: {year:inputyear,orgid:orgidtemp,orgids:orgids},
            cache: false,
            contentType: 'text/json',
            success: function (text) {
         		ishaveAuth = text.ishaveAuth;
         		if(ishaveAuth == false){
					nui.alert("您不能查看该部门损益数据！",null,function(){
						//如果选中的节点不等于之前的节点，则选择之前的节点。
						if(beforselectednode != e.node){
							if(beforselectednode == null||beforselectednode == ""){
								document.getElementById("body_tab").style.display = "none";
							}
							nui.get("tree1").selectNode(beforselectednode);
						}
					});
					return false;
				}
            	orgFlag = text.orgFlag;
            	//懒加载tab页
				for(var i=0;i<body_tab.tabs.length;i++){
					var temp_tab = body_tab.tabs[i];
					if(temp_tab.id=="sy_tab"){//损益
						body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/queryDeptbudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag+"&orgdegree="+orgdegree+"&orglevel="+orglevel+"&orgtype="+orgtype+"&orgseq="+orgseq+"&parentorgid="+parentorgid,temp_tab);
					}
					if(temp_tab.id=="tab_service"){//服务成本
						body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/serviceBudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag,temp_tab);
					}
					if(temp_tab.id=="tab_sale"){//销售成本
						body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/saleBudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag,temp_tab);
					}
					if(temp_tab.id=="tab_manage"){//管理成本
						body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/manageBudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag,temp_tab);
					}
					if(temp_tab.id=="tab_research"){//研发成本
						body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/researchBudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag,temp_tab);
					}
					if(temp_tab.id=="tab_market"){//市场成本
						body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/marketBudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag,temp_tab);
					}
				}
				
				 //tab页
	        var tab = "";
			if(orgdegree == 1){
	        	body_tab.updateTab(sy_tab, { visible: true });
	            body_tab.updateTab(tab_service, { visible: true });
	            body_tab.updateTab(tab_sale, { visible: true });
	            body_tab.updateTab(tab_research, { visible: true });
	            body_tab.updateTab(tab_manage, { visible: true });
	            body_tab.updateTab(tab_market, { visible: true });
	    		body_tab.setActiveIndex(0);
	    		tab = body_tab.getActiveTab();
				body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/queryDeptbudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag+"&orgdegree="+orgdegree+"&orglevel="+orglevel+"&orgtype="+orgtype+"&orgseq="+orgseq+"&parentorgid="+parentorgid,tab);
	        }else if(orgdegree == 2||orgdegree == 3) {
	       		body_tab.updateTab(sy_tab, { visible: true });
	            body_tab.updateTab(tab_service, { visible: true });
	            body_tab.updateTab(tab_sale, { visible: true });
	            body_tab.updateTab(tab_research, { visible: true });
	            body_tab.updateTab(tab_manage, { visible: true });
	            body_tab.updateTab(tab_market, { visible: false });
	    		body_tab.setActiveIndex(0);
	    		<%-- tab = body_tab.getActiveTab();
	    		alert("s");
				body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/queryDeptbudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag+"&orgdegree="+orgdegree+"&orglevel="+orglevel+"&orgtype="+orgtype+"&orgseq="+orgseq+"&parentorgid="+parentorgid,tab); --%>
	        }else if(orgdegree != 1 && orgdegree != 2 && orgdegree != 3 && orgFlag==3 && orgtype==4  ){
	       		body_tab.updateTab(sy_tab, { visible: false });
	            body_tab.updateTab(tab_service, { visible: false });
	            body_tab.updateTab(tab_sale, { visible: false });
	            body_tab.updateTab(tab_research, { visible: true });
	            body_tab.updateTab(tab_manage, { visible: false });
	            body_tab.updateTab(tab_market, { visible: false });
	            body_tab.setActiveIndex(4);
	            tab = body_tab.getActiveTab();
				body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/researchBudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag,tab);
	        }else if(orgdegree != 1 && orgdegree != 2 && orgdegree != 3 && orgFlag==3 && orgtype==1  ){
	       		body_tab.updateTab(sy_tab, { visible: false });
	            body_tab.updateTab(tab_service, { visible: false });
	            body_tab.updateTab(tab_sale, { visible: false });
	            body_tab.updateTab(tab_research, { visible: false });
	            body_tab.updateTab(tab_manage, { visible: true });
	         	body_tab.updateTab(tab_market, { visible: false });
	            body_tab.setActiveIndex(3);
				tab = body_tab.getActiveTab();            
				body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/manageBudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag,tab);
			}else if(orgdegree != 1 && orgdegree != 2 && orgdegree != 3 && orgFlag==3 && orgtype==2  ){
				body_tab.updateTab(sy_tab, { visible: false });
	            body_tab.updateTab(tab_service, { visible: false });
	            body_tab.updateTab(tab_sale, { visible: true });
	            body_tab.updateTab(tab_research, { visible: false });
	            body_tab.updateTab(tab_manage, { visible: false });
             	body_tab.updateTab(tab_market, { visible: false });
            	body_tab.setActiveIndex(2);
            	tab = body_tab.getActiveTab();
				body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/saleBudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag,tab);
			}else if(orgdegree != 1 && orgdegree != 2 && orgdegree != 3 && orgFlag==3 && orgtype==5  ){
				body_tab.updateTab(sy_tab, { visible: false });
	            body_tab.updateTab(tab_service, { visible: false });
	            body_tab.updateTab(tab_sale, { visible: false });
	            body_tab.updateTab(tab_research, { visible: false });
	            body_tab.updateTab(tab_manage, { visible: false });
             	body_tab.updateTab(tab_market, { visible: true });
           		body_tab.setActiveIndex(5);
           		tab = body_tab.getActiveTab();
   				body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/marketBudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag,tab);
			}else if(orgdegree != 1 && orgdegree != 2 && orgdegree != 3 && orgFlag==3 && orgtype==3  ){
	       		body_tab.updateTab(sy_tab, { visible: false });
	            body_tab.updateTab(tab_service, { visible: true });
	            body_tab.updateTab(tab_sale, { visible: false });
	            body_tab.updateTab(tab_research, { visible: false });
	            body_tab.updateTab(tab_manage, { visible: false });
	            body_tab.updateTab(tab_market, { visible: false });
	            body_tab.setActiveIndex(1);
	            tab = body_tab.getActiveTab();
	    		body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/serviceBudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag,tab);
			}else{
				if(orgidtemp == 14){
					body_tab.updateTab(sy_tab, { visible: false });
		            body_tab.updateTab(tab_service, { visible: true });
		            body_tab.updateTab(tab_sale, { visible: true });
		            body_tab.updateTab(tab_research, { visible: true });
		            body_tab.updateTab(tab_manage, { visible: true });
		            body_tab.updateTab(tab_market, { visible: true });
				}else{
					body_tab.updateTab(sy_tab, { visible: false });
		            body_tab.updateTab(tab_service, { visible: true });
		            body_tab.updateTab(tab_sale, { visible: true });
		            body_tab.updateTab(tab_research, { visible: true });
		            body_tab.updateTab(tab_manage, { visible: true });
		            body_tab.updateTab(tab_market, { visible: false });
				}
	            body_tab.setActiveIndex(1);
	            tab = body_tab.getActiveTab();
	         	body_tab.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/serviceBudget.jsp?year="+inputyear+"&orgid="+orgidtemp+"&orgname="+orgname+"&orgFlag="+orgFlag,tab);
			}
			
			beforselectednode = e.node;
	            },
	            error: function () {
	            }
	       });
       
		
	}
	         
  </script>
</body>
</html>