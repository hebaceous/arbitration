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

import cn.anyang.zc.arbitration.domain.Case;
import cn.anyang.zc.arbitration.domain.Notice;
import cn.anyang.zc.arbitration.domain.Receipt;
import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.service.CaseService;
import cn.anyang.zc.arbitration.service.NoticeService;
import cn.anyang.zc.arbitration.service.ReceiptService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private CaseService caseService;

	@Autowired
	private ReceiptService receiptService;

	@Autowired
	private NoticeService noticeService;

	/**
	 * 审批中的公告
	 */
	@RequestMapping(value="/6approving/{uid}")
	public String notice6approving(@PathVariable Integer uid, Model model, HttpSession session) {
		logger.info("用户[{}]查看审批中的公告列表。", ((User)session.getAttribute("user")).getName());

		Collection<Case> cases = this.caseService.getCaseByStatusAndUID(6, uid);
		List<Receipt> receipts = new ArrayList<Receipt>();
		for(Case case1 : cases){
			Collection<Receipt> temp = this.receiptService.getByCidAndTimesAndStatus(case1.getId()+"-1", 3);
			receipts.addAll(temp);
		}
		List<Notice> notices = new ArrayList<Notice>();
		for(Receipt receipt : receipts) {
			Notice notice = this.noticeService.get(receipt.getId());
			notices.add(notice);
		}
		model.addAttribute("notices", notices);
		return "notice/6approving";
	}

	/**
	 * 审批通过的公告
	 */
	@RequestMapping(value="/6approved/{uid}")
	public String notice6approved(@PathVariable Integer uid, Model model, HttpSession session) {
		logger.info("用户[{}]查看审批通过的公告列表。", ((User)session.getAttribute("user")).getName());

		Collection<Case> cases = this.caseService.getCaseByUID(uid);
		List<Receipt> receipts = new ArrayList<Receipt>();
		for(Case case1 : cases){
			Collection<Receipt> temp = this.receiptService.getByCidAndTimesAndStatus(case1.getId()+"-1", 3);
			receipts.addAll(temp);
		}
		List<Notice> notices = new ArrayList<Notice>();
		for(Receipt receipt : receipts) {
			if(receipt.getStatus() == 4){
				Notice notice = this.noticeService.get(receipt.getId());
				notices.add(notice);
			}
		}
		model.addAttribute("notices", notices);
		return "notice/6approved";
	}

	/**
	 * 获取公告详情
	 */
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public String noticeDetail(@PathVariable String id, Model model, HttpSession session) {
		logger.info("用户[{}]查看[{}]号公告详情.", ((User)session.getAttribute("user")).getName(), id);

		Notice notice = this.noticeService.get(id);
		model.addAttribute("notice", notice);
		return "notice/noticeDetail";
	}

}