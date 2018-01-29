package cn.edn.yan.domain;
// default package

import java.util.Date;


/**
 * Affiche entity. @author MyEclipse Persistence Tools
 */

public class Affiche  implements java.io.Serializable ,Comparable<Affiche>{


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 66666666L;
	private Integer id;
     private String name;
     private String simplename;
     private String author;
     private Date createdate;
     private String autdit;
     private String releaseunit;
     private String context;
     private Integer scansum;


    // Constructors

    /** default constructor */
    public Affiche() {
    }

	/** minimal constructor */
    public Affiche(String name, Date createdate) {
        this.name = name;
        this.createdate = createdate;
    }
    
    /** full constructor */
    public Affiche(String name, String simplename, String author, Date createdate, String autdit, String releaseunit, String context, Integer scansum) {
        this.name = name;
        this.simplename = simplename;
        this.author = author;
        this.createdate = createdate;
        this.autdit = autdit;
        this.releaseunit = releaseunit;
        this.context = context;
        this.scansum = scansum;
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

    public String getSimplename() {
        return this.simplename;
    }
    
    public void setSimplename(String simplename) {
        this.simplename = simplename;
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

	public int compareTo(Affiche affiche) {
		return id.compareTo(affiche.id);
	}
   








}