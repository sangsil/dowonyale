package admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.SearchVo;
import common.vo.SuyeopVo;
import common.vo.SuyeopryoVo;
import common.vo.VoucherVo;

@Repository
public class AdminSuyeopDaoImpl implements AdminSuyeopDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap suyeopList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminSuyeop.suyeopList_totalCnt", searchVo);
		modelMap.put("totalCnt", total);
		
		List<SuyeopVo> resultList = (List<SuyeopVo>)sqlSession.selectList("adminSuyeop.suyeopList", searchVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap suyeopAllList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		List<SuyeopVo> resultList = (List<SuyeopVo>)sqlSession.selectList("adminSuyeop.suyeopAllList", searchVo);
		modelMap.put("suyeop_resultList", resultList);
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap suyeopListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminSuyeop.suyeopList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<SuyeopVo> resultList = (List<SuyeopVo>)sqlSession.selectList("adminSuyeop.suyeopList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	public Integer suyeopDuplChk(SearchVo searchVo){
		return (Integer)sqlSession.selectOne("adminSuyeop.suyeopDuplChk", searchVo);
	}
	
	public Integer suyeopInsert(SuyeopVo suyeopVo){
		return (Integer)sqlSession.insert("adminSuyeop.suyeopInsert", suyeopVo);
	}
	
	public Integer suyeopUpdate(SuyeopVo suyeopVo){
		return (Integer)sqlSession.update("adminSuyeop.suyeopUpdate", suyeopVo);
	}
	public Integer suyeopDelete(SuyeopVo suyeopVo){
		String[] arr_suyeop_id = suyeopVo.getArr_suyeop_id().split(",");
		int result = 0;
		for(int i=0; i<arr_suyeop_id.length; i++){
			suyeopVo.setSuyeop_id(arr_suyeop_id[i]);
			result = (Integer)sqlSession.update("adminSuyeop.suyeopDelete", suyeopVo);
		}
		return result;
	}
	public Integer suyeopDeleteCancel(SuyeopVo suyeopVo){
		String[] arr_suyeop_id = suyeopVo.getArr_suyeop_id().split(",");
		int result = 0;
		for(int i=0; i<arr_suyeop_id.length; i++){
			suyeopVo.setSuyeop_id(arr_suyeop_id[i]);
			result = (Integer)sqlSession.update("adminSuyeop.suyeopDeleteCancel", suyeopVo);
		}
		return result;
	}
	public VoucherVo suyeopSelectAdong(String adong_id){
		VoucherVo result = (VoucherVo)sqlSession.selectOne("adminSuyeop.suyeopSelectAdong", adong_id);
		return result;
	}
	public SuyeopryoVo suyeopSelectSuyeopryo(String suyeop_gubun, String gwamok){
		HashMap paramMap = new HashMap();
		paramMap.put("suyeop_gubun", suyeop_gubun);
		paramMap.put("gwamok", gwamok);
		SuyeopryoVo result = (SuyeopryoVo)sqlSession.selectOne("adminSuyeop.suyeopSelectSuyeopryo", paramMap);
		return result;
	}
}
