package admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.JindanVo;
import common.vo.SearchVo;

@Repository
public class AdminJindanAnsDaoImpl implements AdminJindanAnsDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap jindanAnsList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		List<JindanVo> resultList = (List<JindanVo>)sqlSession.selectList("adminJindanAns.jindanAnsList", searchVo);
		modelMap.put("resultList", resultList);
		modelMap.put("totalCnt", resultList.size());
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap jindanAnsListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminJindanAns.jindanAnsList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<JindanVo> resultList = (List<JindanVo>)sqlSession.selectList("adminJindanAns.jindanAnsList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap jindanAnsDetail(JindanVo jindanVo){
		ModelMap modelMap = new ModelMap();
		List<JindanVo> resultList = new ArrayList<JindanVo>();
		
		JindanVo result = new JindanVo();
		result = (JindanVo)sqlSession.selectOne("adminJindanAns.jindanAnsDetail", jindanVo);
		
		if(jindanVo.getJindan_gbn().equals("1029")){
			resultList = (List<JindanVo>)sqlSession.selectList("adminJindanAns.jindanAnsDetailList_adhd", jindanVo);
		}
		else if(jindanVo.getJindan_gbn().equals("1030")){
			resultList = (List<JindanVo>)sqlSession.selectList("adminJindanAns.jindanAnsDetailList_soa", jindanVo);
		}
		else{
			resultList = (List<JindanVo>)sqlSession.selectList("adminJindanAns.jindanAnsDetailList_hakseub", jindanVo);
		}
		modelMap.put("result", result);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}

	public Integer jindanAnsDelete(JindanVo jindanVo){
		String[] arr_jindanAns_id = jindanVo.getArr_jindanAns_id().split(",");
		int result = 0;
		JindanVo detail = new JindanVo();
		for(int i=0; i<arr_jindanAns_id.length; i++){
			jindanVo.setJindan_ans_id(arr_jindanAns_id[i]);
			detail = (JindanVo)sqlSession.selectOne("adminJindanAns.jindanAnsOne", jindanVo);
			detail.setUp_user(jindanVo.getUp_user());
			result = (Integer)sqlSession.update("adminJindanAns.jindanAnsDelete", detail);
		}
		return result;
	}
	public Integer jindanAnsDeleteCancel(JindanVo jindanVo){
		String[] arr_jindanAns_id = jindanVo.getArr_jindanAns_id().split(",");
		int result = 0;
		JindanVo detail = new JindanVo();
		for(int i=0; i<arr_jindanAns_id.length; i++){
			jindanVo.setJindan_ans_id(arr_jindanAns_id[i]);
			detail = (JindanVo)sqlSession.selectOne("adminJindanAns.jindanAnsOne", jindanVo);
			detail.setUp_user(jindanVo.getUp_user());
			result = (Integer)sqlSession.update("adminJindanAns.jindanAnsDeleteCancel", detail);
		}
		return result;
	}
}
