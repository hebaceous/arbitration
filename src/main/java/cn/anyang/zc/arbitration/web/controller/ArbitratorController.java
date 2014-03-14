package cn.anyang.zc.arbitration.web.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.anyang.zc.arbitration.domain.Arbitrator;
import cn.anyang.zc.arbitration.domain.ArbitratorDetail;
import cn.anyang.zc.arbitration.domain.Case;
import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.model.DwzAjaxModel;
import cn.anyang.zc.arbitration.service.ArbitratorDetailService;
import cn.anyang.zc.arbitration.service.ArbitratorService;
import cn.anyang.zc.arbitration.service.CaseService;
import cn.anyang.zc.arbitration.utils.ArbitrationUtils;
import cn.anyang.zc.arbitration.utils.DwzAjaxUtils;
import cn.anyang.zc.arbitration.utils.Global;

@Controller
@RequestMapping("/arbitrator")
public class ArbitratorController {

	private final Logger logger = LoggerFactory.getLogger(ArbitratorController.class);

	@Autowired
	private CaseService caseService;

	@Autowired
	private ArbitratorService arbitratorService;

	@Autowired
	private ArbitratorDetailService arbitratorDetailService;

	/**
	 * 仲裁员费用案件列表
	 */
	@RequestMapping(value="/costList")
	public String costList(Model model, HttpSession session) {
		logger.info("用户[{}]查看仲裁员费用列表。", ((User)session.getAttribute("user")).getName());

		Collection<Case> cases = this.caseService.getCaseByStatus_LT(25);
		List<ArbitratorDetail> arbitratorDetails = new ArrayList<ArbitratorDetail>();
		for(Case case1 : cases) {
			Collection<ArbitratorDetail> temp = this.arbitratorDetailService.getByCID(case1.getId());
			arbitratorDetails.addAll(temp);
		}
		model.addAttribute("arbitratorDetails", arbitratorDetails);
		return "arbitrator/costList";
	}

	/**
	 * 仲裁员花费列表
	 */
	@RequestMapping(value="/cost/{id}",method=RequestMethod.GET)
	public String cost(@PathVariable String id, Model model, HttpSession session) {
		logger.info("用户[{}]查看第[{}]号案件的仲裁员费用列表。", ((User)session.getAttribute("user")).getName(), id);

		ArbitratorDetail detail = this.arbitratorDetailService.get(ArbitrationUtils.ISO2UTF(id));
		model.addAttribute("detail", detail);
		return "arbitrator/cost";
	}

	/**
	 * 设置仲裁员费用
	 */
	@RequestMapping(value="/cost/{id}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel cost(@PathVariable String id, @RequestParam Long accruedCharges, @RequestParam Long paidCharges, @RequestParam String description, HttpSession session) {
		ArbitratorDetail detail = this.arbitratorDetailService.get(ArbitrationUtils.ISO2UTF(id));
		detail.setAccruedCharges(accruedCharges);
		detail.setPaidCharges(paidCharges);
		detail.setDebtCharges(accruedCharges-paidCharges);
		detail.setDescription(description);
		if(accruedCharges == paidCharges){
			detail.setIsPayInFull(true);
		} else {
			detail.setIsPayInFull(false);
		}
		this.arbitratorDetailService.update(detail);

		Object[] params = {((User)session.getAttribute("user")).getName(), detail.getName(), accruedCharges, paidCharges};
		logger.info("用户[{}]设置仲裁员[{}]应付费用[{}]，已付费用：[{}].", params);
		return DwzAjaxUtils.ok_closeCurrent();
	}

	/**
	 * 根据id得到仲裁员表详情
	 */
	@RequestMapping("/{id}")
	public String arbitratorDetail(@PathVariable String id, Model model, HttpSession session) {
		logger.info("用户[{}]查看仲裁员表详情。", ((User)session.getAttribute("user")).getName());

		Arbitrator arbitrator = this.arbitratorService.get(id);
		arbitrator.setContents(ArbitrationUtils.splitAndSpace(arbitrator.getContents(), 20));
		model.addAttribute("arbitrator", arbitrator);

		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "arbitrator/arbitratorDetail";
	}

}