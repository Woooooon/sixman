package com.kh.sixman.document.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.sixman.common.AttachmentVo;

import lombok.Data;

@Data
public class DocumentVo {

	private String no;
	private String sendPay;
	private String type;
	private String title;
	private String content;
	private String dYn;
	private String enrollDate;
	private String modifyDate;
	private String startDate;
	private String endDate;
	private String apNo;
	
	
	private List<AttachmentVo> fileList;
	private List<MultipartFile> file;
	private List<String> sender;
	
	
	
}
