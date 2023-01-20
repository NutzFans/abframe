package com.primeton.eos.ame_common;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.system.annotation.Bizlet;

/**
 * 百度地图工具类
 * @author shihao
 *
 */
public class BaiduMapUtil {
	static double DEF_PI = 3.14159265359; // PI
    static double DEF_2PI= 6.28318530712; // 2*PI
    static double DEF_PI180= 0.01745329252; // PI/180.0
    static double DEF_R =6370693.5; // 地球的半径
     
    /**
     * 适用于近距离
     * 用于计算2个point之间的距离
     * @param lon1
     * @param lat1
     * @param lon2
     * @param lat2
     * @return
     */
    @Bizlet("计算2个坐标之间的距离")
    public static double getShortDistance(double lon1, double lat1, double lon2, double lat2)
    {
        double ew1, ns1, ew2, ns2;
        double dx, dy, dew;
        double distance;
        // 角度转换为弧度
        ew1 = lon1 * DEF_PI180;
        ns1 = lat1 * DEF_PI180;
        ew2 = lon2 * DEF_PI180;
        ns2 = lat2 * DEF_PI180;
        // 经度差
        dew = ew1 - ew2;
        // 若跨东经和西经180 度，进行调整
        if (dew > DEF_PI){
        	dew = DEF_2PI - dew;
        }else if (dew < -DEF_PI){
        	dew = DEF_2PI + dew;
        }
        dx = DEF_R * Math.cos(ns1) * dew; // 东西方向长度(在纬度圈上的投影长度)
        dy = DEF_R * (ns1 - ns2); // 南北方向长度(在经度圈上的投影长度)
        // 勾股定理求斜边长
        distance = Math.sqrt(dx * dx + dy * dy);
        BigDecimal bigDe=  new BigDecimal(distance);  
        double  newDistance= bigDe.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();  
        return newDistance;
    }
    
    /**
     * 适用于远距离
     * @param lon1
     * @param lat1
     * @param lon2
     * @param lat2
     * @return
     */
    @Bizlet("计算2个坐标之间的距离")
    public static double getLongDistance(double lon1, double lat1, double lon2, double lat2)
    {
        double ew1, ns1, ew2, ns2;
        double distance;
        // 角度转换为弧度
        ew1 = lon1 * DEF_PI180;
        ns1 = lat1 * DEF_PI180;
        ew2 = lon2 * DEF_PI180;
        ns2 = lat2 * DEF_PI180;
        // 求大圆劣弧与球心所夹的角(弧度)
        distance = Math.sin(ns1) * Math.sin(ns2) + Math.cos(ns1) * Math.cos(ns2) * Math.cos(ew1 - ew2);
        // 调整到[-1..1]范围内，避免溢出
        if (distance > 1.0){
             distance = 1.0;
        }else if (distance < -1.0){
              distance = -1.0;
        }
        // 求大圆劣弧长度
        distance = DEF_R * Math.acos(distance);
        return distance;
    }
    
    /**
     * 坐标转换成地理位置
     * @param lon1
     * @param lat1
     */
    @Bizlet("坐标转换成地理位置")
    public static Map<String,Object> coordinateToLocation(String lon1,String lat1){
    	Map<String,Object> map = new HashMap<String,Object>();
    	String key = BusinessDictUtil.getDictName("AME_SYSCONF", "MAPKEY") ;
    	String url = BusinessDictUtil.getDictName("AME_SYSCONF", "MAP_GEOCODER_URL") ;
    			//"http://api.map.baidu.com/geocoder/v2/";
		String param = "coordtype=wgs84ll&location="+lat1+","+lon1+"&output=json&pois=0&ak="+key;
		String return_msg = HttpClientUtil.getMethodInvoke(url, param);
    	JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
    	String status = return_json.get("status").toString();
    	if(status.equals("0")){
    		JSONObject ja = (JSONObject)return_json.get("result");
        	JSONObject location = (JSONObject)ja.get("location");
        	String formatted_address = (String)ja.get("formatted_address");
        	map.put("x", location.get("lng"));
        	map.put("y", location.get("lat"));
        	map.put("address", formatted_address);
    	}
		return map;
    }
    
    
    public static void main(String[] args) {
    	//121.59407,W31.207956
    	//121.5886,31.21035
        double mLat1 = 31.21035; // point1纬度
        double mLon1 = 121.5886; // point1经度
        //121.593334,31.207863
        double mLat2 = 31.207863;// point2纬度
        double mLon2 = 121.593334;// point2经度
        //double distance = BaiduMapUtil.GetShortDistance(mLon1, mLat1, mLon2, mLat2);
        //31°12′38.34″ 东经E121°35′23.24″
        BaiduMapUtil.coordinateToLocation("121.352324","31.123834");
        //System.out.println(distance);
    }
}
