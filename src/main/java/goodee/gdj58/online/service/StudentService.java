package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class StudentService {

	@Autowired private StudentMapper studentMapper;
	//학생 시험 점수
	public int studentTestScore(int studentNo)
	{
		return studentMapper.studentTestScore(studentNo);
	}
	
	//학생 시험 제출답안
	public int studentTestPaper(Paper paper)
	{
		return studentMapper.studentTestPaper(paper);
	}
	
	//학생 문제별 보기 리스트
	public List<Map<String, Object>> getExampleList(int testNo)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		
		return studentMapper.selectExampleList(paramMap);
	}
	//학생 시험 리스트 총 갯수
	public int questionTotalCount(String searchWord)
	{
		return studentMapper.questionTotalCount(searchWord);
	}
	//학생 시험별 문제 리스트
	public List<Map<String,Object>> getQuestionList(int currentPage, int rowPerPage, String searchWord, int testNo)
	{
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("testNo", testNo);
		
		return studentMapper.selectQuestionList(paramMap);
	}
	
	//학생 시험 리스트 총 갯수
	public int testTotalCount(String searchWord)
	{
		return studentMapper.testTotalCount(searchWord);
	}
	
	//학생 시험 리스트
	public List<Map<String,Object>> getTestList(int currentPage, int rowPerPage, String searchWord)
	{
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return studentMapper.selectTestList(paramMap);
	}
	
	//학생 끝난 시험 리스트
	public List<Map<String,Object>> getEndTestList(int currentPage, int rowPerPage, String searchWord)
	{
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return studentMapper.selectEndTestList(paramMap);
	}
	
	//학생 로그인
	public Student login (Student student)
	{
		return studentMapper.login(student);
	}
}
