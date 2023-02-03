package goodee.gdj58.online.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	
	//학생 시험 리스트
	@GetMapping("/student/studentTestList")
	public String testList(HttpSession session)
	{
		return "student/studentTestList";
	}
	
	//로그인 폼
	@GetMapping("/loginStudent")
	public String loginStudent(HttpSession session)//세션이 필요하면 매개변수로 세션을 받자
	{
		
		return "student/loginStudent";
	}
	//로그인 액션
	@PostMapping("/loginStudent")
	public String loginStudent(HttpSession session, Student student)
	{
		Student resultStudent = studentService.login(student);
		
		session.setAttribute("loginStudent", resultStudent);
		return "redirect:/student/studentTestList";
	}
	//로그아웃 액션
	@GetMapping("/student/logout")
	public String logout(HttpSession session) 
	{
		session.invalidate();
		return "redirect:/employee/loginEmp";
	}

}
