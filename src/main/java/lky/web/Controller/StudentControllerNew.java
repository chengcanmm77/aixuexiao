package lky.web.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.aixuexiao.model.Student;
import com.aixuexiao.service.StudentService;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudentControllerNew {
	public static final int pagesize = 8;
	
	@Resource(name="studentService")
	private StudentService studentService;
	@RequestMapping(value="/manager/students/students",method=RequestMethod.GET)
	public void returnStudent(String pagenum,Student student,Model model){
		int num = 1;
		if(null!=pagenum){
			num = Integer.parseInt(pagenum);
		}
		List<Student> list = studentService.listStudent((num-1)*pagesize, pagesize,student);
		model.addAttribute("data",list);
	}
	@RequestMapping(value="/manager/students/add",method=RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public void InsertStudent(@RequestBody Student student) {
 		studentService.addStudent(student);
	}

	@RequestMapping(value="/manager/students/update",method=RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public void updateStudent(@RequestBody Student student) {
		studentService.updateStudent(student);
	}
	
	@RequestMapping(value="/manager/students/delete",method=RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public void deleteStudent(@RequestParam Integer id) throws Exception {
		if(id==null)throw new Exception("id不能为空");
		studentService.deleteStudentByid(id);
	}
	@ExceptionHandler
	@ResponseBody
	public String exceptionHandler(Exception e){
		return  e.getMessage();
	}
}
