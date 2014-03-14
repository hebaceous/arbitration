package cn.anyang.zc.arbitration.service;

import cn.anyang.zc.arbitration.model.PageModel;
import cn.anyang.zc.arbitration.model.ResultModel;

public interface RetrievalService {

	ResultModel caseSearch(PageModel pageModel);

	ResultModel noticeSearch(PageModel pageModel);

	ResultModel receiptSearch(PageModel pageModel);

	ResultModel arbitratorSearch(PageModel pageModel);

	ResultModel awardSearch(PageModel pageModel);

}