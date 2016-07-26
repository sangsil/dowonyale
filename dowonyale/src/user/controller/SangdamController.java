package user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import common.controller.BaseController;

@Controller
public class SangdamController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(SangdamController.class);
	
	@Autowired
    //private MainService mainService;
	
	/**
	 * 상담이용안내
	 * @param userVo
	 * @param modelMap
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/user/sangdam_jeolcha", method=RequestMethod.GET)
    public String sangdam_jeolcha() {
        return "/user/sangdam_jeolcha";
    }
	@RequestMapping(value = "/user/sangdam_sigan", method=RequestMethod.GET)
	public String sangdam_sigan() {
		return "/user/sangdam_sigan";
	}
}
