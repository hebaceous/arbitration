package cn.anyang.zc.arbitration.web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.model.PageModel;
import cn.anyang.zc.arbitration.model.ResultModel;
import cn.anyang.zc.arbitration.service.LoggerService;

@Controller
@RequestMapping("/logger")
public class LoggerController {

	private static final Logger logger = LoggerFactory.getLogger(LoggerController.class);

	@Autowired
	private LoggerService loggerService;

	@RequestMapping(method={RequestMethod.GET,RequestMethod.POST})
	public String list(@ModelAttribute PageModel pageModel, Model model, HttpSession session) {
		if(pageModel.getKeyword() == null){
			logger.info("用户[{}]查看系统日志。", ((User)session.getAttribute("user")).getName());
		}

		ResultModel resultModel = this.loggerService.search(pageModel);
		model.addAttribute("model", resultModel);
		return "logger/list";
	}

}
