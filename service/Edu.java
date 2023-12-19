package kr.co.dstinfo.DSEDU.cop.edu.service;

import kr.co.dstinfo.DSCMS.cmm.service.CmmPagingModel;
public class Edu extends CmmPagingModel{
	private int eduNo;
	private String eduNm;
	private String siteId;
	private String startGradation;
	private String endGradation;
	private String eduMainFileNm;
	private String eduLogoFileNm;
	private String frstRegisterPnttm;
	private String frstRegisterId;
	private String lastUpdusrPnttm;
	private String lastUpdusrId;
	public int getEduNo() {
		return eduNo;
	}
	public void setEduNo(int eduNo) {
		this.eduNo = eduNo;
	}
	public String getEduNm() {
		return eduNm;
	}
	public void setEduNm(String eduNm) {
		this.eduNm = eduNm;
	}
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getStartGradation() {
		return startGradation;
	}
	public void setStartGradation(String startGradation) {
		this.startGradation = startGradation;
	}
	public String getEndGradation() {
		return endGradation;
	}
	public void setEndGradation(String endGradation) {
		this.endGradation = endGradation;
	}
	public String getEduMainFileNm() {
		return eduMainFileNm;
	}
	public void setEduMainFileNm(String eduMainFileNm) {
		this.eduMainFileNm = eduMainFileNm;
	}
	public String getEduLogoFileNm() {
		return eduLogoFileNm;
	}
	public void setEduLogoFileNm(String eduLogoFileNm) {
		this.eduLogoFileNm = eduLogoFileNm;
	}
	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}
	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}
	public String getFrstRegisterId() {
		return frstRegisterId;
	}
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}
	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}
	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}
	  
}
