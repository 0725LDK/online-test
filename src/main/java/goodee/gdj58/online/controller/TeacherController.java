package goodee.gdj58.online.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeacherController {

	@Autowired TeacherService teacherService;
	
	//강사 시험 리스트
	@GetMapping("/teacher/teacherTestList")
	public String testList(HttpSession session)
	{
		return "teacher/teacherTestList";
	}
	
	//로그인 폼
	@GetMapping("/loginTeacher")
	public String loginTeacher(HttpSession session)//세션이 필요하면 매개변수로 세션을 받자
	{
		
		return "teacher/loginTeacher";
	}
	//로그인 액션
	@PostMapping("/loginTeacher")
	public String loginTeacher(HttpSession session, Teacher teacher)
	{
		Teacher resultTeacher =  teacherService.login(teacher);
		
		session.setAttribute("loginTeacher", resultTeacher);
		return "redirect:/teacher/teacherTestList";
	}
	//로그아웃 액션
	@GetMapping("/teacher/logout")
	public String logout(HttpSession session) 
	{
		session.invalidate();
		return "redirect:/employee/loginEmp";
	}

}
