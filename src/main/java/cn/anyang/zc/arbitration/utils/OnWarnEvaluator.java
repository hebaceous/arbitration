package cn.anyang.zc.arbitration.utils;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.boolex.EvaluationException;
import ch.qos.logback.core.boolex.EventEvaluatorBase;

/**
 * 自定义方法，使SMTPAppender发邮件的默认级别为大于等于WARN
 * @author Herbaceous
 */
public class OnWarnEvaluator extends EventEvaluatorBase<ILoggingEvent> {

	@Override
	public boolean evaluate(ILoggingEvent event) throws NullPointerException, EvaluationException {
		return event.getLevel().levelInt >= Level.WARN_INT;
	}

}
