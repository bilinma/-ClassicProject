package com.bilin.crm.request;

import java.io.Serializable;

public class PageRequest implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 当前页数
	private Integer pagenum = 0;
	// 每一页显示多少
	private Integer pagesize = 50;
	// 当前显示到的ID, 在mysql limit 中就是第一个参数.
	private Integer stratRow;
	// 总记录数
	private Integer totalRecords;

	public Integer getPagenum() {
		return pagenum;
	}

	public void setPagenum(Integer pagenum) {
		this.pagenum = pagenum;
	}

	public Integer getPagesize() {
		return pagesize;
	}

	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}

	public Integer getStratRow() {
		return stratRow;
	}

	public void setStratRow() {
		this.stratRow = pagesize * pagenum;
	}

	public Integer getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(Integer totalRecords) {
		this.totalRecords = totalRecords;
	}

	

}
