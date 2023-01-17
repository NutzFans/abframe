/**
 * 
 */
package com.primeton.eos.ame_newlook;


import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map.Entry;

import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.ChangeSummary;
import commonj.sdo.DataGraph;
import commonj.sdo.DataObject;
import commonj.sdo.Property;
import commonj.sdo.Sequence;
import commonj.sdo.Type;


/**
 * @author zyl
 * @date 2016-07-14 17:05:09
 *
 */
@Bizlet("")
public class PjMenu {

	/**
	 * @param menuTemp
	 *  自顶向下按顺序拼接
	 * @return
	 * @author 朱海翔
	 */
	@Bizlet("")
	public static DataObject[] pjMenus(DataObject[] menuTemp) {
		HashMap mapresult = new HashMap();
		ArrayList<DataObject> menus = new ArrayList<DataObject>();
		mapresult.put("0",menus);
		int length = menuTemp.length;
		for(int i =0;i<length;i++){
			if(menuTemp[i].get("parentsid")==null){
				menus.add(menuTemp[i]);
				mapresult.put(menuTemp[i].get("id"),menuTemp[i]);
			}else{
				DataObject menuTemp1 = (DataObject) mapresult.get(menuTemp[i].get("parentsid"));
				List menusTemp =  menuTemp1.getList("menus");
				if(menusTemp==null){
					menusTemp = new ArrayList<DataObject>();
					menuTemp1.set("menus", menusTemp);
				}
				menusTemp.add(menuTemp[i]);
				mapresult.put(menuTemp[i].get("id"),menuTemp[i]);
			}
		}
		ArrayList<DataObject> menusReal = (ArrayList<DataObject>) mapresult.get("0");
		DataObject[] realmenu = new DataObject[menusReal.size()];
		menusReal.toArray(realmenu);
		return realmenu;
	}
	
	
	
	
	
	/**
	 * @param menuTemp
	 * @param 自底向上拼接菜单
	 * @return
	 * @author 朱海翔
	 */
	@Bizlet("")
	public static HashMap pjmenu(DataObject[] menuTemp) {
		int length1 = menuTemp.length;
		String flag = "temp1"; 
		HashMap<String, ArrayList<DataObject>> mapTemp = new HashMap<String, ArrayList<DataObject>>();
		for(int i = 0;i<length1;i++){
			String parentsid = menuTemp[i].getString("parentsid");
			if(parentsid != null && (!"temp2".equals(parentsid))){
				flag = "temp0";
			}else{
				parentsid = "temp2";
			}
			ArrayList list = (ArrayList) mapTemp.get(parentsid);
			if(list==null){
				list = new ArrayList();
			}
			list.add(menuTemp[i]);
			mapTemp.put(parentsid, list);
		}
		HashMap mapresult = new HashMap();
		if("temp1".equals(flag)){
			mapresult.put(flag, menuTemp);
		}else{
			ArrayList listTemp =  mapTemp.get("temp2");
			int listleng = 0;
			if(listTemp != null){
				listleng = listTemp.size();
			}
			int klen = 0;
			int mapleng = mapTemp.size();
			if(listleng == 0){
				klen = mapleng;
			}else{
				klen = mapleng+listleng-1;
			}
			DataObject[] menuTemp1 = new DataObject[klen];
			int k = 0;
			for (Entry<String, ArrayList<DataObject>> entry : mapTemp.entrySet()) {  
				String parentsid = entry.getKey();
				if("temp2".equals(parentsid)){
					ArrayList list =entry.getValue();
					int length2 = list.size();
					DataObject[] aa = new DataObject[length2];
					for(int j=0;j<length2;j++){
						aa[j] = (DataObject) list.get(j);
						menuTemp1[k] = aa[j];
						k++;
					}
				}else{
					ArrayList list =entry.getValue();
					int length2 = list.size();
					DataObject[] aa = new DataObject[length2];
					for(int j=0;j<length2;j++){
						aa[j] = (DataObject) list.get(j);
					}
					HashMap param = new HashMap();
					param.put("parentsid", parentsid);
					Object[] listR = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_newlook.pjmenu.getLastMenu", param);
					if(listR.length!=0){
						DataObject resultR = (DataObject) listR[0];
						resultR.set("menus", aa);
						menuTemp1[k] = resultR;
						k++;
					}
				}
			} 
			mapresult.put(flag,sortMenus(menuTemp1));
		}
		return mapresult;
	}
	
	
	
	/**
	 * @param data
	 * @return 
	 *  合并菜单
	 * @author 朱海翔
	 */
	@Bizlet("")
	public static DataObject[] removeDupmenu(DataObject[] data) {
		int length = data.length;
		HashMap<String, ArrayList<DataObject[]>> map = new HashMap<String, ArrayList<DataObject[]>>();
		for(int i=0;i<length;i++){
			ArrayList list = (ArrayList) map.get(data[i].get("id"));
			if(list==null){
				list = new ArrayList();
			}
			list.add(data[i].get("menus"));
			map.put((String) data[i].get("id"),list);
		}
		ArrayList listMenus = new ArrayList();
		for (Entry<String, ArrayList<DataObject[]>> entry : map.entrySet()) {  
			String id = entry.getKey();
			ArrayList list =entry.getValue();
			ArrayList listTemp = new ArrayList();
			int length2 = list.size();
			for(int j=0;j<length2;j++){
				DataObject[] aa =  (DataObject[]) list.get(j);
				for(int k = 0;k<aa.length;k++){
					listTemp.add(aa[k]);
				}
			}
			DataObject[] aa = new DataObject[listTemp.size()];
			for(int j=0;j<listTemp.size();j++){
				aa[j] = (DataObject) listTemp.get(j);
			}
			HashMap param = new HashMap();
			param.put("parentsid", id);
			Object[] listR = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_newlook.pjmenu.getLastMenu", param);
			if(listR.length!=0){
				DataObject resultR = (DataObject) listR[0];
				resultR.set("menus", sortMenus(aa));
				listMenus.add(resultR);
			}
		}
		DataObject[] bb = new DataObject[listMenus.size()];
		for(int j=0;j<listMenus.size();j++){
			bb[j] = (DataObject) listMenus.get(j);
		}
		
		return sortMenus(bb);
	}
	//排序
	private static DataObject[] sortMenus(DataObject[] menulist) {
		List<DataObject> menus = new ArrayList<DataObject>();
		menus.addAll(Arrays.asList(menulist));
	 // 按menulevel、displayorder排序
		Collections.sort(menus, new Comparator<DataObject>(){
			 public int compare(DataObject o1, DataObject o2) {
				 if(o1.getInt("menulevel")!=o2.getInt("menulevel")){
					 return o1.getInt("menulevel")-o2.getInt("menulevel");
				 }else if( o1.getInt("displayorder")!= o2.getInt("displayorder")){
					 return o1.getInt("displayorder")-o2.getInt("displayorder");
				 }else{
					 return 0;
				 }				
			}
		});
		return  menus.toArray(new DataObject[0]);
	}

}
