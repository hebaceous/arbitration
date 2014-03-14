package cn.anyang.zc.arbitration.service;

import java.util.Collection;

import cn.anyang.zc.arbitration.domain.Notice;

public interface NoticeService extends BaseService<Notice,String> {

	Collection<Notice> getApprovaledNoticeByName(String secretary);

}