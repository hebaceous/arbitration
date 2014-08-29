package cn.anyang.zc.arbitration.util;

public class Global {

	// 申请人/被申请人类型
	public static String[] applicantTypes = {"公民", "法人", "其它组织"};

	// 案件程序：简易/普通
	public static String[] caseProcedures = {"简易", "普通"};

	// 案件类型：...8-其它
	public static String[] caseTypes = {"保险合同纠纷", "商品房买卖合同纠纷", "建设工程合同纠纷", "借款合同纠纷", "确权合同纠纷", "购销合同纠纷", "租赁合同纠纷", "承包合同纠纷", "其它"};

	// 立案审批固定格式
	public static String message123 = "已阅，符合仲裁法第二十一条规定，拟同意立案。";

	// 送达方式	
	public static String[] serviceModes = {"直接送达", "公正送达", "邮寄", "公告", "留置"};

	// 裁决书的三种方式(裁决、调解、决定)
	public static String[] awardTypes = {"裁决", "调解", "决定"};

	// 案件争议金额分布
	public static String[] caseMoneys = {"10万元以下", "10万——20万", "20万——50万", "50万——100万", "100万——200万", "200万——500万", "500万——1000万", "1000万以上",};

}