package cn.edn.yan.dao;

import cn.edn.yan.domain.File;

public interface FileDAO {
	/**
	 * 添加文件信息
	 * @param file
	 */
	public void addFile(File file);
	/**
	 * 删除文件信息
	 * @param id
	 */
	public void deleteFile(int id);
	/**
	 * 根据文件id查询文件信息
	 * @param id
	 * @return
	 */
	public File findById(int id);
}
