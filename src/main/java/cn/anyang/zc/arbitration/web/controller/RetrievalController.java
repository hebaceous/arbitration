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
import cn.anyang.zc.arbitration.service.RetrievalService;
import cn.anyang.zc.arbitration.utils.Global;

@Controller
@RequestMapping("/retrieval")
public class RetrievalController {

	private final Logger logger = LoggerFactory.getLogger(RetrievalController.class);

	@Autowired
	private RetrievalService retrievalService;

	/**
	 * 案件检索
	 */
	@RequestMapping(value="/case",method={RequestMethod.GET,RequestMethod.POST})
	public String caseList(@ModelAttribute PageModel pageModel, Model model, HttpSession session) {
		if(pageModel.getKeyword() == null){
			logger.info("用户[{}]查看案件检索。", ((User)session.getAttribute("user")).getName());
		}

		ResultModel resultModel = this.retrievalService.caseSearch(pageModel);
		model.addAttribute("model", resultModel);
		String[] caseTypes = Global.caseTypes;
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseTypes", caseTypes);
		model.addAttribute("caseProcedures", caseProcedures);
		return "retrieval/caseList";
	}

	/**
	 * 送达回证检索
	 */
	@RequestMapping(value="/receipt",method={RequestMethod.GET,RequestMethod.POST})
	public String receiptList(@ModelAttribute PageModel pageModel, Model model, HttpSession session) {
		if(pageModel.getKeyword() == null){
			logger.info("用户[{}]查看回证检索。", ((User)session.getAttribute("user")).getName());
		}

		ResultModel resultModel = this.retrievalService.receiptSearch(pageModel);
		model.addAttribute("model", resultModel);
		return "retrieval/receiptList";
	}

	/**
	 * 文书检索
	 */
	@RequestMapping(value="/notice",method={RequestMethod.GET,RequestMethod.POST})
	public String noticeList(@ModelAttribute PageModel pageModel, Model model, HttpSession session) {
		if(pageModel.getKeyword() == null){
			logger.info("用户[{}]查看文书检索。", ((User)session.getAttribute("user")).getName());
		}

		ResultModel resultModel = this.retrievalService.noticeSearch(pageModel);
		model.addAttribute("model", resultModel);
		return "retrieval/noticeList";
	}

	/**
	 * 仲裁员审批表检索
	 */
	@RequestMapping(value="/arbitrator",method={RequestMethod.GET,RequestMethod.POST})
	public String arbitratorList(@ModelAttribute PageModel pageModel, Model model, HttpSession session) {
		if(pageModel.getKeyword() == null){
			logger.info("用户[{}]查看仲裁员审批表检索。", ((User)session.getAttribute("user")).getName());
		}

		ResultModel resultModel = this.retrievalService.arbitratorSearch(pageModel);
		model.addAttribute("model", resultModel);
		return "retrieval/arbitratorList";
	}

	/**
	 * 裁决书检索
	 */
	@RequestMapping(value="/award",method={RequestMethod.GET,RequestMethod.POST})
	public String awardList(@ModelAttribute PageModel pageModel, Model model, HttpSession session) {
		if(pageModel.getKeyword() == null){
			logger.info("用户[{}]查看裁决书检索。", ((User)session.getAttribute("user")).getName());
		}

		ResultModel resultModel = this.retrievalService.awardSearch(pageModel);
		model.addAttribute("model", resultModel);
		return "retrieval/awardList";
	}

}