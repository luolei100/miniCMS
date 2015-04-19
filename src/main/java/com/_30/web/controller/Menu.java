/**   
 * @Title: Menu.java 
 * @Package com._30.common.web.controller 
 * @Description: TODO 
 * @date 2015年4月19日 下午1:41:22 
 * @version V1.0   
 */
package com._30.web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com._30.web.service.IMenuService;
import com.mongodb.DBObject;

/**
 * @author luolei
 * 
 */
@RequestMapping("menu")
@Controller
public class Menu {

	private static final Logger logger = LoggerFactory.getLogger(Menu.class);

	@Autowired
	private IMenuService menuService = null;

	@RequestMapping(value = "getMenu/${id}", method = RequestMethod.GET)
	public List<DBObject> getMenu(int id) {
		logger.debug("获取菜单列表,菜单节点:{}", id);

		List<DBObject> menus = this.menuService.getMenu(id);

		return menus;
	}

}
