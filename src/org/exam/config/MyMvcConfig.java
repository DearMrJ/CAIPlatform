package org.exam.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Description: 使用WebMvcConfigurer来扩展SpringMvc的功能
 * @author Lynch
 */
@Configuration
public class MyMvcConfig implements WebMvcConfigurer {
	
	//此配置不通过，则springmvc.xml 中<mvc:view-controller path="/" view-name="index/main"/>
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		/*添加视图映射配置*/
		registry.addViewController("/manage").setViewName("manager/manager");
		registry.addViewController("/kickout").setViewName("system/kickout");
		registry.addViewController("/").setViewName("index/main");
	}
	
}
