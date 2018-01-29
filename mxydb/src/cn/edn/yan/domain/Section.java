package cn.edn.yan.domain;
// default package

import java.util.HashSet;
import java.util.Set;


/**
 * Section entity. @author MyEclipse Persistence Tools
 */

public class Section  implements java.io.Serializable ,Comparable<Section>{


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID =2222222L;
	private Integer id;
     private Module module;
     private String name;
     private String urlname;
     private String author;
     private Set informations = new HashSet(0);


    // Constructors

    /** default constructor */
    public Section() {
    }

	/** minimal constructor */
    public Section( String name ,String author) {
    	this.name = name;
    	setAuthor(author);
    }
    public Section(Module module, String name) {
    	this.module = module;
    	this.name = name;
    }
    public Section( String name,String author,Module module) {
        this.module = module;
        this.name = name;
        setAuthor(author);
    }
    
    /** full constructor */
    public Section(Module module, String name,String urlname, String author, Set informations) {
        this.module = module;
        this.name = name;
        this.urlname=urlname;
        this.author = author;
        this.informations = informations;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Module getModule() {
        return this.module;
    }
    
    public void setModule(Module module) {
        this.module = module;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return this.author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }

    public Set getInformations() {
        return this.informations;
    }
    
    public void setInformations(Set informations) {
        this.informations = informations;
    }
    
	public String getUrlname() {
		return urlname;
	}

	public void setUrlname(String urlname) {
		this.urlname = urlname;
	}
	
    public String toString(){
    	return "id:"+id+",name:"+name;
    }

	public int compareTo(Section section) {
		return id.compareTo(section.id);
	}









}