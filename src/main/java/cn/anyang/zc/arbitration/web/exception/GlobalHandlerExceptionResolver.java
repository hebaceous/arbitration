package cn.anyang.zc.arbitration.web.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * 自定义全局异常处理器，设置日志级别为ERROE，方便logback的 SMTPAppender--evaluator(默认输出ERROR级别)
 * @author Herbaceous
 */
public class GlobalHandlerExceptionResolver implements HandlerExceptionResolver {

	private static final Logger logger = LoggerFactory.getLogger(GlobalHandlerExceptionResolver.class);

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		logger.error("全局异常：", ex);
		return new ModelAndView("error");
	}

}
