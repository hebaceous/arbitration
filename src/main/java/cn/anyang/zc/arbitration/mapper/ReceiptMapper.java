package cn.anyang.zc.arbitration.mapper;

import java.util.Collection;

import org.apache.ibatis.annotations.Param;

import cn.anyang.zc.arbitration.domain.Receipt;

public interface ReceiptMapper extends BaseMapper<Receipt,String> {

	Collection<Receipt> getReceiptedByName(@Param("secretary") String secretary);

	Collection<Receipt> getByCidAndTimes(@Param("idkey") String idkey);

	Collection<Receipt> getByCidAndTimesAndStatus(@Param("idkey") String idkey, @Param("status") Integer status);

	Collection<Receipt> getByStatus(@Param("status") Integer status);

}