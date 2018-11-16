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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userCode=" + userCode + ", userName=" + userName + ", password=" + password
				+ ", telephone=" + telephone + ", wechat=" + wechat + ", roleCode=" + roleCode + ", createTime="
				+ createTime + "]";
	}
    
    

}