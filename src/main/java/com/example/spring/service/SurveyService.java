package com.example.spring.service;

import java.util.List;

import com.example.spring.domain.Survey;

public interface SurveyService {

	public List<Survey> getsurveylist(int page);

	public int getPostCount();

	public List<Survey> search_t(String s, int page);

	public List<Survey> search_w(String s, int page);

	public int SearchPostCount_t(String s);

	public int SearchPostCount_w(String s);

	public void reg(Survey survey);
}
