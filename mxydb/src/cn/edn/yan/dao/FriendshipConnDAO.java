package cn.edn.yan.dao;

import java.util.Collection;
import java.util.List;

import cn.edn.yan.domain.FriendshipConn;

public interface FriendshipConnDAO {
	/**
	 * 查询友情链接的行数
	 * @return
	 */
	public int qryCounts();
	/**
	 * 查询固定行友情链接信息
	 * @param currentPage
	 * @return
	 */
	public Collection<FriendshipConn> queryAll(int currentPage);
	public List<FriendshipConn> listFriendshipConn();
	public void addFriendshipConn(FriendshipConn friendshipConn);
	public FriendshipConn findById(int id);
	public void updateFriendshipConn(FriendshipConn friendshipConn);
	public void deleteFriendshipConn(int id);
}
