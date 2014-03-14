package cn.anyang.zc.arbitration.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.domain.Case;
import cn.anyang.zc.arbitration.domain.Receipt;
import cn.anyang.zc.arbitration.mapper.BaseMapper;
import cn.anyang.zc.arbitration.mapper.CaseMapper;
import cn.anyang.zc.arbitration.mapper.ReceiptMapper;
import cn.anyang.zc.arbitration.service.ReceiptService;

@Service
public class ReceiptServiceImpl extends BaseServiceImpl<Receipt,String> implements ReceiptService {

	@Autowired
	private ReceiptMapper receiptMapper;

	@Autowired
	private CaseMapper caseMapper;

	@Override
	public BaseMapper<Receipt,String> getMapper() {
		return this.receiptMapper;
	}

	@Override
	public Collection<Receipt> getReceiptedByName(String secretary) {
		return this.receiptMapper.getReceiptedByName(secretary);
	}

	@Override
	public Collection<Receipt> getByCidAndTimes(String idkey) {
		return this.receiptMapper.getByCidAndTimes("'"+idkey+"%'");
	}

	@Override
	public Collection<Receipt> getByCidAndTimesAndStatus(String idkey, Integer status) {
		return this.receiptMapper.getByCidAndTimesAndStatus("'"+idkey+"%'", status);
	}

	@Override
	public Collection<Receipt> getByStatus(Integer status) {
		return this.receiptMapper.getByStatus(status);
	}

	@Override
	public Integer countByTimesAndUIDAndStatus(Integer times, Integer uid, Integer status) {
		Collection<Case> cases = this.caseMapper.getCaseByUID(uid);
		List<Receipt> receipts = new ArrayList<Receipt>();
		for(Case case1 : cases){
			Collection<Receipt> temp = this.receiptMapper.getByCidAndTimesAndStatus("'"+case1.getId()+"-"+times+"%'", status);
			receipts.addAll(temp);
		}
		return receipts.size();
	}

}