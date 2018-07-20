package com.bilin.crm.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * t_user
 * @author 
 */
@Entity
@Table(name = "t_user")

@Data
public class User implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -6084207027268518318L;

	/**
     * ID
     */
	@Id
    private Long id;

    /**
     * 用户名
     */
    private String userCode;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 密码
     */
    private String password;

    /**
     * 电话
     */
    private String telephone;

    /**
     * 微信
     */
    private String wechat;
    
    /**
     * 角色编码
     */
    private String roleCode;

    /**
     * 创建时间
     */
    private Date createTime;

}