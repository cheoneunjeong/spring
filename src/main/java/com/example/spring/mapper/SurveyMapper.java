package com.example.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.spring.domain.Answer;
import com.example.spring.domain.Question;
import com.example.spring.domain.Survey;

@Mapper
public interface SurveyMapper {

	public List<Survey> getsurveylist(int page);

	public int getPostCount();

	public List<Survey> search_t(@Param("s") String s, @Param("page") int page);

	public List<Survey> search_w(@Param("s") String s, @Param("page") int page);

	public int SearchPostCount_t(String s);

	public int SearchPostCount_w(String s);

	public void regSurvey(Survey survey);

	public void regQuestion(Survey survey);

	public void regAnswer(Question q);

	public void regAnswer(Survey survey);

	public void regQuestion(Question q);

	public void regAnswer(Answer a);

	public Survey getsurveyDetail(int s_num);

	public List<Question> getquestionDetailR(@Param("s_num") int s_num, @Param("count") int count);

	public List<Answer> getanswerDetail(int q_num);

	public void deleteSurvey(int delid);

	public void deleteQuestion(int delid);

	public void deleteAnswser(int q);

	public int getquestionCount(int s_num);

	public List<Question> getquestionDetail(int s_num);
}
