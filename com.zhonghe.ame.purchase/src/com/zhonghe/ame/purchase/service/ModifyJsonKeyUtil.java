package com.zhonghe.ame.purchase.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;


public class ModifyJsonKeyUtil {
	public static JSONObject transToUpperCaseObject(String json) {
        JSONObject JSONObject2 = new JSONObject();
        JSONObject JSONObject1 = JSON.parseObject(json);
        for (String key : JSONObject1.keySet()){
            Object object = JSONObject1.get(key);
            if (object.getClass().toString().endsWith("JSONObject")) {
                JSONObject2.put(key.toUpperCase(), transToUpperCaseObject(object.toString()));
            } else if (object.getClass().toString().endsWith("JSONArray")) {
                JSONObject2.put(key.toUpperCase(), transToArray(JSONObject1.getJSONArray(key).toString()));
            }else{
                JSONObject2.put(key.toUpperCase(), object);
            }
        }
        return JSONObject2;
    }
	
	/**
     * jsonArray转jsonArray
     *
     * @return JSONArray
     */
    public static JSONArray transToArray(String jsonArray) {
        JSONArray jSONArray2 = new JSONArray();
        JSONArray jSONArray1 = JSON.parseArray(jsonArray);
        for (int i = 0; i < jSONArray1.size(); i++) {
            Object jArray = jSONArray1.getJSONObject(i);
            if (jArray.getClass().toString().endsWith("JSONObject")) {
                jSONArray2.add(transToUpperCaseObject( jArray.toString()));
            } else if (jArray.getClass().toString().endsWith("JSONArray")) {
                jSONArray2.add(transToArray(jArray.toString()));
            }
        }
        return jSONArray2;
    }
}
