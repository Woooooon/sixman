package com.kh.sixman.project.vo;

import java.util.List;

import lombok.Data;

@Data
public class TodoVo {

	private String no;
	private String pmNo;
	private String checkboxYn;
	private String todoContent;
	private String deleteYn;
	
	private List<TodoVo> todoList;
}
