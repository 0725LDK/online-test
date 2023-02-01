package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Controller
public class EmployeeController {
	
	@Autowired EmployeeService employeeService;
	@Autowired IdService idService;
	
	//학생 삭제
	@GetMapping("/student/removeStudent")
	public String removeStudent(HttpSession session, @RequestParam("studentNo") int studentNo)
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		
		employeeService.removeStudent(studentNo);
		return "redirect:/student/studentList";
	}
	
	//학생 입력 폼
	@GetMapping("/student/addStudent")
	public String addStudent(HttpSession session)
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		return "student/addStudent"; //forword
	}
	//학생 입력 액션
	@PostMapping("/student/addStudent")
	public String addStudent(HttpSession session,Model model, Student student)
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		
		String idCheck = idService.getIdCheck(student.getStudentId());
		if(idCheck != null)
		{
			model.addAttribute("errorMsg", "중복된 ID");
			return "student/addStudent";
		}
		
		int row = employeeService.addStudent(student);
		
		if(row == 0)
		{
			model.addAttribute("errorMsg", "실패");
			return "student/addStudent";
		}
		//row == 1 이면 입력 성공
		return "redirect:/student/studentList"; //sendRedirect  CM -> C
	}

	
	//학생 리스트
	@GetMapping("/student/studentList")
	public String studentList(HttpSession session, Model model, 
								@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage
									   )//int currentPage = Integer.parseInt(request.getParamenter("currentPage"));
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		int empTotalCount = employeeService.studentTotalCount();
		int lastPage = empTotalCount / rowPerPage;
		if(empTotalCount % rowPerPage != 0)
		{
			lastPage = lastPage +1;
		}
		List<Student> list = employeeService.getStudentList(currentPage, rowPerPage);
		//request.setAttribute("list", list);
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		return "student/studentList";
	}
	
	//강사 삭제
	@GetMapping("/teacher/removeTeacher")
	public String removeTeacher(HttpSession session, @RequestParam("teacherNo") int teacherNo)
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		
		employeeService.removeTeacher(teacherNo);
		return "redirect:/teacher/teacherList";
	}
	
	//강사 입력 폼
	@GetMapping("/teacher/addTeacher")
	public String addTeacher(HttpSession session)
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		return "teacher/addTeacher"; //forword
	}
	//강사 입력 액션
	@PostMapping("/teacher/addTeacher")
	public String addTeacher(HttpSession session,Model model, Teacher teacher)
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null)
		{
			model.addAttribute("errorMsg", "중복된 ID");
			return "teacher/addTeacher";
		}
		
		int row = employeeService.addTeacher(teacher);
		
		if(row == 0)
		{
			model.addAttribute("errorMsg", "실패");
			return "teacher/addTeacher";
		}
		//row == 1 이면 입력 성공
		return "redirect:/teacher/teacherList"; //sendRedirect  CM -> C
	}

	//강사 리스트
	@GetMapping("/teacher/teacherList")
	public String teacherList(HttpSession session, Model model, 
								@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage
									   )//int currentPage = Integer.parseInt(request.getParamenter("currentPage"));
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		int empTotalCount = employeeService.teacherTotalCount();
		int lastPage = empTotalCount / rowPerPage;
		if(empTotalCount % rowPerPage != 0)
		{
			lastPage = lastPage +1;
		}
		List<Teacher> list = employeeService.getTeacherList(currentPage, rowPerPage);
		//request.setAttribute("list", list);
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		return "teacher/teacherList";
	}

	//pw 수정 폼
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session)
	{
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		return "employee/modifyEmpPw";
	}
	//pw 수정 액션
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session, @RequestParam(value = "oldPw") String oldPw, @RequestParam(value = "newPw") String newPw)
	{
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		employeeService.updateEmployeePw(loginEmp.getEmpNo() , oldPw, newPw);
		return "redirect:/employee/empList";
	}
	
	
	//로그인 폼
	@GetMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session)//세션이 필요하면 매개변수로 세션을 받자
	{
		//이미 로그인 중이면 return "redirect:/employee/empList";
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp != null)
		{
			return "redirect:/employee/empList";
		}
		//로그인 중이 아니면
		return "employee/loginEmp";
	}
	//로그인 액션
	@PostMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session, Employee emp)
	{
		Employee resultEmp =  employeeService.login(emp);
		if(resultEmp == null)//로그인 실패
		{
			return "redirect:/employee/loginEmp";
		}
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/employee/empList";
	}
	//로그아웃 액션
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) 
	{
		session.invalidate();
		return "redirect:/employee/loginEmp";
	}
	
	
	//직원 삭제
	@GetMapping("/employee/removeEmp")
	public String removeEmp(HttpSession session, @RequestParam("empNo") int empNo)
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		
		employeeService.removeEmployee(empNo);
		return "redirect:/employee/empList";
	}
	
	
	//직원 입력 폼
	@GetMapping("/employee/addEmp")
	public String addEmp(HttpSession session)
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		return "employee/addEmp"; //forword
	}
	//직원 입력 액션
	@PostMapping("/employee/addEmp")
	public String addEmp(HttpSession session,Model model, Employee employee)
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		
		String idCheck = idService.getIdCheck(employee.getEmpId());
		if(idCheck != null)
		{
			model.addAttribute("errorMsg", "중복된 ID");
			return "employee/addEmp";
		}
		
		int row = employeeService.addEmployee(employee);
		
		if(row == 0)
		{
			model.addAttribute("errorMsg", "실패");
			return "employee/addEmp";
		}
		//row == 1 이면 입력 성공
		return "redirect:/employee/empList"; //sendRedirect  CM -> C
	}
	
	
	//직원 리스트
	@GetMapping("/employee/empList")
	public String empList(HttpSession session, Model model, 
								@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage
									   )//int currentPage = Integer.parseInt(request.getParamenter("currentPage"));
	{
		//로그인 안되어있다면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null)
		{
			return "redirect:/employee/loginEmp";
		}
		int empTotalCount = employeeService.empTotalCount();
		int lastPage = empTotalCount / rowPerPage;
		if(empTotalCount % rowPerPage != 0)
		{
			lastPage = lastPage +1;
		}
		List<Employee> list = employeeService.getEmployeeList(currentPage,rowPerPage);
		//request.setAttribute("list", list);
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		return "employee/empList";
	}
}
