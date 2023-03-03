package goodee.gdj58.online.controller;

import java.awt.Dialog.ModalExclusionType;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.AvgScore;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeacherController {

	@Autowired TeacherService teacherService;
	
	//pw 수정 폼
	@GetMapping("/teacher/modifyTeacherPw")
	public String modifyTeacherPw()
	{
		
		return "teacher/teacherModifyPw";
	}
	//pw 수정 액션
	@PostMapping("/teacher/modifyTeacherPw")
	public String modifyTeacherPw(HttpSession session, @RequestParam(value = "oldPw") String oldPw, @RequestParam(value = "newPw") String newPw)
	{
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		
		int row = teacherService.updateTeacherPw(loginTeacher.getTeacherNo() , oldPw, newPw);
		if(row==0)
		{
			return "teacher/teacherModifyPw";
		}
		return "redirect:/teacher/teacherTestList";
	}
	
	//강사 보기 수정 폼
	@GetMapping("/teacher/teacherModifyExample")
	public String modifyExample(HttpSession session, Model model, @RequestParam(value = "exampleTitle") String exampleTitle
			, @RequestParam(value = "exampleNo") int exampleNo
			, @RequestParam(value = "questionNo") int questionNo
			, @RequestParam(value = "testNo") int testNo
			, @RequestParam(value = "exampleIdx") int exampleIdx
			)
	{
		model.addAttribute("exampleTitle",exampleTitle);
		model.addAttribute("exampleNo",exampleNo);
		model.addAttribute("questionNo",questionNo);
		model.addAttribute("testNo",testNo);
		model.addAttribute("exampleIdx",exampleIdx);
		return "teacher/teacherModifyExampleForm";
	}
	//강사 보기 수정 액션
	@PostMapping("/teacher/teacherModifyExample")
	public String modifyExample(HttpSession session, @RequestParam(value = "exampleTitle") String exampleTitle
			, @RequestParam(value = "exampleNo") int exampleNo
			, @RequestParam(value = "questionNo") int questionNo
			, @RequestParam(value = "testNo") int testNo
			, @RequestParam(value = "exampleOx") String exampleOx
			)
	{
		
		teacherService.updateExample(exampleTitle,exampleNo,exampleOx);
		return "redirect:/teacher/teacherExampleList?questionNo="+questionNo+"&testNo="+testNo;
	}
	//강사 문제 수정 폼
	@GetMapping("/teacher/teacherModifyQuestion")
	public String modifyQuestion(HttpSession session, Model model, @RequestParam(value = "questionTitle") String questionTitle
			, @RequestParam(value = "questionNo") int questionNo
			, @RequestParam(value = "testNo") int testNo
			)
	{
		model.addAttribute("questionTitle",questionTitle);
		model.addAttribute("questionNo",questionNo);
		model.addAttribute("testNo",testNo);
		return "teacher/teacherModifyQuestionForm";
	}
	//강사 문제 수정 액션
	@PostMapping("/teacher/teacherModifyQuestion")
	public String modifyQuestion(HttpSession session, @RequestParam(value = "questionTitle") String questionTitle
			, @RequestParam(value = "questionNo") int questionNo
			, @RequestParam(value = "testNo") int testNo
			)
	{
		
		teacherService.updateQuestion(questionTitle,questionNo);
		return "redirect:/teacher/teacherQuestionList?testNo="+testNo;
	}
	//강사 시험 수정 폼
	@GetMapping("/teacher/teacherModifyTest")
	public String modifyTest(HttpSession session, Model model, @RequestParam(value = "testTitle") String testTitle
			 , @RequestParam(value = "testDate") String testDate
			 , @RequestParam(value = "testNo") int testNo)
	{
		model.addAttribute("testTitle",testTitle);
		model.addAttribute("testDate",testDate);
		model.addAttribute("testNo",testNo);
		return "teacher/teacherModifyTestForm";
	}
	//강사 시험 수정 액션
	@PostMapping("/teacher/teacherModifyTest")
	public String modifyTest(HttpSession session, @RequestParam(value = "testTitle") String testTitle
												 , @RequestParam(value = "testDate") String testDate
												 , @RequestParam(value = "testNo") int testNo
												 )
	{
		
		teacherService.updateTest(testTitle,testDate,testNo);
		return "redirect:/teacher/teacherTestList";
	}
	//강사 보기 삭제
	@GetMapping("/teacher/removeExample")
	public String removeExample(HttpSession session, @RequestParam("exampleNo") int exampleNo
												   , @RequestParam("questionNo") int questionNo
												   , @RequestParam("testNo") int testNo
												   )
	{
		teacherService.removeExample(exampleNo);
		return "redirect:/teacher/teacherExampleList?questionNo="+questionNo+"&testNo="+testNo;
	}
	//강사 문제 삭제
	@GetMapping("/teacher/removeQuestion")
	public String removeQuestion(HttpSession session, @RequestParam("questionNo") int questionNo, int testNo)
	{
		teacherService.removeQuestion(questionNo);
		return "redirect:/teacher/teacherQuestionList?testNo="+testNo;
	}
	//강사 시험 삭제
	@GetMapping("/teacher/removeTest")
	public String removeTest(HttpSession session, @RequestParam("testNo") int testNo)
	{
		teacherService.removeTest(testNo);
		return "redirect:/teacher/teacherTestList";
	}
		
	
	//강사 문제별 보기 입력 액션
	@PostMapping("/teacher/addExample")
	public String addExample(HttpSession session,Model model, Example example
												,@RequestParam(value = "questionNo") int questionNo
												,@RequestParam(value = "testNo") int testNo
												)
	{
		//로그인 안되어있다면
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		if(loginTeacher == null)
		{
			return "redirect:/teacher/loginTeacher";
		}
		
		System.out.println(questionNo+"<---teacherController questionNo");
		int row = teacherService.addExample(example);
		
		if(row == 0)
		{
			model.addAttribute("errorMsg", "실패");
			return "redirect:/teacher/teacherExampleList?questionNo="+questionNo;
		}
		//row == 1 이면 입력 성공
		return "redirect:/teacher/teacherExampleList?questionNo="+questionNo+"&testNo="+testNo; //sendRedirect  CM -> C
	}
	//강사 시험별 문제 입력 액션
	@PostMapping("/teacher/addQuestion")
	public String addQuestion(HttpSession session,Model model, Question question, int testNo)
	{
		//로그인 안되어있다면
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		if(loginTeacher == null)
		{
			return "redirect:/teacher/loginTeacher";
		}
		
		int row = teacherService.addQuestion(question);
		int questionTotal = teacherService.questionTotalCount(testNo);
		if(row == 0)
		{
			model.addAttribute("errorMsg", "실패");
			return "teacher/teacherQuestionList";
		}
		//row == 1 이면 입력 성공
		return "redirect:/teacher/teacherQuestionList?testNo="+testNo; //sendRedirect  CM -> C
	}
	//강사 시험 입력 액션
	@PostMapping("/teacher/addTest")
	public String addTest(HttpSession session,Model model, Test test)
	{
		//로그인 안되어있다면
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		if(loginTeacher == null)
		{
			return "redirect:/teacher/loginTeacher";
		}
		
		int row = teacherService.addTest(test);
	
		if(row == 0)
		{
			model.addAttribute("errorMsg", "실패");
			return "teacher/teacherTestList";
		}
		//row == 1 이면 입력 성공
		return "redirect:/teacher/teacherTestList"; //sendRedirect  CM -> C
	}

	
	//강사 문제별 보기 리스트
	@GetMapping("/teacher/teacherExampleList")
	public String exampleList(HttpSession session, Model model
			,@RequestParam(value = "questionNo", defaultValue = "") int questionNo
			,@RequestParam(value = "testNo", defaultValue = "") int testNo
			)//int currentPage = Integer.parseInt(request.getParamenter("currentPage"));
	{
		int exampleCount = teacherService.exampleTotalCount(questionNo);
		List<Example> list = teacherService.getExampleList(questionNo);
		//request.setAttribute("list", list);
		model.addAttribute("list",list);
		model.addAttribute("questionNo",questionNo);
		model.addAttribute("testNo",testNo);
		model.addAttribute("exampleCount",exampleCount);
		return "teacher/teacherExampleList";
	}
	
	//강사 시험별 문제 리스트
	@GetMapping("/teacher/teacherQuestionList")
	
	public String questionList(HttpSession session, Model model, 
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord,
			@RequestParam(value = "testNo", defaultValue = "") int testNo
			)//int currentPage = Integer.parseInt(request.getParamenter("currentPage"));
	{
		
		log.debug(searchWord+"<---searchWord");
		
		
		List<Question> list = teacherService.getQuestionList(currentPage,rowPerPage,searchWord,testNo);
		int questionTotalCount = teacherService.questionTotalCount(testNo);
		//request.setAttribute("list", list);
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("testNo",testNo);
		model.addAttribute("questionTotalCount",questionTotalCount);
		return "teacher/teacherQuestionList";
	}
	//강사 시험 리스트
	@GetMapping("/teacher/teacherTestList")

	public String testList(HttpSession session1, Model model, 
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord
				   )//int currentPage = Integer.parseInt(request.getParamenter("currentPage"));
		{
		
		log.debug(searchWord+"<---searchWord");
		
		int testTotalCount = teacherService.testTotalCount(searchWord);
		int endPage = (int)(Math.ceil(currentPage / 10.0)) * 10; //페이징 버튼의 끝
		int startPage = endPage - 9; //페이징 버튼의 시작
		int firstPage = 1;
		int lastPage = (int)(Math.ceil(testTotalCount * 1.0/rowPerPage));
		if(lastPage < endPage )
		{
		endPage = lastPage;
		}
		
		List<Test> list = teacherService.getTestList(currentPage,rowPerPage,searchWord);
		//request.setAttribute("list", list);
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("searchWord",searchWord);
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
