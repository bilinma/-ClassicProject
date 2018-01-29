package cn.edn.yan.domain;
// default package

import java.util.HashSet;
import java.util.Set;

/**
 * Module entity. @author MyEclipse Persistence Tools
 */

public class Module  implements java.io.Serializable ,Comparable<Module>{


    // Fields    

     /**
	 * 
	 */ 
	private static final long serialVersionUID = 11111111L;
	private Integer id;
     private String name;
     private String url;
     private Set informations = new HashSet(0);
     private Set sections = new HashSet(0);


    // Constructors

    /** default constructor */
    public Module() {
    }

	/** minimal constructor */
    public Module(String name) {
    	this.name = name;
    }
    
    public Module(String name,String url) {
    	this.name = name;
    	this.url=url;
    }
    
    /** full constructor */
    public Module(String name, String url, Set informations, Set sections) {
        this.name = name;
        this.url = url;
        this.informations = informations;
        this.sections = sections;
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

    public Set getInformations() {
        return this.informations;
    }
    
    public void setInformations(Set informations) {
        this.informations = informations;
    }

    public Set getSections() {
        return this.sections;
    }
    
    public void setSections(Set sections) {
        this.sections = sections;
    }
   

    public String toString(){
    	return "name:"+name+",url:"+url;
    }

	public int compareTo(Module module) {
		return id.compareTo(module.id);
	}






}