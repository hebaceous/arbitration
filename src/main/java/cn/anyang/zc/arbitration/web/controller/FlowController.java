package cn.anyang.zc.arbitration.web.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.anyang.zc.arbitration.domain.Applicant;
import cn.anyang.zc.arbitration.domain.Arbitrator;
import cn.anyang.zc.arbitration.domain.ArbitratorDetail;
import cn.anyang.zc.arbitration.domain.Award;
import cn.anyang.zc.arbitration.domain.Case;
import cn.anyang.zc.arbitration.domain.Notice;
import cn.anyang.zc.arbitration.domain.Receipt;
import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.model.DwzAjaxModel;
import cn.anyang.zc.arbitration.service.ApplicantService;
import cn.anyang.zc.arbitration.service.ArbitratorDetailService;
import cn.anyang.zc.arbitration.service.ArbitratorService;
import cn.anyang.zc.arbitration.service.AwardService;
import cn.anyang.zc.arbitration.service.CaseService;
import cn.anyang.zc.arbitration.service.NoticeService;
import cn.anyang.zc.arbitration.service.ReceiptService;
import cn.anyang.zc.arbitration.service.UserService;
import cn.anyang.zc.arbitration.util.ArbitrationUtils;
import cn.anyang.zc.arbitration.util.DwzAjaxUtils;
import cn.anyang.zc.arbitration.util.Global;

@Controller
@RequestMapping("/flow")
public class FlowController {

	private static final Logger logger = LoggerFactory.getLogger(FlowController.class);

	@Autowired
	private ApplicantService applicantService;

	@Autowired
	private CaseService caseService;

	@Autowired
	private UserService userService;

	@Autowired
	private ReceiptService receiptService;

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private ArbitratorService arbitratorService;

	@Autowired
	private AwardService awardService;

	@Autowired
	private ArbitratorDetailService arbitratorDetailService;

	/**
	 * 流程0(仲裁秘书添加仲裁申请)
	 */
	@RequestMapping(value="/0",method=RequestMethod.GET)
	public String flow0(Model model) {
		String[] applicantTypes = Global.applicantTypes;
		String[] caseProcedures = Global.caseProcedures;
		String[] caseTypes = Global.caseTypes;
		model.addAttribute("applicantTypes", applicantTypes);
		model.addAttribute("caseProcedures", caseProcedures);
		model.addAttribute("caseTypes", caseTypes);
		return "flow/0";
	}

	/**
	 * 处理添加申请人/被申请人、以及案件信息
	 */
	@Transactional
	@RequestMapping(value="/0/{uid}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel flow0(@PathVariable Integer uid, HttpServletRequest request) {
		User sessionUser = (User) request.getSession().getAttribute("user");
		User user = new User();
		user.setId(uid);
		Case case1 = this.handlingCase(request);
		case1.setDebtCharges(case1.getArbitrationCharges()-case1.getPaidCharges());
		case1.setUser(user);
		case1.setCaseOfficer(sessionUser.getName());	//设置立案员
		this.caseService.insert(case1);

		List<Applicant> applicants = this.handlingApplicants(request);
		Integer maxID = this.applicantService.getMaxID();
		if(maxID == null){maxID = 1;}
		for(int i=0;i<applicants.size();i++){
			Applicant applicant = applicants.get(i);
			applicant.setId(++maxID);
			applicant.setCid(case1.getId());
			this.applicantService.insert(applicant);
		}

		logger.info("用户[{}]添加仲裁申请，案件号：[{}].", sessionUser.getName(), case1.getId());
		return DwzAjaxUtils.ok_closeCurrent();
	}

	private List<Applicant> handlingApplicants(HttpServletRequest request) {
		String[] isApplicants = request.getParameterValues("applicants.isApplicant");
		String[] types = request.getParameterValues("applicants.type");
		String[] organizations = request.getParameterValues("applicants.organization");
		String[] posts = request.getParameterValues("applicants.post");
		String[] names = request.getParameterValues("applicants.name");
		String[] sexs = request.getParameterValues("applicants.sex");
		String[] identityCards = request.getParameterValues("applicants.identityCard");
		String[] phones = request.getParameterValues("applicants.phone");
		String[] addresss = request.getParameterValues("applicants.address");
		String[] proxy_spokesmans = request.getParameterValues("applicants.proxy_spokesman");
		String[] proxy_proxy1s = request.getParameterValues("applicants.proxy_proxy1");
		String[] proxy_proxy2s = request.getParameterValues("applicants.proxy_proxy2");
		String[] proxy_organizations = request.getParameterValues("applicants.proxy_organization");
		String[] proxy_contacts = request.getParameterValues("applicants.proxy_contact");
		String[] proxy_powers = request.getParameterValues("applicants.proxy_power");
		List<Applicant> applicants = new ArrayList<Applicant>();
		if(isApplicants != null){
			for(int i=0;i<isApplicants.length;i++){
				Applicant a = new Applicant();
				a.setIsApplicant(Boolean.parseBoolean(isApplicants[i]));
				a.setType(Integer.parseInt(types[i]));
				a.setOrganization(organizations[i]);
				a.setPost(posts[i]);
				a.setName(names[i]);
				a.setSex(sexs[i]);
				a.setIdentityCard(identityCards[i]);
				a.setPhone(phones[i]);
				a.setAddress(addresss[i]);
				a.setProxy_spokesman(proxy_spokesmans[i]);
				a.setProxy_proxy1(proxy_proxy1s[i]);
				a.setProxy_proxy2(proxy_proxy2s[i]);
				a.setProxy_organization(proxy_organizations[i]);
				a.setProxy_contact(proxy_contacts[i]);
				a.setProxy_power(proxy_powers[i]);
				applicants.add(a);
			}
		} else {
			logger.warn("用户[{}]添加的[{}]号案件没有（被）申请人.", ((User)request.getSession().getAttribute("user")).getName(), request.getParameter("id"));
		}
		return applicants;
	}

	private Case handlingCase(HttpServletRequest request) {
		String id = request.getParameter("id");
		String agreement = request.getParameter("agreement");
		String type = request.getParameter("type");
		String typeName = request.getParameter("typeName");
		String cause = request.getParameter("cause");
		String date = request.getParameter("date");
		String request2 = request.getParameter("request");
		String money = request.getParameter("money");
		String applicableProcedure = request.getParameter("applicableProcedure");
		String acceptCharges = request.getParameter("acceptCharges");
		String handlingCharges = request.getParameter("handlingCharges");
		String arbitrationCharges = request.getParameter("arbitrationCharges");
		String paidCharges = request.getParameter("paidCharges");
		String isRelief = request.getParameter("isRelief");
		Case c = new Case();
		try {
			// 设置立案日期和申请日期相同
			Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			c.setDate(date2);
			c.setRegisterDate(date2);
			// 2013-1
			c.setId(new SimpleDateFormat("yyyy").format(c.getDate()) + "-" + id);
			c.setAgreement(agreement);
			c.setType(Integer.parseInt(type));
			if(c.getType() == 8){
				c.setTypeName(typeName);
			}
			c.setCause(cause);
			c.setRequest(request2);
			c.setMoney(Long.parseLong(money));
			c.setApplicableProcedure(Integer.parseInt(applicableProcedure));
			c.setAcceptCharges(Long.parseLong(acceptCharges));
			c.setHandlingCharges(Long.parseLong(handlingCharges));
			c.setArbitrationCharges(Long.parseLong(arbitrationCharges));
			c.setPaidCharges(Long.parseLong(paidCharges));
			c.setIsRelief(Boolean.parseBoolean(isRelief));
		} catch (ParseException e) {
			e.printStackTrace();
			logger.warn("用户[{}]添加的[{}]号案件处理案件转换时出错.", ((User)request.getSession().getAttribute("user")).getName(), request.getParameter("id"), e);
		}
		return c;
	}

	/**
	 * 立案科长、副主任、中心主任
	 */
	@RequestMapping(value="/123List/{status}")
	public String flow123List(@PathVariable Integer status, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatus(status);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/123List";
	}
	@RequestMapping(value="/123List_index/{status}")
	public String flow123List_index(@PathVariable Integer status, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatus(status);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/123List_index";
	}

	@RequestMapping(value="/123/{id}",method=RequestMethod.GET)
	public String flow123(@PathVariable String id, Model model) {
		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		return "flow/123";
	}

	@RequestMapping(value="/123/{id}/{uid}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel flow123(@PathVariable String id, @PathVariable Integer uid, @RequestParam String opinion, @RequestParam Boolean agree, HttpSession session) {
		String name = this.userService.get(uid).getName();
		String date = new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
		opinion = opinion + "," + name + "," + date;
		Case case1 = this.caseService.get(id);
		Case c = new Case();
		c.setId(case1.getId());
		int status = case1.getStatus();
		if(agree){
			if(status == 1){
				c.setResponsiblePersonOpinion(opinion);
			} else if(status == 2) {
				c.setDepartmentOpinion(opinion);
			} else if(status == 3) {
				c.setSecretaryGeneralOpinion(opinion);
				/**
				 * 中心主任审批通过，立马设置立案时间
				 */
//				c.setRegisterDate(new Date());
			}
			c.setStatus(status+1);
		} else {
			/**
			 * 不同意直接回到第一步(立案科长)
			 */
			c.setStatus(1);
		}
		this.caseService.update(c);

		if(agree) {
			logger.info("用户[{}]审批[{}]号案件的仲裁申请，同意申请.", ((User)session.getAttribute("user")).getName(), id);
		} else {
			logger.warn("用户[{}]审批[{}]号案件的仲裁申请，不同意申请.", ((User)session.getAttribute("user")).getName(), id);
		}

		DwzAjaxModel model = DwzAjaxUtils.ok_closeCurrent();
		model.setId(id);
		return model;
	}

	/**
	 * 联络科长(为案件指定仲裁秘书)
	 */
	@RequestMapping(value="/4List")
	public String flow4List(Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatus(4);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/4List";
	}
	@RequestMapping(value="/4List_index")
	public String flow4List_index(Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatus(4);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/4List_index";
	}

	@RequestMapping(value="/4/{id}",method=RequestMethod.GET)
	public String flow4(@PathVariable String id, Model model) {
		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		Collection<User> users = this.userService.getUsersByRID(4);	//获得所有的仲裁秘书
		Collection<User> users2 = this.userService.getUsersByRID(8);	//所有的归档秘书
		users.addAll(users2);
		model.addAttribute("users", users);
		return "flow/4";
	}

	@RequestMapping(value="/4/{id}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel flow4(@PathVariable String id, @RequestParam Integer uid, HttpSession session) {
		User user = this.userService.get(uid);
		Case case1 = new Case();
		case1.setId(id);
		case1.setUser(user);
		case1.setStatus(5);
		this.caseService.update(case1);

		logger.info("用户[{}]指定[{}]号案件的仲裁秘书为[{}].", ((User)session.getAttribute("user")).getName(), id, user.getName());

		DwzAjaxModel model = DwzAjaxUtils.ok_closeCurrent();
		model.setId(id);
		return model;
	}

	/**
	 * 送达回证1(proofOfService)（同意受理此案后的送达回证）
	 */
	@RequestMapping(value="/5List/{uid}")
	public String flow5List(@PathVariable Integer uid, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatusAndUID(5, uid);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/5List";
	}

	@RequestMapping(value="/5/{id}",method=RequestMethod.GET)
	public String flow5(@PathVariable String id, Model model) {
		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		String[] serviceModes = Global.serviceModes;
		model.addAttribute("serviceModes", serviceModes);
		/**
		 * 获取案件所有的申请人与被申请人
		 */
		Collection<Applicant> collection = this.applicantService.getByCid(id);
		List<Applicant> applicants = new ArrayList<Applicant>();
		/**
		 * 没有送达的(即在receipt表中没有数据的)添加的当前要送达的集合
		 */
		for(Applicant applicant : collection){
			// 2013-77-1-applicant.id	//第一次送达回证
			Receipt receipt = this.receiptService.get(id+"-1-"+applicant.getId());
			if(receipt == null){
				applicants.add(applicant);
			}
		}
		model.addAttribute("applicants", applicants);
		return "flow/5";
	}

	@Transactional
	@RequestMapping(value="/5/{id}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel flow5(@PathVariable String id, @RequestParam Integer aid, @ModelAttribute Receipt receipt, HttpSession session) {
		Case case1 = this.caseService.get(id);
		Applicant applicant = this.applicantService.get(aid);
		// 某案件第一个送达回证，是某个申请人/被申请人
		receipt.setId(id + "-1-" + aid);
		receipt.setDeliveredDate(new Date());
		receipt.setCause(case1.getCause());
		receipt.setAddressee(applicant.getName());
		if(receipt.getFiles() != null){
			receipt.setPiece(receipt.getFiles().split(",").length);
		} else {
			receipt.setPiece(0);
		}
		
		receipt.setSecretary(case1.getUser().getName());	//此处设置签发人为当前仲裁秘书
		receipt.setStatus(1);	//刚添加默认为1，等待收到回证或者发文书
		this.receiptService.insert(receipt);

		logger.info("用户[{}]为[{}]号案件的[{}]填写送达回证(受理案件后).", ((User)session.getAttribute("user")).getName(), id, receipt.getAddressee());

		/**
		 * 判断所有人是否都已送达完毕
		 */
		Collection<Applicant> applicants = this.applicantService.getByCid(id);
		Collection<Receipt> receipts = this.receiptService.getByCidAndTimes(id+"-"+1);
		if(applicants.size() == receipts.size()){
			// 更新案件状态
			Case c = new Case();
			c.setId(id);
			c.setStatus(6);
			this.caseService.update(c);

			logger.warn("用户[{}],[{}]号案件的申请人和被申请人都已送达完毕(受理案件后).", ((User)session.getAttribute("user")).getName(), id);
		}

		return DwzAjaxUtils.ok_closeCurrent();
	}

	/**
	 * 送达回证1-第一步(等待收到回证OR填写公告签发单)status=1
	 */
	@RequestMapping(value="/6receiptList/{uid}")
	public String receiptList_1(@PathVariable Integer uid, Model model) {
		Collection<Case> cases = this.caseService.getCaseByUID(uid);
		List<Receipt> receipts = new ArrayList<Receipt>();
		for(Case case1 : cases){
			Collection<Receipt> temp = this.receiptService.getByCidAndTimesAndStatus(case1.getId()+"-1", 1);
			receipts.addAll(temp);
		}
		model.addAttribute("receipts", receipts);
		return "flow/6receiptList";
	}

	/**
	 * 收到送达回证
	 */
	@RequestMapping(value="/6receivedReceipt/{rid}",method=RequestMethod.GET)
	public String receivedReceipt_1(@PathVariable String rid, Model model) {
		Receipt receipt = this.receiptService.get(rid);
		receipt.setContents(ArbitrationUtils.splitAndSpace(receipt.getContents(), 9));	//处理为空情况
		model.addAttribute("receipt", receipt);
		return "flow/6receivedReceipt";
	}

	/**
	 * 处理收到送达回证(收到/未收到)
	 */
	@Transactional
	@RequestMapping(value="/6receivedReceipt/{rid}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel receivedReceipt_1(@PathVariable String rid, @RequestParam Boolean isReceive, HttpServletRequest request) {
		Receipt receipt = this.receiptService.get(rid);
		receipt.setIsReceive(isReceive);
		receipt.setDescription(request.getParameter("description"));
		if(isReceive){	//收到回证
			try {
				receipt.setReceiptDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("receiptDate")));
			} catch (ParseException e) {
				e.printStackTrace();
				System.out.println("设置回证收到日期出错!");
			}
			receipt.setStatus(4);	//直接置status=4	结束当前回证流程
			this.receiptService.update(receipt);

			String[] temps = rid.split("-");
			logger.info("用户[{}],已收到[{}]号案件[{}]的送达回证(受理案件后).", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1], receipt.getAddressee());

			this.handleReceiptCaseIsUpdate_1(rid, request);	//判断是否进行更新处理
		} else {	//未收到回证
			receipt.setReason(request.getParameter("reason"));
			receipt.setStatus(2);	//设置status=2	表示进入送达文书步骤
			this.receiptService.update(receipt);

			String[] temps = rid.split("-");
			logger.warn("用户[{}],未收到[{}]号案件[{}]的送达回证(受理案件后),进入送达文书.", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1], receipt.getAddressee());
		}
		return DwzAjaxUtils.ok_closeCurrent();
	}

	//检测所有的回证是否都已经收到或者都已经发过公告并且审批通过
	private void handleReceiptCaseIsUpdate_1(String rid, HttpServletRequest request) {
		// 2013-777-1-0
		String caseID = rid.split("-")[0]+"-"+rid.split("-")[1];
		Collection<Applicant> applicants = this.applicantService.getByCid(caseID);
		Collection<Receipt> receipts = this.receiptService.getByCidAndTimes(caseID+"-1");
		//如果全部送达完成，才进行下列操作
		if(applicants.size() == receipts.size()){
			boolean isFinished = true;
			for(Receipt receipt : receipts){
				if(receipt.getStatus() != 4){	//一旦有一个状态不为4的，就证明没有处理完成
					isFinished = false;
					break;
				}
			}
			//证明处理完成,更新案件状态，到下一步流程
			if(isFinished){
				Case case1 = new Case();
				case1.setId(caseID);
				case1.setStatus(9);
				this.caseService.update(case1);

				String[] temps = rid.split("-");
				logger.warn("用户[{}],已处理完成[{}]号案件的全部送达回证(受理案件后).", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1]);
			}
		}
	}

	/**
	 * 送达文书 receipt.status == 2
	 */
	@RequestMapping(value="/6noticeList/{uid}")
	public String noticeList_1(@PathVariable Integer uid, Model model) {
		Collection<Case> cases = this.caseService.getCaseByUID(uid);
		List<Receipt> receipts = new ArrayList<Receipt>();
		for(Case case1 : cases){
			Collection<Receipt> temp = this.receiptService.getByCidAndTimesAndStatus(case1.getId()+"-1", 2);
			receipts.addAll(temp);
		}
		model.addAttribute("receipts", receipts);
		return "flow/6noticeList";
	}

	/**
	 * 处理送达文书请求UI
	 */
	@RequestMapping(value="/6notice/{rid}",method=RequestMethod.GET)
	public String notice(@PathVariable String rid, Model model) {
		Receipt receipt = this.receiptService.get(rid);
		model.addAttribute("receipt", receipt);
		return "flow/6notice";
	}

	/**
	 * 处理送达文书请求
	 */
	@Transactional
	@RequestMapping(value="/6notice/{rid}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel notice(@PathVariable String rid, HttpServletRequest request) {
		Notice notice = new Notice();
		// notice.id = receipt.id
		notice.setId(rid);
		Date courtDate = null;
		try {
			courtDate = new SimpleDateFormat("yyyy年MM月dd日 HH点mm分").parse(request.getParameter("courtDate"));
		} catch (ParseException e) {
			logger.error("转换开庭时间出错rid=[{}]", rid, e);
		}
		notice.setCourtDate(courtDate);
		notice.setDeliveredDate(new Date());
		//notice.setDeliveredDate(new Date());	//审批通过以后才设置
		Case case1 = this.caseService.get(rid.split("-")[0]+"-"+rid.split("-")[1]);
		notice.setCause(case1.getCause());
		notice.setSecretary(case1.getUser().getName());

		String[] names = this.getApplicantsAndRespondentsName(case1.getId());
		notice.setApplicant(names[0]);	//设置申请人
		notice.setRespondent(names[1]);	//设置被申请人
		this.noticeService.insert(notice);
		/**
		 * 更新receipt.status == 3(待审批)
		 */
		Receipt receipt = new Receipt();
		receipt.setId(rid);
		receipt.setStatus(3);
		this.receiptService.update(receipt);

		String[] temps = rid.split("-");
		logger.warn("用户[{}],为[{}]号案件送达文书(未收到受理案件后的送达回证).", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1]);

		/**
		 * 更新案件的开庭时间
		 */
		Case case2 = new Case();
		case2.setId(case1.getId());
		case2.setCourtDate(courtDate);
		this.caseService.update(case2);
		
		return DwzAjaxUtils.ok_closeCurrent();
	}

	/**
	 * 根据case.id得到申请人和被申请人的姓名
	 */
	private String[] getApplicantsAndRespondentsName(String id){
		List<Applicant> applicants1 = this.applicantService.getByCidAndIsApplicant(id, true);	//所有申请人
		StringBuffer names1 = new StringBuffer();
		for(int i=0; i<applicants1.size(); i++){
			String name = applicants1.get(i).getName();
			names1.append(name);
			if(i < applicants1.size()-1){
				names1.append(",");
			}
		}
		List<Applicant> applicants2 = this.applicantService.getByCidAndIsApplicant(id, false);	//所有被申请人
		StringBuffer names2 = new StringBuffer();
		for(int i=0; i<applicants2.size(); i++){
			String name = applicants2.get(i).getName();
			names2.append(name);
			if(i < applicants2.size()-1){
				names2.append(",");
			}
		}
		return new String[] {names1.toString(), names2.toString()};
	}

	/**
	 * 审批文书List
	 */
	@RequestMapping(value="/6approveNoticeList")
	public String approveNoticeList_1(Model model) {
		Collection<Receipt> receipts = this.receiptService.getByStatus(3);	//等待审批的文书
		List<Notice> notices = new ArrayList<Notice>();
		for(Receipt receipt : receipts){
			Notice notice = this.noticeService.get(receipt.getId());
			notices.add(notice);
		}
		model.addAttribute("notices", notices);
		return "flow/6approveNoticeList";
	}
	@RequestMapping(value="/6approveNoticeList_index")
	public String approveNoticeList_1_index(Model model) {
		Collection<Receipt> receipts = this.receiptService.getByStatus(3);	//等待审批的文书
		List<Notice> notices = new ArrayList<Notice>();
		for(Receipt receipt : receipts){
			Notice notice = this.noticeService.get(receipt.getId());
			notices.add(notice);
		}
		model.addAttribute("notices", notices);
		return "flow/6approveNoticeList_index";
	}

	/**
	 * 处理审批文书UI
	 */
	@RequestMapping(value="/6approveNotice/{nid}",method=RequestMethod.GET)
	public String approveNotice_1(@PathVariable String nid, Model model) {
		Notice notice = this.noticeService.get(nid);
		model.addAttribute("notice", notice);
		return "flow/6approveNotice";
	}

	/**
	 * 处理审批文书
	 */
	@Transactional
	@RequestMapping(value="/6approveNotice/{nid}/{uid}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel approveNotice_1(@PathVariable String nid, @PathVariable Integer uid, @RequestParam Boolean agree, HttpServletRequest request) {
		Notice notice = this.noticeService.get(nid);
		Receipt receipt = new Receipt();
		receipt.setId(notice.getId());
		User user = this.userService.get(uid);
		if(agree){	//如果同意，审批通过
			notice.setAuditor(user.getName());
			this.noticeService.update(notice);
			receipt.setStatus(4);	//结束回证流程
			this.receiptService.update(receipt);

			String[] temps = nid.split("-");
			logger.info("用户[{}],审批通过[{}]号案件[{}]的送达文书(未收到受理案件后的送达回证).", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1], notice.getApplicant());

			this.handleReceiptCaseIsUpdate_1(nid, request);	//判断是否更新案件状态
		} else {
			/**
			 * 不同意，重新打回到秘书那(receipt.status == 2)
			 */
			receipt.setStatus(2);
			this.noticeService.delete(nid);	//并且删除开始添加的文书
			this.receiptService.update(receipt);

			String[] temps = nid.split("-");
			logger.warn("用户[{}],审批不通过[{}]号案件[{}]的送达文书(未收到受理案件后的送达回证).", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1], notice.getApplicant());
		}

		DwzAjaxModel model = DwzAjaxUtils.ok_closeCurrent();
		model.setId(nid);
		return model;
	}

	/**
	 * 9.仲裁员选定情况(仲裁秘书)
	 */
	@RequestMapping(value="/9List/{uid}")
	public String flow9List(@PathVariable Integer uid, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatusAndUID(9, uid);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/9List";
	}

	@RequestMapping(value="/9/{id}",method=RequestMethod.GET)
	public String flow9(@PathVariable String id, Model model) {
		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/9";
	}

	@Transactional
	@RequestMapping(value="/9/{id}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel flow9(@PathVariable String id, @RequestParam String contents, HttpServletRequest request) {
		Case case1 = this.caseService.get(id);
		Arbitrator arbitrator = new Arbitrator();
		arbitrator.setId(case1.getId());
		arbitrator.setType(Global.caseProcedures[case1.getApplicableProcedure()]);
		arbitrator.setSecretary(case1.getUser().getName());
		arbitrator.setCause(case1.getCause());
		arbitrator.setContents(contents);
		try {
			arbitrator.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date")));
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("转换仲裁员日期失败！");
		}
		this.arbitratorService.insert(arbitrator);
		Case c = new Case();
		c.setId(case1.getId());
		c.setStatus(10);
		this.caseService.update(c);

		logger.info("用户[{}]为[{}]号案件指定仲裁员.", ((User)request.getSession().getAttribute("user")).getName(), id);

		return DwzAjaxUtils.ok_closeCurrent();
	}

	/**
	 * 10.11.12(副主任、主任、仲裁委主任 审批仲裁员选定情况)
	 */
	@RequestMapping(value="/101112List/{status}")
	public String flow101112List(@PathVariable Integer status, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatus(status);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/101112List";
	}
	@RequestMapping(value="/101112List_index/{status}")
	public String flow101112List_index(@PathVariable Integer status, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatus(status);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/101112List_index";
	}

	@RequestMapping(value="/101112/{id}",method=RequestMethod.GET)
	public String flow101112(@PathVariable String id, Model model) {
		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		Arbitrator arbitrator = this.arbitratorService.get(id);
		arbitrator.setContents(ArbitrationUtils.splitAndSpace(arbitrator.getContents(), 20));
		model.addAttribute("arbitrator", arbitrator);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/101112";
	}

	@Transactional
	@RequestMapping(value="/101112/{id}/{uid}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel flow101112(@PathVariable String id, @PathVariable Integer uid, @RequestParam Boolean agree, @RequestParam String opinion, @RequestParam String contents, HttpSession session) {
		Case case1 = this.caseService.get(id);
		String name = this.userService.get(uid).getName();
		String date = new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
		opinion = opinion + "," + name + "," + date;
		Arbitrator arbitrator = new Arbitrator();
		//arbitrator.id = case.id
		arbitrator.setId(case1.getId());
		Case c = new Case();
		c.setId(case1.getId());
		if(agree){
			if(case1.getStatus() == 10){
				arbitrator.setDepartmentOpinion(opinion);
				arbitrator.setContents(ArbitrationUtils.deleteSpace(contents, 20));	//去除不必要的空格
				c.setStatus(11);
			} else if(case1.getStatus() == 11){
				arbitrator.setCenterDirectorOpinion(opinion);
				c.setStatus(12);
			} else if(case1.getStatus() == 12){
				arbitrator.setDirectorOpinion(opinion);
				c.setStatus(14);	//直接跳到送达回证 status == 14
				c.setFormationDate(new Date());	//设置案件组庭时间
				//在这里添加仲裁员，供计费的时候使用
				String arbitratorNames = handleInsertArbitratorDetail(id);
				c.setArbitratorNames(arbitratorNames);
			}
			logger.info("用户[{}]审批通过[{}]号案件指定仲裁员审批表.", ((User)session.getAttribute("user")).getName(), id);
		} else {
			/**
			 * 不同意的打回到副主任
			 */
			c.setStatus(10);
			if(case1.getStatus() == 10){
				arbitrator.setDepartmentOpinion(opinion);
			} else if(case1.getStatus() == 11){
				arbitrator.setCenterDirectorOpinion(opinion);
			} else if(case1.getStatus() == 12){
				arbitrator.setDirectorOpinion(opinion);
			}
			logger.warn("用户[{}]审批不通过[{}]号案件指定仲裁员审批表.", ((User)session.getAttribute("user")).getName(), id);
		}
		this.arbitratorService.update(arbitrator);
		this.caseService.update(c);

		DwzAjaxModel model = DwzAjaxUtils.ok_closeCurrent();
		model.setId(id);
		return model;
	}

	/**
	 * 根据id,处理添加仲裁员，供会计计费使用	并且返回仲裁员的姓名
	 */
	private String handleInsertArbitratorDetail(String id) {
		String arbitratorNames = null;
		Case case1 = this.caseService.get(id);
		Arbitrator arbitrator = this.arbitratorService.get(id);
		String[] contents = ArbitrationUtils.splitAndSpace(arbitrator.getContents(), 20).split(",");
		if (case1.getApplicableProcedure() == 0) {	//简易程序
			String name = contents[18];
			String post = contents[19];
			ArbitratorDetail detail = new ArbitratorDetail(id+"-"+name, name, post);
			this.arbitratorDetailService.insert(detail);
			arbitratorNames = name;
		} else if (case1.getApplicableProcedure() == 1) {	//普通程序
			String name1 = contents[12];
			String post1 = contents[13];
			ArbitratorDetail detail1 = new ArbitratorDetail(id+"-"+name1, name1, post1);
			this.arbitratorDetailService.insert(detail1);
			String name2 = contents[14];
			String post2 = contents[15];
			ArbitratorDetail detail2 = new ArbitratorDetail(id+"-"+name2, name2, post2);
			this.arbitratorDetailService.insert(detail2);
			String name3 = contents[16];
			String post3 = contents[17];
			ArbitratorDetail detail3 = new ArbitratorDetail(id+"-"+name3, name3, post3);
			this.arbitratorDetailService.insert(detail3);
			arbitratorNames = name1 + "," + name2 + "," + name3;
		}
		logger.info("处理[{}]号案件的仲裁员，供会计计费使用", id);
		return arbitratorNames;
	}

	/**
	 * 送达回证2（组庭后送达回证）
	 */
	@RequestMapping(value="/14List/{uid}")
	public String flow14List(@PathVariable Integer uid, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatusAndUID(14, uid);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/14List";
	}

	@RequestMapping(value="/14/{id}",method=RequestMethod.GET)
	public String flow14(@PathVariable String id, Model model) {
		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		String[] serviceModes = Global.serviceModes;
		model.addAttribute("serviceModes", serviceModes);
		/**
		 * 获取案件所有的申请人与被申请人
		 */
		Collection<Applicant> collection = this.applicantService.getByCid(id);
		List<Applicant> applicants = new ArrayList<Applicant>();
		/**
		 * 没有送达的(即在receipt表中没有数据的)添加的当前要送达的集合
		 */
		for(Applicant applicant : collection){
			// 2013-77-2-applicant.id	//第二次送达回证
			Receipt receipt = this.receiptService.get(id+"-2-"+applicant.getId());
			if(receipt == null){
				applicants.add(applicant);
			}
		}
		model.addAttribute("applicants", applicants);
		return "flow/14";
	}

	@Transactional
	@RequestMapping(value="/14/{id}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel flow14(@PathVariable String id, @RequestParam Integer aid, @ModelAttribute Receipt receipt, HttpSession session) {
		Case case1 = this.caseService.get(id);
		Applicant applicant = this.applicantService.get(aid);
		// 某案件第二个送达回证，是某个申请人/被申请人
		receipt.setId(id + "-2-" + aid);
		receipt.setDeliveredDate(new Date());
		receipt.setCause(case1.getCause());
		receipt.setAddressee(applicant.getName());
		if(receipt.getFiles() != null){
			receipt.setPiece(receipt.getFiles().split(",").length);
		} else {
			receipt.setPiece(0);
		}
		receipt.setSecretary(case1.getUser().getName());	//此处设置签发人为当前仲裁秘书
		receipt.setStatus(1);	//刚添加默认为1，等待收到回证
		this.receiptService.insert(receipt);

		logger.info("用户[{}]为[{}]号案件的[{}]填写送达回证(组庭后).", ((User)session.getAttribute("user")).getName(), id, receipt.getAddressee());

		/**
		 * 判断所有人是否都以送达完毕
		 */
		Collection<Applicant> applicants = this.applicantService.getByCid(id);
		Collection<Receipt> receipts = this.receiptService.getByCidAndTimes(id+"-"+2);
		if(applicants.size() == receipts.size()){
			// 更新案件状态
			Case c = new Case();
			c.setId(id);
			c.setStatus(15);	//都已经送达案件状态到达15，表示在等待一系列回证
			this.caseService.update(c);

			logger.warn("用户[{}],[{}]号案件的申请人和被申请人都已送达完毕(组庭后).", ((User)session.getAttribute("user")).getName(), id);
		}
		return DwzAjaxUtils.ok_closeCurrent();
	}

	/**
	 * 送达回证2-第一步(等待收到回证)status=1
	 */
	@RequestMapping(value="/15receiptList/{uid}")
	public String receiptList_2(@PathVariable Integer uid, Model model) {
		Collection<Case> cases = this.caseService.getCaseByUID(uid);
		List<Receipt> receipts = new ArrayList<Receipt>();
		for(Case case1 : cases){
			Collection<Receipt> temp = this.receiptService.getByCidAndTimesAndStatus(case1.getId()+"-2", 1);
			receipts.addAll(temp);
		}
		model.addAttribute("receipts", receipts);
		return "flow/15receiptList";
	}

	/**
	 * 收到送达回证
	 */
	@RequestMapping(value="/15receivedReceipt/{rid}",method=RequestMethod.GET)
	public String receivedReceipt_2(@PathVariable String rid, Model model) {
		Receipt receipt = this.receiptService.get(rid);
		receipt.setContents(ArbitrationUtils.splitAndSpace(receipt.getContents(), 9));	//处理为空情况
		model.addAttribute("receipt", receipt);
		return "flow/15receivedReceipt";
	}

	/**
	 * 处理收到送达回证(收到/未收到)
	 */
	@Transactional
	@RequestMapping(value="/15receivedReceipt/{rid}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel receivedReceipt_2(@PathVariable String rid, @RequestParam Boolean isReceive, HttpServletRequest request) {
		Receipt receipt = this.receiptService.get(rid);
		receipt.setIsReceive(isReceive);
		receipt.setDescription(request.getParameter("description"));
		receipt.setStatus(2);	//直接置status=2	结束当前回证流程
		if(isReceive){	//收到回证
			try {
				receipt.setReceiptDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("receiptDate")));
			} catch (ParseException e) {
				e.printStackTrace();
				System.out.println("设置回证收到日期出错!");
			}

			String[] temps = rid.split("-");
			logger.info("用户[{}],已收到[{}]号案件[{}]的送达回证(组庭后).", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1], receipt.getAddressee());
		} else {	//未收到回证
			receipt.setReason(request.getParameter("reason"));
			String[] temps = rid.split("-");
			logger.warn("用户[{}],未收到[{}]号案件[{}]的送达回证(组庭后).", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1], receipt.getAddressee());
		}
		this.receiptService.update(receipt);

		/**
		 * 判断是否所有的回证都已经处理完成
		 */
		this.handleReceiptCaseIsUpdate_2(rid, request);
		return DwzAjaxUtils.ok_closeCurrent();
	}

	private void handleReceiptCaseIsUpdate_2(String rid, HttpServletRequest request) {
		// 2013-777-2-0
		String caseID = rid.split("-")[0]+"-"+rid.split("-")[1];
		Collection<Receipt> receipts = this.receiptService.getByCidAndTimes(caseID+"-2");
		boolean isFinished = true;
		for(Receipt receipt : receipts){
			if(receipt.getStatus() != 2){	//一旦有一个状态不为2的，就证明没有处理完成
				isFinished = false;
				break;
			}
		}
		//证明处理完成,更新案件状态，到下一步流程
		if(isFinished){
			Case case1 = new Case();
			case1.setId(caseID);
			case1.setStatus(16);
			this.caseService.update(case1);

			String[] temps = rid.split("-");
			logger.warn("用户[{}],已处理完成[{}]号案件的全部送达回证(组庭后).", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1]);
		}

	}

	/**
	 * 16.上传笔录+裁决书
	 */
	@RequestMapping(value="/16List/{uid}")
	public String flow16List(@PathVariable Integer uid, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatusAndUID(16, uid);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/16List";
	}

	@RequestMapping(value="/16/{id}",method=RequestMethod.GET)
	public String flow16(@PathVariable String id, Model model) {
		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		return "flow/16";
	}

	@Value("${dir.hearingRecord}")
	private String dir_hearingRecord;

	@Value("${dir.award}")
	private String dir_award;

	@RequestMapping(value="/16/{id}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel flow16(
			@PathVariable String id, 
			@RequestParam MultipartFile hearingRecord, 
			@RequestParam MultipartFile award, 
			HttpServletRequest request) {
		try{
			String hearingRecordFileName = hearingRecord.getOriginalFilename();
			String hearingRecordExtName = hearingRecordFileName.substring(hearingRecordFileName.lastIndexOf("."));
			hearingRecordFileName = id + hearingRecordExtName;
			File hearingRecordFile = new File(dir_hearingRecord + File.separator + hearingRecordFileName);
			hearingRecord.transferTo(hearingRecordFile);

			String awardFileName = award.getOriginalFilename();
			String awardExtName = awardFileName.substring(awardFileName.lastIndexOf("."));
			awardFileName = id + awardExtName;
			File awardFile = new File(dir_award + File.separator + awardFileName);
			hearingRecord.transferTo(awardFile);

			Case case1 = new Case();
			case1.setId(id);
			case1.setHearingRecord(hearingRecordFileName);
			case1.setAward(awardFileName);
			case1.setStatus(17);
			this.caseService.update(case1);

			logger.info("用户[{}]为[{}]号案件上传笔录和裁决书.", ((User)request.getSession().getAttribute("user")).getName(), id);
			return DwzAjaxUtils.ok_closeCurrent();
		} catch (Exception exception){
			exception.printStackTrace();
			logger.error("用户[{}]在为[{}]号案件上传笔录和裁决书时出错！", ((User)request.getSession().getAttribute("user")).getName(), id, exception);
			return DwzAjaxUtils.error();
		}

	}

	/**
	 * 17.下达裁决书
	 */
	@RequestMapping(value="/17List/{uid}")
	public String flow17List(@PathVariable Integer uid, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatusAndUID(17, uid);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/17List";
	}

	@RequestMapping(value="/17/{id}",method=RequestMethod.GET)
	public String flow17(@PathVariable String id, Model model) {
		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		String[] names = this.getApplicantsAndRespondentsName(id);
		model.addAttribute("names", names);
		return "flow/17";
	}

	@Transactional
	@RequestMapping(value="/17/{id}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel flow17(@PathVariable String id, @ModelAttribute Award award, HttpSession session) {
		Case case1 = this.caseService.get(id);
		// award.id = case.id
		award.setId(id);
		award.setCause(case1.getCause());
		award.setDeliveredDate(new Date());
		award.setCaseDate(case1.getRegisterDate());
		String[] names = this.getApplicantsAndRespondentsName(id);
		award.setApplicant(names[0]);
		award.setRespondent(names[1]);
		this.awardService.insert(award);
		Case c = new Case();
		c.setId(id);
		c.setAwardResult(Global.awardTypes[award.getType()]);	//设置审理结果--裁决类型
		c.setStatus(18);
		this.caseService.update(c);

		logger.info("用户[{}]为[{}]号案件填写下达裁决书.", ((User)session.getAttribute("user")).getName(), id);
		return DwzAjaxUtils.ok_closeCurrent();
	}

	/**
	 * 18、19、20 审批裁决书(副主任，中心主任，仲裁委主任)
	 */
	@RequestMapping(value="/181920List/{status}")
	public String flow181920List(@PathVariable Integer status, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatus(status);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/181920List";
	}
	@RequestMapping(value="/181920List_index/{status}")
	public String flow181920List_index(@PathVariable Integer status, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatus(status);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/181920List_index";
	}

	@RequestMapping(value="/181920/{id}",method=RequestMethod.GET)
	public String flow181920(@PathVariable String id, Model model) {
		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		Award award = this.awardService.get(id);
		model.addAttribute("award", award);
		String[] awardTypes = Global.awardTypes;
		model.addAttribute("awardTypes", awardTypes);
		return "flow/181920";
	}

	@Transactional
	@RequestMapping(value="/181920/{id}/{uid}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel flow181920(@PathVariable String id, @PathVariable Integer uid, @RequestParam Boolean agree, @RequestParam String opinion, HttpSession session) {
		Case case1 = this.caseService.get(id);
		Case c = new Case();
		c.setId(id);
		Award award = new Award();
		award.setId(id);
		String name = this.userService.get(uid).getName();
		String date = new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
		opinion = opinion + "," + name + "," + date;
		if(agree){	//同意
			if(case1.getStatus() == 18){	//副主任
				award.setAuditor(opinion);
				c.setStatus(19);
			} else if(case1.getStatus() == 19) {	//中心主任
				award.setSecretaryGeneral(opinion);
				c.setStatus(20);
			} else if(case1.getStatus() == 20){	//仲裁委主任
				award.setDirector(opinion);
				c.setConcludedDate(new Date());	//裁决书审批完成，设置结案日期
				c.setStatus(21);
			}
			logger.info("用户[{}]审批通过[{}]号案件的下达裁决书.", ((User)session.getAttribute("user")).getName(), id);
		} else {	//不同意，打回到第一个人审批
			c.setStatus(18);
			if(case1.getStatus() == 18){	//副主任
				award.setAuditor(opinion);
			} else if(case1.getStatus() == 19) {	//中心主任
				award.setSecretaryGeneral(opinion);
			} else if(case1.getStatus() == 20){	//仲裁委主任
				award.setDirector(opinion);
			}
			logger.warn("用户[{}]审批不通过[{}]号案件的下达裁决书.", ((User)session.getAttribute("user")).getName(), id);
		}
		this.awardService.update(award);
		this.caseService.update(c);

		DwzAjaxModel model = DwzAjaxUtils.ok_closeCurrent();
		model.setId(id);
		return model;
	}

	/**
	 * 送达回证三（下达裁决书后送达回证）
	 */
	@RequestMapping(value="/21List/{uid}")
	public String flow21List(@PathVariable Integer uid, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatusAndUID(21, uid);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/21List";
	}

	@RequestMapping(value="/21/{id}",method=RequestMethod.GET)
	public String flow21(@PathVariable String id, Model model) {
		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		String[] serviceModes = Global.serviceModes;
		model.addAttribute("serviceModes", serviceModes);
		/**
		 * 获取案件所有的申请人与被申请人
		 */
		Collection<Applicant> collection = this.applicantService.getByCid(id);
		List<Applicant> applicants = new ArrayList<Applicant>();
		/**
		 * 没有送达的(即在receipt表中没有数据的)添加的当前要送达的集合
		 */
		for(Applicant applicant : collection){
			// 2013-77-3-applicant.id	//第三次送达回证
			Receipt receipt = this.receiptService.get(id+"-3-"+applicant.getId());
			if(receipt == null){
				applicants.add(applicant);
			}
		}
		model.addAttribute("applicants", applicants);
		return "flow/21";
	}

	@Transactional
	@RequestMapping(value="/21/{id}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel flow21(@PathVariable String id, @RequestParam Integer aid, @ModelAttribute Receipt receipt) {
		Case case1 = this.caseService.get(id);
		Applicant applicant = this.applicantService.get(aid);
		// 某案件第三个送达回证，是某个申请人/被申请人
		receipt.setId(id + "-3-" + aid);
		receipt.setDeliveredDate(new Date());
		receipt.setCause(case1.getCause());
		receipt.setAddressee(applicant.getName());
		if(receipt.getFiles() != null){
			receipt.setPiece(receipt.getFiles().split(",").length);
		} else {
			receipt.setPiece(0);
		}
		receipt.setSecretary(case1.getUser().getName());	//此处设置签发人为当前仲裁秘书
		receipt.setStatus(1);	//刚添加默认为1，等待收到回证
		this.receiptService.insert(receipt);

		/**
		 * 判断所有人是否都以送达完毕
		 */
		Collection<Applicant> applicants = this.applicantService.getByCid(id);
		Collection<Receipt> receipts = this.receiptService.getByCidAndTimes(id+"-"+3);
		if(applicants.size() == receipts.size()){
			// 更新案件状态
			Case c = new Case();
			c.setId(id);
			c.setStatus(22);	//都已经送达案件状态到达22，表示在等待一系列回证
			this.caseService.update(c);
		}
		return DwzAjaxUtils.ok_closeCurrent();
	}

	/**
	 * 送达回证三-第一步(等待收到回证)status=1
	 */
	@RequestMapping(value="/22receiptList/{uid}")
	public String receiptList_3(@PathVariable Integer uid, Model model) {
		Collection<Case> cases = this.caseService.getCaseByUID(uid);
		List<Receipt> receipts = new ArrayList<Receipt>();
		for(Case case1 : cases){
			Collection<Receipt> temp = this.receiptService.getByCidAndTimesAndStatus(case1.getId()+"-3", 1);
			receipts.addAll(temp);
		}
		model.addAttribute("receipts", receipts);
		return "flow/22receiptList";
	}

	/**
	 * 收到送达回证
	 */
	@RequestMapping(value="/22receivedReceipt/{rid}",method=RequestMethod.GET)
	public String receivedReceipt_3(@PathVariable String rid, Model model) {
		Receipt receipt = this.receiptService.get(rid);
		receipt.setContents(ArbitrationUtils.splitAndSpace(receipt.getContents(), 9));	//处理为空情况
		model.addAttribute("receipt", receipt);
		return "flow/22receivedReceipt";
	}

	/**
	 * 处理收到送达回证(收到/未收到)
	 */
	@Transactional
	@RequestMapping(value="/22receivedReceipt/{rid}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel receivedReceipt_3(@PathVariable String rid, @RequestParam Boolean isReceive, HttpServletRequest request) {
		Receipt receipt = this.receiptService.get(rid);
		receipt.setIsReceive(isReceive);
		receipt.setDescription(request.getParameter("description"));
		receipt.setStatus(2);	//直接置status=2	结束当前回证流程
		if(isReceive){	//收到回证
			try {
				receipt.setReceiptDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("receiptDate")));
			} catch (ParseException e) {
				e.printStackTrace();
				System.out.println("设置回证收到日期出错!");
			}
			String[] temps = rid.split("-");
			logger.info("用户[{}],已收到[{}]号案件[{}]的送达回证(下达裁决书后).", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1], receipt.getAddressee());
		} else {	//未收到回证
			receipt.setReason(request.getParameter("reason"));
			String[] temps = rid.split("-");
			logger.warn("用户[{}],未收到[{}]号案件[{}]的送达回证(下达裁决书后).", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1], receipt.getAddressee());
		}
		this.receiptService.update(receipt);
		/**
		 * 判断是否所有的回证都已经处理完成
		 */
		this.handleReceiptCaseIsUpdate_3(rid, request);
		return DwzAjaxUtils.ok_closeCurrent();
	}

	private void handleReceiptCaseIsUpdate_3(String rid, HttpServletRequest request) {
		// 2013-777-2-0
		String caseID = rid.split("-")[0]+"-"+rid.split("-")[1];
		Collection<Receipt> receipts = this.receiptService.getByCidAndTimes(caseID+"-3");
		boolean isFinished = true;
		for(Receipt receipt : receipts){
			if(receipt.getStatus() != 2){	//一旦有一个状态不为2的，就证明没有处理完成
				isFinished = false;
				break;
			}
		}
		//证明处理完成,更新案件状态，到下一步流程
		if(isFinished){
			Case case1 = new Case();
			case1.setId(caseID);
			case1.setStatus(23);
			this.caseService.update(case1);

			String[] temps = rid.split("-");
			logger.warn("用户[{}],已处理完成[{}]号案件的全部送达回证(下达裁决书后).", ((User)request.getSession().getAttribute("user")).getName(), temps[0]+"-"+temps[1]);
		}

	}

	/**
	 * 23.秘书上报归档
	 */
	@RequestMapping(value="/23List/{uid}")
	public String flow23List(@PathVariable Integer uid, Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatusAndUID(23, uid);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/23List";
	}

	/**
	 * 处理秘书的上报归档
	 */
	@RequestMapping(value="/23/{id}")
	public @ResponseBody DwzAjaxModel flow23(@PathVariable String id, HttpSession session) {
		logger.info("用户[{}]为[{}]号案件上报归档.", ((User)session.getAttribute("user")).getName(), id);

		Case case1 = new Case();
		case1.setId(id);
		case1.setStatus(24);
		this.caseService.update(case1);

		DwzAjaxModel model = DwzAjaxUtils.ok();
		model.setMessage("上报归档成功！");
		return model;
	}

	/**
	 * 24.案件归档--归档秘书
	 */
	@RequestMapping(value="/24List")
	public String flow24List(Model model) {
		Collection<Case> cases = this.caseService.getCaseByStatus(24);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "flow/24List";
	}

	/**
	 * 归档前判断案件费用是否都已付清
	 */
	@RequestMapping(value="/24/{id}")
	public @ResponseBody DwzAjaxModel flow24(@PathVariable String id, HttpSession session) {
		Case case1 = this.caseService.get(id);
		if (case1.getDebtCharges() == 0) {	//不欠费了，可以归档
			DwzAjaxModel model = DwzAjaxUtils.ok();
			model.setMessage("归档成功！");
			/**
			 * 归档成功，所有流程都已走完，case.status == 25
			 */
			Case c = new Case();
			c.setId(id);
			c.setStatus(25);
			this.caseService.update(c);

			logger.info("用户[{}]为[{}]号案件完成归档.", ((User)session.getAttribute("user")).getName(), id);
			return model;
		} else {	//还在欠费，不能进行归档
			DwzAjaxModel model = DwzAjaxUtils.error();
			model.setMessage("归档失败！案件费用没有交清。");

			logger.info("用户[{}]为[{}]号案件归档失败,案件费用没有交清.", ((User)session.getAttribute("user")).getName(), id);
			return model;
		}
	}

}