package cn.anyang.zc.arbitration.service.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.domain.Notice;
import cn.anyang.zc.arbitration.mapper.BaseMapper;
import cn.anyang.zc.arbitration.mapper.NoticeMapper;
import cn.anyang.zc.arbitration.service.NoticeService;

@Service
public class NoticeServiceImpl extends BaseServiceImpl<Notice,String> implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public BaseMapper<Notice,String> getMapper() {
		return this.noticeMapper;
	}

	@Override
	public Collection<Notice> getApprovaledNoticeByName(String secretary) {
		return this.noticeMapper.getApprovaledNoticeByName(secretary);
	}

}
