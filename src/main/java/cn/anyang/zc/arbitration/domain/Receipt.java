package cn.anyang.zc.arbitration.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
 * 送达回证(1.2.3)
 */
public class Receipt implements Serializable {
	private static final long serialVersionUID = 4613045382205531518L;
	private String id;
	private String cause;
	private String addressee;	//受送达人
	private String address;		//送达地址
	private String mode;		//送达方式
	private String files;		//送达的文件列表
	private String contents;	//文档中填写的3处九个空格
	private Integer piece;		//送达文件的个数
	private Date deliveredDate;	//送发日期
	private String reason;		//不能送达原因或拒收理由
	private String secretary;	//签发人
	private String processServer;	//送达人
	private String description;		//备注
	private String receiver;		//受送达人或代收人(目前不需要)
	@DateTimeFormat(iso=ISO.DATE)
	private Date receiptDate;		//接收日期
	private Boolean isReceive;		//是否收到
	private Integer status;			//回证的状态，刚添加默认为1，2为等待审批，3为操作完成

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
	public String getAddressee() {
		return addressee;
	}
	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getPiece() {
		return piece;
	}
	public void setPiece(Integer piece) {
		this.piece = piece;
	}
	public Date getDeliveredDate() {
		return deliveredDate;
	}
	public void setDeliveredDate(Date deliveredDate) {
		this.deliveredDate = deliveredDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getSecretary() {
		return secretary;
	}
	public void setSecretary(String secretary) {
		this.secretary = secretary;
	}
	public String getProcessServer() {
		return processServer;
	}
	public void setProcessServer(String processServer) {
		this.processServer = processServer;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public Date getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(Date receiptDate) {
		this.receiptDate = receiptDate;
	}
	public Boolean getIsReceive() {
		return isReceive;
	}
	public void setIsReceive(Boolean isReceive) {
		this.isReceive = isReceive;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
}