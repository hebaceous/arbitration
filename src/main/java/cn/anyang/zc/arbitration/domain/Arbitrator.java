package cn.anyang.zc.arbitration.domain;

import java.io.Serializable;
import java.util.Date;

public class Arbitrator implements Serializable {
	private static final long serialVersionUID = 3502086516194753313L;
	private String id;
	private String type;
	private String secretary;
	private Date date;
	private String cause;
	private String contents;	//页面填写的所有的仲裁员信息20格
	private String departmentOpinion;	//部门意见
	private String centerDirectorOpinion;	//中心主任审批
	private String directorOpinion;		//仲裁委主任审批

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSecretary() {
		return secretary;
	}
	public void setSecretary(String secretary) {
		this.secretary = secretary;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDepartmentOpinion() {
		return departmentOpinion;
	}
	public void setDepartmentOpinion(String departmentOpinion) {
		this.departmentOpinion = departmentOpinion;
	}
	public String getCenterDirectorOpinion() {
		return centerDirectorOpinion;
	}
	public void setCenterDirectorOpinion(String centerDirectorOpinion) {
		this.centerDirectorOpinion = centerDirectorOpinion;
	}
	public String getDirectorOpinion() {
		return directorOpinion;
	}
	public void setDirectorOpinion(String directorOpinion) {
		this.directorOpinion = directorOpinion;
	}
}