package cn.anyang.zc.arbitration.service;

import java.util.List;

public interface StatisticsService {

	List<Integer> getAllYears();

	String[] caseCountStatistics(Integer year);

	String[] caseTypeStatistics(Integer year);

	String[] secretaryCaseCountStatistics(Integer status);
}