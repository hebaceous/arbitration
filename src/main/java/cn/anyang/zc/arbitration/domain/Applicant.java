package cn.anyang.zc.arbitration.domain;

import java.io.Serializable;

public class Applicant implements Serializable {
	private static final long serialVersionUID = -7581788600685899235L;
	private Integer id;
	private String name;
	private String sex;
	private String identityCard;	//身份证号
	private String phone;
	private String address;
	private Integer type;	//申请人/被申请人类型(Global.applicantTypes)
	private String organization;	//单位名称
	private String post;			//职务
	//private String proxy;			//代理人的所有信息(一个主要发言人、两个代理人、单位、联系方式、代理权限)
	private String proxy_spokesman;		//主要发言人
	private String proxy_proxy1;
	private String proxy_proxy2;
	private String proxy_organization;
	private String proxy_contact;
	private String proxy_power;
	private Boolean isApplicant;	//true:申请人	false:被申请人
	private String cid;	//属于哪个案件

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getIdentityCard() {
		return identityCard;
	}
	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getProxy_spokesman() {
		return proxy_spokesman;
	}
	public void setProxy_spokesman(String proxy_spokesman) {
		this.proxy_spokesman = proxy_spokesman;
	}
	public String getProxy_proxy1() {
		return proxy_proxy1;
	}
	public void setProxy_proxy1(String proxy_proxy1) {
		this.proxy_proxy1 = proxy_proxy1;
	}
	public String getProxy_proxy2() {
		return proxy_proxy2;
	}
	public void setProxy_proxy2(String proxy_proxy2) {
		this.proxy_proxy2 = proxy_proxy2;
	}
	public String getProxy_organization() {
		return proxy_organization;
	}
	public void setProxy_organization(String proxy_organization) {
		this.proxy_organization = proxy_organization;
	}
	public String getProxy_contact() {
		return proxy_contact;
	}
	public void setProxy_contact(String proxy_contact) {
		this.proxy_contact = proxy_contact;
	}
	public String getProxy_power() {
		return proxy_power;
	}
	public void setProxy_power(String proxy_power) {
		this.proxy_power = proxy_power;
	}
	public Boolean getIsApplicant() {
		return isApplicant;
	}
	public void setIsApplicant(Boolean isApplicant) {
		this.isApplicant = isApplicant;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
}