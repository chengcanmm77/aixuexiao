package lky.dao.test;

import lky.dao.PermissionDao;
import lky.entity.Permission;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;


public class PermissionTest {
	private static ApplicationContext ctx;
	private static PermissionDao test;
	@Before
	public void init(){
		ctx = new FileSystemXmlApplicationContext("classpath:spring.xml");
	    test = (PermissionDao)ctx.getBean("permissionDao");

	}
	@Test
	public void testInsert(){
		Permission permission = new Permission();
		permission.setPermission("user:view");
		permission.setDescription("for test");
		permission.setAvailable(false);
		test.createPermission(permission);
		
	}
	@Test
	public void testDelete(){
		Long id = 1l;
		test.deletePermission(id);
	}
}
