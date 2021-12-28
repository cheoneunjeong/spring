package com.example.spring.domain;

import java.util.List;

public class SAnswer {

	private String a;
	private String t;
	private int q_num;
	private int s_num;
	private int cnt;
	private int sub_num;
	private int ans_num;

	public String getT() {
		return t;
	}
	public void setT(String t) {
		this.t = t;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public int getSub_num() {
		return sub_num;
	}
	public void setSub_num(int sub_num) {
		this.sub_num = sub_num;
	}

	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public int getAns_num() {
		return ans_num;
	}
	public void setAns_num(int ans_num) {
		this.ans_num = ans_num;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}