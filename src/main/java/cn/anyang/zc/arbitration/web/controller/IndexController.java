package cn.anyang.zc.arbitration.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.service.CaseService;
import cn.anyang.zc.arbitration.service.ReceiptService;

@Controller
@RequestMapping("/")
public class IndexController {

	@Autowired
	private CaseService caseService;

	@Autowired
	private ReceiptService receiptService;

	@RequestMapping(method=RequestMethod.GET)
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null){
			try {
				request.getRequestDispatcher("/login").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			Integer rid = user.getRole().getId();
			switch (rid) {
				case 1:		//副主任
					// 审批仲裁申请
					Integer count2 = this.caseService.countByStatus(2);
					model.addAttribute("count2", count2);
					// 需要审批文书的
					Integer count6approve = this.caseService.countByStatus(8);
					model.addAttribute("count6approve", count6approve);
					// 审批仲裁员
					Integer count10 = this.caseService.countByStatus(10);
					model.addAttribute("count10", count10);
					// 审批裁决书
					Integer count18 = this.caseService.countByStatus(18);
					model.addAttribute("count18", count18);
					break;
				case 2:		//中心主任
					// 审批仲裁申请
					Integer count3 = this.caseService.countByStatus(3);
					model.addAttribute("count3", count3);
					// 审批仲裁员
					Integer count11 = this.caseService.countByStatus(11);
					model.addAttribute("count11", count11);
					// 审批裁决书
					Integer count19 = this.caseService.countByStatus(19);
					model.addAttribute("count19", count19);
					break;
				case 3:		//仲裁委主任
					// 审批仲裁员
					Integer count12 = this.caseService.countByStatus(12);
					model.addAttribute("count12", count12);
					// 审批裁决书
					Integer count20 = this.caseService.countByStatus(20);
					model.addAttribute("count20", count20);
					break;
				case 4:		//仲裁秘书
					// 需要第一次送达回证的案件数量
					Integer count5 = this.caseService.countByStatusAndUID(5, user.getId());
					model.addAttribute("count5", count5);
					// 需要完善的送达回证
					Integer count6receipt = this.receiptService.countByTimesAndUIDAndStatus(1, user.getId(), 1);
					model.addAttribute("count6receipt", count6receipt);
					// 需要发文书的
					Integer count6notice = this.receiptService.countByTimesAndUIDAndStatus(1, user.getId(), 2);
					model.addAttribute("count6notice", count6notice);
					// 选仲裁员的
					Integer count9 = this.caseService.countByStatusAndUID(9, user.getId());
					model.addAttribute("count9", count9);
					// 需要第二次送达回证的案件数量
					Integer count14 = this.caseService.countByStatusAndUID(14, user.getId());
					model.addAttribute("count14", count14);
					// 需要完善的送达回证
					Integer count15receipt = this.receiptService.countByTimesAndUIDAndStatus(2, user.getId(), 1);
					model.addAttribute("count15receipt", count15receipt);
					// 上传开庭笔录
					Integer count16 = this.caseService.countByStatusAndUID(16, user.getId());
					model.addAttribute("count16", count16);
					// 下达裁决书
					Integer count17 = this.caseService.countByStatusAndUID(17, user.getId());
					model.addAttribute("count17", count17);
					// 需要第三次送达回证的案件数量
					Integer count21 = this.caseService.countByStatusAndUID(21, user.getId());
					model.addAttribute("count21", count21);
					// 需要完善的送达回证
					Integer count22receipt = this.receiptService.countByTimesAndUIDAndStatus(3, user.getId(), 1);
					model.addAttribute("count22receipt", count22receipt);
					break;
				case 5:		// 立案科长
					// 审批仲裁申请
					Integer count1 = this.caseService.countByStatus(1);
					model.addAttribute("count1", count1);
					break;
				case 6:		// 分案科长
					// 分发案件
					Integer count4 = this.caseService.countByStatus(4);
					model.addAttribute("count4", count4);
					break;
				case 8:	//归档秘书
					// 需要第一次送达回证的案件数量
					count5 = this.caseService.countByStatusAndUID(5, user.getId());
					model.addAttribute("count5", count5);
					// 需要完善的送达回证
					count6receipt = this.receiptService.countByTimesAndUIDAndStatus(1, user.getId(), 1);
					model.addAttribute("count6receipt", count6receipt);
					// 需要发文书的
					count6notice = this.receiptService.countByTimesAndUIDAndStatus(1, user.getId(), 2);
					model.addAttribute("count6notice", count6notice);
					// 选仲裁员的
					count9 = this.caseService.countByStatusAndUID(9, user.getId());
					model.addAttribute("count9", count9);
					// 需要第二次送达回证的案件数量
					count14 = this.caseService.countByStatusAndUID(14, user.getId());
					model.addAttribute("count14", count14);
					// 需要完善的送达回证
					count15receipt = this.receiptService.countByTimesAndUIDAndStatus(2, user.getId(), 1);
					model.addAttribute("count15receipt", count15receipt);
					// 上传开庭笔录
					count16 = this.caseService.countByStatusAndUID(16, user.getId());
					model.addAttribute("count16", count16);
					// 下达裁决书
					count17 = this.caseService.countByStatusAndUID(17, user.getId());
					model.addAttribute("count17", count17);
					// 需要第三次送达回证的案件数量
					count21 = this.caseService.countByStatusAndUID(21, user.getId());
					model.addAttribute("count21", count21);
					// 需要完善的送达回证
					count22receipt = this.receiptService.countByTimesAndUIDAndStatus(3, user.getId(), 1);
					model.addAttribute("count22receipt", count22receipt);
					// 需要归档的案件
					Integer count24 = this.caseService.countByStatus(24);
					model.addAttribute("count24", count24);
					break;
				default:
					break;
			}
		}
		return "index";
	}

}