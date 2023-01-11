package com.kh.sixman.project.vo;

import java.util.List;

import lombok.Data;

@Data
public class TodoVo {

	private String no;
	private String pmNo;
	private String name;
	private String title;
	private String[] content;
	private String checkboxYn;
	private String deleteYn;
	
	private List<TodoVo> todoList;
}
