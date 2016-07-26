package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.UserVo;

public interface AdminLoginService {
	
	ModelMap getLogin(UserVo userVo);
	/* 로그인시 카운트,날짜 업데이트*/
	void updateLoginInfo(String user_id);
	
}
