package lky.web.Controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@RequestMapping(value="/login")
	public String showLoginForm(HttpServletRequest req, Model model){
		String exceptionClassName = (String)req.getAttribute("shiroLoginFailure");
		String error = null;
		if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
			error="用户名/密码错误";
		}else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
			error="用户名/密码错误";
		}else {
			error="其它错误:"+exceptionClassName;
		}
		model.addAttribute("error", error);
		return "login";
	}
}