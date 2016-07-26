package user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.SearchVo;
import common.vo.UserVo;

@Repository
public class LoginDaoImpl implements LoginDao{
	
	private SqlSession sqlSession;
	//private UserVo userVo = new UserVo();
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

	public ModelMap getLogin(UserVo userVo)
	{
		ModelMap modelMap = new ModelMap();

		UserVo returnValue = (UserVo)sqlSession.selectOne("login.select_lgoin", userVo);
		modelMap.put("returnValue", returnValue);
		
		return modelMap;
	}

	public Integer userDuplChk(SearchVo searchVo){
		return (Integer)sqlSession.selectOne("login.userDuplChk", searchVo);
	}
	
	public Integer userEmailDuplChk(UserVo userVo) {
		return (Integer)sqlSession.selectOne("login.userEmailDuplChk", userVo);
	}
	
	public Integer userInsert(UserVo userVo){
		return (Integer)sqlSession.insert("login.userInsert", userVo);
	}
	
	public Integer userUpdate(UserVo userVo){
		return (Integer)sqlSession.update("login.userUpdate", userVo);
	}
	
	public ModelMap idpwSendMail(UserVo userVo){
		ModelMap modelMap = new ModelMap();
		UserVo result = (UserVo)sqlSession.selectOne("login.getUserId", userVo);
		modelMap.put("result", result);
		return modelMap;
	}
	
	public Integer updateImsiPw(UserVo userVo){
		return (Integer)sqlSession.update("login.updateImsiPw", userVo);
	}
	
	
	
	
	public Integer userDelete(UserVo userVo){
		String[] arr_user_id = userVo.getArr_user_id().split(",");
		int result = 0;
		for(int i=0; i<arr_user_id.length; i++){
			userVo.setUser_id(arr_user_id[i]);
			result = (Integer)sqlSession.update("login.userDelete", userVo);
		}
		return result;
	}
	
	public ModelMap userDetail(UserVo userVo){
		ModelMap modelMap = new ModelMap();
		
		UserVo result = (UserVo)sqlSession.selectOne("login.userDetail", userVo);
		modelMap.put("result", result);
		
		return modelMap;
	}

	@Override
	public UserVo login_portal(UserVo userVo) {
		return (UserVo) sqlSession.selectOne("login.login_portal", userVo);
	}

	@Override
	public Integer updateLoginInfo(UserVo userVo) {
		return (Integer)sqlSession.selectOne("login.updateLoginInfo", userVo);
	}

}
