package lky.web.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import lky.entity.User;
import lky.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	@RequestMapping(value="/")
	public String index(){
		return "redirect:/manager/students";
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String showLoginForm(){
		return "login";
	}
	@Resource
	UserService userService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(HttpServletRequest req, Model model){
		String exceptionClassName = (String)req.getAttribute("shiroLoginFailure");
		String error = null;
		if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
			error="用户名/密码错误";
		}else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
			error="用户名/密码错误";
		}else if(exceptionClassName!=null){
			error="其它错误:"+exceptionClassName;
		}
		if(error==null){
			return "redirect:/manager/students";
		}else {
			return "login";
		}
		
	}
	@RequestMapping(value="/logout")
	public String logout(){
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "login";
	}

	@RequestMapping(value="/register")
	public String register(@Valid @ModelAttribute User user){
		userService.createUser(user);
		return "login";
	}
}