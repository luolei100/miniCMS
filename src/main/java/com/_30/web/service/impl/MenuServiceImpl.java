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

	/*
	 * (non-Javadoc)
	 * 
	 * @see com._30.web.service.IMenuService#getMenu(int)
	 */
	@Override
	public List<DBObject> getMenu(int id) {
		DBCollection dbc = MongoDBUtil.getDB().getCollection(MONGO_COLLECTION);

		DBObject query = new BasicDBObject();

		query.put("pid", (float)id);

		DBCursor cursor = dbc.find(query);

		List<DBObject> results = new ArrayList<>();
		while (cursor.hasNext()) {

			DBObject c = cursor.next();

			logger.debug("..."+c);

			results.add(c);
		}

		return results;
	}

}
