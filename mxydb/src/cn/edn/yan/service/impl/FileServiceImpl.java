package cn.edn.yan.service.impl;

import cn.edn.yan.dao.FileDAO;
import cn.edn.yan.domain.File;
import cn.edn.yan.service.FileService;

public class FileServiceImpl implements FileService{
	private FileDAO fileDao;
	public void setFileDao(FileDAO fileDao) {
		this.fileDao = fileDao;
	}
	public void addFile(File file) {
		fileDao.addFile(file);
	}
	public void deleteFile(int id) {
		fileDao.deleteFile(id);
	}

}
