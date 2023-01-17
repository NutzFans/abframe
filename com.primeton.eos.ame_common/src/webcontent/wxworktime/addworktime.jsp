<%@page pageEncoding="UTF-8"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<html lang=“zh”>
<!-- 
  - Author(s): 许青倩
  - Date: 2017-06-23 09:51:31
  - Description:
-->
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="screen-orientation" content="portrait"><!-- uc强制竖屏 -->
<meta name="x5-orientation" content="portrait"><!-- QQ强制竖屏 -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/ame_common/css/main.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/ame_common/wxworktime/select2/dist/css/select2.min.css"/>
<title></title>
<script type="text/javascript" src="js/laydate.js"> 
</script>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    * {margin:0;padding:0;/* 禁用浏览器长按默认样式 */-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;-webkit-tap-highlight-color: transparent;outline: none;}
    *:not(input,textarea) { -webkit-touch-callout: none; -webkit-user-select: none; }
    [v-cloak]{display: none !important;}
    .box{display: -webkit-flex;  /* 新版本语法: Chrome 21+ */display: flex;/* 新版本语法: Opera 12.1, Firefox 22+ */display: -webkit-box;   /* 老版本语法: Safari, iOS, Android browser, older WebKit browsers. */display: -moz-box;/* 老版本语法: Firefox (buggy) */display: -ms-flexbox;/* 混合版本语法: IE 10 */}  
    .flex1 {-webkit-flex: 1;/* Chrome */-ms-flex: 1/* IE 10 */flex: 1;/* NEW, Spec - Opera 12.1, Firefox 20+ */-webkit-box-flex: 1     /* OLD - iOS 6-, Safari 3.1-6 */-moz-box-flex: 1;       /* OLD - Firefox 19- */}
    .dataList{width:100%;font-size: 1rem;}
    .hours{float:right;font-size:3rem;}
    .extra{float:right;font-size:3rem;}
    .dataList li p input{margin-left:3%;text-align:center;}
    .flat-green{border:1px solid #CCCCCC;width:18px;height:18px;}
    #list{overflow: hidden; min-height: 101%;}
    @media only screen and (min-device-width:599px) {
        .nav{padding:0.7rem 0;box-shadow:0px 2px 2px gray;display: flex;align-items: center;justify-content: space-around;}
        .data,.fh{font-size:2rem;cursor: pointer;}
        .dataList li {border-bottom: 0px solid gray;padding-bottom:2rem;border-top: 0px solid gray;padding-top:2rem;margin-top:2%;width:95%;padding: 2.5% 2.5%;list-style-type:none;}
        .dataList li p {border-style:solid;border-width:0px;border-top-color:gray;border-bottom-color:gray;border-left-color:#ffffff;border-right-color:#ffffff;}
        .xz{width:2.5rem;line-height: 2rem;background: #00BFF0;text-align: center;border-radius:10%;color: #fff;cursor: pointer;}
    	.xz:hover{background: #2DAADE}
    }
    @media only screen and (max-device-width:599px) {
    	body{background:url(/default/common/wechat/img/bg.jpg);background-repeat:no-repeat;background-size:100% 100%; background-attachment:fixed;}
        .dataList li p {border-style:solid;border-width:0px;border-top-color:gray;border-bottom-color:gray;border-left-color:#ffffff;border-right-color:#ffffff;}
        .dataList li {border-bottom: 0px solid gray;padding-bottom:2rem;border-top: 0px solid gray;padding-top:2rem;margin-top:10%;width:95%;padding: 2.5% 2.5%;list-style-type:none;}
        .nav{position: relative;top: 0;background:#fff;display: flex;align-items: center;justify-content: space-around;width: 100%;height:10%;box-shadow:0 2px 2px gray;}
        .data{display: flex;flex-direction: column;align-items: center;justify-content: space-around; font-size: 1.5rem;width:75%;text-align:center;}
        .fh{padding: 0.5% 0.5%;font-size: 1rem;width: 15%;text-align:center; }
        .xz{padding: 0.5% 0.5%;font-size: 0.5rem;width: 13%;text-align: center; background: #00BFF0;font-size: 1rem;border-radius: 0.5rem;margin-right: 1rem;}
    }
</style>
</head>
<body>
<div id="add">
    <div class="nav" >
        <div class="fh" @click="fh(startdate,enddate)" >❮</div>
        <div v-cloak class="data">
            <div v-cloak class="laydate-icon" id="demo" v-model="laborDate" style="display: none;border: none;" readonly="readonly">{{laborDate}}</div>
            <div v-cloak id="demo1" style="display: none;">{{laborDate}}</div>
        </div>
        <div class="xz" @click="savedata() | debounce 0" id="save" v-show="bolen">保存</div>
    </div>
    <div class="dataList">
        <li>
            <p v-cloak style="border-top-color:#ffffff;">
                <span v-cloak  style="display:inline-block;text-align:center;width:100% ;height:8%;">
                    <input type="radio" id="xm" value="Pro" v-model="picked" class="flat-green" style='margin-left:5%'>
                    <label for="xm">项目</label>
                    <input type="radio" id="flx" value="nonPro" v-model="picked" class="flat-green" style='margin-left:15%'>
                    <label for="flx">非立项</label>
                    <input type="radio" id="zzj" value="orgLevel" v-model="picked" class="flat-green" style='margin-left:15%'>
                    <label for="zzj">组织级</label>
                </span>
            </p>
            <p v-cloak style="border-top-color:#ffffff;" >
                <span v-cloak style="display:inline-block;text-align:right;width:25% ;height:8%;">客户：</span>
                <select v-model="custid" onchange="watchcust()" readonly="readonly" id="nav-search-cust" style="width:70% ;height:8%;border-color:#ffffff;" >
                    <option v-cloak v-for="cust in custs" 
                              v-bind:value="cust.custid" >
                        {{cust.custname}}
                    </option>
                </select>
            </p>
            <p v-cloak style="border-top-color:#ffffff;" >
                <span v-cloak style="display:inline-block;text-align:right;width:25% ;height:8%;">项目：</span>
                <select v-model="projectid" onchange="watchproject()" readonly="readonly" id="nav-search-project" style="width:70% ;height:8%;border-color:#ffffff;">
                    <option v-cloak v-for="project in projects" v-bind:value="project.projectid" >
                        {{project.projectname}}
                    </option>
                </select>
            </p>
            <p v-cloak style="border-top-color:#ffffff;" >
                <span v-cloak style="display:inline-block;text-align:right;width:25% ;height:8%;">受益部门：</span>
                <select v-model="orgid" onchange="watchorg()" readonly="readonly" id="nav-search-input" autocomplete="off" style="width:70% ;height:8%;border-color:#ffffff;" >
                    <option v-cloak select v-for="org in orgs" v-bind:value="org.orgid" >
                        {{org.orgname}}
                    </option>
                </select>
            </p>
            <p v-cloak style="border-top-color:#ffffff;" >
                <span v-cloak style="display:inline-block;text-align:right;width:25% ;height:8%;">项目活动：</span>
                <select v-model="tasklist" onchange="watchtask()" readonly="readonly" id="nav-search-task" style="width:70% ;height:14% !important;border-color:#ffffff;">
                    <option v-cloak v-for="task in tasklists" v-bind:value="task.tasklist" >
                        {{task.taskname}}
                    </option>
                </select>
            </p>
            <p v-cloak style="border-top-color:#ffffff;" >
                <span v-cloak style="display:inline-block;text-align:right;width:25% ;height:8%;">填报部门：</span>
                <select v-model="tborgid" onchange="watchtborg()" readonly="readonly" id="nav-search-tb" autocomplete="off" style="width:70% ;height:8%;border-color:#ffffff;" >
                    <option v-cloak select v-for="tborg in tborgs" v-bind:value="tborg.orgid" >
                        {{tborg.orgname}}
                    </option>
                </select>
            </p>
            <p v-cloak style="border-top-color:#ffffff;" >
                <span v-cloak style="display:inline-block;text-align:right;width:25% ;height:8%;">总工时：</span>
                <select v-model="acthours" readonly="readonly" style="width:70% ;height:4.8%;border-color: rgba(0, 0, 0, 0.4);background-color: rgba(0, 0, 0, 0);font-size:0.9rem;border-radius:4px;">
                    <option value="0.5">0.5小时</option>
                    <option value="1.0">1.0小时</option>
                    <option value="1.5">1.5小时</option>
                    <option value="2.0">2.0小时</option>
                    <option value="2.5">2.5小时</option>
                    <option value="3.0">3.0小时</option>
                    <option value="3.5">3.5小时</option>
                    <option value="4.0">4.0小时</option>
                    <option value="4.5">4.5小时</option>
                    <option value="5.0">5.0小时</option>
                    <option value="5.5">5.5小时</option>
                    <option value="6.0">6.0小时</option>
                    <option value="6.5">6.5小时</option>
                    <option value="7.0">7.0小时</option>
                    <option value="7.5">7.5小时</option>
                    <option value="8.0">8.0小时</option>
                    <option value="8.5">8.5小时</option>
                    <option value="9.0">9.0小时</option>
                    <option value="9.5">9.5小时</option>
                    <option value="10.0">10小时</option>
                    <option value="11.0">11小时</option>
                    <option value="12.0">12小时</option>
                    <option value="13.0">13小时</option>
                    <option value="14.0">14小时</option>
                    <option value="15.0">15小时</option>
                    <option value="16.0">16小时</option>
                </select>
            </p>
            <p v-cloak style="border-top-color:#ffffff;" >
                <span v-cloak style="display:inline-block;text-align:right;width:25% ;height:8%;">其中加班：</span>
                <select v-model="otwHours" readonly="readonly" style="width:30% ;height:4.8%;border-color: rgba(0, 0, 0, 0.4);background-color: rgba(0, 0, 0, 0);font-size:0.9rem;border-radius:4px;">
                    <option value="0.0">0.0小时</option>
                    <option value="0.5">0.5小时</option>
                    <option value="1.0">1.0小时</option>
                    <option value="1.5">1.5小时</option>
                    <option value="2.0">2.0小时</option>
                    <option value="2.5">2.5小时</option>
                    <option value="3.0">3.0小时</option>
                    <option value="3.5">3.5小时</option>
                    <option value="4.0">4.0小时</option>
                    <option value="4.5">4.5小时</option>
                    <option value="5.0">5.0小时</option>
                    <option value="5.5">5.5小时</option>
                    <option value="6.0">6.0小时</option>
                    <option value="6.5">6.5小时</option>
                    <option value="7.0">7.0小时</option>
                    <option value="7.5">7.5小时</option>
                    <option value="8.0">8.0小时</option>
                    <option value="8.5">8.5小时</option>
                    <option value="9.0">9.0小时</option>
                    <option value="9.5">9.5小时</option>
                    <option value="10.0">10小时</option>
                    <option value="11.0">11小时</option>
                    <option value="12.0">12小时</option>
                    <option value="13.0">13小时</option>
                    <option value="14.0">14小时</option>
                    <option value="15.0">15小时</option>
                    <option value="16.0">16小时</option>
                </select>
                <span v-cloak  style="display:inline-block;text-align:center;width:40% ;height:8%;" v-show="DaysoffShow">
	                <input type="checkbox" id="DaysOff"  v-model="isDaysOff" style='margin-left:12%'>
	                <label for="DaysOff">预留调休</label> 
                </span>
            </p>
            <p v-cloak style="border-top-color:#ffffff;" >
                <span v-cloak style="display:inline-block;text-align:right;width:25% ;height:8%;float:left;margin-top:2px;" >工作内容：</span>
                <textarea v-model="repContent" cols=40 rows=4 style="width:70% ;margin-left:1%;height:15%;border-color:#ADADAD;text-align:left;font-size: 1rem;resize:none;padding: 0.5rem;"></textarea>
            </p>
        </li>
    </div> 
</div>
</body>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-latest.js"></script><%--
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/p-pull-refresh.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/touche.js"></script>--%>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/vue.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/wxworktime/select2/dist/js/select2.full.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/wxworktime/select2/dist/js/select2.min.js"></script>
<script type="text/javascript">
    !function(){
        laydate.skin('mystyle');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo'});//绑定元素
    }();
    //获取设备高度（软键盘调出来时高度也会变小，所以在点击事件前获取）
    var deviceH=document.documentElement.clientHeight+"px";
    //表单获得焦点后动态改变body和背景图片的大小
    $('select,input,select2,span,li,ul,textarea').on("click",function(){
        $("body").attr("style","background:url(/default/common/wechat/img/bg.jpg);  background-repeat:no-repeat; background-attachment:fixed;width:100%;height:"+deviceH+";background-size: 100%"+deviceH);
    });
    
   var oHeight = $(document).height(); //浏览器当前的高度
   
   $(window).resize(function(){
        if($(document).height() < oHeight){
         
        $("body").css("position","static");
    }else{
         
        $("body").css("position","absolute");
    }
        
   });

    var app = new  Vue({
        el:'#add',
        data:{
            laborDetailId:null,
            userid:'',
            startdate:1,
            enddate: 1,
            laborDate:1,
            custid:'',
            custs:[],
            custs_Pro:[],
            cust_nonPro:[],
            cust_orgLevel:[],
            projectid:'',
            projects:[],
            orgid:'',
            orgs:[],
            tborgid:'',
            tborgs:[],
            operate:'',
            tasklist:'',
            tasklists:[],
            acthours:0.0,
            otwHours:0.0,
            repContent:'',
            picked:'',
            org:'',
            custid_alert:'',
            projectid_alert:'',
            orgid_alert:'',
            tasklist_alert:'',
            otwHours_alert:0.0,
            picked_alert:'',
            custname:'',
            org_sy:[],
            isPhone:'',
            org_flx:[],
			bolen:true,
			minDate:'',
			isDaysOff:false,
			isDaysOff1:'',
			DaysoffShow:true,
        },        
        ready:function(){
            //获取查询年月日并存储
            this.startdate = sessionStorage.getItem("startdate");
            this.enddate = sessionStorage.getItem("enddate");
            this.laborDate = sessionStorage.getItem("startdate");   
            this.laborDetailId = sessionStorage.getItem("laborDetailId");
            this.operate = sessionStorage.getItem("operate");
            this.custname=sessionStorage.getItem("custname");
            this.custs.$set("custid", "custname");
            <%
                String userid = "";
                String orgid = "";
                UserObject user = (UserObject) request.getSession().getAttribute("userObject");
                userid = user.getUserId(); 
                orgid = user.getUserOrgId();
            %>
            //判断日期是否可以修改
            if(this.startdate!=this.enddate){
                document.getElementById("demo").style.display="";
            }else{
                document.getElementById("demo1").style.display="";
            }
            //客户下拉框
            this.org = "<%=orgid %>";
            this.userid = "<%=userid %>";
            <%--custs_Pro;cust_nonPro;cust_orgLevel--%>
            var cust = [];//------------------------------------------------项目
            var json_custs = ({"userid":this.userid});
            $.ajax({
                type:'get',
                data:json_custs,
                async:false,
                url:'com.primeton.rdmgr.labor.labormgr.queryOwnerCusts.biz.ext',
                success:function(result){
                    for(var i = 0;i<result.custs.length;i++){
                        if(result.custs[i].custid != '1' && result.custs[i].custid != '2'  && result.custs[i].custid != '0'){
                            cust.push(result.custs[i]);
                        }
                    }
                }
            })
            this.custs_Pro=cust;
            
            cust = [];//------------------------------------------------非立项
            json_custs = ({"custname":"上海"});
            cust.push({ custid: null, custname: '其他' });
            this.cust_nonPro=cust;
            
            cust = [];//------------------------------------------------组织级
            cust.push({ custid: '1926', custname: '普元信息技术股份有限公司' });
            this.cust_orgLevel=cust;
            
            var org = [];//------------------------------------------------受益部门
            $.ajax({
                type:'get',
                data:"",
                async:false,
                url:'com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext',
                success:function(result){
                    for(var i = 0;i<result.allorgs.length;i++){
                        org.push(result.allorgs[i]);
                    }
                }
            })
            this.org_sy=org;
            
            var org1 = [];//------------------------------------------------非立项的受益部门
            $.ajax({
                type:'get',
                data:"",
                async:false,
                url:'com.primeton.eos.ame_common.wx_worktime.queryorgbysales.biz.ext',
                success:function(result){
                    for(var i = 0;i<result.allorgs.length;i++){
                        org1.push(result.allorgs[i]);
                    }
                }
            })
            this.org_flx=org1;
            
            var org_tb = [];//------------------------------------------------受益部门
            $.ajax({
                type:'get',
                data:"",
                async:false,
                url:'com.primeton.eos.ame_common.wx_worktime.getTBorg.biz.ext',
                success:function(result){
                    for(var i = 0;i<result.TBorgs.length;i++){
                        org_tb.push(result.TBorgs[i]);
                    }
                }
            })
            this.tborgs=org_tb;
            $("#nav-search-tb").select2({
              data: org_tb,
              placeholder:'请选择',
              allowClear:true
            })
            this.tborgid=org_tb[0].orgid;
            if(org_tb.length>1){
            	$("#nav-search-tb").prop("disabled", false);//可用
            }else{
            	$("#nav-search-tb").prop("disabled", true);//可用
            }
            
            //填报的最小日期
            var mindate_1='';
            nui.ajax({
                type:'get',
                data:"",
                async:false,
                url:'com.primeton.eos.ame_common.wx_worktime.getLaborMinDate.biz.ext',
                success:function(result){
                    if(result.minDate  !='' && result.minDate  != null){
                    	mindate_1 = result.minDate;
                    }else{
                    	mindate_1 = null;
                    }
                }
            })
            this.minDate = mindate_1;
            
            //判断日期是否合法
            if(this.minDate != '' && this.minDate != null && this.operate=="add"){
            	if(new   Date(Date.parse(this.laborDate.replace(/-/g,"/")))<new Date(Date.parse(this.minDate.replace(/-/g,"/")))){
            		var dayCount = parseInt((Math.abs(new Date() - new Date(Date.parse(this.minDate.replace(/-/g,"/")))))/1000/60/60/24)+1;
                	alert("根据系统设置要求，不能填报超过距离当前日期"+dayCount+"天的工时！(最小填报日期："+this.minDate.substr(0,10)+')');
                }
            }
            
            //是否预留调休
        	var json_workday = ({"LaborDate":this.laborDate});
        	var isworkday = '1';
            $.ajax({
                type:'get',
                data:json_workday,
                async:false,
                url:'com.primeton.eos.ame_common.wx_worktime.isWorkDay.biz.ext',
                success:function(result){                	
                    isworkday=result.isWorkday;
                }
            })
            if(isworkday == 0){
        		document.getElementById("DaysOff").disabled=false;
        		this.DaysoffShow=false;
            }else{
        		document.getElementById("DaysOff").disabled=true;
        		this.DaysoffShow=false;
            }
            
            var custid ='';
            var projectid='';
            var orgid='';
            var tasklist='';
            var acthours=0;
            var otwHours=0;
            var repContent='';
            var picked="Pro";
            var isDaysOff1='';
            var userOrgId='';
            if(this.operate=="alter"){
                document.title = '修改工时';
                var json = ({"criteria": 
                                    {"_expr[0]": {"laborDate": this.startdate},
                                    "_expr[1]": { "userId": null},
                                    "_expr[2]": {"_property": "laborDetailId","_op": "=","_value": this.laborDetailId}}});
                nui.ajax({
                    type:'get',
                    data:json,
                    cache: false,
                    showModal: false,
                    async :false,
                    contentType: 'text/json',
                    url:'com.primeton.rdmgr.labor.input.rdlabordetailbiz.getMyRdLabor.biz.ext',
                    success:function(result){
                        if(result.rdlabordetails.length>=1){
                            if(result.rdlabordetails[0].projectId=='1'){
                                picked="orgLevel";
                            }else if(result.rdlabordetails[0].projectId=='2'){
                                picked="nonPro";
                            }
                            custid=result.rdlabordetails[0].custid;
                            projectid=result.rdlabordetails[0].projectId;
                            orgid=result.rdlabordetails[0].omOrganization.orgid;
                            tasklist=result.rdlabordetails[0].tasklist;
                            acthours=result.rdlabordetails[0].actHours;
                            otwHours=result.rdlabordetails[0].otwHours;
                            repContent=result.rdlabordetails[0].repContent;
                           	isDaysOff1=result.rdlabordetails[0].isDaysOff;
                            userOrgId=result.rdlabordetails[0].userOrgId;
                        }
                    }
                })
                if(picked=="nonPro"){
                    //------------------------------------------------非立项
                    cust = [];
                    cust.push({ custid: custid, custname: this.custname });
                    this.cust_nonPro=cust;
                }
                this.picked=picked;
                this.picked_alert=picked;
                this.custid=custid;
                this.projectid=projectid;
                this.orgid=orgid;
                this.tasklist=tasklist;
                this.acthours=acthours;
                this.otwHours=otwHours;
                this.repContent=repContent;
                this.custid_alert=custid;
                this.projectid_alert=projectid;
                this.orgid_alert=orgid;
                this.tasklist_alert=tasklist;
                this.otwHours_alert=otwHours;
                if(userOrgId != null && userOrgId !='' && this.tborgs.length>1){
                	this.tborgid=userOrgId;
                }
                if(isDaysOff1 == '1'){
                	this.isDaysOff =true ;
                }
                this.isDaysOff1=isDaysOff1;
            }else{
                document.title = '新增工时';
                nui.ajax({
                    type:'get',
                    data:json,
                    cache: false,
                    showModal: false,
                    async :false,
                    contentType: 'text/json',
                    url:'com.primeton.rdmgr.labor.input.rdlabordetailbiz.getMyLastLabor.biz.ext',
                    success:function(result){
                        if(result.labor.laborDetailId != null && result.labor.laborDetailId !=""){
                            if(result.labor.projectId=='1'){
                                picked="orgLevel";
                            	custid=result.labor.custid;
                            }else if(result.labor.projectId=='2'){
                                picked="nonPro";
                            }else{
                            	custid=result.labor.custid;
                            }
                            projectid=result.labor.projectId;
                            orgid=result.labor.omOrganization.orgid;
                            tasklist=result.labor.tasklist;
                            acthours=result.labor.actHours;
                            otwHours=result.labor.otwHours;
                            repContent=result.labor.repContent;
                            userOrgId=result.labor.userOrgId;
                        }
                    }
                })
                if(picked=="nonPro"){
                    //------------------------------------------------非立项
                    cust = [];
                    cust.push({ custid: custid, custname: this.custname });
                    this.cust_nonPro=cust;
                }
                this.picked=picked;
                this.picked_alert=picked;
                this.custid=custid;
                this.projectid=projectid;
                this.orgid=orgid;
                this.tasklist=tasklist;
                this.custid_alert=custid;
				this.projectid_alert=projectid;
				this.orgid_alert=orgid;
				this.tasklist_alert=tasklist;
                this.repContent=repContent;
                if(userOrgId != null && userOrgId != '' && this.tborgs.length>1){
                	this.tborgid=userOrgId;
                }
            }
        },
        watch: {
            //项目、非立项、组织级
            //选中项目客户需要做过滤，项目可选
            //选中非立项，客户不需要过滤，并添加其他（custid为空）选项，项目为非立项，不可选
            //选中组织级，客户不需要过滤，并添加其他（custid为空）选项，项目为组织级，不可选
            picked:function(newVal, oldVal){
                $("#nav-search-project").prop("disabled", false);//可用
                $("#nav-search-input").prop("disabled", false);//可用
                $("#nav-search-task").prop("disabled", false);//可用
                if(newVal=="Pro"){
                    document.getElementById("nav-search-cust").value=null;
                    document.getElementById("nav-search-cust").text=null;
                    var data_cust = this.custs_Pro;
                    var gray_text = '请选择';
                    if(data_cust.length<=0){
                        gray_text = '无授权项目的客户';
                    }
                    $("#nav-search-cust").prop("disabled", false);//可用
                    $("#nav-search-cust").select2({
                      placeholderOption: "first",
                      allowClear:true,
                      data: data_cust,
                      placeholder:gray_text
                    })
                    if(data_cust.length<=0){
                        $("#nav-search-cust").prop("disabled", true);//不可用
                    }
                    this.custs=this.custs_Pro;
                    if(this.custid_alert !=  null && this.custid_alert !='' && this.picked==this.picked_alert){
                        this.custid=this.custid_alert;
                    }else if (this.custs.length>0){
                        this.custid=this.custs[0].custid;
                    }else{
                        this.custid='';
                    }
                    var length=document.getElementById("nav-search-cust").options.length;
                    var options=document.getElementById("nav-search-cust").options;
                    if(data_cust.length>0 && oldVal!="orgLevel"){
                        for(var i=data_cust.length;i<length;i++){
                            document.getElementById("nav-search-cust").options.remove(i);
                        }
                        document.getElementById("nav-search-cust").options.length=data_cust.length;
                    }
                    
                    if(this.custid != null && this.custid !=''){
                        var project =[];
                        var json = ({"custid":this.custid});
                        $.ajax({
                            type:'get',
                            data:json,
                            async:false,
                            url:'com.primeton.eos.ame_common.wx_worktime.queryRdProject.biz.ext',
                            success:function(result){
                                for(var i = 0;i<result.project.length;i++){
                                    project.push(result.project[i]);
                                }
                            }
                        })
                        var data_cust = project;
                        var gray_text = '请选择';
                        if(data_cust.length<=0){
                            gray_text = '无授权项目';
                        }
                        $("#nav-search-project").prop("disabled", false);//可用
                        $("#nav-search-project").select2({
                          data: data_cust,
                          placeholder:gray_text,
                          allowClear:true
                        })
                        if(data_cust.length<=0){
                            $("#nav-search-project").prop("disabled", true);//不可用
                        }
                        this.projects=project;
                        if(this.projectid_alert !=  null && this.projectid_alert !='' && this.picked==this.picked_alert){
                            this.projectid=this.projectid_alert;
                        }else if(this.projects.length>0){
                            this.projectid=this.projects[0].projectid;
                        }else{
                            this.projectid='';
                        }
                    }else{
                        var data_cust = null;
                        var gray_text = '无授权项目';
                        $("#nav-search-project").select2({
                          data: data_cust,
                          placeholder:gray_text,
                          allowClear:true
                        })
                        $("#nav-search-project").prop("disabled", true);//不可用
                        this.projectid='';
                        
                        var data = null;
                        var gray_text1 = '无受益部门对应';
                        $("#nav-search-input").select2({
                          data: data,
                          placeholder:gray_text1,
                          allowClear:true
                        })
                        $("#nav-search-input").prop("disabled", true);//不可用
                        this.orgid='';
                        
                        var data_task = null;
                        var gray_text2 = '无活动对应';
                        $("#nav-search-task").select2({
                          data: data_task,
                          placeholder:gray_text2,
                          allowClear:true
                        })
                        $("#nav-search-task").prop("disabled", true);//不可用
                        this.tasklist='';
                    }
                }else if(newVal=="nonPro"){
                    var project =[];
                    project.push({projectid: '2', projectname: '非立项技术支持'});
                    var data_project = project;
                    $("#nav-search-project").select2({
                      data: data_project,
                      placeholder:'请选择',
                      allowClear:true
                    })
                    this.projects=project;
                    if(this.projectid_alert !=  null && this.projectid_alert !='' && this.picked==this.picked_alert){
                        this.projectid=this.projectid_alert;
                    }else if(this.projects.length>0){
                        this.projectid=this.projects[0].projectid;
                    }
                    if(this.custid_alert !='' && this.picked==this.picked_alert){
                        var data_cust = this.cust_nonPro;
                        $("#nav-search-cust").select2({
                          allowClear:true,
                          data: data_cust,
                          placeholder:'请选择',
                          allowClear:true
                        })
                        this.custs=this.cust_nonPro;
                        this.custid=this.custid_alert;  
                        document.getElementById("nav-search-cust").value=this.custid;
                        document.getElementById("nav-search-cust").text=this.custname;
                    }else{
                        this.custid=null;
                        document.getElementById("nav-search-cust").value=null;
                        document.getElementById("nav-search-cust").text=null;
                    }
                    $("#nav-search-cust").select2({
                      placeholder: "请查询，不要求必选。",
                      placeholderOption: "first",
                      allowClear:true,
                      ajax: {
                            url: "com.primeton.eos.ame_common.wx_worktime.queryCust.biz.ext",
                            dataType: 'json',
                            delay: 0,
                            async:false,
                            data: function (params) {
                              return {
                                custname: params.term,
                              };
                            },
                            processResults: function (data) {
                                var arr = data.custs;
                                var cust_query=[];
                                for(var item in arr){
                                    cust_query.push({id: arr[item].custid, text: arr[item].custname});
                                }
                              return {
                                results: cust_query//data.custs
                              };
                            },
                            cache: false
                      },
                      escapeMarkup: function (markup) { return markup; }, 
                      minimumInputLength: 2,
                      templateResult: formatRepo, 
                      templateSelection: formatRepoSelection
                    });
                }else{
                    var project =[];
                    project.push({projectid: '1', projectname: '组织级工时'});
                    var data_project = project;
                    $("#nav-search-project").select2({
                      data: data_project,
                      placeholder:'请选择',
                      allowClear:true
                    })
                    this.projects=project;
                    if(this.projectid_alert !=  null && this.projectid_alert !='' && this.picked==this.picked_alert){
                        this.projectid=this.projectid_alert;
                    }else if(this.projects.length>0){
                        this.projectid=this.projects[0].projectid;
                    }
                    document.getElementById("nav-search-cust").value=null;
                    document.getElementById("nav-search-cust").text=null;
                    var data_cust = this.cust_orgLevel;
                    $("#nav-search-cust").select2({
                      allowClear:true,
                      data: data_cust,
                      placeholder:'请选择',
                      allowClear:true
                    })
                    this.custs=this.cust_orgLevel;
                    if(this.custid_alert !=  null && this.custid_alert !='' && this.picked==this.picked_alert){
                        this.custid=this.custid_alert;
                    }else{
                        this.custid=this.custs[0].custid;
                    }<%--
                    var length1=document.getElementById("nav-search-cust").options.length;
                    document.getElementById("nav-search-cust").options.length=data_cust.length;--%>
                }
            },
            //项目下拉框（客户二级）
            custid:function(newVal, oldVal){
                if((newVal != null && newVal !='' && this.picked=="Pro") || this.picked!="Pro"){
                    var project =[];
                    var json = ({"custid":newVal});
                    if(this.picked == "nonPro"){
                        json = ({"custid":'2'});
                    }else if (this.picked == "orgLevel"){
                        json = ({"custid":'1'});
                    }
                    
                    $.ajax({
                        type:'get',
                        data:json,
                        async:false,
                        url:'com.primeton.eos.ame_common.wx_worktime.queryRdProject.biz.ext',
                        success:function(result){
                            for(var i = 0;i<result.project.length;i++){
                                project.push(result.project[i]);
                            }
                        }
                    })
                    var data_cust = project;
                    var gray_text = '请选择';
                    if(data_cust.length<=0){
                        gray_text = '无项目对应';
                    }
                    $("#nav-search-project").prop("disabled", false);//可用
                    $("#nav-search-project").select2({
                      data: data_cust,
                      placeholder:gray_text,
                      allowClear:true
                    })
                    if(data_cust.length<=0){
                        $("#nav-search-project").prop("disabled", true);//不可用
                    }
                    this.projects=project;
                    if(this.projectid_alert !=  null && this.projectid_alert !='' && this.picked==this.picked_alert && this.custid == this.custid_alert){
                        this.projectid=this.projectid_alert;
                    }else if(this.projects.length>0){
                        this.projectid=this.projects[0].projectid;
                    }
                }else{
                    var data_cust = null;
                    $("#nav-search-project").select2({
                      data: data_cust,
                      placeholder:'请选择',
                      allowClear:true
                    })
                    this.projectid='';
                }
            },
            projectid:function(newVal, oldVal){
                if(newVal != null && newVal !=''){
                    //活动过滤
                    var tasklist = [];
                    var json = ({"projectid":newVal});
                    $.ajax({
                        type:'get',
                        data:json,
                        async:false,
                        url:'com.primeton.eos.ame_common.wx_worktime.querytasklist.biz.ext',
                        success:function(result){
                            for(var i = 0;i<result.tasklists.length;i++){
                                tasklist.push(result.tasklists[i]);
                            }
                        }
                    })
                    var data_cust = tasklist;
                    $("#nav-search-task").select2({
                      data: data_cust,
                      placeholder:'请选择',
                      allowClear:true
                    })
                    this.tasklists=tasklist;
                    
                    if(this.tasklist_alert !=  null && this.tasklist_alert !='' && this.picked==this.picked_alert){
                        this.tasklist=this.tasklist_alert;
                    }else if(this.tasklists.length>0){
                        this.tasklist=this.tasklists[0].tasklist;
                    }
                    //受益部门过滤
                    if(newVal=='1' || newVal=='2'){
                        var data = this.org_sy;
                        if(newVal=='2'){
                        	data=this.org_flx;
                        }
                        $("#nav-search-input").select2({
                          data: data,
                          placeholder:'请选择',
                          allowClear:true
                        })
                        this.orgs=this.org_sy;
                        if(newVal=='2'){
                        	this.orgs=this.org_flx;
                        }
                        
                        if(this.orgid_alert !=  null && this.orgid_alert !='' && this.picked==this.picked_alert){
                            this.orgid=this.orgid_alert;
                        }else{
                            if(newVal=='2'){
                                this.orgid='';
                                document.getElementById("nav-search-input").value='';
                            }else{
                                this.orgid=this.org;
                            }
                        }
                        if(newVal=='2'){
                            $("#nav-search-cust").prop("disabled", false);//可用
                        }else{
                            $("#nav-search-cust").prop("disabled", true);//不可用
                        }
                        $("#nav-search-project").prop("disabled", true);//不可用
                        $("#nav-search-input").prop("disabled", false);//可用
                    }else{  
                        var json = ({"projectID":newVal});
                        var org = [];
                        //受益部门过滤
                        $.ajax({
                            type:'get',
                            data:json,
                            async:false,
                            url:'com.primeton.eos.ame_common.wx_worktime.queryorg.biz.ext',
                            success:function(result){
                                for(var i = 0;i<result.allorgs.length;i++){
                                    org.push(result.allorgs[i]);
                                }
                            }
                        })
                        var data = org;
                        $("#nav-search-input").select2({
                          data: data,
                          placeholder:'请选择',
                          allowClear:true
                        })
                        this.orgs=org;
                        
                        if(this.orgid_alert !=  null && this.orgid_alert !='' && this.picked==this.picked_alert && this.picked!="Pro"){
                            this.orgid=this.orgid_alert;
                        }else if(this.orgs.length>0){
                            this.orgid=this.orgs[0].orgid;
                        }
                        $("#nav-search-project").prop("disabled", false);//可用
                        $("#nav-search-input").prop("disabled", true);//不可用
                        $("#nav-search-cust").prop("disabled", false);//可用
                    }
                }else{
                    var data = null;
                    var gray_text1 = '无受益部门对应';
                    $("#nav-search-input").select2({
                      data: data,
                      placeholder:gray_text1,
                      allowClear:true
                    })
                    $("#nav-search-input").prop("disabled", true);//不可用
                    
                    var data_task = null;
                    var gray_text2 = '无活动对应';
                    $("#nav-search-task").select2({
                      data: data_task,
                      placeholder:gray_text2,
                      allowClear:true
                    })
                    $("#nav-search-task").prop("disabled", true);//不可用
                }
            },
            acthours:function(newVal, oldVal){
            	this.laborDate=document.getElementById("demo").innerHTML;
            	//是否预留调休
	        	var json_workday = ({"LaborDate":this.laborDate});
	        	var isworkday = '1';
	            $.ajax({
	                type:'get',
	                data:json_workday,
	                async:false,
	                url:'com.primeton.eos.ame_common.wx_worktime.isWorkDay.biz.ext',
	                success:function(result){
	                    isworkday=result.isWorkday;
	                }
	            })
            	if(this.otwHours_alert>0){
	                this.otwHours_alert=0;
            	}else{
            		if(newVal>8){
	                    this.otwHours=newVal-8;
	                }else{
	                    this.otwHours=0;
	                }
        			if(isworkday == 0){
        				this.otwHours=newVal;
        			}
            	}
                
            },
            otwHours:function(newVal, oldVal){
            	this.laborDate=document.getElementById("demo").innerHTML;
            	//是否预留调休
	        	var json_workday = ({"LaborDate":this.laborDate});
	        	var isworkday = '1';
	            $.ajax({
	                type:'get',
	                data:json_workday,
	                async:false,
	                url:'com.primeton.eos.ame_common.wx_worktime.isWorkDay.biz.ext',
	                success:function(result){
	                    isworkday=result.isWorkday;
	                }
	            })
	            if(isworkday == 0 && newVal>0 && this.isDaysOff1 =='1' ){
	        		document.getElementById("DaysOff").disabled=false;
	        		this.DaysoffShow=false;
	        		this.isDaysOff=true;
	            }else if (isworkday == 0 && newVal>0 && (this.isDaysOff1 == '0' || this.isDaysOff1 =='')){
	        		document.getElementById("DaysOff").disabled=false;
	        		this.DaysoffShow=false;
	        		if(this.isDaysOff==true){
	        			this.isDaysOff=true;
	        		}else{
	        			this.isDaysOff=false;
	        		}
	            }else{
	            	document.getElementById("DaysOff").disabled=true;
	            	this.DaysoffShow=false;
	        		this.isDaysOff=false;
	            }
	            this.otwHours=newVal;
            },
        },
        methods:{
            fh:function(startdate,endate){
                sessionStorage.setItem("startdate",this.startdate); 
                sessionStorage.setItem("enddate",this.enddate);
                sessionStorage.setItem("time",this.startdate);
                window.location.href = '<%= request.getContextPath() %>/ame_common/wxworktime/list.jsp?time='+((new Date()).getTime());
            },
            savedata:function(){
                var json=null;
                var _self = this;
                _self.bolen = false;
                var custname = $("#nav-search-cust option:checked").text();
                if((this.custid==null || this.custid=='' || custname == null || custname == '') && (this.picked=="Pro" || this.picked=="orgLevel")){
                    nui.alert("客户必选！");
                	_self.bolen = true;
                    return;
                }
                var projectname = $("#nav-search-project option:checked").text();
                if(this.projectid==null || this.projectid == '' || projectname == null || projectname == ''){
                    nui.alert("项目必选！");
                	_self.bolen = true;
                    return;
                }
                var orgname = $("#nav-search-input option:checked").text();
                if(this.orgid==null || this.orgid == ''|| orgname == null || orgname == ''){
                    nui.alert("受益部门必选！");
                	_self.bolen = true;
                    return;
                }
                var taskname = $("#nav-search-task option:checked").text();
                if(this.tasklist==null || this.tasklist == '' || taskname == null || taskname == ''){
                    nui.alert("项目活动必选！");
                	_self.bolen = true;
                    return;
                }
                if(this.acthours==null || this.acthours == 0){
                    nui.alert("工作时间不能为零！");
                	_self.bolen = true;
                    return;
                }
                if(this.repContent==null || this.repContent == ''){
                    nui.alert("工作内容必填！");
                	_self.bolen = true;
                    return;
                }
                this.laborDate=document.getElementById("demo").innerHTML.replace('年',"-").replace('月',"-").replace('日',"");
                if(this.laborDate== null || this.laborDate == ''){
                    nui.alert("填报日期不能为空！");
                	_self.bolen = true;
                    return;
                }
                if(new   Date(Date.parse(this.laborDate.replace(/-/g,"/")))>new Date()){
                    nui.alert("填报日期不能大于当天！");
                	_self.bolen = true;
                    return;
                }
                if(this.minDate != '' && this.minDate != null && this.operate=="add"){
                	if(new   Date(Date.parse(this.laborDate.replace(/-/g,"/")))<new Date(Date.parse(this.minDate.replace(/-/g,"/")))){
	                	var dayCount = parseInt((Math.abs(new Date() - new Date(Date.parse(this.minDate.replace(/-/g,"/")))))/1000/60/60/24)+1;
                		alert("根据系统设置要求，不能填报超过距离当前日期"+dayCount+"天的工时！(最小填报日期："+this.minDate.substr(0,10)+')');
                		_self.bolen = true;
	                    return;
	                }
                }
                if(parseFloat(this.acthours)<parseFloat(this.otwHours)){
                	nui.alert("填报的加班工时不能大于总工时！");
                	_self.bolen = true;
                    return;
                }
                if(this.tborgid == null || this.tborgid == ''){
                    nui.alert("填报部门必填！");
                	_self.bolen = true;
                    return;
                }
                if(this.DaysoffShow){
                	if(this.isDaysOff==false){
                		if(confirm("该加班工时你已选择“不调休”，是否确认？")){
                		}else{
                			_self.bolen = true;
                			return;
                		}
                	}
                }
               	var isDaysOff='0';
                if(this.isDaysOff==true){
                	isDaysOff = '1';
                }
                if(this.isDaysOff1=='2'){
                	isDaysOff = '2';
                }
                
                //$('.xz').attr('onclick','javascript:void();');//改变提交按钮上的文字并将按钮设置为不可点击
                if(this.custid == '1'){
                    this.custid='';
                }
                var tbly='';
                if(this.isPhone==true){
                	tbly="wx";
                }
                if(this.operate=="add"){
                    json=({"insertEntities": 
                                    [{"actHours": this.acthours,
                                    "userId": this.userid,
                                    "laborDetailId":this.laborDetailId,
                                    "laborDate":this.laborDate,
                                    "otwHours":this.otwHours,
                                    "custid":this.custid,
                                    "projectId":this.projectid,
                                    "tasklist":this.tasklist,
                                    "repContent":this.repContent,
                                    "status":0,
                                    "userOrgId":this.tborgid,
                                    "isDaysOff":isDaysOff,
                                    "tbly":tbly,
                                    "omOrganization":{"orgid": this.orgid}
                                    }]});
                     if(json.insertEntities[0].userOrgId == null || json.insertEntities[0].userOrgId == ''){
                     	nui.alert("填报部门必填！");
	                	_self.bolen = true;
	                    return;
                     }
                }else{
                    json=({"updateEntities": 
                                    [{"actHours": this.acthours,
                                    "userId": this.userid,
                                    "laborDetailId":this.laborDetailId,
                                    "laborDate":this.laborDate,
                                    "otwHours":this.otwHours,
                                    "custid":this.custid,
                                    "projectId":this.projectid,
                                    "tasklist":this.tasklist,
                                    "repContent":this.repContent,
                                    "userOrgId":this.tborgid,
                                    "isDaysOff":isDaysOff,
                                    "tbly":tbly,
                                    "omOrganization":{"orgid": this.orgid}
                                    }]});
                	if(json.updateEntities[0].userOrgId == null || json.updateEntities[0].userOrgId == ''){
                     	nui.alert("填报部门必填！");
	                	_self.bolen = true;
	                    return;
                     }
                }
                nui.ajax({
                    type:'get',
                    data:json,
                    cache: false,
                    showModal: false,
                    contentType: 'text/json',
                    url:'com.primeton.rdmgr.labor.input.rdlabordetailbiz.saveAllRdLaborDetails1.biz.ext',
                    success:function(result){
                        if(result.exception == null){
                            nui.alert("保存成功","系统提示",function(){
                                sessionStorage.setItem("startdate",app.startdate); 
                                sessionStorage.setItem("enddate",app.enddate);
                                sessionStorage.setItem("time",app.startdate);
                				window.location.href = '<%= request.getContextPath() %>/ame_common/wxworktime/list.jsp?time='+((new Date()).getTime());
                            });
                        }else{
                            nui.alert("保存失败！请联系信息技术部人员。")
                        }
                        _self.bolen = true;
                        
                    },
                    error:function(jqXHR, textStatus, errorThrown){
                        nui.alert("error:" + jqXHR.responseText);
                    }
                })
            },
        },
    });
    
    function watchcust(){
        app.custid=document.getElementById("nav-search-cust").value;
    }
    
    function watchorg(){
        app.orgid=document.getElementById("nav-search-input").value;
    }
    
    function watchtborg(){
        app.tborgid=document.getElementById("nav-search-tb").value;
    }
    
    function watchproject(){
        app.projectid=document.getElementById("nav-search-project").value;
    }
    
    function watchtask(){
        app.tasklist=document.getElementById("nav-search-task").value;
    }
      
    function formatRepo(repo){
        //app.custs=repo;
        return repo.text;
    }
    function formatRepoSelection(repo){
        app.custid=repo.id;
        return repo.text;
    }
    
    //判断手机还是pc true为pc false为pc
	function IsPC() {
	    var userAgentInfo = navigator.userAgent;
	    var Agents = ["Android", "iPhone",
	                "SymbianOS", "Windows Phone",
	                "iPad", "iPod"];
	    var flag = true;
	    for (var v = 0; v < Agents.length; v++) {
	        if (userAgentInfo.indexOf(Agents[v]) > 0) {
	            flag = false;
	            break;
	        }
	    }
	    return flag;
	}
	 
	var flag = IsPC();
	app.isPhone = !flag;
	
	var pendingRequests = {};
	$.ajaxPrefilter(function( options, originalOptions, jqXHR ) {
		var key = options.url;
	 	if (!pendingRequests[key]) {
	  		pendingRequests[key] = jqXHR;
	 	}else{
	  		//jqXHR.abort(); //放弃后触发的提交
	  		pendingRequests[key].abort(); // 放弃先触发的提交
	 	}
	 
	 	var complete = options.complete;
	 	options.complete = function(jqXHR, textStatus) {
	  		pendingRequests[key] = null;
	  		if ($.isFunction(complete)) {
	  			complete.apply(this, arguments);
	  		}
	 	};
	});
</script>
</html>