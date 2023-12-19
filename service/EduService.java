package kr.co.dstinfo.DSEDU.cop.edu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public  abstract interface EduService{
	  public List<EduVO> selectEduList(EduVO eduVO) throws Exception;
	  public int selectEduTotCnt(EduVO eduVO) throws Exception; 
	  public List<Edu> selectEduCommonList(Edu edu) throws Exception;
	  public void insertEdu(HttpServletRequest request, EduVO eduVO) throws Exception;	  
	  public void updateEdu( HttpServletRequest request, EduVO eduVO) throws Exception;
	  public void deleteEdu(HttpServletRequest request,EduVO eduVO) throws Exception;
	  public EduVO selectEdu(EduVO eduVO) throws Exception;
}
