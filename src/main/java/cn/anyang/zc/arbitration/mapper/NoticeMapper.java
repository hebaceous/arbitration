package cn.anyang.zc.arbitration.mapper;

import java.util.Collection;

import org.apache.ibatis.annotations.Param;

import cn.anyang.zc.arbitration.domain.Notice;

public interface NoticeMapper extends BaseMapper<Notice,String> {

	Collection<Notice> getApprovaledNoticeByName(@Param("secretary") String secretary);

}