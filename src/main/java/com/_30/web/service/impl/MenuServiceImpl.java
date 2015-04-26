/**   
 * @Title: MenuServiceImpl.java 
 * @Package com._30.web.service.impl 
 * @Description: TODO 
 * @date 2015年4月19日 下午8:27:00 
 * @version V1.0   
 */
package com._30.web.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com._30.common.util.MongoDBUtil;
import com._30.web.service.IMenuService;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

/**
 * @author luolei
 * 
 */
@Service
public class MenuServiceImpl implements IMenuService {

	private static final Logger logger = LoggerFactory
			.getLogger(MenuServiceImpl.class);

	public MenuServiceImpl() {
		logger.debug("初始化完成");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com._30.web.service.IMenuService#getMenu(int)
	 */
	@Override
	public List<DBObject> getMenu(int id) {
		DBCollection dbc = getDefaultCollection();

		DBObject query = new BasicDBObject();

		query.put("_parentId", id);

		DBCursor cursor = dbc.find(query);

		List<DBObject> results = new ArrayList<>();
		while (cursor.hasNext()) {

			DBObject c = cursor.next();

			logger.debug("..." + c);

			results.add(c);
		}
		return results;
	}

	/**
	 * @return
	 */
	private DBCollection getDefaultCollection() {
		DBCollection dbc = MongoDBUtil.getDB().getCollection(MONGO_COLLECTION);
		return dbc;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com._30.web.service.IMenuService#edit(java.lang.String)
	 */
	@Override
	public String edit(String json) {

		DBCollection dbc = getDefaultCollection();

		// dbc.save(jo);

		return null;
	}

}
