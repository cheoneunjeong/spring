package com.example.spring.domain;

import java.util.List;

public class Submission {

	private int s_num;
	private String title;	
	private String disc;	
	private String writer;	
	private String datetime;	
	private List<SQuestion> questions;
	
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDisc() {
		return disc;
	}
	public void setDisc(String disc) {
		this.disc = disc;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public List<SQuestion> getQuestions() {
		return questions;
	}
	public void setQuestions(List<SQuestion> questions) {
		this.questions = questions;
	}
	
}
