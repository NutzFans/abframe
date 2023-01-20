<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

/* performance table */
function show_product(unitno,year,month,type){ 
var strurl='showReport.jsp?raq=rpt_test_chanpinshouru.raq&unitno='+unitno+'&year='+year+'&month='+month+'&type='+type;
window.open(strurl,"_blank","height=500,width=600"); 
}


function show_shouru(unitno,year,month,typeValue,selectName){ 
	
	
	/*
	var typeStr;
	switch (type)
	{
	case 1:
	  typeStr="产品";
	  break;
	
	case 2:
	typeStr="服务";
	  break;
	
	case 3:
	typeStr="MA";
	  break;
	}
	*/
	var strurl='showReport.jsp?raq=performance_shouru.raq&unitno='+unitno+'&year='+year+'&month='+month+'&typeValue='+typeValue+'&selectName='+selectName;
	window.open(strurl,"_blank"); 
}


function show_fuwuchengben(unitno,year,month,type){
	var strurl='showReport.jsp?raq=performance_fuwuchengben.raq&unitno='+unitno+'&year='+year+'&month='+month+'&type='+type;
	window.open(strurl,"_blank"); 

}

function show_xiaoshoufeiyong(unitno,year,month,type){
	var strurl='showReport.jsp?raq=performance_xiaoshoufeiyong.raq&unitno='+unitno+'&year='+year+'&month='+month+'&type='+type;
	window.open(strurl,"_blank"); 

}

function show_jibengongzi(unitno,year,month,deptExpTypeID){
	var strurl='showReport.jsp?raq=performance_jibengongzi.raq&unitno='+unitno+'&year='+year+'&month='+month+'&deptExpTypeID='+deptExpTypeID;
	window.open(strurl,"_blank"); 

}

function changeFontColor(name){
	
}


/* dept_PL table */
function show_grossIncome(deptno,year,month,type,title){
	//	alert('&deptno='+deptno+'&year='+year+'&month='+month+'&type='+type+'&title='+title);
	var strurl='showReport.jsp?raq=dept_PL_grossIncome.raq&deptno='+deptno+'&year='+year+'&month='+month+'&type='+type+'&title='+title;
	window.open(strurl,"_blank"); 
}

function show_netIncome(deptno,year,month,type,title){
	//	alert('&deptno='+deptno+'&year='+year+'&month='+month+'&type='+type+'&title='+title);
	var strurl='showReport.jsp?raq=dept_PL_netIncome.raq&deptno='+deptno+'&year='+year+'&month='+month+'&type='+type+'&title='+title;
	window.open(strurl,"_blank"); 
}

function show_serviceCosts(deptno,year,month,staticCosts,outSource,buy,sell){
	//	alert(' deptno='+deptno+' year='+year+' month='+month+' '+staticCosts+'/'+outSource+'/'+buy+'/'+sell);
	var strurl='showReport.jsp?raq=dept_PL_serviceCosts.raq&deptno='+deptno+'&year='+year+'&month='+month+'&staticCosts='+staticCosts+'&outSource='+outSource+'&buy='+buy+'&sell='+sell;
	window.open(strurl,"_blank"); 
}

function show_staticServiceCosts(subRaq,deptno,year,month,parentType){
	//	alert(' deptno='+deptno+' year='+year+' month='+month+' parentType='+parentType);
	var strurl=subRaq+'&deptno='+deptno+'&year='+year+'&month='+month+'&parentType='+parentType;
	window.open(strurl,"_blank"); 
}

function show_staicServiceCostsSalary(subRaq,deptno,year,month,deptExpTypeID,deptGroupTypeID,parentType){
//	alert('subRaq='+subRaq+' deptno='+deptno+' year='+year+' month='+month+" deptExpTypeID="+deptExpTypeID +' deptGroupTypeID='+deptGroupTypeID+' parentType='+parentType);
	var strurl='showReport.jsp?raq='+subRaq+'.raq&deptno='+deptno+'&year='+year+'&month='+month+'&deptExpTypeID='+deptExpTypeID+'&deptGroupTypeID='+deptGroupTypeID+'&parentType='+parentType;
	window.open(strurl,"_blank"); 
}
//公共费用预算与执行表点击链接调用的js函数
function show_commBudgetDetail(subRaq,regionid,year,month,comExpTypeID,comGroupTypeID){
	//alert(regionid);
	//alert('subRaq='+subRaq+' regionid='+regionid+' year='+year+' month='+month+" comExpTypeID="+comExpTypeID +' comGroupTypeID='+comGroupTypeID);
	var strurl='showReport.jsp?raq='+subRaq+'.raq&regionid='+regionid+'&year='+year+'&month='+month+'&comExpTypeID='+comExpTypeID+'&comGroupTypeID='+comGroupTypeID;
	window.open(strurl,"_blank"); 
}
/* dept_BFT table */

function company_PL_income(year,month,type,name){
	var strurl='showReport.jsp?raq=company_PL_income.raq&year='+year+'&month='+month+'&type='+type+'&name='+name;
	window.open(strurl,"_blank"); 
}
function company_PL_costs(year,month,fileName){
	var strurl='showReport.jsp?raq=company_PL_'+fileName+'.raq&year='+year+'&month='+month;
	window.open(strurl,"_blank"); 
}



</script>

