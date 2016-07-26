package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.AdongVo;
import common.vo.ComcdVo;
import common.vo.SearchVo;
import common.vo.UserVo;

@Repository
public class AdminUserDaoImpl implements AdminUserDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap userList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminUser.userList_totalCnt", searchVo);
		modelMap.put("totalCnt", total);
		
		List<UserVo> resultList = (List<UserVo>)sqlSession.selectList("adminUser.userList", searchVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap userListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminUser.userList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<UserVo> resultList = (List<UserVo>)sqlSession.selectList("adminUser.userList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	public Integer userDuplChk(SearchVo searchVo){
		return (Integer)sqlSession.selectOne("adminUser.userDuplChk", searchVo);
	}
	
	public Integer userEmailDuplChk(UserVo userVo){
		return (Integer)sqlSession.selectOne("adminUser.userEmailDuplChk", userVo);
	}
	
	public Integer userInsert(UserVo userVo){
		return (Integer)sqlSession.insert("adminUser.userInsert", userVo);
	}
	
	public Integer userUpdate(UserVo userVo){
		return (Integer)sqlSession.update("adminUser.userUpdate", userVo);
	}
	public Integer userDelete(UserVo userVo){
		String[] arr_user_id = userVo.getArr_user_id().split(",");
		int result = 0;
		for(int i=0; i<arr_user_id.length; i++){
			userVo.setUser_id(arr_user_id[i]);
			result = (Integer)sqlSession.update("adminUser.userDelete", userVo);
		}
		return result;
	}
	public Integer userDeleteCancel(UserVo userVo){
		String[] arr_user_id = userVo.getArr_user_id().split(",");
		int result = 0;
		for(int i=0; i<arr_user_id.length; i++){
			userVo.setUser_id(arr_user_id[i]);
			result = (Integer)sqlSession.update("adminUser.userDeleteCancel", userVo);
		}
		return result;
	}
	public List<ComcdVo> com_cd_list(String high_cd_id){
		List<ComcdVo> resultList = (List<ComcdVo>)sqlSession.selectList("adminUser.com_cd_list", high_cd_id);
		return resultList;
	}
	public List<ComcdVo> com_cd_list_desc(String high_cd_id){
		List<ComcdVo> resultList = (List<ComcdVo>)sqlSession.selectList("adminUser.com_cd_list_desc", high_cd_id);
		return resultList;
	}
	public List<UserVo> com_teacher_list(){
		List<UserVo> resultList = (List<UserVo>)sqlSession.selectList("adminUser.com_teacher_list");
		return resultList;
	}
	public List<AdongVo> com_adong_list(){
		List<AdongVo> resultList = (List<AdongVo>)sqlSession.selectList("adminUser.com_adong_list");
		return resultList;
	}
}
