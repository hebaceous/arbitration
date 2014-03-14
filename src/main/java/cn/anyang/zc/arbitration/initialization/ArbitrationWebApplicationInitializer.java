package cn.anyang.zc.arbitration.initialization;

import java.util.EnumSet;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

import cn.anyang.zc.arbitration.config.ApplicationContextConfiguration;
import cn.anyang.zc.arbitration.config.WebMvcContextConfiguration;

public class ArbitrationWebApplicationInitializer implements WebApplicationInitializer {

	private static final String DISPATCHER_SERVLET_NAME = "dispatcherServlet";
	private static final String LOCATION = null;
	private static final long MAX_FILE_SIZE = 1024 * 1024 * 1024;	//最大1G
	private static final long MAX_REQUEST_SIZE = -1L;
	private static final int FILE_SIZE_THRESHOLD = 1024 * 1024;

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		this.registerContextLoaderListener(servletContext);
		this.registerDispatcherServlet(servletContext);
		this.registerCharacterEncodingFilter(servletContext);
	}

	private WebApplicationContext createWebApplicationContext(Class<?>... annotatedClasses) {
		AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
		context.register(annotatedClasses);
		return context;
	}

	/**
	 * 注册 Spring ContextLoaderListener
	 */
	private void registerContextLoaderListener(ServletContext servletContext) {
		WebApplicationContext webApplicationContext = this.createWebApplicationContext(ApplicationContextConfiguration.class);
		ContextLoaderListener contextLoaderListener = new ContextLoaderListener(webApplicationContext);
		servletContext.addListener(contextLoaderListener);
	}

	/**
	 * 注册SpringMVC DispatcherServlet
	 */
	private void registerDispatcherServlet(ServletContext servletContext) {
//		ServletRegistration.Dynamic dynamic = servletContext.addServlet(DISPATCHER_SERVLET_NAME, DispatcherServlet.class);
//		dynamic.setInitParameter("contextConfigLocation", "classpath:dispatcherServlet-servlet.xml");
		WebApplicationContext webApplicationContext = this.createWebApplicationContext(WebMvcContextConfiguration.class);
		DispatcherServlet dispatcherServlet = new DispatcherServlet(webApplicationContext);
		ServletRegistration.Dynamic dynamic = servletContext.addServlet(DISPATCHER_SERVLET_NAME, dispatcherServlet);
		dynamic.setLoadOnStartup(1);
		dynamic.addMapping("/");

		//设置上传文件的参数
		dynamic.setMultipartConfig(new MultipartConfigElement(LOCATION, MAX_FILE_SIZE, MAX_REQUEST_SIZE, FILE_SIZE_THRESHOLD));
	}

	/**
	 * 注册字符乱码过滤器
	 */
	private void registerCharacterEncodingFilter(ServletContext servletContext) {
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("utf-8");
		filter.setForceEncoding(true);
		FilterRegistration.Dynamic dynamic = servletContext.addFilter("characterEncodingFilter", filter);
		dynamic.addMappingForServletNames(EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD), false, DISPATCHER_SERVLET_NAME);
	}

}