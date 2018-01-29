package cn.edn.yan.service;

import java.util.List;

import cn.edn.yan.domain.FriendshipConn;
import cn.edn.yan.util.QueryResult;

public interface FriendshipConnService {
	public List<FriendshipConn> listFriendshipConn();
	public QueryResult<FriendshipConn> findAll(int currentPage);
	
	public void addFriendshipConn(FriendshipConn friendshipConn);
	public FriendshipConn findById(int id);
	public void updateFriendshipConn(FriendshipConn friendshipConn) ;
	public void deleteFriendshipConn(int id);
}
