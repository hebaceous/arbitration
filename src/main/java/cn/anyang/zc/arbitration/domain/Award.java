package cn.anyang.zc.arbitration.domain;

import java.io.Serializable;
import java.util.Date;

public class Award implements Serializable {
	private static final long serialVersionUID = 7574620960123732736L;
	private String id;
	private Date deliveredDate;	//送达日期
	private Integer type;		//裁决书类型(Global.awardTypes)
	private String cause;
	private String applicant;
	private String respondent;
	private Date caseDate;		//受案日期
	private String undertaker;	//承办人
	private String auditor;		//审核人
	private String secretaryGeneral;	//秘书长
	private String director;	//主任
	private String secretary;	//仲裁秘书
	private String	firstTrial;	//初审
	private Integer printing;	//印数

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getDeliveredDate() {
		return deliveredDate;
	}
	public void setDeliveredDate(Date deliveredDate) {
		this.deliveredDate = deliveredDate;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public String getApplicant() {
		return applicant;
	}
	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}
	public String getRespondent() {
		return respondent;
	}
	public void setRespondent(String respondent) {
		this.respondent = respondent;
	}
	public Date getCaseDate() {
		return caseDate;
	}
	public void setCaseDate(Date caseDate) {
		this.caseDate = caseDate;
	}
	public String getUndertaker() {
		return undertaker;
	}
	public void setUndertaker(String undertaker) {
		this.undertaker = undertaker;
	}
	public String getAuditor() {
		return auditor;
	}
	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}
	public String getSecretaryGeneral() {
		return secretaryGeneral;
	}
	public void setSecretaryGeneral(String secretaryGeneral) {
		this.secretaryGeneral = secretaryGeneral;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getSecretary() {
		return secretary;
	}
	public void setSecretary(String secretary) {
		this.secretary = secretary;
	}
	public String getFirstTrial() {
		return firstTrial;
	}
	public void setFirstTrial(String firstTrial) {
		this.firstTrial = firstTrial;
	}
	public Integer getPrinting() {
		return printing;
	}
	public void setPrinting(Integer printing) {
		this.printing = printing;
	}
}