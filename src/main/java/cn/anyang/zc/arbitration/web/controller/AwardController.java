package cn.anyang.zc.arbitration.web.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.anyang.zc.arbitration.domain.Award;
import cn.anyang.zc.arbitration.domain.Case;
import cn.anyang.zc.arbitration.service.AwardService;
import cn.anyang.zc.arbitration.service.CaseService;
import cn.anyang.zc.arbitration.util.Global;

@Controller
@RequestMapping("/award")
public class AwardController {

	@Autowired
	private AwardService awardService;

	@Autowired
	private CaseService caseService;

	/**
	 * 取得裁决书详情
	 */
	@RequestMapping(value="/{id}")
	public String awardDetail(@PathVariable String id, Model model) {
		Award award = this.awardService.get(id);
		model.addAttribute("award", award);
		String[] awardTypes = Global.awardTypes;
		model.addAttribute("awardTypes", awardTypes);
		return "award/awardDetail";
	}

	/**
	 * 审批中的裁决书
	 */
	@RequestMapping(value="/awarding")
	public String awarding(Model model){
		Collection<Case> cases = this.caseService.getCaseByStatus(18);
		Collection<Case> cases1 = this.caseService.getCaseByStatus(19);
		Collection<Case> cases2 = this.caseService.getCaseByStatus(20);
		cases.addAll(cases1);
		cases.addAll(cases2);

		List<Award> awards = new ArrayList<Award>();
		for(Case case1 : cases){
			Award award = this.awardService.get(case1.getId());
			awards.add(award);
		}
		model.addAttribute("awards", awards);
		model.addAttribute("awardTypes", Global.awardTypes);
		model.addAttribute("cases", cases);
		return "award/awarding";
	}

}
