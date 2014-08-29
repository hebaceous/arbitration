package cn.anyang.zc.arbitration.web.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.anyang.zc.arbitration.domain.Role;
import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.model.DwzAjaxModel;
import cn.anyang.zc.arbitration.model.PageModel;
import cn.anyang.zc.arbitration.model.ResultModel;
import cn.anyang.zc.arbitration.service.RoleService;
import cn.anyang.zc.arbitration.service.UserService;
import cn.anyang.zc.arbitration.util.ArbitrationUtils;
import cn.anyang.zc.arbitration.util.DwzAjaxUtils;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	/**
	 * 默认显示分页查询的
	 */
	@RequestMapping(method={RequestMethod.GET,RequestMethod.POST})
	public String list(@ModelAttribute PageModel pageModel, Model model, HttpSession session) {
		if(pageModel.getKeyword() == null){
			logger.info("用户[{}]查看用户管理列表。", ((User)session.getAttribute("user")).getName());
		}

		ResultModel resultModel = this.userService.search(pageModel);
		model.addAttribute("model", resultModel);
		return "user/list";
	}

	/**
	 * 添加页面
	 */
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insertUI(Model model) {
		Collection<Role> roles = this.roleService.getAll();
		model.addAttribute("roles", roles);
		return "user/insert";
	}

	/**
	 * 处理添加
	 */
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel insert(@ModelAttribute User user,@RequestParam Integer rid, HttpSession session) {
		Role role = this.roleService.get(rid);
		user.setRole(role);
		this.userService.insert(user);
		Object[] params = {((User)session.getAttribute("user")).getName(), user.getName(), user.getUsername(), user.getRole().getName()};
		logger.info("用户[{}]添加一个用户，姓名：[{}]，用户名：[{}]，角色：[{}]。", params);
		return DwzAjaxUtils.ok_closeCurrent();
	}

	/**
	 * 处理删除
	 */
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel delete(@PathVariable Integer id, HttpSession session) {
		User user = this.userService.get(id);
		this.userService.delete(id);

		Object[] params = {((User)session.getAttribute("user")).getName(), user.getName(), user.getUsername(), user.getRole().getName()};
		logger.info("用户[{}]删除一个用户，姓名：[{}]，用户名：[{}]，角色：[{}]。", params);
		return DwzAjaxUtils.ok();
	}

	/**
	 * 修改页面
	 */
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String updateUI(@PathVariable Integer id,Model model) {
		User user = this.userService.get(id);
		model.addAttribute("user", user);
		Collection<Role> roles = this.roleService.getAll();
		model.addAttribute("roles", roles);
		return "user/update";
	}

	/**
	 * 处理修改
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel update(@ModelAttribute User user,@RequestParam Integer rid, HttpSession session) {
		User oldUser = this.userService.get(rid);
		Role role = this.roleService.get(rid);
		user.setRole(role);
		this.userService.update(user);

		
		Object[] params = {((User)session.getAttribute("user")).getName(), oldUser.getName(), user.getName(), oldUser.getUsername(), user.getUsername(), oldUser.getRole().getName(), user.getRole().getName()};
		logger.info("用户[{}]修改一个用户，姓名：[{}]-->[{}]，用户名：[{}]-->[{}]，角色：[{}]-->[{}]。", params);
		return DwzAjaxUtils.ok_closeCurrent();
	}

	/**
	 * 模糊查询(name or username or role.name)
	 */
//	@RequestMapping(value="/search",method=RequestMethod.POST)
//	public @ResponseBody DwzAjaxModel search(@ModelAttribute PageModel pageModel, Model model) {
//		ResultModel resultModel = this.userService.search(pageModel);
//		model.addAttribute("model", resultModel);
//		return DwzAjaxUtils.ok();
//	}

	@RequestMapping(value="/checkUsername",method=RequestMethod.GET)
	public @ResponseBody Boolean checkUsername(@RequestParam String username) {
		username = ArbitrationUtils.ISO2UTF(username);
		User user = this.userService.checkUsername(username);
		if(user == null){
			return true;	//可以使用
		} else {
			return false;	//用户名已经存在
		}
	}

}