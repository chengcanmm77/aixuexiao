package lky.entity;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public Boolean getLocked() {
		return locked;
	}
	public void setLocked(Boolean locked) {
		this.locked = locked;
	}
	private Long id;
	@NotNull  @Length(min = 3)
	private String username;
	@NotNull
	private String password;
	private Date birthday;
	private String salt;
	private Boolean locked = Boolean.FALSE;
	public User(){}
	public User(String username,String password){
		this.username = username;
		this.password = password;
	}
	public String getCredentialsSalt() {
        return username + salt;
    }
	@Override
	public boolean equals(Object obj) {
		if(this==obj)return true;
		if(getClass()!=obj.getClass())return false;
		User u = (User)obj;
		if (id!=null?!id.equals(u.getId()):id!=null) {
			return false;
		}
		return true;
		
		
	}

	public Date getBirthday() {
		return birthday;
	}
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
}