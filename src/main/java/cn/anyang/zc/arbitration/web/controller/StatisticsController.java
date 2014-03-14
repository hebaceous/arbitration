package cn.anyang.zc.arbitration.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.service.StatisticsService;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {

	private final Logger logger = LoggerFactory.getLogger(StatisticsController.class);

	@Autowired
	private StatisticsService statisticsService;

	/**
	 * 案件数量统计(争议金额、时间)
	 */
	@RequestMapping(value="/count")
	public String count(Integer year, Model model, HttpSession session) {
		logger.info("用户[{}]查看[{}]年案件数量统计。", ((User)session.getAttribute("user")).getName(), year==null?"所有":year);

		String[] datas = this.statisticsService.caseCountStatistics(year);
		model.addAttribute("datas", datas);
		List<Integer> years = this.statisticsService.getAllYears();
		model.addAttribute("years", years);
		return "statistics/count";
	}

	/**
	 * 案件类型统计
	 */
	@RequestMapping(value="/type")
	public String type(Integer year, Model model, HttpSession session) {
		logger.info("用户[{}]查看[{}]年案件类型统计。", ((User)session.getAttribute("user")).getName(), year==null?"所有":year);

		String[] datas = this.statisticsService.caseTypeStatistics(year);
		model.addAttribute("datas", datas);
		List<Integer> years = this.statisticsService.getAllYears();
		model.addAttribute("years", years);
		return "statistics/type";
	}

	/**
	 * 人员办案统计(秘书办案数量统计)
	 */
	@RequestMapping(value="/secretary",method={RequestMethod.GET,RequestMethod.POST})
	public String secretary(Integer year, Model model, HttpSession session) {
		logger.info("用户[{}]查看[{}]年人员办案统计。", ((User)session.getAttribute("user")).getName(), year==null?"所有":year);

		String[] datas = this.statisticsService.secretaryCaseCountStatistics(year);
		model.addAttribute("datas", datas);
		List<Integer> years = this.statisticsService.getAllYears();
		model.addAttribute("years", years);
		return "statistics/secretary";
	}

	/**
	 * 案件费用统计
	 */
	@RequestMapping(value="/cost",method={RequestMethod.GET,RequestMethod.POST})
	public String cost(HttpSession session) {
		logger.info("用户[{}]查看案件费用统计。", ((User)session.getAttribute("user")).getName());
		// TODO 

		return "statistics/cost";
	}

}