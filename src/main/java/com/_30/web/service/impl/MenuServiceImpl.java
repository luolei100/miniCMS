/**   
 * @Title: MenuServiceImpl.java 
 * @Package com._30.web.service.impl 
 * @Description: TODO 
 * @date 2015年4月19日 下午8:27:00 
 * @version V1.0   
 */
package com._30.web.service.impl;

import java.util.List;

import com._30.common.util.MongoDBUtil;
import com._30.web.service.IMenuService;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

/**
 * @author luolei
 * 
 */
public class MenuServiceImpl implements IMenuService {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com._30.web.service.IMenuService#getMenu(int)
	 */
	@Override
	public List<DBObject> getMenu(int id) {
		DBCollection dbc = MongoDBUtil.getDB().getCollection(MONGO_COLLECTION);
		
		
		dbc.find(ref);
		
		
		
		return null;
	}

}
