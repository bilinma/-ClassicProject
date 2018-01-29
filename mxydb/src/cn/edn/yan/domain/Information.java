package cn.edn.yan.domain;
// default package

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * Information entity. @author MyEclipse Persistence Tools
 */

public class Information  implements java.io.Serializable,Comparable<Information> {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 3333333L;
	private Integer id;
     private Section section;
     private Module module;
     private String name;
     private String author;
     private Date createdate;
     private String autdit;
     private String releaseunit;
     private String context;
     private Integer scansum;
     private String imgurl;
     private String mname;
     private String sname;
     private Set files = new HashSet(0);


    // Constructors

	/** default constructor */
    public Information() {
    }

	/** minimal constructor */
    public Information(Section section, Module module, String name, Date createdate, String mname, String sname) {
        this.section = section;
        this.module = module;
        this.name = name;
        this.createdate = createdate;
        this.mname = mname;
        this.sname = sname;
    }
    
    public Information( String name, String author, Date createdate, String autdit, String releaseunit, String context, Integer scansum,String imgurl) {
    	this.name = name;
    	this.author = author;
    	this.createdate = createdate;
    	this.autdit = autdit;
    	this.releaseunit = releaseunit;
    	this.context = context;
    	this.scansum = scansum;
    	this.imgurl = imgurl;
    }
    /** full constructor */
    public Information(Integer id, Section section, Module module, String name,
			String imgurl, String author, Date createdate, String autdit,
			String releaseunit, String context, Integer scansum, String mname,
			String sname, Set files) {
		super();
		this.id = id;
		this.section = section;
		this.module = module;
		this.name = name;
		this.imgurl = imgurl;
		this.author = author;
		this.createdate = createdate;
		this.autdit = autdit;
		this.releaseunit = releaseunit;
		this.context = context;
		this.scansum = scansum;
		this.mname = mname;
		this.sname = sname;
		this.files = files;
	}

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Section getSection() {
        return this.section;
    }
    
    public void setSection(Section section) {
        this.section = section;
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

    public Date getCreatedate() {
        return this.createdate;
    }
    
    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getAutdit() {
        return this.autdit;
    }
    
    public void setAutdit(String autdit) {
        this.autdit = autdit;
    }

    public String getReleaseunit() {
        return this.releaseunit;
    }
    
    public void setReleaseunit(String releaseunit) {
        this.releaseunit = releaseunit;
    }

    public String getContext() {
        return this.context;
    }
    
    public void setContext(String context) {
        this.context = context;
    }

    public Integer getScansum() {
        return this.scansum;
    }
    
    public void setScansum(Integer scansum) {
        this.scansum = scansum;
    }

    public String getMname() {
        return this.mname;
    }
    
    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getSname() {
        return this.sname;
    }
    
    public void setSname(String sname) {
        this.sname = sname;
    }
 
    public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public Set getFiles() {
		return files;
	}

	public void setFiles(Set files) {
		this.files = files;
	}

	public String toString(){
    	return "name:"+name+"\t moduleName"+mname+",sectionName"+sname;
    }

	public int compareTo(Information information) {
		return id.compareTo(information.getId());
	}







}