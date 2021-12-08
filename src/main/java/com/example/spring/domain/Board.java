package com.example.spring.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Board {
	private int bId;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private String bDateTime;
	private Timestamp bDate_timestamp;
	
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbDateTime() {
		return bDateTime;
	}
	public void setbDateTime(String bDateTime) {
		this.bDateTime = bDateTime;
	}
	
	public Timestamp getBDate_timestamp() {
		return bDate_timestamp;
	}

	public void setBDate_timestamp(Timestamp bDate_timestamp) {
		this.bDate_timestamp = bDate_timestamp;
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd \n hh:mm:ss");
		this.bDateTime = fm.format(bDate_timestamp); 
	}
}
