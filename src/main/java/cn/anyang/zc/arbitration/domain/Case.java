package cn.anyang.zc.arbitration.domain;

import java.io.Serializable;
import java.util.Date;

public class Case implements Serializable {
	private static final long serialVersionUID = 381590671352733716L;
	private String id;				//案件号
	private String cause;			//案由
	//private List<Applicant> applicants = new ArrayList<Applicant>();	//申请人[0]与被申请人[1]
	private String agreement;		//仲裁协议(arbitration agreement)
	private String request;			//仲裁请求事项
	private String caseOfficer;		//立案员--分案之前的
	private String responsiblePersonOpinion;	//立案科意见
	private String departmentOpinion;			//部门初审意见
	private String secretaryGeneralOpinion;		//秘书长意见
	private Long money;				//争议金额(amount of money in controversy) 标的
	private Long acceptCharges;		//受理费
	private Long handlingCharges;	//处理费
	private Long arbitrationCharges;//仲裁费(受理费+处理费)
	private Long paidCharges;		//已交费用
	private Long debtCharges;		//欠费金额(仲裁费-已交费用)
	private Boolean isRelief;		//是否减免
	private Date date;				//仲裁申请日期
	private Date registerDate;		//立案时间
	private Date formationDate;		//组庭时间
	private Date courtDate;			//开庭时间
	private Date concludedDate;		//结案时间
	private Integer applicableProcedure;	//适用程序(0:简易,1:普通)
	private Integer type;			//案件类型(Global.caseTypes)
	private String typeName;		//当为其它时自己写的类型名称
	private User user;				//仲裁秘书
	private Integer status = 1;		//当前案件的状态(刚添加时，默认为1)
	private String hearingRecord;	//开庭笔录,为服务器相对位置(Folder hearingRecord---hearingRecord/xxxid.zip)
	private String awardResult;		//裁决书类型	{"裁决","调解","决定"}
	private String arbitratorNames;	//仲裁员的姓名

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public String getAgreement() {
		return agreement;
	}
	public void setAgreement(String agreement) {
		this.agreement = agreement;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getCaseOfficer() {
		return caseOfficer;
	}
	public void setCaseOfficer(String caseOfficer) {
		this.caseOfficer = caseOfficer;
	}
	public String getResponsiblePersonOpinion() {
		return responsiblePersonOpinion;
	}
	public void setResponsiblePersonOpinion(String responsiblePersonOpinion) {
		this.responsiblePersonOpinion = responsiblePersonOpinion;
	}
	public String getDepartmentOpinion() {
		return departmentOpinion;
	}
	public void setDepartmentOpinion(String departmentOpinion) {
		this.departmentOpinion = departmentOpinion;
	}
	public String getSecretaryGeneralOpinion() {
		return secretaryGeneralOpinion;
	}
	public void setSecretaryGeneralOpinion(String secretaryGeneralOpinion) {
		this.secretaryGeneralOpinion = secretaryGeneralOpinion;
	}
	public Long getMoney() {
		return money;
	}
	public void setMoney(Long money) {
		this.money = money;
	}
	public Long getAcceptCharges() {
		return acceptCharges;
	}
	public void setAcceptCharges(Long acceptCharges) {
		this.acceptCharges = acceptCharges;
	}
	public Long getHandlingCharges() {
		return handlingCharges;
	}
	public void setHandlingCharges(Long handlingCharges) {
		this.handlingCharges = handlingCharges;
	}
	public Long getArbitrationCharges() {
		return arbitrationCharges;
	}
	public void setArbitrationCharges(Long arbitrationCharges) {
		this.arbitrationCharges = arbitrationCharges;
	}
	public Long getPaidCharges() {
		return paidCharges;
	}
	public void setPaidCharges(Long paidCharges) {
		this.paidCharges = paidCharges;
	}
	public Long getDebtCharges() {
		return debtCharges;
	}
	public void setDebtCharges(Long debtCharges) {
		this.debtCharges = debtCharges;
	}
	public Boolean getIsRelief() {
		return isRelief;
	}
	public void setIsRelief(Boolean isRelief) {
		this.isRelief = isRelief;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public Date getFormationDate() {
		return formationDate;
	}
	public void setFormationDate(Date formationDate) {
		this.formationDate = formationDate;
	}
	public Date getCourtDate() {
		return courtDate;
	}
	public void setCourtDate(Date courtDate) {
		this.courtDate = courtDate;
	}
	public Date getConcludedDate() {
		return concludedDate;
	}
	public void setConcludedDate(Date concludedDate) {
		this.concludedDate = concludedDate;
	}
	public Integer getApplicableProcedure() {
		return applicableProcedure;
	}
	public void setApplicableProcedure(Integer applicableProcedure) {
		this.applicableProcedure = applicableProcedure;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getHearingRecord() {
		return hearingRecord;
	}
	public void setHearingRecord(String hearingRecord) {
		this.hearingRecord = hearingRecord;
	}
	public String getAwardResult() {
		return awardResult;
	}
	public void setAwardResult(String awardResult) {
		this.awardResult = awardResult;
	}
	public String getArbitratorNames() {
		return arbitratorNames;
	}
	public void setArbitratorNames(String arbitratorNames) {
		this.arbitratorNames = arbitratorNames;
	}
}