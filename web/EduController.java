package kr.co.dstinfo.DSEDU.cop.edu.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import kr.co.dstinfo.DSCMS.cmm.stereotype.Interceptor;
import kr.co.dstinfo.DSCMS.site.service.MenuInfo;
import kr.co.dstinfo.DSCMS.site.service.SiteService;
import kr.co.dstinfo.DSCMS.sym.sit.mnu.service.Menu;
import kr.co.dstinfo.DSCMS.sym.sit.mnu.service.MenuService;
import kr.co.dstinfo.DSCMS.sym.sit.sii.service.SiteInfo;
import kr.co.dstinfo.DSCMS.tag.pagination.CmsPaginationInfo;
import kr.co.dstinfo.DSEDU.cop.edu.service.Edu;
import kr.co.dstinfo.DSEDU.cop.edu.service.EduService;
import kr.co.dstinfo.DSEDU.cop.edu.service.EduVO;
import kr.co.dstinfo.DSPhoto.cop.cot.service.ContestService;
import kr.co.dstinfo.DSPhoto.cop.cot.service.ContestVO;

@Controller
public class EduController {
	
	  @Resource(name="eduService")
	  private EduService eduService;
	  
	  @Resource(name="menuService")
	  private MenuService menuService;
	  
	  @Resource(name="siteService")
	  private SiteService siteService;
	  
	  @Resource(name="beanValidator")
	  protected DefaultBeanValidator beanValidator;
	  
	  @Interceptor(value={"pmsAuthorInterceptor", "templateBinding"}, type={kr.co.dstinfo.DSCMS.cmm.stereotype.AccesType.REJECT})
	  @RequestMapping({"/{siteId}/eduProgramManageView.do"})
	  public String eduProgramManageView(@PathVariable("siteId") String siteId, @RequestParam("key") int key, @ModelAttribute("eduVO") EduVO eduVO,HttpServletRequest request,ModelMap model)
	    throws Exception
	  {
		  System.out.println("eduProgramManageView eduVO : " + eduVO);
		  int totCnt = eduService.selectEduTotCnt( eduVO);
		  CmsPaginationInfo cmsPaginationInfo = eduVO.getCmsPaginationInfo(totCnt);
		  model.addAttribute("paginationInfo", cmsPaginationInfo);
		  List selectEduList = eduService.selectEduList(eduVO);
		  model.addAttribute("selectEduList", selectEduList);
	     return "/DSPhoto/edu/cop/edu/eduProgramManageView";
	  }
	  
	  @Interceptor(value={"pmsAuthorInterceptor", "templateBinding"}, type={kr.co.dstinfo.DSCMS.cmm.stereotype.AccesType.REJECT})
	  @RequestMapping({"/{siteId}/eduProgramManageAdd.do"})
	  public String eduProgramManageAdd(MultipartHttpServletRequest multiRequest,@ModelAttribute("eduVO") EduVO eduVO, BindingResult bindingResult, RedirectAttributes rttr, HttpServletRequest request, ModelMap model)
	    throws Exception
	  { 
		  System.out.println("eduVO : " + eduVO);
		  this.beanValidator.validate(eduVO, bindingResult);
		  
		  //MultipartFile 
		  bindingResult
		  .getFieldErrors()
		  .stream()
		  .forEach(f -> System.out.println(f.getField() + ": " + f.getDefaultMessage()));
		    
		  System.out.println("bindingResult.hasErrors() : " + bindingResult.hasErrors());
		 if (bindingResult.hasErrors())
	     {
	       return "redirect:eduProgramManageViewAdd.do";
	     }
	     this.eduService.insertEdu(request, eduVO);
	     rttr.addFlashAttribute("title", "프로그램등록");
	     rttr.addFlashAttribute("type", "success");
	     rttr.addFlashAttribute("message", "프로그램 등록을 완료하였습니다.");
	     return "redirect:eduProgramManageView.do";	
	  }
	  
	  @Interceptor(value={"pmsAuthorInterceptor", "templateBinding"}, type={kr.co.dstinfo.DSCMS.cmm.stereotype.AccesType.REJECT})
	  @RequestMapping({"/{siteId}/eduProgramManageViewAdd.do"})
	  public String eduProgramManageViewAdd(@PathVariable("siteId") String siteId, @RequestParam("key") int key, @ModelAttribute("eduVO") EduVO eduVO, ModelMap model)
	    throws Exception
	  {

	     return "/DSPhoto/edu/cop/edu/eduProgramManageViewAdd";
	  }
	  
	  @Interceptor(value={"pmsAuthorInterceptor", "templateBinding"}, type={kr.co.dstinfo.DSCMS.cmm.stereotype.AccesType.REJECT})
	  @RequestMapping({"/{siteId}/eduProgramManageViewEdit.do"})
	  public String eduProgramManageViewEdit(@PathVariable("siteId") String siteId, @RequestParam("key") int key, @ModelAttribute("eduVO") EduVO eduVO, ModelMap model)
	    throws Exception
	  {  
		  eduVO = this.eduService.selectEdu(eduVO);
		  System.out.println("eduVO : " + eduVO);
		  model.addAttribute("eduVO", eduVO);
	     return "/DSPhoto/edu/cop/edu/eduProgramManageViewEdit";
	  }
	  
	  @Interceptor(value={"pmsAuthorInterceptor", "templateBinding"}, type={kr.co.dstinfo.DSCMS.cmm.stereotype.AccesType.REJECT})
	  @RequestMapping({"/{siteId}/eduProgramManageEdit.do"})
	  public String eduProgramManageEdit(MultipartHttpServletRequest multiRequest,@ModelAttribute("eduVO") EduVO eduVO, BindingResult bindingResult, RedirectAttributes rttr, HttpServletRequest request, ModelMap model)
	    throws Exception
	  { 
		  System.out.println("66666666666666666666666666666666");
		  System.out.println("eduVO : " + eduVO);
		  this.beanValidator.validate(eduVO, bindingResult);
		  
		  //MultipartFile 
		  bindingResult
		  .getFieldErrors()
		  .stream()
		  .forEach(f -> System.out.println(f.getField() + ": " + f.getDefaultMessage()));
		    
		  System.out.println("bindingResult.hasErrors() : " + bindingResult.hasErrors());
		 if (bindingResult.hasErrors())
	     {
	       return "redirect:eduProgramManageViewAdd.do";
	     }
	     this.eduService.updateEdu(request, eduVO);
	     rttr.addFlashAttribute("title", "프로그램수정");
	     rttr.addFlashAttribute("type", "success");
	     rttr.addFlashAttribute("message", "프로그램을 수정 완료하였습니다.");
	     return "redirect:eduProgramManageView.do";	
	  }
	  
	  @Interceptor(value={"pmsAuthorInterceptor", "templateBinding"}, type={kr.co.dstinfo.DSCMS.cmm.stereotype.AccesType.REJECT})
	  @RequestMapping({"/{siteId}/eduProgramManageDelete.do"})
	  public String eduProgramManageDelete(@ModelAttribute("eduVO") EduVO eduVO, RedirectAttributes rttr, HttpServletRequest request, ModelMap model)
	    throws Exception
	  { 
		 
	     this.eduService.deleteEdu(request,eduVO);
	     rttr.addFlashAttribute("title", "프로그램삭제");
	     rttr.addFlashAttribute("type", "success");
	     rttr.addFlashAttribute("message", "프로그램 삭제가 완료하였습니다.");
	     return "redirect:eduProgramManageView.do";	
	  }
	  
}
