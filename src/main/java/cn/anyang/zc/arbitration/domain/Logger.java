package cn.anyang.zc.arbitration.domain;

import java.io.Serializable;
import java.util.Date;

public class Logger implements Serializable {
	private static final long serialVersionUID = -6866234026268646892L;

	private Long event_id;
	private Date time;
	private String level_string;
	private String formatted_message;
	public Long getEvent_id() {
		return event_id;
	}
	public void setEvent_id(Long event_id) {
		this.event_id = event_id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getLevel_string() {
		return level_string;
	}
	public void setLevel_string(String level_string) {
		this.level_string = level_string;
	}
	public String getFormatted_message() {
		return formatted_message;
	}
	public void setFormatted_message(String formatted_message) {
		this.formatted_message = formatted_message;
	}
}
