package cn.anyang.zc.arbitration.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.model.PageModel;
import cn.anyang.zc.arbitration.model.ResultModel;
import cn.anyang.zc.arbitration.service.ArbitratorService;
import cn.anyang.zc.arbitration.service.AwardService;
import cn.anyang.zc.arbitration.service.CaseService;
import cn.anyang.zc.arbitration.service.NoticeService;
import cn.anyang.zc.arbitration.service.ReceiptService;
import cn.anyang.zc.arbitration.service.RetrievalService;

@Service
public class RetrievalServiceImpl implements RetrievalService {

	@Autowired
	private CaseService caseService;

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private ReceiptService receiptService;

	@Autowired
	private ArbitratorService arbitratorService;

	@Autowired
	private AwardService awardService;

	@Override
	public ResultModel caseSearch(PageModel pageModel) {
		return this.caseService.search(pageModel);
	}

	@Override
	public ResultModel noticeSearch(PageModel pageModel) {
		return this.noticeService.search(pageModel);
	}

	@Override
	public ResultModel receiptSearch(PageModel pageModel) {
		return this.receiptService.search(pageModel);
	}

	@Override
	public ResultModel arbitratorSearch(PageModel pageModel) {
		return this.arbitratorService.search(pageModel);
	}

	@Override
	public ResultModel awardSearch(PageModel pageModel) {
		return this.awardService.search(pageModel);
	}

}