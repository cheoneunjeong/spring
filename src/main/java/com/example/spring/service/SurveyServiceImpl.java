package com.example.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spring.domain.Answer;
import com.example.spring.domain.Question;
import com.example.spring.domain.Survey;
import com.example.spring.mapper.SurveyMapper;

@Service("SurveyServiceImpl")
public class SurveyServiceImpl implements SurveyService {

	@Autowired SurveyMapper surveymaper;

	@Override
	public List<Survey> getsurveylist(int page) {
		return surveymaper.getsurveylist(page);
	}

	@Override
	public int getPostCount() {
		return surveymaper.getPostCount();
	}

	@Override
	public List<Survey> search_t(String s, int page) {
		return surveymaper.search_t(s, page);
	}

	@Override
	public List<Survey> search_w(String s, int page) {
		return surveymaper.search_w(s, page);
	}

	@Override
	public int SearchPostCount_t(String s) {
		return surveymaper.SearchPostCount_t(s);
	}

	@Override
	public int SearchPostCount_w(String s) {
		return surveymaper.SearchPostCount_w(s);
	}

	@Override
	public void regSurvey(Survey survey) {
		surveymaper.regSurvey(survey);
		
	}

	@Override
	public void regQuestion(Survey survey) {
		surveymaper.regQuestion(survey);
		
	}

	@Override
	public void regAnswer(Survey survey) {
		surveymaper.regAnswer(survey);
		
	}



}
