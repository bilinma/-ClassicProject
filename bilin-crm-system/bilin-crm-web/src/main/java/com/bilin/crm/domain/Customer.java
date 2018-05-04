package com.bilin.crm.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * t_customer
 * @author 
 */
@Entity
@Table(name = "t_customer")
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;
    /**
     * ID
     */
	@Id
    private Long id;

    /**
     * 编码
     */
    private String code;

    /**
     * 姓名
     */
    private String name;

    /**
     * 拼音
     */
    private String pinyinName;

    /**
     * 手机
     */
    private String telephone;

    /**
     * 微信号
     */
    private String wechat;
    
    private Date birthday;

    /**
     * 客户等级
     */
    private Integer level;

    /**
     * 消费总额
     */
    private Integer amountTotal;

    /**
     * 是否返款
     */
    private Integer isBack;

    /**
     * 创建时间
     */
    private Date createTime;

    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPinyinName() {
        return pinyinName;
    }

    public void setPinyinName(String pinyinName) {
        this.pinyinName = pinyinName;
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

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getAmountTotal() {
        return amountTotal;
    }

    public void setAmountTotal(Integer amountTotal) {
        this.amountTotal = amountTotal;
    }

    public Integer getIsBack() {
        return isBack;
    }

    public void setIsBack(Integer isBack) {
        this.isBack = isBack;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
    
    
}