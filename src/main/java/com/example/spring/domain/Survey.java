package com.example.spring.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Survey {

	private String title;
	private String disc;
	private String question;
	private String[] question_;
	private String answer;
	private String[] answer_;
	private int s_num;
	private String writer;
	private String datetime;
	private String filename;
	private List<MultipartFile> file;
	private int hit;
	private int rownum;

	
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
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public List<MultipartFile> getFile() {
		return file;
	}
	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	public String[] getQuestion_() {
		return question_;
	}
	public void setQuestion_(String[] question_) {
		this.question_ = question_;
	}
	public String[] getAnswer_() {
		return answer_;
	}
	public void setAnswer_(String[] answer_) {
		this.answer_ = answer_;
	}
	
	
}