package user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.controller.BaseController;

@Controller
public class ChiryoController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(ChiryoController.class);
	
	@Autowired
    //private MainService mainService;
	
	/**
	 * 치료프로그램
	 * @param userVo
	 * @param modelMap
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/user/chiryo_eoneo")
    public String chiryo_eoneo() {
        return "/user/chiryo_eoneo";
    }
	@RequestMapping(value = "/user/chiryo_nolyi")
	public String chiryo_nolyi() {
		return "/user/chiryo_nolyi";
	}
	@RequestMapping(value = "/user/chiryo_inji")
	public String chiryo_inji() {
		return "/user/chiryo_inji";
	}
	@RequestMapping(value = "/user/chiryo_geurup")
	public String chiryo_geurup() {
		return "/user/chiryo_geurup";
	}
	@RequestMapping(value = "/user/chiryo_bumo")
	public String bumo() {
		return "/user/chiryo_bumo";
	}
}
