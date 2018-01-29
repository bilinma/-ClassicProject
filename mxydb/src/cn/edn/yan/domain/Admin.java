package cn.edn.yan.domain;
// default package

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * Admin entity. @author MyEclipse Persistence Tools
 */

public class Admin  implements java.io.Serializable ,Comparable<Admin>{


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 12345671L;
	private Integer id;
     private String name;
     private String loginname;
     private String loginpassword;
     private String phone;
     private String email;
     private Date enrolldate;
     private Set adminrights = new HashSet(0);


    // Constructors

    /** default constructor */
    public Admin() {
    }

    public Admin(String name, String loginname, String loginpassword, String phone, String email, Date enrolldate) {
        this.name = name;
        this.loginname = loginname;
        this.loginpassword = loginpassword;
        this.phone = phone;
        this.email = email;
        this.enrolldate = enrolldate;
    }

    /** full constructor */
    public Admin(String name, String loginname, String loginpassword, String phone, String email, Date enrolldate, Set adminrights) {
        this.name = name;
        this.loginname = loginname;
        this.loginpassword = loginpassword;
        this.phone = phone;
        this.email = email;
        this.enrolldate = enrolldate;
        this.adminrights = adminrights;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getLoginname() {
        return this.loginname;
    }
    
    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getLoginpassword() {
        return this.loginpassword;
    }
    
    public void setLoginpassword(String loginpassword) {
        this.loginpassword = loginpassword;
    }

    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public Date getEnrolldate() {
        return this.enrolldate;
    }
    
    public void setEnrolldate(Date enrolldate) {
        this.enrolldate = enrolldate;
    }

    public Set getAdminrights() {
        return this.adminrights;
    }
    
    public void setAdminrights(Set adminrights) {
        this.adminrights = adminrights;
    }


	public int compareTo(Admin admin) {
		return id.compareTo(admin.getId());
	}
   








}