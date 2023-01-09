package com.kh.sixman.temp.approval.vo;

import java.util.List;

import lombok.Data;

@Data
public class ApprovalDocumentVo {
	
	private String no;
	private String apNo;
	private String sendPay;
	private String type;
	private String typeName;
	private String title;
	private String content;
	private String dYn;
	private String dSave;
	private String enrollDate;
	private String modifyDate;
	private String startDate;
	private String endDate;
	private String refer;
	private String sendName;
	private String[] docSaveNo;
	private List<ApprovalVo> line;
	private String state;

}
