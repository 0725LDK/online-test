package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Mapper
public interface EmployeeMapper {
	
	
	//학생 삭제
	int deleteStudent(int studentNo);
	//학생 추가
	int insertStudent(Student student);
	//학생 총 수
	int studentTotalCount(String searchWord);
	//학생 리스트
	List<Student> selectStudentList(Map<String, Object> paramMap);
	
	//직원 삭제
	int deleteTeacher(int teacherNo);
	//직원 추가
	int insertTeacher(Teacher teacher);
	//강사 총 수
	int teacherTotalCount(String searchWord);
	//강사 리스트
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
	
	//직원 비밀번호 변경
	int updateEmployeePw(Map<String, Object> paramMap);
	//직원 로그인
	Employee login(Employee employee);
	//직원 삭제
	int deleteEmployee(int empNo);
	//직원 추가
	int insertEmployee(Employee employee);
	//직원 총 수
	int empTotalCount(String searchWord);
	//직원리스트
	List<Employee> selectEmployeeList(Map<String, Object> paramMap);
	
	
	
}
