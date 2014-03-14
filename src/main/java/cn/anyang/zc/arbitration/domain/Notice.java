package cn.anyang.zc.arbitration.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 送达文书（公告签发单）
 */
public class Notice implements Serializable {
	private static final long serialVersionUID = -7064729683380002074L;
	private String id;
	private String cause;
	private String applicant;
	private String respondent;
	private Date deliveredDate;	//送发日期
	private Date courtDate;		//开庭时间
	private String secretary;	//负责案件的秘书
	private String auditor;		//公告审核人

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
	public Date getDeliveredDate() {
		return deliveredDate;
	}
	public void setDeliveredDate(Date deliveredDate) {
		this.deliveredDate = deliveredDate;
	}
	public Date getCourtDate() {
		return courtDate;
	}
	public void setCourtDate(Date courtDate) {
		this.courtDate = courtDate;
	}
	public String getSecretary() {
		return secretary;
	}
	public void setSecretary(String secretary) {
		this.secretary = secretary;
	}
	public String getAuditor() {
		return auditor;
	}
	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}
}