package user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import user.service.IntroService;

import common.controller.BaseController;

@Controller
public class IntroController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(IntroController.class);
	
	@Autowired
    private IntroService introService;
	
	/**
	 * 도원예일소개
	 * @param userVo
	 * @param modelMap
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/user/intro_dowon")
    public String intro_dowon() {
        return "/user/intro_dowon";
    }
	@RequestMapping(value = "/user/intro_wonjang")
	public String intro_wonjang() {
		return "/user/intro_wonjang";
	}
	@RequestMapping(value = "/user/intro_chiryosa")
	public String intro_chiryosa(ModelMap modelMap) {
		modelMap.putAll(introService.intro_chiryosaList());
		return "/user/intro_chiryosa";
	}
	@RequestMapping(value = "/user/intro_center")
	public String intro_center() {
		return "/user/intro_center";
	}
	@RequestMapping(value = "/user/intro_chaja")
	public String intro_chaja() {
		return "/user/intro_chaja";
	}
}
