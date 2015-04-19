package com._30.common.sys;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author luolei 
 *
 */
public class PathInitializeListener implements ServletContextListener {
	
	private static final Logger logger = LoggerFactory.getLogger(PathInitializeListener.class);
	
	
	public static final String DEFAULT_STATIC_URL = "/resource";
	
	public void contextInitialized(ServletContextEvent event) {
		ServletContext servletContext = event.getServletContext();
		
		
		String contextPath = servletContext.getContextPath();
		if (contextPath == null || "/".equals(contextPath)) {
			contextPath = "";
		}
		//设置项目根目录访问路�?
		logger.debug("项目路径:{},...",contextPath);
		servletContext.setAttribute("contextPath", contextPath);
		String staticUrl = DEFAULT_STATIC_URL;		
		if (staticUrl.startsWith("/")) {
			staticUrl = contextPath + staticUrl;
		}
		//设置js,image,css文件访问路径
		servletContext.setAttribute("statics", staticUrl);
	}

	public void contextDestroyed(ServletContextEvent event) {
	}

}
