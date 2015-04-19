package com._30.common.util;

import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * jackson json工具类
 * 
 * @author zhangyj
 * 
 *         2014年1月10日
 */
public class jacksonUtil {

	private static ObjectMapper objectMapper = null;

	public static void initobjmap() {
		if (objectMapper == null)
			objectMapper = new ObjectMapper();
	}

	public static void destroyTobjmap() {
		if (objectMapper != null)
			objectMapper = null;
	}

	/**
	 * @param json
	 *            格式 [{\"name\":\"haha2\"},{\"name\":\"haha\"}]
	 * @param jsonClass
	 *            格式 Class[].class
	 * @return Account[]
	 * */
	public static <T> T jsonBeanToArray(String json, final Class<T> jsonClass) {
		initobjmap();
		T acc = null;
		try {
			acc = objectMapper.readValue(json, jsonClass);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			destroyTobjmap();
		}
		return (T) acc;
	}

	/**
	 * @param json
	 *            格式 [{\"name\":\"haha2\"},{\"name\":\"haha\"}]
	 * @return List<Map>集合[{name=haha2,email=email2},{name=haha,email=email}]
	 * */
	@SuppressWarnings("rawtypes")
	public static List jsonListMap(String jsonstr) {
		initobjmap();
		List<List> list = null;
		try {
			list = objectMapper.readValue(jsonstr, new TypeReference<List>() {
			});

			// Map<String, Object> map = null;
			// for (int i = 0; i < list.size(); i++) {
			// map= (Map<String, Object>) list.get(i);

			// Set<String> set = map.keySet();
			// for (Iterator<String> it = set.iterator();it.hasNext();) {
			// String key = it.next();
			// System.out.println(key + ":" + map.get(key));
			// }
			// }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			destroyTobjmap();
		}
		return list;
	}

	/**
	 * @param json
	 *            格式 "{\"success\":true,\"A\":{\"address\": \"address2\"},"+
	 *            "\"B\":{\"address\":\"address\",}}";
	 * @return Map<String,String>集合 {success=true, A={address=address22},
	 *         B={address=address}}
	 * */
	@SuppressWarnings("unchecked")
	public static Map<String, String> jsonToMap(String json) {
		initobjmap();
		Map<String, String> maps = null;
		try {
			maps = objectMapper.readValue(json, Map.class);
			// Set<String> key = maps.keySet();
			// Iterator<String> iter = key.iterator();
			// while (iter.hasNext()) {
			// String field = iter.next();
			// System.out.println(field + ":" + maps.get(field));
			// }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			destroyTobjmap();
		}
		return maps;

	}
}
