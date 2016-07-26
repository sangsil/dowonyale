package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.ComcdVo;
import common.vo.SearchVo;

@Repository
public class AdminComcdDaoImpl implements AdminComcdDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap comcdList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminComcd.comcdList_totalCnt", searchVo);
		modelMap.put("totalCnt", total);
		
		List<ComcdVo> resultList = (List<ComcdVo>)sqlSession.selectList("adminComcd.comcdList", searchVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap comcdListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminComcd.comcdList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<ComcdVo> resultList = (List<ComcdVo>)sqlSession.selectList("adminComcd.comcdList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	public Integer comcdDuplChk(SearchVo searchVo){
		return (Integer)sqlSession.selectOne("adminComcd.comcdDuplChk", searchVo);
	}
	
	public Integer comcdInsert(ComcdVo comcdVo){
		return (Integer)sqlSession.insert("adminComcd.comcdInsert", comcdVo);
	}
	
	public Integer comcdUpdate(ComcdVo comcdVo){
		return (Integer)sqlSession.update("adminComcd.comcdUpdate", comcdVo);
	}
	public Integer comcdDelete(ComcdVo comcdVo){
		String[] arr_comcd_id = comcdVo.getArr_cd_id().split(",");
		int result = 0;
		for(int i=0; i<arr_comcd_id.length; i++){
			comcdVo.setCd_id(arr_comcd_id[i]);
			result = (Integer)sqlSession.update("adminComcd.comcdDelete", comcdVo);
		}
		return result;
	}
	public Integer comcdDeleteCancel(ComcdVo comcdVo){
		String[] arr_comcd_id = comcdVo.getArr_cd_id().split(",");
		int result = 0;
		for(int i=0; i<arr_comcd_id.length; i++){
			comcdVo.setCd_id(arr_comcd_id[i]);
			result = (Integer)sqlSession.update("adminComcd.comcdDeleteCancel", comcdVo);
		}
		return result;
	}

	
	
	@SuppressWarnings("unchecked")
	public ModelMap comcdDetail(String cd_id){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminComcd.comcdDetailTotalCnt", cd_id);
		modelMap.put("totalCnt", total);
		ComcdVo result = (ComcdVo)sqlSession.selectOne("adminComcd.comcdDetail", cd_id);
		modelMap.put("result", result);
		List<ComcdVo> resultList = (List<ComcdVo>)sqlSession.selectList("adminComcd.comcdDetailList", cd_id);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
}
