package cn.anyang.zc.arbitration.web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.model.DwzAjaxModel;
import cn.anyang.zc.arbitration.service.UserService;
import cn.anyang.zc.arbitration.util.DwzAjaxUtils;

@Controller
@RequestMapping("/login")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private UserService userService;

	@RequestMapping(method=RequestMethod.GET)
	public String loginUI() {
		return "login";
	}

	@RequestMapping(method=RequestMethod.POST)
	public String login(@RequestParam String username, @RequestParam String password, HttpSession session) {
		User user = this.userService.login(username, password);
		if(user == null){
			logger.warn("错误的登录，登录用户名：{}，密码：{}.", username, password);
			session.setAttribute("message", false);
		} else {
			logger.info("用户[{}]登录系统，登录用户名：{}.", user.getName(), user.getUsername());
			session.setAttribute("user", user);
//			session.setMaxInactiveInterval(1 * 60 * 60 * 12);
		}
		return "redirect:/";
	}

	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null){
			logger.info("用户[{}]退出系统，登录用户名：{}.", user.getName(), user.getUsername());
		}
		session.removeAttribute("user");
		return "redirect:/";
	}

	@RequestMapping(value="/loginDialog",method=RequestMethod.GET)
	public String loginDialogUI() {
		return "loginDialog";
	}

	@RequestMapping(value="/loginDialog",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel loginDialog(@RequestParam String username, @RequestParam String password, HttpSession session) {
		User user = this.userService.login(username, password);
		if (user == null) {
			logger.warn("重新登录系统失败，登录用户名：{}，密码：{}.", username, password);
			DwzAjaxModel model = DwzAjaxUtils.error();
			model.setMessage("用户名或密码错误！");
			return model;
		} else {
			logger.info("用户[{}]重新登录系统（会话超时），登录用户名：{}.", user.getName(), user.getUsername());
			session.setAttribute("user", user);
//			session.setMaxInactiveInterval(1 * 60 * 60 * 12);
			DwzAjaxModel model = DwzAjaxUtils.ok_closeCurrent();
			model.setMessage("登录成功！");
			return model;
		}
	}

}