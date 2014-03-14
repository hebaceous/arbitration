package cn.anyang.zc.arbitration.domain;

import java.io.Serializable;

public class ArbitratorDetail implements Serializable {
	private static final long serialVersionUID = 998401112807638759L;
	private String id;	//case.id-name
	private String name;
	private String post;
	private Long accruedCharges;	//应付费用
	private Long paidCharges;		//已付费用
	private Long debtCharges;		//欠费用
	private Boolean isPayInFull;	//是否付清
	private String description;

	public ArbitratorDetail() {
	}
	public ArbitratorDetail(String id, String name, String post) {
		this.id = id;
		this.name = name;
		this.post = post;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public Long getAccruedCharges() {
		return accruedCharges;
	}
	public void setAccruedCharges(Long accruedCharges) {
		this.accruedCharges = accruedCharges;
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
	public Boolean getIsPayInFull() {
		return isPayInFull;
	}
	public void setIsPayInFull(Boolean isPayInFull) {
		this.isPayInFull = isPayInFull;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}