package admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.UserVo;

@Repository
public class AdminLoginDaoImpl implements AdminLoginDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	public ModelMap getLogin(UserVo userVo){
		ModelMap modelMap = new ModelMap();
		
		UserVo resultValue = (UserVo) sqlSession.selectOne("adminLogin.getLogin", userVo);
		modelMap.put("resultValue", resultValue);
		return modelMap;
	}
	
	/* 로그인시 업데이트*/
	public void updateLoginInfo(String user_id){
		sqlSession.update("adminLogin.updateLoginInfo", user_id);
	}
}
