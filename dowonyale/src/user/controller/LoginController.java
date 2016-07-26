package user.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import user.service.LoginService;
import admin.service.AdminLoginService;
import common.controller.BaseController;
import common.controller.CommonUtil;
import common.controller.HttpsClientWithoutValidation;
import common.controller.LoginUtil;
import common.controller.MailService;
import common.vo.SearchVo;
import common.vo.UserVo;

@Controller
public class LoginController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private MailService mailService;

	@Autowired
	private LoginService loginService;
	
	@Autowired
    private AdminLoginService adminLoginService;
	
	@Value("#{config['ADMIN_MAILE_ADDRESS']}") String adminMailAddress;
	
	//로그인기관구분 
	@Value("#{config['LOGIN_GBN_00']}") String login_gbn_00;
	@Value("#{config['LOGIN_GBN_01']}") String login_gbn_01;
	@Value("#{config['LOGIN_GBN_02']}") String login_gbn_02;
	@Value("#{config['LOGIN_GBN_03']}") String login_gbn_03;
	@Value("#{config['LOGIN_GBN_04']}") String login_gbn_04;
	@Value("#{config['LOGIN_GBN_05']}") String login_gbn_05;
	//네로아 설정
	@Value("#{config['NAVER_LOGIN_URL']}") String naver_login_url;
	@Value("#{config['NAVER_LOGIN_CLIENT_ID']}") String naver_login_client_id;
	@Value("#{config['NAVER_LOGIN_REDIRECT_URI']}") String naver_login_redirect_uri;
	@Value("#{config['NAVER_LOGIN_CLIENT_SECRET']}") String naver_login_client_secret;
	@Value("#{config['NAVER_LOGIN_XML_RESULT']}") String naver_login_xml_result;
	@Value("#{config['NAVER_LOGIN_XML_RESPONSE']}") String naver_login_xml_response;
	
	@RequestMapping(value = "/login")
    public String index() {
        return "/user/login";
    }
	
	/**
	 * 자체로그인 
	 * @param userVo
	 * @param modelMap
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/user/login", method=RequestMethod.POST)
    public @ResponseBody String signin(UserVo userVo, ModelMap modelMap, HttpSession session) {
		String loginOk = "N";
		
		session.setAttribute("LOGIN_GBN", login_gbn_00);
		
		userVo.setLogin_gbn(login_gbn_00);
        modelMap.putAll(loginService.getLogin(userVo));
		if(modelMap.get("returnValue") != null)
		{
//			session.setAttribute("ID", ((UserVo)modelMap.get("resultValue")).getId());
			session.setAttribute("USER_ID", ((UserVo)modelMap.get("returnValue")).getUser_id());
			session.setAttribute("USER_NAME", ((UserVo)modelMap.get("returnValue")).getUser_name());
			session.setAttribute("USER_TYPE", ((UserVo)modelMap.get("returnValue")).getUser_type());
			loginOk = "Y";
			
			loginService.updateLoginInfo(userVo);
		}
        return loginOk;
    }
    
	/**
	 * 로그아웃 
	 * @param userVo
	 * @param modelMap
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/user/logout")    
    public @ResponseBody String signout(UserVo userVo, ModelMap modelMap, HttpSession session) {
		String result = "N";
		try {
			logger.info("LOG OUT LOGIN_GBN:"+session.getAttribute("LOGIN_GBN").toString());
			// https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&access_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLnaoETis9YzjfnorlQwEisqemfpKHUq2gY&service_provider=NAVER
			// ===================================================================================================
			// 네로아-접근 토큰 삭제 요청
			//https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=jyvqXeaVOVmV&client_
			//secret=527300A0_COq1_XV33cf&access_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLnaoETis9Yzjfn
			//orlQwEisqemfpKHUq2gY&service_provider=NAVER
			//https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=jyvqXeaVOVmV&access_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLnaoETis9YzjfnorlQwEisqemfpKHUq2gY	&client_secret=527300A0_COq1_XV33cf&service_provider=NAVER
			//https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=aDbtAQP5ImTbn5MWqFfT&secret=qxBqZHqD8B&access_token=AAAAOK55G+reNt8oay7pOGkufLonQLGIr15lqC4rKe6cT7e7Ui7T8JtCdxJotyTwzQI9tNJjhQ1G4oma6eiKTPF3gHA=&service_provider=NAVER
			
			//네이버의경우 토큰삭제요청 
			if(session.getAttribute("LOGIN_GBN").toString().equals(login_gbn_01)){
				StringBuffer naver_req_url = new StringBuffer();
				naver_req_url.append(naver_login_url);
				naver_req_url.append("/token");
				naver_req_url.append("?grant_type=delete");
				naver_req_url.append("&client_id=");
				naver_req_url.append(naver_login_client_id);
				naver_req_url.append("&access_token=");
				naver_req_url.append(session.getAttribute("ACCESS_TOKEN").toString());
				naver_req_url.append("&client_secret=");
				naver_req_url.append(naver_login_client_secret);
				naver_req_url.append("&service_provider=NAVER");
				
				logger.info("RESULT_naver_req_url:"+naver_req_url.toString());
				
				StringBuffer delete = new StringBuffer();
				HttpsClientWithoutValidation httpsClientWithoutValidation = new HttpsClientWithoutValidation();
				delete = httpsClientWithoutValidation.getHttps(naver_req_url.toString());
				logger.info("RESULT:"+delete.toString());
			}
			result = "Y";
		} catch (Exception e) {
			result = "N";
			logger.info("LOG OUT EXCEPTION:"+e.toString());
		} finally {
			logger.info("LOG OUT RESULT:"+result);
			session.invalidate();
		}
        return result;
    }

	/**
	 * 아이디 중복 체크
	 * @param req
	 * @param res
	 * @throws IOException
	 */
	@RequestMapping(value = "/user/userDuplChk")
	public void userDuplChk(HttpServletRequest req, HttpServletResponse res) throws IOException{
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", loginService.userDuplChk(searchVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	/**
	 * 이메일중복확인 
	 * @param req
	 * @param res
	 * @throws IOException
	 */
	@RequestMapping(value = "/user/userEmailDuplChk")
	public void userEmailDuplChk(HttpServletRequest req, HttpServletResponse res) throws IOException{
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", loginService.userEmailDuplChk(userVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	/**
	 * 회원가
	 * @param req
	 * @param res
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping(value = "/user/userInsert")
	public void userInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);
		
		userVo.setIn_user((String)session.getAttribute("USER_ID"));
		userVo.setLogin_gbn(login_gbn_00);
		userVo.setUser_type("U");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", loginService.userInsert(userVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	/**
	 * 회원정보수
	 * @param req
	 * @param res
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping(value = "/user/userUpdate")
	public void userUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);
		
		userVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", loginService.userUpdate(userVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	/**
	 * 메일전
	 * @param req
	 * @param res
	 * @param modelMap
	 * @throws IOException
	 */
	@RequestMapping(value = "/user/idpwSendMail")
	public void idpwSendMail(HttpServletRequest req, HttpServletResponse res, ModelMap modelMap) throws IOException{
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);
		
		String resultStr = "N";
		//
		UserVo resultUserVo = new UserVo();
		modelMap = loginService.idpwSendMail(userVo);
		resultUserVo = (UserVo) modelMap.get("result");
		
		String imsiPw = "";
		Random random = new Random();
		String contnts = "";
		if(modelMap.get("result") != null){
			
			try {
				
				//8자리 랜덤숫자 생성
				imsiPw = Integer.toString(random.nextInt(10000000));
				contnts = "안녕하세요.\n" + resultUserVo.getUser_name() + " 님의 임시 비밀번호는 " + imsiPw + "입니다.\n임시비밀번호로 로그인 할 수 있으며\n로그인후에 비밀번호를 수정해 주세요.";
				userVo.setUser_pw(imsiPw);
				userVo.setUser_id(resultUserVo.getUser_id());
				userVo.setUp_user(resultUserVo.getUser_id());
				loginService.updateImsiPw(userVo);
				
				//실제 메일 발송
				mailService.sendMail(adminMailAddress, resultUserVo.getEmail1()+"@"+resultUserVo.getEmail2(), "도원예일언어심리센터-임시비밀번호 입니다.", contnts);
				resultStr = "Y";
			} catch (Exception e) {
				// TODO: handle exception
				resultStr = e.toString();
			}
			
		}
		modelMap.put("resultStr", resultStr);
		getResultJsonPW(modelMap, res);
	}
	
	
	
	@RequestMapping(value = "/user/userDelete")
	public void userDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);

		userVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", loginService.userDelete(userVo));
		getResultJsonPW(resultMap, res);
	}
	
	
	@RequestMapping(value = "/user/userDetail")
	public void userDetail(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);
		
		userVo.setUser_id((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.putAll(loginService.userDetail(userVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	
	/**
	 * 네이버 인증페이지 호출(인증코드요청)
	 * @param userDto
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/user/form_naver")
	@ResponseBody
	public JSONObject form_naver(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);
		
		JSONObject json = new JSONObject();
		
		try {
			session.setAttribute("LOGIN_GBN", login_gbn_01);
			//네로아 요청URL
			//"https://nid.naver.com/oauth2.0/authorize?client_id={클라이언트 아이디}&response_type=code&redirect_uri={개발자 센터에 등록한 콜백 URL(URL 인코딩)}&state={상태 토큰}";
			// 상태 토큰으로 사용할 랜덤 문자열 생성
			String state = CommonUtil.generateState();
			session.setAttribute("NAVER_STATE", state);
			// 세션 또는 별도의 저장 공간에 상태 토큰을 저장
			String naver_login_redirect_uri_enc = URLEncoder.encode(naver_login_redirect_uri, "UTF-8");
			StringBuffer naver_req_url = new StringBuffer();
			naver_req_url.append(naver_login_url);
			naver_req_url.append("/authorize");
			naver_req_url.append("?client_id=");
			naver_req_url.append(naver_login_client_id);
			naver_req_url.append("&response_type=code&redirect_uri=");
			naver_req_url.append(naver_login_redirect_uri_enc);
			naver_req_url.append("&state=");
			naver_req_url.append(state);
			
			json.put("naver_req_url", naver_req_url.toString());
			CommonUtil.getReturnCodeSuc(json);
		} catch (Exception e) {
			CommonUtil.getReturnCodeFail(json, e);
		}
		
		logger.info(json.toJSONString());
		return json;
	}
	
	@RequestMapping(value="/user/loginCallback")
	public ModelAndView loginCallback(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		JSONObject json = new JSONObject();
		LoginUtil loginUtil = new LoginUtil();
		UserVo UserVo = new UserVo();
		HashMap<String, String> prop = new HashMap<String, String>();
		
		logger.info("===================================================================================================");
		logger.info("로그인 콜백 들어왔음");
		logger.info("===================================================================================================");
		
		try {
			//네이버로그인
			if(session.getAttribute("LOGIN_GBN") != null){
				
				if(session.getAttribute("LOGIN_GBN").toString().equalsIgnoreCase(login_gbn_00)){
					logger.info("MEE 로그인");
				}else if(session.getAttribute("LOGIN_GBN").toString().equalsIgnoreCase(login_gbn_01)){
					//네이버 인증최종받기와 회원정보 세팅
					prop.put("naver_login_url", naver_login_url);
					prop.put("naver_login_client_id", naver_login_client_id);
					prop.put("naver_login_redirect_uri", naver_login_redirect_uri);
					prop.put("naver_login_client_secret", naver_login_client_secret);
					prop.put("naver_login_xml_result", naver_login_xml_result);
					prop.put("naver_login_xml_response", naver_login_xml_response);
					loginUtil.naverCallback(prop, request, response, session);
				}else if(session.getAttribute("LOGIN_GBN").toString().equalsIgnoreCase(login_gbn_03)){
					//구글
//					//http://localhost:8080/common/login/loginCallback.mee?code=4/NkNpmu4qqm4THThXh9ltHi2bh1SFFLX_d4QBMgodjbo&authuser=0&session_state=c57c8c8cc4ed5eebb8e507a4dbece06ac5cc655b..2c44&prompt=consent#
//					String code = request.getParameter("code");
//					logger.info("GOOGLE_LOGIN START!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//					logger.info("code:"+code);
//					OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//					logger.info("1111111111");
//					AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null);
//					logger.info("22222222");
//					String accessToken = accessGrant.getAccessToken();
//					logger.info("33333333");
//					Long expireTime =  accessGrant.getExpireTime();
//					logger.info("4444444444");
//					if (expireTime != null && expireTime < System.currentTimeMillis()) {
//						logger.info("5555555");
//						accessToken = accessGrant.getRefreshToken();
//						logger.info("accessToken is expired. refresh token = {}" , accessToken);
//					}
//					logger.info("6666666");
//					
//					Connection<Google>connection = googleConnectionFactory.createConnection(accessGrant);
//					Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
//							
//					PlusOperations plusOperations = google.plusOperations();
//					Person person = plusOperations.getGoogleProfile();
					
//					logger.info("person:"+person.getAboutMe());
				}else if(session.getAttribute("LOGIN_GBN").toString().equalsIgnoreCase(login_gbn_05)){
					//트위
					//http://localhost:8080/twitter-response.jsp?oauth_token=qwd1AAAWeDHAAABUEXVgyE&oauth_verifier=Ae12e12Xsu5VIWhs0wq2
//					loginUtil.twitterCallback(request, response, session);
					
				}else{throw new Exception("LOGIN_GBN 세션 값이 없음");}
				
			}else{
				
				String param_login_gbn = request.getParameter("param_login_gbn");
				
				//카카오톡로그인 
				if(!param_login_gbn.isEmpty() && param_login_gbn != null){
					if(param_login_gbn.equalsIgnoreCase(login_gbn_02)){
						logger.info("통하였느냐!!!!!!:"+login_gbn_02);
						session.setAttribute("LOGIN_GBN", login_gbn_02);
						loginUtil.kakaoCallback(request, response, session);
					}else if(param_login_gbn.equalsIgnoreCase(login_gbn_04)){
						logger.info("통하였느냐!!!!!!:"+login_gbn_04);
						session.setAttribute("LOGIN_GBN", login_gbn_04);
						loginUtil.facebookCallback(request, response, session);
					}else if(param_login_gbn.equalsIgnoreCase(login_gbn_00)){
						logger.info("통하였느냐!!!!!!:"+login_gbn_00);
						
					}
				}else{
					throw new Exception("param_login_gbn 이 없음");
				}
			}
			
			
			//로그인 히스토리 저장할 빈 데이타생성 
			UserVo.setLogin_gbn(session.getAttribute("LOGIN_GBN").toString());
			UserVo.setUser_id(session.getAttribute("LOGIN_GBN").toString() + "_" + session.getAttribute("P_ID").toString());
			UserVo.setUser_name(session.getAttribute("LOGIN_GBN").toString() + "_" + session.getAttribute("P_ID").toString());
			UserVo.setUser_type(session.getAttribute("USER_TYPE").toString());
			UserVo.setP_id(session.getAttribute("P_ID").toString());
			UserVo.setP_email(session.getAttribute("P_EMAIL").toString());
			UserVo.setP_nickname(session.getAttribute("P_NICKNAME").toString());
			UserVo.setP_age(session.getAttribute("P_AGE").toString());
			UserVo.setP_gender(session.getAttribute("P_GENDER").toString());
			UserVo.setP_name(session.getAttribute("P_NAME").toString());
			UserVo.setP_birthday(session.getAttribute("P_BIRTHDAY").toString());
//			CommonUtil.setInUserInfo(request, UserVo);

			//로그인 회원 체크
			UserVo user = new UserVo();
			user = loginService.login_portal(UserVo);
			
			// 등록된 회원이 아니라면 회원정보 저장
			if(user == null){
				try {
					loginService.userInsert(UserVo);
					user = loginService.login_portal(UserVo);
				} catch (Exception e) {
					throw new Exception("회원 정보 저장 실패",e);
				}
				
			}
			
			if(user.getUser_id() != null){
				
				// 회원정보 세션 저장
				session.setAttribute("USER_ID", user.getUser_id());
				// 회원권한
				session.setAttribute("USER_YTPE", user.getUser_type());
				// 본 사이트에서 활동할 유저 이름(고유한 이름이어야함)
				session.setAttribute("USER_NAME", user.getUser_name());
				
				// 로그인 한 로그인 정보 업데이트
				loginService.updateLoginInfo(user);
			}else{
				throw new Exception("회원 정보 저장 실패!");
			}
			
			
		} catch (Exception e) {
			logger.info("로그인 전체적인 실패");
//			CommonUtil.getReturnCodeFail(json, e);
		}
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
}

