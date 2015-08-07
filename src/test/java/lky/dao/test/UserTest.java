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
		ctx = new FileSystemXmlApplicationContext("classpath:test-spring-transaction.xml");
	    service = (UserService)ctx.getBean("userService");
	}
	@Test
	public void create(){
		User user1 = new User();
		user1.setUsername("test");
		user1.setPassword("123");
		user1.setLocked(false);
		service.createUser(user1);
	}
	public static void main(String[] args) {
		ctx = new FileSystemXmlApplicationContext("classpath:test-spring-transaction.xml");
	    service = (UserService)ctx.getBean("userService");
		User user1 = new User();
		user1.setUsername("op");
		user1.setPassword("123");
		user1.setLocked(false);
		service.createAndUpdate(user1);
	}
}
