package cn.anyang.zc.arbitration.web.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.anyang.zc.arbitration.domain.Applicant;
import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.service.ApplicantService;
import cn.anyang.zc.arbitration.util.Global;

@Controller
@RequestMapping("/applicant")
public class ApplicantController {

	private static final Logger logger = LoggerFactory.getLogger(ApplicantController.class);

	@Autowired
	private ApplicantService applicantService;

	/**
	 * 取得所有(被)申请人的详细信息
	 */
	@RequestMapping(value="/{cid}/{isApplicant}",method=RequestMethod.GET)
	public String get(@PathVariable String cid, @PathVariable Boolean isApplicant, Model model, HttpSession session) {
		logger.info("用户[{}]查看第[{}]号案件[{}]详细信息。", ((User)session.getAttribute("user")).getName(), cid, isApplicant?"申请人":"被申请人");

		Collection<Applicant> applicants = this.applicantService.getByCidAndIsApplicant(cid, isApplicant);
		model.addAttribute("applicants", applicants);
		String[] applicantTypes = Global.applicantTypes;
		model.addAttribute("applicantTypes", applicantTypes);
		return "applicant/detail";
	}

	/**
	 * ajax返回申请人，被申请人信息
	 */
	@RequestMapping(value="/ajax/{id}",method=RequestMethod.POST)
	public @ResponseBody Applicant ajaxGet(@PathVariable Integer id, HttpSession session) {
		logger.info("用户[{}]查询（被）申请人的详情（ajax），编号：[{}]", ((User)session.getAttribute("user")).getName(), id);

		Applicant applicant = this.applicantService.get(id);
		return applicant;
	}

}