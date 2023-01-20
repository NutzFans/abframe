/**
 * 
 * 
 * 
 */

var canvas_in;
var canvas_out;
var ctx_in;
var ctx_out;

//初始化考勤打卡按钮
function initButtion(){
	canvas_in = $("#signInBtn_show")[0];
	canvas_out = $("#signOutBtn_show")[0];
	
	if(canvas_in.getContext){
		//获取对应的CanvasRenderingContext2D对象(画笔)
		ctx_in = canvas_in.getContext("2d"); 
	}
	//签退画布
	if(canvas_out.getContext){
		ctx_out = canvas_out.getContext("2d"); 
	}
	
	canvasIn();
	canvasOut();
	showText(ctx_in,"签到"); 
	showText(ctx_out,"签退"); 
	
}

//签到画布初始化
function canvasIn(){
	//简单地检测当前浏览器是否支持Canvas对象，以免在一些不支持html5的浏览器中提示语法错误
	if(canvas_in.getContext){  
    	//开始一个新的绘制路径
    	ctx_in.beginPath();
    	//设置弧线的颜色为蓝色
    	ctx_in.strokeStyle = "#ace7ff";
    	//边框宽度
    	ctx_in.lineWidth = 6;
    	//圆的参数
    	var circle = {
	        x : 180,    //圆心的x轴坐标值
	        y : 80,    //圆心的y轴坐标值
	        r : 65      //圆的半径
	    };
	    //以canvas中的坐标点(180,100)为圆心，绘制一个半径为65px的圆形
	    ctx_in.arc(circle.x, circle.y, circle.r, 0, Math.PI * 2, true);    
	    //按照指定的路径绘制弧线,
	    ctx_in.stroke();//对于边框的画图方法。
	    
	    ctx_in.beginPath();//再开始画
    	var circle = {
	        x : 180,    //圆心的x轴坐标值
	        y : 80,    //圆心的y轴坐标值
	        r : 60      //圆的半径
	    };
	    //以canvas中的坐标点(180,100)为圆心，绘制一个半径为60px的圆形
	    ctx_in.arc(circle.x, circle.y, circle.r, 0, Math.PI * 2, true);   
	    //填充颜色 
	    ctx_in.fillStyle="#17aeec"; 
	    ctx_in.closePath(); 
	    ctx_in.fill(); //填充图像内部的画图方法
	 }
}

//签到成功画布
function canvasInSucc(time){
	ctx_in.clearRect(0,0,500,500);
	ctx_in.beginPath();
	//设置弧线的颜色为蓝色
	ctx_in.strokeStyle = "#E6E6FA";
	//边框宽度
	ctx_in.lineWidth = 6;
	//圆的参数
	var circle = {
        x : 180,    //圆心的x轴坐标值
        y : 80,    //圆心的y轴坐标值
        r : 65      //圆的半径
    };
    //以canvas中的坐标点(180,100)为圆心，绘制一个半径为65px的圆形
    ctx_in.arc(circle.x, circle.y, circle.r, 0, Math.PI * 2, true);    
    //按照指定的路径绘制弧线,
    ctx_in.stroke();//对于边框的画图方法。
    
    ctx_in.beginPath();//再开始画
	var circle = {
        x : 180,    //圆心的x轴坐标值
        y : 80,    //圆心的y轴坐标值
        r : 60      //圆的半径
    };
    //以canvas中的坐标点(180,100)为圆心，绘制一个半径为60px的圆形
    ctx_in.arc(circle.x, circle.y, circle.r, 0, Math.PI * 2, true);   
    //填充颜色 
    ctx_in.fillStyle="#DCDCDC"; 
    ctx_in.closePath(); 
    ctx_in.fill(); //填充图像内部的画图方法
    //showTime(ctx_in,"09:30");
     //时间
    ctx_in.font = 'bold 21px arial';
    ctx_in.fillStyle = '#f6f6f6';
    ctx_in.fillText(time, 156, 80);
    //显示签退
    ctx_in.font = 'bold 21px arial';
    ctx_in.fillStyle = '#ffffff';
    ctx_in.fillText("签到", 162,100);
}

function canvasOut(){
	//简单地检测当前浏览器是否支持Canvas对象，以免在一些不支持html5的浏览器中提示语法错误
	if(canvas_out.getContext){  
    	//开始一个新的绘制路径
    	ctx_out.beginPath();
    	//设置弧线的颜色为蓝色
    	ctx_out.strokeStyle = "#ace7ff";
    	//边框宽度
    	ctx_out.lineWidth = 6;
    	//圆的参数
    	var circle = {
	        x : 180,    //圆心的x轴坐标值
	        y : 80,    //圆心的y轴坐标值
	        r : 65      //圆的半径
	    };
	    //以canvas中的坐标点(180,100)为圆心，绘制一个半径为65px的圆形
	    ctx_out.arc(circle.x, circle.y, circle.r, 0, Math.PI * 2, true);    
	    //按照指定的路径绘制弧线,
	    ctx_out.stroke();//对于边框的画图方法。
	    
	    ctx_out.beginPath();//再开始画
    	var circle = {
	        x : 180,    //圆心的x轴坐标值
	        y : 80,    //圆心的y轴坐标值
	        r : 60      //圆的半径
	    };
	    //以canvas中的坐标点(180,100)为圆心，绘制一个半径为60px的圆形
	    ctx_out.arc(circle.x, circle.y, circle.r, 0, Math.PI * 2, true);   
	    //填充颜色 
	    ctx_out.fillStyle="#17aeec"; 
	    ctx_out.closePath(); 
	    ctx_out.fill(); //填充图像内部的画图方法
	 }
}

//签退成功后按钮显示画布
function canvasOutSucc(time){
	//清除画布内容
	ctx_out.clearRect(0,0,500,500);
	//开始一个新的绘制路径
	ctx_out.beginPath();
	//设置弧线的颜色为蓝色
	ctx_out.strokeStyle = "#E6E6FA";
	//边框宽度
	ctx_out.lineWidth = 6;
	//圆的参数
	var circle = {
        x : 180,    //圆心的x轴坐标值
        y : 80,    //圆心的y轴坐标值
        r : 65      //圆的半径
    };
    //以canvas中的坐标点(180,100)为圆心，绘制一个半径为65px的圆形
    ctx_out.arc(circle.x, circle.y, circle.r, 0, Math.PI * 2, true);    
    //按照指定的路径绘制弧线,
    ctx_out.stroke();//对于边框的画图方法。
    
    ctx_out.beginPath();//再开始画
	var circle = {
        x : 180,    //圆心的x轴坐标值
        y : 80,    //圆心的y轴坐标值
        r : 60      //圆的半径
    };
    //以canvas中的坐标点(180,100)为圆心，绘制一个半径为60px的圆形
    ctx_out.arc(circle.x, circle.y, circle.r, 0, Math.PI * 2, true);   
    //填充颜色 
    ctx_out.fillStyle="#DCDCDC"; 
    ctx_out.closePath(); 
    ctx_out.fill(); //填充图像内部的画图方法
    //showTime(ctx_out,"18:00");
    //时间
    ctx_out.font = 'bold 21px arial';
    ctx_out.fillStyle = '#f6f6f6';
    ctx_out.fillText(time, 156, 80);
    //显示签退
    ctx_out.font = 'bold 21px arial';
    ctx_out.fillStyle = '#ffffff';
    ctx_out.fillText("签退", 162,100);
   
}


 //显示文字(签到/签退)
 function showText(ctx,text){
    ctx.font = 'bold 21px arial';
    ctx.fillStyle = '#ffffff';
    ctx.fillText(text, 159,85);
 }
 
//显示时间
function showTime(ctx,time){
    ctx.font = 'bold 21px arial';
    ctx.fillStyle = '#f6f6f6';
    ctx.fillText(time, 156, 85);
 }