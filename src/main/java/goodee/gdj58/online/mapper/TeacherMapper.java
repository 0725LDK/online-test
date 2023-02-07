package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface TeacherMapper {
	
	//강사 보기 수정
	int updateExample(Map<String, Object> paramMap);
	//강사 문제 수정
	int updateQuestion(Map<String, Object> paramMap);
	//강사 시험 수정
	int updateTest(Map<String, Object> paramMap);
	
	//강사 보기 삭제
	int deleteExample(int exampleNo);
	//강사 문제 삭제
	int deleteQuestion(int questionNo);
	//강사 시험 삭제
	int deleteTest(int testNo);
	//강사 문제별 보기 추가
	int insertExample(Example example);
	//강사 시험별 문제 추가
	int insertQuestion(Question question);
	//강사 시험 추가
	int insertTest(Test test);
	
	//강사 문제별 보기 총 수
	int exampleTotalCount(int questionNo);
	//강사 문제별 보기 리스트
	List<Example> selectExampleList(Map<String, Object> paramMap);
	//강사 시험별 문제 총 수
	int questionTotalCount(String searchWord, int testNo);
	//강사 시험별 문제 리스트
	List<Question> selectQuestionList(Map<String, Object> paramMap);
	//강사 시험 총 수
	int testTotalCount(String searchWord);
	//강사 시험 리스트
	List<Test> selectTestList(Map<String, Object> paramMap);
	//강사 로그인
	Teacher login(Teacher teacher);
}
