package com._30.mongo;

import com._30.common.util.MongoDBUtil;
import com._30.web.service.IMenuService;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.WriteConcern;
import com.mongodb.WriteResult;

public class MongoDBCRUDTest {

	public static void main(String[] args) {

		DB db = MongoDBUtil.getDB();

		DBCollection coll = db.getCollection(IMenuService.MONGO_COLLECTION);

		DBObject o = new BasicDBObject();

		o.put("id", 1);
		o.put("text", "根目录");
		o.put("status", "open");
		o.put("parent", 0);
		WriteResult result = coll.insert(o, WriteConcern.UNACKNOWLEDGED);

		if (result.getN() > 0) {
			System.out.println("插入成功");
		}

		DBObject query = new BasicDBObject();

		query.put("id", 1);

		DBCursor cur = coll.find(query);

		while (cur.hasNext()) {
			System.out.println(cur.next());
		}

	}

}
