package cn.edn.yan.domain;

// default package



/**
 * Adminright entity. @author MyEclipse Persistence Tools
 */

public class Adminright  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Right right;
     private Admin admin;


    // Constructors

    /** default constructor */
    public Adminright() {
    }

    
    /** full constructor */
    public Adminright(Right right, Admin admin) {
        this.right = right;
        this.admin= admin;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Right getRight() {
        return this.right;
    }
    
    public void setRight(Right right) {
        this.right = right;
    }

    public Admin getAdmin() {
        return this.admin;
    }
    
    public void setAdmin(Admin admin) {
        this.admin= admin;
    }
   








}