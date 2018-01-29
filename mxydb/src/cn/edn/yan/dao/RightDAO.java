package cn.edn.yan.dao;

import java.util.List;

import cn.edn.yan.domain.Right;

public interface RightDAO {
	public Right findById(int id);
	public List<Right> listRight();
}
