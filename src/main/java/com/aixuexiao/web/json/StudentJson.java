package com.aixuexiao.web.json;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aixuexiao.model.Student;
import com.aixuexiao.service.StudentService;

@Controller
public class StudentJson {
	public static final int pagesize = 8;
	
	@Resource(name="studentService")
	private StudentService studentService;
	@RequestMapping(value="/manager/students/json",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,List<Student>> returnStudent(String pagenum,Student student){
		int num = 1;
		if(null!=pagenum){
			num = Integer.parseInt(pagenum);
		}
		List<Student> list = studentService.listStudent((num-1)*pagesize, pagesize,student);
		Map<String,List<Student>> resultMap = new HashMap<String, List<Student>>();
		resultMap.put("data", list);
		return resultMap;
	}
}
