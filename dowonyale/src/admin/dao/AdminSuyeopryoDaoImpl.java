package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.SearchVo;
import common.vo.SuyeopryoVo;

@Repository
public class AdminSuyeopryoDaoImpl implements AdminSuyeopryoDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap suyeopryoList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminSuyeopryo.suyeopryoList_totalCnt", searchVo);
		modelMap.put("totalCnt", total);
		
		List<SuyeopryoVo> resultList = (List<SuyeopryoVo>)sqlSession.selectList("adminSuyeopryo.suyeopryoList", searchVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap suyeopryoAllList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		List<SuyeopryoVo> resultList = (List<SuyeopryoVo>)sqlSession.selectList("adminSuyeopryo.suyeopryoAllList", searchVo);
		modelMap.put("suyeopryo_resultList", resultList);
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap suyeopryoListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminSuyeopryo.suyeopryoList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<SuyeopryoVo> resultList = (List<SuyeopryoVo>)sqlSession.selectList("adminSuyeopryo.suyeopryoList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	public Integer suyeopryoDuplChk(SearchVo searchVo){
		return (Integer)sqlSession.selectOne("adminSuyeopryo.suyeopryoDuplChk", searchVo);
	}
	
	public Integer suyeopryoInsert(SuyeopryoVo suyeopryoVo){
		return (Integer)sqlSession.insert("adminSuyeopryo.suyeopryoInsert", suyeopryoVo);
	}
	
	public Integer suyeopryoUpdate(SuyeopryoVo suyeopryoVo){
		return (Integer)sqlSession.update("adminSuyeopryo.suyeopryoUpdate", suyeopryoVo);
	}
	public Integer suyeopryoDelete(SuyeopryoVo suyeopryoVo){
		String[] arr_suyeopryo_id = suyeopryoVo.getArr_suyeopryo_id().split(",");
		int result = 0;
		for(int i=0; i<arr_suyeopryo_id.length; i++){
			suyeopryoVo.setSuyeopryo_id(arr_suyeopryo_id[i]);
			result = (Integer)sqlSession.update("adminSuyeopryo.suyeopryoDelete", suyeopryoVo);
		}
		return result;
	}
	public Integer suyeopryoDeleteCancel(SuyeopryoVo suyeopryoVo){
		String[] arr_suyeopryo_id = suyeopryoVo.getArr_suyeopryo_id().split(",");
		int result = 0;
		for(int i=0; i<arr_suyeopryo_id.length; i++){
			suyeopryoVo.setSuyeopryo_id(arr_suyeopryo_id[i]);
			result = (Integer)sqlSession.update("adminSuyeopryo.suyeopryoDeleteCancel", suyeopryoVo);
		}
		return result;
	}
}
