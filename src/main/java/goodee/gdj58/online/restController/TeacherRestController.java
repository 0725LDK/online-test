package goodee.gdj58.online.restController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.AvgScore;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@CrossOrigin
public class TeacherRestController {
	@Autowired TeacherService teacherService;
	
	@GetMapping("/teacher/teacherTestAvgScore")
	public Map<String, Integer> getTestAvgScore()
	{
		List<AvgScore> avgList = teacherService.getTestAvgScore();
		Map<String, Integer> testAvg = new TreeMap<>();
		
		for(int i=0; i<avgList.size(); i++)
		{
			avgList.get(i);
			log.debug(avgList.get(i).getTestTitle()+"<----------");
			log.debug(avgList.get(i).getAvgScore()+"<----------");
		}
		for (AvgScore a : avgList) {
	
			testAvg.put(a.getTestTitle(),(int)(a.getAvgScore()));
		}
	
		return testAvg;
	}
}
