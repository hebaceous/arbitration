package cn.anyang.zc.arbitration.domain;

import java.io.Serializable;

public class Role implements Serializable {
	private static final long serialVersionUID = -3202135787020676063L;
	private Integer id;
	private String name;
	private String description;

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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}