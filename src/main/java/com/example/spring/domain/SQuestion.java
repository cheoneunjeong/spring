package com.example.spring.domain;

import java.util.List;

public class SQuestion {

	private List<SAnswer> answers;
	private String q;
	private String t;
	private String q_num;
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
	public String getQ_num() {
		return q_num;
	}
	public void setQ_num(String q_num) {
		this.q_num = q_num;
	}
}
