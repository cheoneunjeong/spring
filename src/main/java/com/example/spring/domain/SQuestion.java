package com.example.spring.domain;

import java.util.List;

public class SQuestion {

	private List<SAnswer> answers;
	private String q;
	private String t;
	private int sub_num;
	private int que_num;
	
	
	public List<SAnswer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<SAnswer> answers) {
		this.answers = answers;
	}
	public String getQ() {
		return q;
	}
	public void setQ(String q) {
		this.q = q;
	}
	public String getT() {
		return t;
	}
	public void setT(String t) {
		this.t = t;
	}
	public int getQue_num() {
		return que_num;
	}
	public void setQue_num(int que_num) {
		this.que_num = que_num;
	}
	public int getSub_num() {
		return sub_num;
	}
	public void setSub_num(int sub_num) {
		this.sub_num = sub_num;
	}

}
