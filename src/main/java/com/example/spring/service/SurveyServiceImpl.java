package com.example.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spring.domain.Answer;
import com.example.spring.domain.Question;
<<<<<<< HEAD
import com.example.spring.domain.SAnswer;
import com.example.spring.domain.Submission;
=======
>>>>>>> parent of ca29ac2 (finish regSubmission)
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
	public void regAnswer(Question q) {
		surveymaper.regAnswer(q);
		
	}

	@Override
	public void regAnswer(Survey survey) {
		surveymaper.regAnswer(survey);
	}

	@Override
	public void regQuestion(Question q) {
		surveymaper.regQuestion(q);
		
	}

	@Override
	public void regAnswer(Answer a) {
		surveymaper.regAnswer(a);
		
	}

	@Override
	public Survey getsurveyDetail(int s_num) {
		return surveymaper.getsurveyDetail(s_num);
	}

	@Override
	public List<Question> getquestionDetailR(int s_num, int count) {
		return surveymaper.getquestionDetailR(s_num,count);
	}

	@Override
	public List<Answer> getanswerDetail(int q_num) {
		return surveymaper.getanswerDetail(q_num);
	}

	@Override
	public void deleteSurvey(int delid) {
		surveymaper.deleteQuestion(delid);
		surveymaper.deleteSurvey(delid);
		
	}

	@Override
	public void deleteAnswer(int q) {
		surveymaper.deleteAnswser(q);
		
	}

	@Override
	public int getquestionCount(int s_num) {
		return surveymaper.getquestionCount(s_num);
	}

	@Override
	public List<Question> getquestionDetail(int s_num) {
		return surveymaper.getquestionDetail(s_num);
	}

<<<<<<< HEAD
	@Override
	public void regSubmission(Submission submission) {
		surveymaper.regSubmission(submission);
		
	}

	@Override
	public void regSAnswer(SAnswer a) {
		surveymaper.regSAnswer(a);
		
	}
=======

>>>>>>> parent of ca29ac2 (finish regSubmission)

}
