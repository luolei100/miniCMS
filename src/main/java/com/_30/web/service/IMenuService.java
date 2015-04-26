/**   
* @Title: IMenuService.java 
* @Package com._30.web.controller.service 
* @Description: TODO 
* @date 2015年4月19日 下午6:09:53 
* @version V1.0   
*/
package com._30.web.service;

import java.util.List;

import com.mongodb.DBObject;

/**
 * @author luolei 
 * 
 */
public interface IMenuService {
	
	
	public static final String MONGO_COLLECTION = "back_menu";
	
	/**
	 * 获取菜单
	 * @param id
	 * @return
	 */
	public List<DBObject> getMenu(int id) ;

	/**
	 * 菜单修改,
	 * @param json 已修改的json串
	 */
	public String edit(String json);
	
	
	
}
