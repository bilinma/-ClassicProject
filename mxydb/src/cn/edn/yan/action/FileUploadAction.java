package cn.edn.yan.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import cn.edn.yan.domain.Information;
import cn.edn.yan.service.FileService;
import cn.edn.yan.service.InformationService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FileUploadAction extends ActionSupport {
	private final Logger logger = Logger.getLogger(FileUploadAction.class);
	
	private static final long serialVersionUID = 572146812454l;
	private static final int BUFFER_SIZE = 16 * 1024;

	private FileService fileService;
	private InformationService informationService;
	private int id;
	private File myFile;
	private String contentType;
	private String fileName;
	private String caption;
	private int inforid;
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	public void setInformationService(InformationService informationService) {
		this.informationService = informationService;
	}
	public void setMyFileContentType(String contentType) {
		this.contentType = contentType;
	}
	public void setMyFileFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}
	public int getInforid() {
		return inforid;
	}
	public void setInforid(int inforid) {
		this.inforid = inforid;
	}
	/**
	 * 拷贝文件方法
	 * @param src
	 * @param dst
	 */
	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

	public String newInforId(){
		inforid=informationService.findNewInfor();
		return SUCCESS;
	}
	/**
	 * 添加文件
	 * @return
	 */
	public String addFile(){
		if(fileName!=null){
			try{
				File copyFile = new File(ServletActionContext.getServletContext()
						.getRealPath("/UploadFiles")
						+ "/" + fileName);
				
				copy(myFile, copyFile);
				Information infor=informationService.findById(inforid);
				cn.edn.yan.domain.File file1 = new cn.edn.yan.domain.File(fileName,caption,infor);
				fileService.addFile(file1);
				infor=informationService.findById(infor.getId());
				ActionContext.getContext().getSession().put("files",infor.getFiles());
				return SUCCESS;
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return INPUT;
	}
	/**
	 * 文件列表
	 * @return
	 */
	public String listFile(){
		Information information=informationService.findById(inforid);
		logger.debug("8888888888888888888888"+information);
		if(information.getFiles().size()!=0){
			ActionContext.getContext().getSession().put("files",information.getFiles() );
			return SUCCESS;
		}else{
			ActionContext.getContext().getSession().put("files",null );
			return INPUT;
		}
	}
	/**
	 * 删除文件
	 * @return
	 */
	public String deleteFile(){	
			fileService.deleteFile(id);
			return SUCCESS;
	}
}