package kr.co.dstinfo.DSEDU.cop.edu.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kr.co.dstinfo.DSEDU.cop.edu.service.Edu;
import kr.co.dstinfo.DSEDU.cop.edu.service.EduVO;


@Repository("eduDAO")
public class EduDAO extends EgovAbstractDAO{
	public List<EduVO> selectEduList(EduVO eduVO)  throws Exception
	{
	    return (List<EduVO>) list("eduDAO.selectEduList", eduVO);
	}
	public List<Edu> selectEduCommonList(Edu edu)  throws Exception
	{
	    return (List<Edu>) list("eduDAO.selectEduCommonList", edu);
	}
	public int selectEduTotCnt(EduVO eduVO) throws Exception {
     return ((Integer)select("eduDAO.selectEduTotCnt", eduVO)).intValue();
    }
	public EduVO selectEdu(EduVO eduVO)  throws Exception
	{
	    return (EduVO)select("eduDAO.selectEdu", eduVO);
	}
	public void insertEdu(EduVO eduVO) throws Exception 
	{
	     insert("eduDAO.insertEdu", eduVO);
	}
	
	public void updateEdu(EduVO eduVO) throws Exception 
	{
	     update("eduDAO.updateEdu", eduVO);
	}
	
	public void deleteEdu(EduVO eduVO) throws Exception 
	{
	     delete("eduDAO.deleteEdu", eduVO);
	}
}
