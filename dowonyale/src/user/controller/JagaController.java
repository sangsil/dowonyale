package user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.service.AdminEmailService;
import user.service.JagaService;
import common.controller.BaseController;
import common.controller.MailService;
import common.vo.EmailVo;
import common.vo.JindanVo;

@Controller
public class JagaController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(JagaController.class);
	
	@Autowired
    private JagaService jagaService;
	@Autowired
	private AdminEmailService adminEmailService;
	@Autowired
	private MailService mailService;
	
	@Value("#{config['EMAIL_TYPE_BOARD']}") String email_type_board;
	@Value("#{config['ADMIN_MAILE_ADDRESS']}") String adminMailAddress;
	
	@Value("#{config['JINDAN_GBN_ADHD']}") String jindan_gbn_adhd;
	@Value("#{config['JINDAN_GBN_SOA']}") String jindan_gbn_soa;
	@Value("#{config['JINDAN_GBN_HAKSEUB']}") String jindan_gbn_hakseub;
	
	
	/**
	 * 자가진단
	 * @param userVo
	 * @param modelMap
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/user/jaga_adhd")
    public String jaga_adhd(ModelMap modelMap) {
		JindanVo jindanVo = new JindanVo();
		jindanVo.setJindan_gbn(jindan_gbn_adhd);
		modelMap.putAll(jagaService.jaga_adhd(jindanVo));
        return "/user/jaga_adhd";
    }
	@RequestMapping(value = "/user/jaga_adhdInsert")
	public void jaga_adhdInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		JindanVo jindanVo = new JindanVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(jindanVo);
		binder.bind(req);

		jindanVo.setArr_jindan_quest_no(req.getParameterValues("jindan_quest_no"));
		
		String[] jindanAns = new String[Integer.parseInt(jindanVo.getResultCnt())];
		for(int i=1; i<= Integer.parseInt(jindanVo.getResultCnt()); i++){
			jindanAns[i-1] = req.getParameter("ans_"+i);
//			System.out.println(i+":"+req.getParameter("ans_"+i));
		}
		jindanVo.setArr_jindan_ans(jindanAns);
		jindanVo.setIn_user((String)session.getAttribute("USER_ID"));
		jindanVo.setJindan_gbn(jindan_gbn_adhd);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			resultMap.put("result", jagaService.jaga_adhdInsert(jindanVo));
			
			// 게시판 글 등록시 담당자에게 메일 전송
			EmailVo emailVo = new EmailVo();
			emailVo.setType(email_type_board);
			List<EmailVo> emailList = new ArrayList<EmailVo>();
			emailList = adminEmailService.emailList(emailVo);
			
			String contentsInfo = "ID:"+(String)session.getAttribute("USER_ID") +"\n";
			//실제 메일 발송
			for(int i=0; i<emailList.size(); i++){
				mailService.sendMail(adminMailAddress, emailList.get(i).getEmail(), "[도원예일]ADHD아동 체크리스트 제출", contentsInfo + "ADHD아동 체크리스트 제출");
			}
			
		} catch (Exception e) {
			logger.info("jaga_adhdInsert_Exception:"+ e);
		}
		
		
		getResultJsonPW(resultMap, res);
	}
	@RequestMapping(value = "/user/jaga_soa")
	public String jaga_soa(ModelMap modelMap) {
		JindanVo jindanVo = new JindanVo();
		jindanVo.setJindan_gbn(jindan_gbn_soa);
		modelMap.putAll(jagaService.jaga_soa(jindanVo));
		return "/user/jaga_soa";
	}
	@RequestMapping(value = "/user/jaga_soaInsert")
	public void jaga_soaInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		JindanVo jindanVo = new JindanVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(jindanVo);
		binder.bind(req);

		jindanVo.setArr_jindan_quest_no(req.getParameterValues("jindan_quest_no"));
		
		String[] jindanAns = new String[Integer.parseInt(jindanVo.getResultCnt())];
		for(int i=1; i<= Integer.parseInt(jindanVo.getResultCnt()); i++){
			jindanAns[i-1] = req.getParameter("ans_"+i);
//			System.out.println(i+":"+req.getParameter("ans_"+i));
		}
		jindanVo.setArr_jindan_ans(jindanAns);
		jindanVo.setIn_user((String)session.getAttribute("USER_ID"));
		jindanVo.setJindan_gbn(jindan_gbn_soa);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
	
		try {
			resultMap.put("result", jagaService.jaga_soaInsert(jindanVo));
			
			// 게시판 글 등록시 담당자에게 메일 전송
			EmailVo emailVo = new EmailVo();
			emailVo.setType(email_type_board);
			List<EmailVo> emailList = new ArrayList<EmailVo>();
			emailList = adminEmailService.emailList(emailVo);
			
			String contentsInfo = "ID:"+(String)session.getAttribute("USER_ID") +"\n";
			//실제 메일 발송
			for(int i=0; i<emailList.size(); i++){
				mailService.sendMail(adminMailAddress, emailList.get(i).getEmail(), "[도원예일]소아불안 체크리스트 제출", contentsInfo + "소아불안 체크리스트 제출");
			}
			
		} catch (Exception e) {
			logger.info("jaga_soaInsert_Exception:"+ e);
		}
		
		getResultJsonPW(resultMap, res);
	}
	@RequestMapping(value = "/user/jaga_hakseub")
	public String jaga_hakseub(ModelMap modelMap) {
		JindanVo jindanVo = new JindanVo();
		jindanVo.setJindan_gbn(jindan_gbn_hakseub);
		modelMap.putAll(jagaService.jaga_hakseub(jindanVo));
		return "/user/jaga_hakseub";
	}
	@RequestMapping(value = "/user/jaga_hakseubInsert")
	public void jaga_hakseubInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		JindanVo jindanVo = new JindanVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(jindanVo);
		binder.bind(req);

		jindanVo.setArr_jindan_quest_no(req.getParameterValues("jindan_quest_no"));
		
		String[] arr_jindan_quest_no = new String[Integer.parseInt(jindanVo.getResultCnt())/3];
		String[] jindanAns = new String[Integer.parseInt(jindanVo.getResultCnt())];
		for(int i=1; i<= Integer.parseInt(jindanVo.getResultCnt())/3; i++){
			jindanAns[i-1] = req.getParameter("ans_"+i);
			arr_jindan_quest_no[i-1] = i+"";
//			jindanAns[i-1] = req.getParameter("ans_"+i) == null? "0" : req.getParameter("ans_"+i);
//			System.out.println(i+":"+req.getParameter("ans_"+i));
		}
		jindanVo.setArr_jindan_quest_no(arr_jindan_quest_no);
		jindanVo.setArr_jindan_ans(jindanAns);
		jindanVo.setIn_user((String)session.getAttribute("USER_ID"));
		jindanVo.setJindan_gbn(jindan_gbn_hakseub);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			resultMap.put("result", jagaService.jaga_hakseubInsert(jindanVo));
			
			// 게시판 글 등록시 담당자에게 메일 전송
			EmailVo emailVo = new EmailVo();
			emailVo.setType(email_type_board);
			List<EmailVo> emailList = new ArrayList<EmailVo>();
			emailList = adminEmailService.emailList(emailVo);
			
			String contentsInfo = "ID:"+(String)session.getAttribute("USER_ID") +"\n";
			//실제 메일 발송
			for(int i=0; i<emailList.size(); i++){
				mailService.sendMail(adminMailAddress, emailList.get(i).getEmail(), "[도원예일]학습/반항성/따돌림 체크리스트 제출", contentsInfo + "학습/반항성/따돌림 체크리스트 제출");
			}
			
		} catch (Exception e) {
			logger.info("jaga_hakseubInsert_Exception:"+ e);
		}
		
		getResultJsonPW(resultMap, res);
	}
	
}
