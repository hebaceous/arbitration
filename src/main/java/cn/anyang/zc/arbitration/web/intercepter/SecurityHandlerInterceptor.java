package cn.anyang.zc.arbitration.web.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SecurityHandlerInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(SecurityHandlerInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String uri = request.getRequestURI();
		logger.debug("URI:", uri);
		/**
		 * 不是到达主页面或者登录的
		 */
		String contextPath = request.getServletContext().getContextPath();
		if(!(uri.equals(contextPath + "/") || uri.startsWith(contextPath + "/login"))){
			if (request.getSession().getAttribute("user") == null) {
				response.getWriter().print("{\"statusCode\":\"301\", \"message\":\"会话超时，请重新登录。\"}");
				return false;
			}
		}
		return true;
	}

}