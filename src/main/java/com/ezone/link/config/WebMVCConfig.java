package com.ezone.link.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ezone.link.common.FileManagerService;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer{
	

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/profileImage/**")
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);
	}

}
