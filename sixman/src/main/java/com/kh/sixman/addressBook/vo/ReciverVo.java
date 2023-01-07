package com.kh.sixman.addressBook.vo;

import java.util.List;

import lombok.Data;

@Data
public class ReciverVo {

	private String no;
	private String reciverNo;
	private String checkYn;
	private String enrollDate;
	private String sendAddress;
	
	private String senderNo;
	private String senderName;
	private String senderDept;
	private String senderTeam;
	private String senderPosition;
	
	private List<AddressVo> addressList;
}
