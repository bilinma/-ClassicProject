package cn.edn.yan.service.impl;

import java.util.List;

import cn.edn.yan.dao.RightDAO;
import cn.edn.yan.domain.Right;

public class RightServiceImpl implements cn.edn.yan.service.RightService {
	private RightDAO rightDao;
	public void setRightDao(RightDAO rightDao) {
		this.rightDao = rightDao;
	}
	public Right findById(int id){
		
		return rightDao.findById(id);
	}
	public List<Right> listRight() {
		return rightDao.listRight();
	}
}
