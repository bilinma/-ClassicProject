package cn.edn.yan.service.impl;

import java.util.List;

import cn.edn.yan.dao.FriendshipConnDAO;
import cn.edn.yan.domain.FriendshipConn;
import cn.edn.yan.service.FriendshipConnService;
import cn.edn.yan.util.QueryResult;

public class FriendshipConnServiceImpl implements FriendshipConnService {
	private FriendshipConnDAO friendshipConnDao;
	public void setFriendshipConnDao(FriendshipConnDAO friendshipConnDao) {
		this.friendshipConnDao = friendshipConnDao;
	}
	
	public List<FriendshipConn> listFriendshipConn() {
		return friendshipConnDao.listFriendshipConn();
	}

	public QueryResult<FriendshipConn> findAll(int currentPage) {
		QueryResult<FriendshipConn> qr=new QueryResult<FriendshipConn>();
		qr.setData(friendshipConnDao.queryAll(currentPage));
		qr.setCount(friendshipConnDao.qryCounts());
		return qr;
	}

	public void addFriendshipConn(FriendshipConn friendshipConn) {
		friendshipConnDao.addFriendshipConn(friendshipConn);
	}

	public FriendshipConn findById(int id) {
		return friendshipConnDao.findById(id);
	}

	public void updateFriendshipConn(FriendshipConn friendshipConn) {
		friendshipConnDao.updateFriendshipConn(friendshipConn);
	}

	public void deleteFriendshipConn(int id) {
		friendshipConnDao.deleteFriendshipConn(id);
	}

}
