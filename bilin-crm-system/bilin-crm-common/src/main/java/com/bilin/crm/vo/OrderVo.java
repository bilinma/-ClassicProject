package com.bilin.crm.vo;

import java.io.Serializable;

import javax.persistence.Id;

/**
 * t_order
 * @author 
 */
public class OrderVo implements Serializable {
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
     * 创建时间
     */
    private String createTime;

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

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}