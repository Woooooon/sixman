package com.kh.sixman.addressBook.vo;

import org.springframework.web.multipart.MultipartFile;

import com.kh.sixman.common.AttachmentVo;

import lombok.Data;

@Data
public class AddressVo {
    private String no;
    private String sortationNo;
    private String name;
    private String phone;
    private String email;
    private String company;
    private String position;
    private String address;
    private String enrollDate;
    private String modifyDate;
    private String comment;
    private String sortationHigh;
    private String sortationName;
    private String fileName;
    private String fileNo;
    
    private MultipartFile fileInsert;
	private AttachmentVo addressFile;
}
