package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Score;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface StudentMapper {
	
	//학생 비밀번호 변경
	int updateStudentPw(Map<String, Object> paramMap);
	
	//학생 점수 score 테이블에 저장
	int studentAddScore(Score score);
	//학생 시험 점수 계산
	int studentCalScore(Map<String, Object> paramMap);
	//학생 문제 제출 답안
	int studentTestPaper(Paper paper);
	//학생 문제별 보기 리스트
	List<Map<String,Object>> selectExampleList(Map<String, Object> paramMap);
	//학생 시험 총 수
	int questionTotalCount(String searchWord);
	//학생 시험별 문제 리스트
	List<Map<String,Object>> selectQuestionList(Map<String, Object> paramMap);
	//학생 시험 총 수
	int testTotalCount(String searchWord);
	//학생 시험 리스트
	List<Map<String,Object>> selectTestList(int studentNo);
	//학생 끝난시험 리스트
	List<Map<String,Object>> selectEndTestList(int studentNo);
	//학생 로그인
	Student login(Student student);
}
