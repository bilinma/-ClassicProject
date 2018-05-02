package com.bilin.crm.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * t_order
 * @author 
 */
@Entity
@Table(name = "t_order")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;
	
    /**
     * ID
     */
	@Id
    private Long id;

    /**
     * 订单号
     */
    private String orderNo;

    /**
     * 订单次序
     */
    private Integer orderSeq;

    /**
     * 顾客ID
     */
    private Long customerId;

    /**
     * 桌号
     */
    private String deskNo;

    /**
     * 消费金额
     */
    private Integer amount;

    /**
     * 订单状态
     */
    private Integer orderStatus;
    
    /**
     * 订单状态
     */
    private Integer backStatus;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 订单备注
     */
    private String remark;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getOrderSeq() {
        return orderSeq;
    }

    public void setOrderSeq(Integer orderSeq) {
        this.orderSeq = orderSeq;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getDeskNo() {
        return deskNo;
    }

    public void setDeskNo(String deskNo) {
        this.deskNo = deskNo;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }
    
	public Integer getBackStatus() {
		return backStatus;
	}

	public void setBackStatus(Integer backStatus) {
		this.backStatus = backStatus;
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