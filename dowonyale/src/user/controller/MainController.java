package user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import user.service.MainService;

import common.controller.BaseController;
import common.vo.BoardVo;
import common.vo.UserVo;

@Controller
public class MainController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
    private MainService mainService;
	
	
	
	/**
	 * 메인페이지-최신게시판글 3개
	 * @param userVo
	 * @param modelMap
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/user/main", method=RequestMethod.GET)
    public String index(BoardVo boardVo, ModelMap modelMap, HttpSession session) {
		modelMap.putAll(mainService.getNews(boardVo));
		modelMap.putAll(mainService.getPopup_list());
        return "/user/main";
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 리스트 화면
	 * @param userVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/user/list")    
    public String list(UserVo userVo, ModelMap modelMap) {
        modelMap.putAll(mainService.getList(userVo));
        return "/user/list";
    }
	
	/**
	 * 등록과 결과화면
	 * @param userVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/user/thanks", method=RequestMethod.POST)
    public String thanks(UserVo userVo, ModelMap modelMap) {
		modelMap.putAll(mainService.getThanks(userVo));
        return "/user/thanks";
    }
	
	/**
	 * 결과화면 바로가기
	 * @param userVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/user/thanksView")    
	public String thanksView(UserVo userVo, ModelMap modelMap) {
		modelMap.putAll(mainService.thanksView(userVo));
		return "/user/thanks";
	}

	/**
	 * 추천
	 * @param userVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/user/recommend", method=RequestMethod.POST)
	public String recommend(UserVo userVo, ModelMap modelMap) {
		mainService.recommend(userVo);
		modelMap.putAll(mainService.getList(userVo));
		return "/user/list";
	}

	/**
	 * 수정
	 * @param userVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/user/editUser", method=RequestMethod.POST)
	public String editUser(UserVo userVo, ModelMap modelMap) {
		mainService.editUser(userVo);
		modelMap.putAll(mainService.getList(userVo));
		return "/user/list";
	}
	
	/**
	 * 삭제
	 * @param userVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/user/deleteUser", method=RequestMethod.POST)
    public String deleteUser(UserVo userVo, ModelMap modelMap) {
		mainService.deleteUser(userVo);
		modelMap.putAll(mainService.getList(userVo));
        return "/user/list";
    }
	
}
