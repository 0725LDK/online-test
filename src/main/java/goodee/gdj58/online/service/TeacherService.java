package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class TeacherService {
	@Autowired private TeacherMapper teacherMapper;
	//강사 보기 수정
	public int updateExample(String exampleTitle, int exampleNo, String exampleOx)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("exampleTitle", exampleTitle);
		paramMap.put("exampleNo", exampleNo);
		paramMap.put("exampleOx", exampleOx);
		return teacherMapper.updateExample(paramMap);
	}
	//강사 문제 수정
	public int updateQuestion(String questionTitle, int questionNo)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("questionTitle", questionTitle);
		paramMap.put("questionNo", questionNo);
		return teacherMapper.updateQuestion(paramMap);
	}
	//강사 시험 수정
	public int updateTest(String testTitle, String testDate, int testNo)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testTitle", testTitle);
		paramMap.put("testDate", testDate);
		paramMap.put("testNo", testNo);
		return teacherMapper.updateTest(paramMap);
	}
	
	//강사 보기 삭제
	public int removeExample(int exampleNo)
	{
		return teacherMapper.deleteExample(exampleNo);
	}	
	//강사 문제 삭제
	public int removeQuestion(int questionNo)
	{
		return teacherMapper.deleteQuestion(questionNo);
	}	
	//강사 시험 삭제
	public int removeTest(int testNo)
	{
		return teacherMapper.deleteTest(testNo);
	}	
	
	//강사 문제별 보기 추가
	public int addExample(Example example)
	{
		return teacherMapper.insertExample(example);
	}
	//강사 시험별 문제 추가
	public int addQuestion(Question question)
	{
		return teacherMapper.insertQuestion(question);
	}
	//강사 시험 추가
	public int addTest(Test test)
	{
		return teacherMapper.insertTest(test);
	}
	
	//강사 문제별 보기 리스트 총 갯수
	public int exampleTotalCount(int questionNo)
	{
		return teacherMapper.exampleTotalCount(questionNo);
	}
	//강사 문제별 보기 리스트
	public List<Example> getExampleList(int questionNo)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("questionNo", questionNo);
		return teacherMapper.selectExampleList(paramMap);
	}
	
	//강사 시험별 문제 리스트 총 갯수
	public int questionTotalCount(int testNo)
	{
		return teacherMapper.questionTotalCount(testNo);
	}
	//강사 시험별 문제 리스트
	public List<Question> getQuestionList(int currentPage, int rowPerPage, String searchWord, int testNo)
	{
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("testNo", testNo);
		
		return teacherMapper.selectQuestionList(paramMap);
	}
	
	//강사 시험 리스트 총 갯수
	public int testTotalCount(String searchWord)
	{
		return teacherMapper.testTotalCount(searchWord);
	}
	
	//강사 시험 리스트
	public List<Test> getTestList(int currentPage, int rowPerPage, String searchWord)
	{
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return teacherMapper.selectTestList(paramMap);
	}
	
	//로그인 
	public Teacher login (Teacher teacher)
	{
		return teacherMapper.login(teacher);
	}
}
