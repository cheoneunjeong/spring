package com.example.spring.service;

import java.util.List;

import com.example.spring.domain.Answer;
import com.example.spring.domain.Question;
import com.example.spring.domain.Survey;

public interface SurveyService {

	public List<Survey> getsurveylist(int page);

	public int getPostCount();

	public List<Survey> search_t(String s, int page);

	public List<Survey> search_w(String s, int page);

	public int SearchPostCount_t(String s);

	public int SearchPostCount_w(String s);

	public void regSurvey(Survey survey);

	public void regQuestion(Survey survey);

	public void regAnswer(Survey survey);
}
