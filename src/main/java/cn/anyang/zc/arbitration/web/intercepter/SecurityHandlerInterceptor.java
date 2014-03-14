package cn.anyang.zc.arbitration.web.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SecurityHandlerInterceptor extends HandlerInterceptorAdapter {

	private final Logger logger = LoggerFactory.getLogger(SecurityHandlerInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String uri = request.getRequestURI();
		logger.debug("URI:", uri);
		/**
		 * 不是到达主页面或者登录的
		 */
		if(!(uri.equals(request.getServletContext().getContextPath() + "/") || uri.startsWith(request.getServletContext().getContextPath() + "/login"))){
			if (request.getSession().getAttribute("user") == null) {
				response.getWriter().print("{\"statusCode\":\"301\", \"message\":\"会话超时，请重新登录。\"}");
				return false;
			}
		}
		return true;
	}

}