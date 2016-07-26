package user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.ChiryosaVo;
import common.vo.UserVo;

@Repository
public class IntroDaoImpl implements IntroDao{
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	public List<ChiryosaVo> chiryosaTeacherList(String user_id){
		ModelMap modelMap = new ModelMap();

		List<ChiryosaVo> newResultList = (List<ChiryosaVo>)sqlSession.selectList("intro.intro_chiryosaList", user_id);
		
		return newResultList;
	}
	
	public ModelMap intro_chiryosaList(){
		ModelMap modelMap = new ModelMap();
		
		List<UserVo> newResultList = (List<UserVo>)sqlSession.selectList("intro.chiryosaTeacherList");
		
		for(int i=0; i<newResultList.size(); i++){
			modelMap.put("resultList"+i, chiryosaTeacherList(newResultList.get(i).getUser_id()));
		}
		modelMap.put("resultCnt", newResultList.size());
		
		return modelMap;
	}
}
