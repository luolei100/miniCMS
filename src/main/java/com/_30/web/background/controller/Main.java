/**   
 * @Title: Main.java 
 * @Package com._30.common.web.controller 
 * @Description: TODO 
 * @date 2015年4月19日 下午1:42:22 
 * @version V1.0   
 */
package com._30.web.background.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com._30.common.sys.PathInitializeListener;
import com._30.common.util.Common;

/**
 * @author luolei
 * 
 */
@RequestMapping("bg/main")
@Controller
public class Main {
	private static final Logger logger = LoggerFactory
			.getLogger(PathInitializeListener.class);


	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "main";
	}

	@RequestMapping("center")
	public String center() {
		return Common.BACKGROUND_PATH + "/framework/center";
	}

	@RequestMapping("north")
	public String north() {
		return Common.BACKGROUND_PATH + "/framework/north";
	}

	@RequestMapping("south")
	public String south() {
		return Common.BACKGROUND_PATH + "/framework/south";
	}

}
