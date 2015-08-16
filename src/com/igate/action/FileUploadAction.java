package com.igate.action;

import java.io.File;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionSupport;

public class FileUploadAction extends ActionSupport{

	private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;
	private String paths;
	
	public String getPaths() {
		return paths;
	}

	public void setPaths(String paths) {
		this.paths = paths;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String execute() throws Exception{
		
		try {
			paths="D:\\Gaurab_Eclipse/CheapStays/WebContent/HotelListDocs/";
			
			File destFile=new File(paths,fileUploadFileName);
			
			FileUtils.copyFile(fileUpload, destFile);
			
		} catch (Exception e) {
			System.out.println("enter file");
			
		}
		return SUCCESS;
	}
	
	public String display() {
		return NONE;
	}
	
}