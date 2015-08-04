package lky.dao.test;

import lky.entity.User;
import lky.service.UserService;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class UserTest {
	private static ApplicationContext ctx;
	private static UserService service;
	@Before
	public void init(){
		ctx = new FileSystemXmlApplicationContext("classpath:spring.xml");
	    service = (UserService)ctx.getBean("userService");
	}
	@Test
	public void create(){
		User user1 = new User();
		user1.setUsername("admin");
		user1.setPassword("123");
		user1.setLocked(false);
		service.createUser(user1);
	}
}
