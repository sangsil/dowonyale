package user.dao;

import org.springframework.ui.ModelMap;

import common.vo.SearchVo;
import common.vo.UserVo;

public interface LoginDao {
	
	ModelMap getLogin(UserVo userVo);
	
	public Integer userDuplChk(SearchVo searchVo);
	public Integer userEmailDuplChk(UserVo userVo);
	public Integer userInsert(UserVo userVo);
	public Integer userUpdate(UserVo userVo);
	public ModelMap idpwSendMail(UserVo userVo);
	public Integer updateImsiPw(UserVo userVo);
	
	public Integer userDelete(UserVo userVo);
	public ModelMap userDetail(UserVo userVo);
	
	
	public UserVo login_portal(UserVo userVo);
	public Integer updateLoginInfo(UserVo userVo);
	
}
