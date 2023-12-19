package kr.co.dstinfo.DSEDU.cop.edu.service.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dstinfo.DSCMS.cmm.service.AttachmentFileUtil;
import kr.co.dstinfo.DSCMS.cmm.service.FileMngUtil;
import kr.co.dstinfo.DSCMS.cmm.util.DateUtil;
import kr.co.dstinfo.DSCMS.uat.uia.service.LoginUtil;
import kr.co.dstinfo.DSEDU.cop.edu.service.Edu;
import kr.co.dstinfo.DSEDU.cop.edu.service.EduService;
import kr.co.dstinfo.DSEDU.cop.edu.service.EduVO;

@Service("eduService")
public class EduServiceImpl extends EgovAbstractServiceImpl 
implements EduService 
{
	  @Resource(name="eduDAO")
	  private EduDAO eduDAO;
	  
	  @Resource(name="attachmentFileUtil")
	  private AttachmentFileUtil attachmentFileUtil;
	  
	  @Resource(name="FileMngUtil")
	  private FileMngUtil fileMngUtil;
	  
	  
	  public List<EduVO> selectEduList(EduVO eduVO) throws Exception {
		     return this.eduDAO.selectEduList(eduVO);
	  }
	  public List<Edu> selectEduCommonList(Edu edu) throws Exception {
		     return this.eduDAO.selectEduCommonList(edu);
	  }
	  public int selectEduTotCnt(EduVO eduVO) throws Exception {
	     return this.eduDAO.selectEduTotCnt(eduVO);
	  }
	  public void insertEdu(HttpServletRequest request, EduVO eduVO) throws Exception 
	  {		    
	     eduVO.setFrstRegisterPnttm(DateUtil.getNowDateTime("yyyyMMddHHmmss"));
	     eduVO.setFrstRegisterId(LoginUtil.getLoginId(request.getSession()));
	     
	     this.attachmentFileUtil.setAttachMentFileUtil(request);
	     
	     // String storagePath = this.fileMngUtil.realPath(request, this.attachmentFileUtil.getEduDir().replaceAll(Pattern.quote("\\"), "/"));
	     String storagePath = FileMngUtil.getStandardPath(attachmentFileUtil.getEduDir());
	     
	     UUID mainuuid = UUID.randomUUID();
	     UUID logouuid = UUID.randomUUID();
	     MultipartFile mainFile = eduVO.getEduMainFile();
	     String mainextension = mainFile.getOriginalFilename().substring(mainFile.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
	     
	     MultipartFile logoFile = eduVO.getEduLogoFile();
	     String logoextension = logoFile.getOriginalFilename().substring(logoFile.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();	      
	     String eduMainFileNm = mainuuid + "." + mainextension;
	     String eduLogoFileNm = logouuid + "." + logoextension;	   
	     String realpath = request.getSession().getServletContext().getRealPath(storagePath.replaceAll(Pattern.quote("\\"), "/"));	
	     File SavePath = new File(realpath);
	     if(!SavePath.exists())
	     {
	    	 this.attachmentFileUtil.createEduDir();
	     }
	     File trnsMainFile = new File(realpath +  File.separator + eduMainFileNm);
	     File trnsLogoFile = new File(realpath +  File.separator + eduLogoFileNm);
	     if(!mainextension.equals(""))
	     {
	    	 mainFile.transferTo(trnsMainFile);
	     }
	     else
	     {
	    	 eduMainFileNm = "";
	     }
	     if(!logoextension.equals(""))
	     {
	    	 logoFile.transferTo(trnsLogoFile);	  
	     }
	     else
	     {
	    	 eduLogoFileNm = "";
	     }
	     
	     eduVO.setEduMainFileNm(eduMainFileNm);	        
	     eduVO.setEduLogoFileNm(eduLogoFileNm);
	     
	     //System.out.println(realpath +  "/" + eduMainFileNm);
	     //System.out.println(realpath +  "/" + eduLogoFileNm);
	    // String storagePath = FileMngUtil.getStandardPath(strePath); repl
	    // this.egovLogger.debug("storagePath : {}", storagePath);
	     
	     
	     this.eduDAO.insertEdu(eduVO);
	  }
	  
	  public EduVO selectEdu(EduVO eduVO) throws Exception {
		     return this.eduDAO.selectEdu(eduVO);
	  }
	  
	  public void updateEdu(HttpServletRequest request, EduVO eduVO) throws Exception {
		 EduVO oldedu = selectEdu(eduVO);
		 
		 
	     eduVO.setLastUpdusrPnttm(DateUtil.getNowDateTime("yyyyMMddHHmmss"));
	     eduVO.setLastUpdusrId(LoginUtil.getLoginId(request.getSession()));
	     
	     this.attachmentFileUtil.setAttachMentFileUtil(request);
	     
	     // String storagePath = this.fileMngUtil.realPath(request, this.attachmentFileUtil.getEduDir().replaceAll(Pattern.quote("\\"), "/"));
	     String storagePath = FileMngUtil.getStandardPath(attachmentFileUtil.getEduDir());
	     
	     UUID mainuuid = UUID.randomUUID();
	     UUID logouuid = UUID.randomUUID();
	     MultipartFile mainFile = eduVO.getEduMainFile();
	     String mainextension = mainFile.getOriginalFilename().substring(mainFile.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
	     
	     MultipartFile logoFile = eduVO.getEduLogoFile();
	     String logoextension = logoFile.getOriginalFilename().substring(logoFile.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();	      
	     String eduMainFileNm = mainuuid + "." + mainextension;
	     String eduLogoFileNm = logouuid + "." + logoextension;	   
	     String realpath = request.getSession().getServletContext().getRealPath(storagePath.replaceAll(Pattern.quote("\\"), "/"));	
	     File SavePath = new File(realpath);
	     if(!SavePath.exists())
	     {
	    	 this.attachmentFileUtil.createEduDir();
	     }
	     File trnsMainFile = new File(realpath +  File.separator + eduMainFileNm);
	     File trnsLogoFile = new File(realpath +  File.separator + eduLogoFileNm);
	     if(!mainextension.equals(""))
	     {
	    	 mainFile.transferTo(trnsMainFile);
	     }
	     else
	     {
	    	 eduMainFileNm = oldedu.getEduMainFileNm();
	     }
	     if(!logoextension.equals(""))
	     {
	    	 logoFile.transferTo(trnsLogoFile);	  
	     }
	     else
	     {
	    	 eduLogoFileNm  = oldedu.getEduLogoFileNm();
	     }
	     this.eduDAO.updateEdu(eduVO);
	  }

	  public void deleteEdu(HttpServletRequest request,EduVO eduVO) throws Exception {
		  this.attachmentFileUtil.setAttachMentFileUtil(request);
		     
		     // String storagePath = this.fileMngUtil.realPath(request, this.attachmentFileUtil.getEduDir().replaceAll(Pattern.quote("\\"), "/"));
		     String storagePath = FileMngUtil.getStandardPath(attachmentFileUtil.getEduDir());
		     String realpath = request.getSession().getServletContext().getRealPath(storagePath.replaceAll(Pattern.quote("\\"), "/"));	
		     File mainFile = new File(realpath+File.separator +eduVO.getEduMainFileNm());
		     File logoFile = new File(realpath+File.separator +eduVO.getEduLogoFileNm());
		     
		     logoFile.delete();
		     if(mainFile.exists())
		     {
		    	 mainFile.delete();
		     }
		     if(logoFile.exists())
		     {
		    	 logoFile.delete();
		     }
		     this.eduDAO.deleteEdu(eduVO);
	  }
}
