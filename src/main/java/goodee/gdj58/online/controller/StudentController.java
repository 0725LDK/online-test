package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	
	//학생 시험별 문제 리스트
	@GetMapping("/student/studentQuestionList")
	
	public String questionList(HttpSession session, Model model, 
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord,
			@RequestParam(value = "testNo", defaultValue = "") int testNo
			)//int currentPage = Integer.parseInt(request.getParamenter("currentPage"));
	{
		
		log.debug(searchWord+"<---searchWord");
		
		int questionTotalCount = studentService.questionTotalCount(searchWord);
		int endPage = (int)(Math.ceil(currentPage / 10.0)) * 10; //페이징 버튼의 끝
		int startPage = endPage - 9; //페이징 버튼의 시작
		int firstPage = 1;
		int lastPage = (int)(Math.ceil(questionTotalCount * 1.0/rowPerPage));
		if(lastPage < endPage )
		{
			endPage = lastPage;
		}
		
		List<Map<String,Object>> list = studentService.getQuestionList(currentPage,rowPerPage,searchWord,testNo);
		List<Map<String, Object>> exampleList = studentService.getExampleList(testNo);
		//request.setAttribute("list", list);
		model.addAttribute("list",list);
		model.addAttribute("exampleList",exampleList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("testNo",testNo);
		model.addAttribute("questionTotalCount",questionTotalCount);
		return "student/studentQuestionList";
	}

	//학생 시험 리스트
	@GetMapping("/student/studentTestList")
	public String testList(HttpSession session1, Model model, 
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord
				   )//int currentPage = Integer.parseInt(request.getParamenter("currentPage"));
		{
		
		log.debug(searchWord+"<---searchWord");
		
		int testTotalCount = studentService.testTotalCount(searchWord);
		int endPage = (int)(Math.ceil(currentPage / 10.0)) * 10; //페이징 버튼의 끝
		int startPage = endPage - 9; //페이징 버튼의 시작
		int firstPage = 1;
		int lastPage = (int)(Math.ceil(testTotalCount * 1.0/rowPerPage));
		if(lastPage < endPage )
		{
		endPage = lastPage;
		}
		
		
		List<Test> list = studentService.getTestList(currentPage,rowPerPage,searchWord);
		//request.setAttribute("list", list);
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("searchWord",searchWord);
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
