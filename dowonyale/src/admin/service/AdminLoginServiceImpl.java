package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminLoginDao;

import common.vo.UserVo;

@Service
public class AdminLoginServiceImpl implements AdminLoginService{
	
	@Autowired
	private AdminLoginDao adminLoginDao;
	
	public ModelMap getLogin(UserVo userVo){
		return (ModelMap)adminLoginDao.getLogin(userVo);
	}
	public void updateLoginInfo(String user_id){
		adminLoginDao.updateLoginInfo(user_id);
	}
	
}
