package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.AdongVo;
import common.vo.SearchVo;

@Repository
public class AdminAdongDaoImpl implements AdminAdongDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap adongList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminAdong.adongList_totalCnt", searchVo);
		modelMap.put("totalCnt", total);
		
		List<AdongVo> resultList = (List<AdongVo>)sqlSession.selectList("adminAdong.adongList", searchVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap adongListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminAdong.adongList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<AdongVo> resultList = (List<AdongVo>)sqlSession.selectList("adminAdong.adongList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	public Integer adongDuplChk(SearchVo searchVo){
		return (Integer)sqlSession.selectOne("adminAdong.adongDuplChk", searchVo);
	}
	
	public Integer adongInsert(AdongVo adongVo){
		return (Integer)sqlSession.insert("adminAdong.adongInsert", adongVo);
	}
	
	public Integer adongUpdate(AdongVo adongVo){
		return (Integer)sqlSession.update("adminAdong.adongUpdate", adongVo);
	}
	public Integer adongDelete(AdongVo adongVo){
		String[] arr_adong_id = adongVo.getArr_adong_id().split(",");
		int result = 0;
		for(int i=0; i<arr_adong_id.length; i++){
			adongVo.setAdong_id(arr_adong_id[i]);
			result = (Integer)sqlSession.update("adminAdong.adongDelete", adongVo);
		}
		return result;
	}
	public Integer adongDeleteCancel(AdongVo adongVo){
		String[] arr_adong_id = adongVo.getArr_adong_id().split(",");
		int result = 0;
		for(int i=0; i<arr_adong_id.length; i++){
			adongVo.setAdong_id(arr_adong_id[i]);
			result = (Integer)sqlSession.update("adminAdong.adongDeleteCancel", adongVo);
		}
		return result;
	}
}
