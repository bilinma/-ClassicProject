package cn.edn.yan.domain;
// default package

import java.util.HashSet;
import java.util.Set;


/**
 * Right entity. @author MyEclipse Persistence Tools
 */

public class Right  implements java.io.Serializable ,Comparable<Right>{


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 111112222L;
	private Integer id;
     private String name;
     private String url;
     private Set adminrights = new HashSet(0);


    // Constructors

    /** default constructor */
    public Right() {
    }

    
    /** full constructor */
    public Right(String name, String url, Set adminrights) {
        this.name = name;
        this.url = url;
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

    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }

    public Set getAdminrights() {
        return this.adminrights;
    }
    
    public void setAdminrights(Set adminrights) {
        this.adminrights = adminrights;
    }


	public int compareTo(Right right) {
		return id.compareTo(right.getId());
	}
   
	public String toString(){
		return "name:"+name+"url"+url;
	}







}