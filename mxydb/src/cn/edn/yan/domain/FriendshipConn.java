package cn.edn.yan.domain;
// default package

import java.util.HashSet;
import java.util.Set;


/**
 * FriendshipConn entity. @author MyEclipse Persistence Tools
 */

public class FriendshipConn  implements java.io.Serializable,Comparable<FriendshipConn> {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 55555555L;
	private Integer id;
     private String name;
     private String url;


    // Constructors

    /** default constructor */
    public FriendshipConn() {
    }

	/** minimal constructor */
    public FriendshipConn(String name) {
    	this.name = name;
    }
    
    /** full constructor */
    public FriendshipConn(String name, String url) {
        this.name = name;
        this.url = url;

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
    public String toString(){
    	return "name:"+name+",url:"+url;
    }

	public int compareTo(FriendshipConn friendshipConn) {
		return id.compareTo(friendshipConn.id);
	}


}