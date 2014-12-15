package com.sanbao.it.action;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

//文件上传Action
public class UploadAction extends ActionSupport {
	//上传文件存放路径
	private final static String UPLOADDIR = "/upload";
	//上传文件集合
	private List<File> file;
	//上传文件名集合
	private List<String> fileFileName;
	//上传文件内容类型集合
	private List<String> fileContentType;
	
	private String bugIds;
	
	public String getBugIds() {
		return bugIds;
	}

	public void setBugIds(String bugIds) {
		this.bugIds = bugIds;
	}

	public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<String> getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String execute() throws Exception {
		for (int i = 0; i < file.size(); i++) {
			//循环上传每个文件
			uploadFile(i);
		}
		HttpServletResponse response = ServletActionContext.getResponse();  
		response.reset(); 
		response.setContentType("text/plain;charset=utf-8"); 
		PrintWriter writer = response.getWriter(); 
		writer.print("OK");
		writer.flush(); 
		writer.close(); 
		return SUCCESS;
	}

	//执行上传功能
	private void uploadFile(int i) throws FileNotFoundException, IOException {
		try {
			InputStream in = new FileInputStream(file.get(i));
			//String dir = ServletActionContext.getRequest().getRealPath(UPLOADDIR);
			String rootDir = this.getText("rootDir");
			File tmpdir = new File(rootDir);
			if(!tmpdir.exists()){
				tmpdir.mkdirs();
			}
			File uploadFile = new File(rootDir, this.getFileFileName().get(i));
			OutputStream out = new FileOutputStream(uploadFile);
			byte[] buffer = new byte[1024 * 1024];
			int length;
			while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}

			in.close();
			out.close();
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}