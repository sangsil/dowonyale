package user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import user.dao.LoginDao;
import common.vo.SearchVo;
import common.vo.UserVo;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDao loginDao;
	
	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	public ModelMap getLogin(UserVo userVo) {
		return loginDao.getLogin(userVo);
	}
	
	public Integer userDuplChk(SearchVo searchVo){
		return (Integer)loginDao.userDuplChk(searchVo);
	}
	
	public Integer userEmailDuplChk(UserVo userVo) {
		return (Integer)loginDao.userEmailDuplChk(userVo);
	}
	
	public Integer userInsert(UserVo userVo){
		return (Integer)loginDao.userInsert(userVo);
	}

	public Integer userUpdate(UserVo userVo){
		return (Integer)loginDao.userUpdate(userVo);
	}
	
	public ModelMap idpwSendMail(UserVo userVo){
		return loginDao.idpwSendMail(userVo);
	}
	
	public Integer updateImsiPw(UserVo userVo){
		return loginDao.updateImsiPw(userVo);
	}
	
	
	
	
	public Integer userDelete(UserVo userVo){
		return (Integer)loginDao.userDelete(userVo);
	}
	
	public ModelMap userDetail(UserVo userVo){
		return loginDao.userDetail(userVo);
	}

	@Override
	public UserVo login_portal(UserVo userVo) {
		return loginDao.login_portal(userVo);
	}

	@Override
	public Integer updateLoginInfo(UserVo userVo) {
		return (Integer)loginDao.updateLoginInfo(userVo);
	}

}
