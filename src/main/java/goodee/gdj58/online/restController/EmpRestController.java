package goodee.gdj58.online.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.service.EmployeeService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
@CrossOrigin
public class EmpRestController {
	@Autowired EmployeeService employeeService;
	
	//학생 ID 중복 체크
	@GetMapping("/employee/student/studentIdck")
	public String studentIdck(@RequestParam(value = "studentId") String studentId)
	{
		log.debug(studentId+"<------studentId");
		return employeeService.getStudentId(studentId);
	}
	//강사 ID 중복 체크
	@GetMapping("/employee/teacher/teacherIdck")
	public String teacherIdck(@RequestParam(value = "teacherId") String teacherId)
	{
		log.debug(teacherId+"<------teacherId");
		return employeeService.getTeacherId(teacherId);
	}
	//직원 ID 중복 체크
	@GetMapping("/employee/empIdck")
	public String empIdck(@RequestParam(value = "empId") String empId)
	{
		log.debug(empId+"<------empId");
		return employeeService.getEmployeeId(empId);
	}
}
