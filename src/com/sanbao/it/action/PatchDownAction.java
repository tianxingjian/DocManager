package com.sanbao.it.action;

import java.io.File;
import java.io.InputStream;

import com.opensymphony.xwork2.ActionSupport;
import com.sanbao.it.util.FileUtil;

public class PatchDownAction  extends ActionSupport{

	private static final long serialVersionUID = 1L;

	private String versionNo;

	private String filename;
	
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getVersionNo() {
		return versionNo;
	}

	public void setVersionNo(String versionNo) {
		this.versionNo = versionNo;
	}

	public InputStream getDownloadFile() throws Exception {

		FileUtil fileUtil = new FileUtil();
		String fileName = versionNo + "." + this.getText("suffix");
		String rootDir = this.getText("rootDir");
		String parentDir = rootDir + File.separator + versionNo;
		
		InputStream in = fileUtil.getInputStream(parentDir, filename);
		//转码，解决下载界面中文不显示问题
		//filename = new String(filename.getBytes("gb2312"), "iso8859-1");
		return in;
	}

	public String execute() {
		
		String fileName = versionNo + "." + this.getText("suffix");
		String rootDir = this.getText("rootDir");
		String parentDir = rootDir + File.separator + versionNo;
		
		FileUtil fileUtil = new FileUtil();
		if(fileUtil.isFileExists(parentDir, fileName)){
			setFilename(fileName);
			msg = "";
			return SUCCESS;
		}else{
			msg = versionNo + "找不到该版本号对应补丁文件！";
			return ERROR;
		}
		
	}
}
