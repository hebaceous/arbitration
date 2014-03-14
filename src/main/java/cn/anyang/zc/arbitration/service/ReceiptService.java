package cn.anyang.zc.arbitration.service;

import java.util.Collection;

import cn.anyang.zc.arbitration.domain.Receipt;

public interface ReceiptService extends BaseService<Receipt,String> {

	Collection<Receipt> getReceiptedByName(String secretary);

	Collection<Receipt> getByCidAndTimes(String idkey);

	Collection<Receipt> getByCidAndTimesAndStatus(String idkey, Integer status);

	Collection<Receipt> getByStatus(Integer status);

	Integer countByTimesAndUIDAndStatus(Integer times, Integer uid, Integer status);

}