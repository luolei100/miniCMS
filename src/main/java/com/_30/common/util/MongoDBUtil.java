/**   
 * @Title: MongoDBUtil.java 
 * @Package com._30.common.util 
 * @Description: TODO 
 * @date 2015年4月19日 下午5:09:52 
 * @version V1.0   
 */
package com._30.common.util;

import java.net.UnknownHostException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoException;

/**
 * 获取mongdb链接
 * 
 * @author luolei
 * 
 */
public class MongoDBUtil {

	private static final Logger logger = LoggerFactory
			.getLogger(MongoDBUtil.class);

	private static final String HOST = "localhost";

	public static final String DEFAULT_DB_NAME = "mini_cms";

	private static MongoClient mc = null;

	private MongoDBUtil() {
	}

	static {
		initDBPrompties();
	}

	public static DB getDB() {
		return mc.getDB(DEFAULT_DB_NAME);
	}

	public static DB getDB(String dbName) {
		return mc.getDB(dbName);
	}

	/**
	 * 初始化连接池
	 */
	private static void initDBPrompties() {
		// 其他参数根据实际情况进行添加
		try {
			mc = new MongoClient(HOST, new MongoClientOptions.Builder().build());

			logger.debug("mongo初始化完成!!");

		} catch (UnknownHostException e) {
			logger.error("mongoDB初始化失败,主机不存在或者无法连接.");
		} catch (MongoException e) {
			logger.error("mongoDB初始化失败.");
		} finally {
			logger.info("mongo配置文件:{}" + mc);
		}

	}
}
