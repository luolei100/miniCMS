/**   
 * @Title: Main.java 
 * @Package com._30.common.web.controller 
 * @Description: TODO 
 * @date 2015年4月19日 下午1:42:22 
 * @version V1.0   
 */
package com._30.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com._30.common.sys.PathInitializeListener;

/**
 * @author luolei
 * 
 */
@RequestMapping("/main")
@Controller
public class Main {
	private static final Logger logger = LoggerFactory
			.getLogger(PathInitializeListener.class);

	public Main() {
		logger.debug("spring 已启动扫描");
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "main";
	}

}
