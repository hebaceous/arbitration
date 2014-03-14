package cn.anyang.zc.arbitration.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import cn.anyang.zc.arbitration.web.exception.GlobalHandlerExceptionResolver;
import cn.anyang.zc.arbitration.web.intercepter.SecurityHandlerInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan({"cn.anyang.zc.arbitration.web.controller"})
public class WebMvcContextConfiguration extends WebMvcConfigurerAdapter {

	/**
	 * 配置默认视图解析器
	 */
	public @Bean ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setOrder(1);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	/**
	 * 配置上传文件解析器(Servlet 3.0)
	 */
	public @Bean MultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
	}

	/**
	 * 添加自定义拦截器
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new SecurityHandlerInterceptor());
	}

	/**
	 * 添加自定义全局异常处理，配合logback的SMTPAppender，通过error.jsp返回json串
	 */
	@Override
	public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {
		exceptionResolvers.add(new GlobalHandlerExceptionResolver());
	}

	/**
	 * 配置Servlet容器处理静态文件
	 */
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

}
