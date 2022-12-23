package com.kh.sixman.attendance.vo;

import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class AttendanceVo {
	
	private String no;
	private String memberNo;
	private String status;
	private String start;
	private String end;
	private String workTime;

}
