package lky.web.Controller;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.ModelAndView;

public class DefaultExceptionHandler {
	@ExceptionHandler()
	public ModelAndView processUnauthenticatedException(NativeWebRequest request,UnauthorizedException e){
		ModelAndView mv = new ModelAndView();
		mv.addObject("exception",e);
		mv.setViewName("unauthorized");
		return mv;
	}
}	
