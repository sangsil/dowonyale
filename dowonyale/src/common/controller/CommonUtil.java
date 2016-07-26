package common.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommonUtil {

	private static final Logger logger = LoggerFactory.getLogger(CommonUtil.class);
	
	/**
	 * 성공값 리턴
	 * @param json
	 */
	public static void getReturnCodeSuc(JSONObject json){
		json.put("rCode", "0000");
		json.put("rMsg", "성공");
	}
	
	/**
	 * 오류는 아니지만 특별한 메세지가 필요할 경우
	 */
	public static void getReturnCodeSuc(JSONObject json, String rMsg){
		json.put("rCode", "1111");
		json.put("rMsg", rMsg);
	}
	
	/**
	 * 실패 값 리턴
	 * @param json
	 */
	public static void getReturnCodeFail(JSONObject json){
		json.put("rCode", "9999");
		json.put("rMsg", "실패");
	}
	
	/**
	 * Exception 내용
	 * @param json
	 */	
	public static void getReturnCodeFail(JSONObject json, Exception e){
		json.put("rCode", "9999");
		json.put("rMsg", "실패");
		json.put("rReason", e.toString());
		logger.info("FAIL_PROCESS:"+json.toJSONString());
	}

	/**
	 * 실패사유전
	 * @param json
	 * @param str
	 */
	public static void getReturnCodeFail(JSONObject json, String str){
		json.put("rCode", "9999");
		json.put("rMsg", "실패");
		json.put("rReason", str);
		logger.info("FAIL_PROCESS:"+json.toJSONString());
	}
	
	/**
	 * 파일용량제한 10M
	 * @param json
	 */
	public static void getReturnCodeFailFileSize(JSONObject json){
		json.put("rCode", "8887");
		json.put("rMsg", "10M 용량제한");
	}

	/**
	 * 실패 값 리턴
	 * @param json
	 */
	public static void getReturnCodeNotFile(JSONObject json){
		json.put("rCode", "8888");
		json.put("rMsg", "파일 첨부 없음");
	}
	
	/**
	 * 현재 년 가져오기
	 * @return
	 */
	public static String getNowYear(){
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy", Locale.KOREA );
		Date currentTime = new Date ( );
		String nowYear = formatter.format ( currentTime );
		return nowYear;
	}
	
	/**
	 * 현재날짜 
	 * @return
	 */
	public static String getNowDate(){
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date ( );
		String nowDate = formatter.format ( currentTime );
		return nowDate;
	}
	
	/**
	 * client ip 가져오기
	 * @param request
	 * @return
	 */
	public static String getIpAddress(HttpServletRequest request){
		String clientIp = request.getHeader("HTTP_X_FORWARDED_FOR");
		if(null == clientIp || clientIp.length() == 0 || clientIp.toLowerCase().equals("unknown")){
		  clientIp = request.getHeader("REMOTE_ADDR");
		}
		 
		if(null == clientIp || clientIp.length() == 0 || clientIp.toLowerCase().equals("unknown")){
			clientIp = request.getRemoteAddr();
		}
		return clientIp;
	}
	
	/**
	 * 브라우저 확인
	 * @param request
	 * @return
	 */
	public static String getUserBrowser(HttpServletRequest request){
		String userBrowser = "etc";
		String userAgent = request.getHeader("user-agent").toLowerCase();
		
		// IE
		if (userAgent.indexOf("trident") > 0 || userAgent.indexOf("msie") > 0){
			
	    	if (userAgent.indexOf("Trident/7.0") > -1) {
	    		userBrowser = "ie11";
			}
	    	else if (userAgent.indexOf("MSIE 10") > -1) {
	    		userBrowser = "ie10";
			}
			else if (userAgent.indexOf("MSIE 9") > -1) {
				userBrowser = "ie9";
			}
			else if (userAgent.indexOf("MSIE 8") > -1) {
				userBrowser = "ie8";
			}else{
				userBrowser = "ie";
			}
		}
		
        //other
        if (userAgent.indexOf("chrome") != -1) userBrowser = "chrome";
        if (userAgent.indexOf("opera") != -1) userBrowser = "opera";
        if (userAgent.indexOf("staroffice") != -1) userBrowser = "staroffice";
        if (userAgent.indexOf("webtv") != -1) userBrowser = "webtv";
        if (userAgent.indexOf("beonex") != -1) userBrowser = "beonex";
        if (userAgent.indexOf("chimera") != -1) userBrowser = "chimera";
        if (userAgent.indexOf("netpositive") != -1) userBrowser = "netpositiv";
        if (userAgent.indexOf("phoenix") != -1) userBrowser = "phoenix";
        if (userAgent.indexOf("firefox") != -1) userBrowser = "firefox";
        if (userAgent.indexOf("safari") != -1) userBrowser = "safari";
        if (userAgent.indexOf("skipstone") != -1) userBrowser = "skipstone";
        if (userAgent.indexOf("netscape") != -1) userBrowser = "netscape";
//        if (userAgent.indexOf("mozilla/5.0") != -1) userBrowser = "mozilla/5.0";
		
		
		return userBrowser;
	}
	
	/**
	 * 네로아 - STATE 코드 생
	 * @return
	 */
	public static String generateState(){
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}
	
}
