package cn.edn.yan.service;

import java.util.List;

import cn.edn.yan.domain.Right;

public interface RightService {
	public Right findById(int id);
	/**
	 * 查询权限列表
	 * @return
	 */
	public List<Right> listRight();
}
