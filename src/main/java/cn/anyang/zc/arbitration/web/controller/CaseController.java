package cn.anyang.zc.arbitration.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import cn.anyang.zc.arbitration.domain.Applicant;
import cn.anyang.zc.arbitration.domain.ArbitratorDetail;
import cn.anyang.zc.arbitration.domain.Case;
import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.model.DwzAjaxModel;
import cn.anyang.zc.arbitration.model.PageModelNotice123;
import cn.anyang.zc.arbitration.model.ResultModel;
import cn.anyang.zc.arbitration.service.ApplicantService;
import cn.anyang.zc.arbitration.service.ArbitratorDetailService;
import cn.anyang.zc.arbitration.service.CaseService;
import cn.anyang.zc.arbitration.service.NoticeService;
import cn.anyang.zc.arbitration.util.DwzAjaxUtils;
import cn.anyang.zc.arbitration.util.Global;

@Controller
@RequestMapping("/case")
public class CaseController {

	private static final Logger logger = LoggerFactory.getLogger(CaseController.class);

	@Autowired
	private CaseService caseService;

	@Autowired
	private ApplicantService applicantService;

	@Autowired
	private ArbitratorDetailService arbitratorDetailService;

	@Autowired
	private NoticeService noticeService;

	/**
	 * 检查案件id是否唯一
	 */
	@RequestMapping(value="/checkCaseId")
	public @ResponseBody Boolean checkCaseId(@RequestParam String id) {
		Case c = this.caseService.checkCaseId(Calendar.getInstance().get(Calendar.YEAR) + "-" + id);
		if(c == null){
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 获取案件详情
	 */
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public String caseDetail(@PathVariable String id, Model model, HttpSession session) {
		logger.info("用户[{}]获取案件号[{}]的详情。", ((User)session.getAttribute("user")).getName(), id);

		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		String[] caseProcedures = Global.caseProcedures;
		String[] caseTypes = Global.caseTypes;
		String[] applicantTypes = Global.applicantTypes;
		model.addAttribute("caseProcedures", caseProcedures);
		model.addAttribute("caseTypes", caseTypes);
		model.addAttribute("applicantTypes", applicantTypes);
		List<Applicant> applicants = this.applicantService.getByCidAndIsApplicant(id, true);
		model.addAttribute("applicants", applicants);
		List<Applicant> respondents = this.applicantService.getByCidAndIsApplicant(id, false);
		model.addAttribute("respondents", respondents);
		return "case/caseDetail";
	}

	/**
	 * 案件请求事项详细
	 */
	@RequestMapping(value="/requestDetail/{id}")
	public String caseRequestDetail(@PathVariable String id, Model model, HttpSession session) {
		logger.info("用户[{}]获取案件号[{}]的案件请求详情。", ((User)session.getAttribute("user")).getName(), id);

		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		return "case/requestDetail";
	}

	/**
	 * 查看审批中的案件
	 */
	@RequestMapping(value="/123ing/{uid}")
	public String case123ing(@PathVariable Integer uid, Model model, HttpSession session) {
		logger.info("用户[{}]审批当中的仲裁申请案件列表。", ((User)session.getAttribute("user")).getName());

		Collection<Case> cases = this.caseService.getCaseByStatusAndUID(1, uid);
		Collection<Case> cases2 = this.caseService.getCaseByStatusAndUID(2, uid);
		Collection<Case> cases3 = this.caseService.getCaseByStatusAndUID(3, uid);
		cases.addAll(cases2);
		cases.addAll(cases3);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "case/123ing";
	}

	@RequestMapping(value="/123ing")
	public String case123ing(Model model, HttpSession session) {
		logger.info("用户[{}]审批当中的仲裁申请案件列表。", ((User)session.getAttribute("user")).getName());

		Collection<Case> cases = this.caseService.getCaseByStatus(1);
		Collection<Case> cases2 = this.caseService.getCaseByStatus(2);
		Collection<Case> cases3 = this.caseService.getCaseByStatus(3);
		cases.addAll(cases2);
		cases.addAll(cases3);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "case/123ing";
	}

	/**
	 * 刚审批通过的(status>4)，默认显示20条
	 */
	@RequestMapping(value="/123ed/{uid}")
	public String case123ed(@PathVariable Integer uid, Model model, HttpSession session) {
		logger.info("用户[{}]查看刚审批通过的仲裁申请案件列表。", ((User)session.getAttribute("user")).getName());

		Collection<Case> cases = this.caseService.getCaseByStatusAndUID_GT(4, uid);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "case/123ed";
	}

	/**
	 * 请求通过的案件详细(供打印)
	 */
	@RequestMapping(value="/approvaledDetail/{id}")
	public String caseApprovaledDetail(@PathVariable String id, Model model, HttpSession session) {
		logger.info("用户[{}]查看审批通过的[{}]仲裁申请。", ((User)session.getAttribute("user")).getName(), id);

		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);

		List<Applicant> applicants1 = this.applicantService.getByCidAndIsApplicant(id, true);	//申请人
		StringBuffer names1 = new StringBuffer();
		for(int i=0; i<applicants1.size(); i++){
			Applicant applicant = applicants1.get(i);
			if(applicant.getType() == 0){	//公民
				names1.append(applicant.getName());
			} else {	//单位或者组织
				names1.append(applicant.getOrganization());
			}
			if(i < applicants1.size()-1){
				names1.append(",");
			}
		}
		model.addAttribute("names1", names1);

		List<Applicant> applicants2 = this.applicantService.getByCidAndIsApplicant(id, false);	//被申请人
		StringBuffer names2 = new StringBuffer();
		for(int i=0; i<applicants2.size(); i++){
			Applicant applicant = applicants2.get(i);
			if(applicant.getType() == 0){	//公民
				names2.append(applicant.getName());
			} else {	//单位或者组织
				names2.append(applicant.getOrganization());
			}
			if(i < applicants2.size()-1){
				names2.append(",");
			}
		}
		model.addAttribute("names2", names2);

		return "case/approvaledDetail";
	}

	/**
	 * 案件费用管理(归档之前及case.status<25)
	 */
	@RequestMapping(value="/costList")
	public String costList(Model model, HttpSession session) {
		logger.info("用户[{}]查看案件费用管理列表。", ((User)session.getAttribute("user")).getName());

		Collection<Case> cases = this.caseService.getCaseByStatus_LT(25);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "case/costList";
	}

	@RequestMapping(value="/cost/{id}",method=RequestMethod.GET)
	public String cost(@PathVariable String id, Model model, HttpSession session) {
		logger.info("用户[{}]查看[{}]号案件费用。", ((User)session.getAttribute("user")).getName(), id);

		Case case1 = this.caseService.get(id);
		model.addAttribute("c", case1);
		return "case/cost";
	}

	@RequestMapping(value="/cost/{id}",method=RequestMethod.POST)
	public @ResponseBody DwzAjaxModel cost(@PathVariable String id, @RequestParam Long paidCharges, HttpSession session) {
		logger.info("用户[{}]查看案件费用管理列表。", ((User)session.getAttribute("user")).getName());

		Case case1 = this.caseService.get(id);
		case1.setPaidCharges(paidCharges);	//已付金额
		case1.setDebtCharges(case1.getArbitrationCharges() - paidCharges);	//欠费金额
		this.caseService.update(case1);
		return DwzAjaxUtils.ok_closeCurrent();
	}

	/**
	 * 审批中的仲裁员审批表
	 */
	@RequestMapping(value="/101112ing/{uid}")
	public String case101112ing(@PathVariable Integer uid, Model model, HttpSession session) {
		logger.info("用户[{}]查看审批中的仲裁员审批表。", ((User)session.getAttribute("user")).getName());

		Collection<Case> cases = this.caseService.getCaseByStatus(10);
		Collection<Case> cases2 = this.caseService.getCaseByStatus(11);
		Collection<Case> cases3 = this.caseService.getCaseByStatus(12);
		cases.addAll(cases2);
		cases.addAll(cases3);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "case/101112ing";
	}

	@RequestMapping(value="/101112ed/{uid}")
	public String case101112ed(@PathVariable Integer uid, Model model, HttpSession session) {
		logger.info("用户[{}]查看审批通过的仲裁员审批表。", ((User)session.getAttribute("user")).getName());
	
		Collection<Case> cases = this.caseService.getCaseByStatusAndUID_GT(12, uid);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "case/101112ed";
	}

	/**
	 * 下载开庭笔录
	 */
	@RequestMapping("/download/{id}")
	public void download(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		logger.info("用户[{}]下载[{}]号案件的开庭笔录。", ((User)request.getSession().getAttribute("user")).getName(), id);

		Case case1 = this.caseService.get(id);
		String hearingRecord = case1.getHearingRecord();
		String path = request.getServletContext().getRealPath(hearingRecord);
		String filename = hearingRecord.substring(hearingRecord.lastIndexOf(File.separator)+1);
		try {
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(filename, "UTF-8"));
			FileInputStream in = new FileInputStream(path);
			int len = 0;
			byte[] buffer = new byte[1024];
			OutputStream out = response.getOutputStream();
			while((len=in.read(buffer))>0){
				out.write(buffer, 0, len);
			}
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("用户[{}]下载[{}]号案件的开庭笔录时出错！", ((User)request.getSession().getAttribute("user")).getName(), id, e);
		}
	}

	/**
	 * 办理中的案件 status(1-23)(供监控使用)
	 */
	@RequestMapping("/caseing")
	public String caseing(Model model){
		Collection<Case> cases = this.caseService.getCaseByStatus_LT(25);
		model.addAttribute("cases", cases);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "case/caseing";
	}

	/**
	 * 发受理通知书(status>=5后，即分过案的)
	 */
	@RequestMapping("/notice1List")
	public String notice1List(@ModelAttribute PageModelNotice123 pageModelNotice123, Model model){
		pageModelNotice123.setStartStatus(5);
		ResultModel resultModel = this.caseService.getCaseNotice(pageModelNotice123);
		model.addAttribute("model", resultModel);
		String[] caseTypes = Global.caseTypes;
		model.addAttribute("caseTypes", caseTypes);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "case/notice1List";
	}

	@RequestMapping("/notice1/{id}")
	public String notice1(@PathVariable String id, Model model){
		Case case1 = this.caseService.get(id);
		Collection<Applicant> applicants = this.applicantService.getByCid(id);
		model.addAttribute("c", case1);
		model.addAttribute("applicants", applicants);
		String[] names = this.getApplicantsAndRespondentsName(id);
		model.addAttribute("names", names);
		return "case/notice1";
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
	 * 组庭理通知书(status>=14后，上报仲裁员通过的)
	 */
	@RequestMapping("/notice2List")
	public String notice2List(@ModelAttribute PageModelNotice123 pageModelNotice123, Model model){
		pageModelNotice123.setStartStatus(14);
		ResultModel resultModel = this.caseService.getCaseNotice(pageModelNotice123);
		model.addAttribute("model", resultModel);
		String[] caseTypes = Global.caseTypes;
		model.addAttribute("caseTypes", caseTypes);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "case/notice2List";
	}

	@RequestMapping("/notice2/{id}")
	public String notice2(@PathVariable String id, Model model){
		Case case1 = this.caseService.get(id);
		Collection<Applicant> applicants = this.applicantService.getByCid(id);
		model.addAttribute("c", case1);
		model.addAttribute("applicants", applicants);
		String[] names = this.getApplicantsAndRespondentsName(id);
		model.addAttribute("names", names);
		Collection<ArbitratorDetail> arbitrators = this.arbitratorDetailService.getByCID(id);
		model.addAttribute("arbitrators", arbitrators);
		return "case/notice2";
	}

	/**
	 * 开庭理通知书(status>=16后，已送达回证的《组庭后》)
	 */
	@RequestMapping("/notice3List")
	public String notice3List(@ModelAttribute PageModelNotice123 pageModelNotice123, Model model){
		pageModelNotice123.setStartStatus(16);
		ResultModel resultModel = this.caseService.getCaseNotice(pageModelNotice123);
		model.addAttribute("model", resultModel);
		String[] caseTypes = Global.caseTypes;
		model.addAttribute("caseTypes", caseTypes);
		String[] caseProcedures = Global.caseProcedures;
		model.addAttribute("caseProcedures", caseProcedures);
		return "case/notice3List";
	}

	@RequestMapping("/notice3/{id}")
	public String notice3(@PathVariable String id, Model model){
		Case case1 = this.caseService.get(id);
		Collection<Applicant> applicants = this.applicantService.getByCid(id);
		model.addAttribute("c", case1);
		model.addAttribute("applicants", applicants);
		String[] names = this.getApplicantsAndRespondentsName(id);
		model.addAttribute("names", names);
		return "case/notice3";
	}

}