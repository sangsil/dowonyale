package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.EmailVo;
import common.vo.LogVo;
import common.vo.SearchVo;

@Repository
public class AdminEmailDaoImpl implements AdminEmailDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

	@Override
	public List<EmailVo> emailList(EmailVo emailVo) {
		List<EmailVo> resultList = (List<EmailVo>)sqlSession.selectList("adminEmail.emailList", emailVo);
		return resultList;
	}
	
}
