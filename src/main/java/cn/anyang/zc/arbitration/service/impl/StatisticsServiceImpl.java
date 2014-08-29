package cn.anyang.zc.arbitration.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.anyang.zc.arbitration.domain.User;
import cn.anyang.zc.arbitration.mapper.StatisticsMapper;
import cn.anyang.zc.arbitration.service.CaseService;
import cn.anyang.zc.arbitration.service.StatisticsService;
import cn.anyang.zc.arbitration.service.UserService;
import cn.anyang.zc.arbitration.util.Global;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Autowired
	private StatisticsMapper statisticsMapper;

	@Autowired
	private UserService userService;

	@Autowired
	private CaseService caseService;

	@Override
	public List<Integer> getAllYears() {
		return this.caseService.getAllYears();
	}

	@Override
	public String[] caseCountStatistics(Integer year) {
		StringBuffer legends = new StringBuffer();
		StringBuffer datas = new StringBuffer();
		String[] caseMoneys = Global.caseMoneys;
		String date = null;
		String title = null;
		if(year == null){
			date = "%";
			title = "案件数量统计（所有年）";
		} else {
			date = year + "%";
			title = "案件数量统计（" + year + "年）";
		}
		for(int i=0; i<caseMoneys.length; i++){
			Integer count = this.caseService.caseCount(date + "%", i);
			if(count != 0){
				legends.append("'%%.%% – " + caseMoneys[i] + " - " + count + "件',");
				datas.append(count + ",");
			}
		}
		String legend = null;
		String data = null;
		/**
		 * 去掉最后一个 ","
		 */
		if(legends.length() > 0){
			legend = legends.substring(0, legends.lastIndexOf(","));
			data = datas.substring(0, datas.lastIndexOf(","));
		} else {
			title = "没有案件";
		}

		return new String[] { legend, data, title };
	}

	@Override
	public String[] caseTypeStatistics(Integer year) {
		StringBuffer legends = new StringBuffer();
		StringBuffer datas = new StringBuffer();
		String[] caseTypes = Global.caseTypes;
		String date = null;
		String title = null;
		if(year == null){
			date = "%";
			title = "案件类型统计（所有年）";
		} else {
			date = year + "%";
			title = "案件类型统计（" + year + "年）";
		}
		for(int i=0; i<caseTypes.length; i++){
			Integer count = this.caseService.typeCount(date, i);
			if(count != 0){
				legends.append("'%%.%% – " + caseTypes[i] + " - " + count + "件',");
				datas.append(count + ",");
			}
		}
		String legend = null;
		String data = null;
		/**
		 * 去掉最后一个 ","
		 */
		if(legends.length() > 0){
			legend = legends.substring(0, legends.lastIndexOf(","));
			data = datas.substring(0, datas.lastIndexOf(","));
		} else {
			title = "没有案件";
		}
		return new String[] { legend, data, title };
	}

	@Override
	public String[] secretaryCaseCountStatistics(Integer year) {
		//得到所有的仲裁秘书
		List<User> users = this.userService.getUsersByRID(4);
		StringBuffer legends = new StringBuffer();
		StringBuffer datas = new StringBuffer();
		String date = null;
		String title = null;
		if(year == null){
			date = "%";
			title = "人员办案数量统计（所有年）";
		} else {
			date = year + "%";
			title = "人员办案数量统计（" + year + "年）";
		}
		for(User user : users) {
			Integer count = this.caseService.secretaryCount(date, user.getId());
			if(count != 0){
				legends.append("'%%.%% – " + user.getName() + " - " + count + "件',");
				datas.append(count + ",");
			}
		}
		String legend = null;
		String data = null;
		/**
		 * 去掉最后一个 ","
		 */
		if(legends.length() > 0){
			legend = legends.substring(0, legends.lastIndexOf(","));
			data = datas.substring(0, datas.lastIndexOf(","));
		} else {
			title = "没有案件";
		}
		return new String[] { legend, data, title };
	}

}