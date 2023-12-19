package kr.co.dstinfo.DSEDU.cop.edu.service;

import org.springframework.web.multipart.MultipartFile;

public class EduVO extends Edu {
	private String statusCode;
	private MultipartFile eduMainFile;
	private MultipartFile eduLogoFile;


	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public MultipartFile getEduMainFile() {
		return eduMainFile;
	}

	public void setEduMainFile(MultipartFile eduMainFile) {
		this.eduMainFile = eduMainFile;
	}

	public MultipartFile getEduLogoFile() {
		return eduLogoFile;
	}

	public void setEduLogoFile(MultipartFile eduLogoFile) {
		this.eduLogoFile = eduLogoFile;
	}
	
	
}
