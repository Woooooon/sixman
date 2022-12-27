package com.kh.sixman.project.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.member.vo.MemberVo;

import lombok.Data;

@Data
public class ProjectVo {

	private String no;
	private String leader;
	private String writer;
	private String title;
	private String content;
	private String enrollDate;
	private String startDate;
	private String endDate;
	private String consentYn;
	private String progress;
	
	private List<MultipartFile> prjfile;
	private List<AttachmentVo> prjfileList;
	
	private List<MemberVo> memberList;
	private List<String> memberNo;
}
