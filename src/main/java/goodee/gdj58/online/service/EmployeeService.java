package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.EmployeeMapper;
import goodee.gdj58.online.mapper.IdMapper;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Service
@Transactional
public class EmployeeService {
	//DI  = new EmployeeMapper()
	@Autowired private EmployeeMapper employeeMapper;
	//학생 삭제
	public int removeStudent(int studentNo)
	{
		return employeeMapper.deleteStudent(studentNo);
	}
	//학생 추가
	public int addStudent(Student student)
	{
		return employeeMapper.insertStudent(student);
	}
	//학생 리스트 총 갯수
	public int studentTotalCount()
	{
		return employeeMapper.studentTotalCount();
	}
	//학생 리스트
	public List<Student> getStudentList(int currentPage, int rowPerPage)
	{
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		return employeeMapper.selectStudentList(paramMap);
	}
	
	//강사 삭제
	public int removeTeacher(int teacherNo)
	{
		return employeeMapper.deleteTeacher(teacherNo);
	}
	
	//강사 추가
	public int addTeacher(Teacher teacher)
	{
		return employeeMapper.insertTeacher(teacher);
	}
	
	//강사 리스트 총 갯수
	public int teacherTotalCount()
	{
		return employeeMapper.teacherTotalCount();
	}
	
	//강사 리스트
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage)
	{
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		return employeeMapper.selectTeacherList(paramMap);
	}
	
	//직원 비밀번호 변경
	public int updateEmployeePw(int empNo, String oldPw, String newPw)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("empNo", empNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		return employeeMapper.updateEmployeePw(paramMap);
	}
	
	//로그인 
	public Employee login (Employee emp)
	{
		return employeeMapper.login(emp);
	}
	
	//직원 삭제
	public int removeEmployee(int empNo)
	{
		return employeeMapper.deleteEmployee(empNo);
	}
	
	//직원 추가
	public int addEmployee(Employee employee)
	{
		return employeeMapper.insertEmployee(employee);
	}
	
	//직원 리스트 총 갯수
	public int empTotalCount()
	{
		return employeeMapper.empTotalCount();
	}
	
	//직원 리스트
	public List<Employee> getEmployeeList(int currentPage, int rowPerPage)
	{
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		return employeeMapper.selectEmployeeList(paramMap);
	}
	
}
