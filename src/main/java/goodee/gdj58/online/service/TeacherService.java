package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Teacher;

@Service
@Transactional
public class TeacherService {
	@Autowired private TeacherMapper teacherMapper;
	//로그인 
	public Teacher login (Teacher teacher)
	{
		return teacherMapper.login(teacher);
	}
}
