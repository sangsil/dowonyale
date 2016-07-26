package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.UserVo;

public interface AdminLoginDao {
	
	ModelMap getLogin(UserVo userVo);
	void updateLoginInfo(String id);
}
