package com.example.spring.domain;

import java.util.List;

public class Submission {

	private int s_num;
	private String title;	
	private String disc;	
	private String writer;	
	private String datetime;	
	private List<SAnswer> answers;
	private int sub_num;
	
	
	
	public List<SAnswer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<SAnswer> answers) {
		this.answers = answers;
	}
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
	public int getSub_num() {
		return sub_num;
	}
	public void setSub_num(int sub_num) {
		this.sub_num = sub_num;
	}
	
	
}