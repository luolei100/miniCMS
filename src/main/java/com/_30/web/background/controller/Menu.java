/**   
 * @Title: Menu.java 
 * @Package com._30.common.web.controller 
 * @Description: TODO 
 * @date 2015年4月19日 下午1:41:22 
 * @version V1.0   
 */
package com._30.web.background.controller;

import java.util.List;

import org.hibernate.validator.constraints.NotBlank;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com._30.common.util.Common;
import com._30.web.background.service.IMenuService;
import com.mongodb.DBObject;

/**
 * @author luolei
 * 
 */
@RequestMapping("bg/menu")
@Controller
public class Menu {

	private static final Logger logger = LoggerFactory.getLogger(Menu.class);

	@Autowired
	private IMenuService menuService = null;

	@RequestMapping("edit")
	public String editMenu() {
		return Common.BACKGROUND_PATH + "/menu/editMenu";
	}

	@RequestMapping(value = "getMenu/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<DBObject> getMenu(@PathVariable int id) {
		logger.debug("获取菜单列表,菜单节点:{}", id);

		List<DBObject> menus = this.menuService.getMenu(id);

		return menus;
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	@ResponseBody
	public String edit(
			@RequestBody @NotBlank(message = "请求参数不能为空") String json,
			BindingResult br) {

		if (br.hasErrors()) {
			return br.getFieldError("json").getDefaultMessage();
		}
		logger.debug("接受到的json:{}", json);

		this.menuService.edit(json);

		return "菜单修改成功";
	}

}
