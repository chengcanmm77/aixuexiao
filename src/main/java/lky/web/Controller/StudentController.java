package lky.web.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.aixuexiao.model.Student;
import com.aixuexiao.service.StudentService;

@Controller("lky_student")
public class StudentController {
	public static final int pagesize = 8;
	
	@Resource(name="studentService")
	private StudentService studentService;
	@RequestMapping(value="/manager/students/json",method=RequestMethod.GET)
	@ResponseBody public Map<String,List<Student>> returnStudent(String pagenum,Student student){
		int num = 1;
		if(null!=pagenum){
			num = Integer.parseInt(pagenum);
		}
		List<Student> list = studentService.listStudent((num-1)*pagesize, pagesize,student);
		Map<String,List<Student>> resultMap = new HashMap<String, List<Student>>();
		resultMap.put("data", list);
		return resultMap;
	}
	@RequestMapping(value="/manager/students/add",method=RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public void InsertStudent(@RequestBody Student student) {
		studentService.addStudent(student);
	}
	
}
