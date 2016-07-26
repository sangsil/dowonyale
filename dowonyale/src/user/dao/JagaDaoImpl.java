package user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.JindanVo;

@Repository
public class JagaDaoImpl implements JagaDao{
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	public ModelMap jaga_adhd(JindanVo jindanVo){
		ModelMap modelMap = new ModelMap();
		List<JindanVo> resultList = (List<JindanVo>)sqlSession.selectList("jaga.jaga_adhd", jindanVo);
		modelMap.put("resultList", resultList);
		modelMap.put("resultCnt", resultList.size());
		return modelMap;
	}
	public int jaga_adhdInsert(JindanVo jindanVo){
		int result = 0;
		String ans_num = getAns_num(jindanVo);
		jindanVo.setAns_num(ans_num);
		for(int i=0; i<jindanVo.getArr_jindan_quest_no().length; i++){
			jindanVo.setJindan_quest_no(jindanVo.getArr_jindan_quest_no()[i]);
			jindanVo.setAns_val(jindanVo.getArr_jindan_ans()[i]);
			sqlSession.insert("jaga.jaga_adhdInsert", jindanVo);
		}
		result = (Integer) sqlSession.selectOne("jaga.jaga_adhdInsert_result", jindanVo);
		return result;
	}
	
	public String getAns_num(JindanVo jindanVo){
		String ans_num = (String) sqlSession.selectOne("jaga.getAns_num", jindanVo);
		return ans_num;
	}
	
	public ModelMap jaga_soa(JindanVo jindanVo){
		ModelMap modelMap = new ModelMap();
		List<JindanVo> resultList = (List<JindanVo>)sqlSession.selectList("jaga.jaga_adhd", jindanVo);
		modelMap.put("resultList", resultList);
		modelMap.put("resultCnt", resultList.size());
		return modelMap;
	}
	public int jaga_soaInsert(JindanVo jindanVo){
		int result = 0;
		String ans_num = getAns_num(jindanVo);
		jindanVo.setAns_num(ans_num);
		for(int i=0; i<jindanVo.getArr_jindan_quest_no().length; i++){
			jindanVo.setJindan_quest_no(jindanVo.getArr_jindan_quest_no()[i]);
			jindanVo.setAns_val(jindanVo.getArr_jindan_ans()[i]);
			sqlSession.insert("jaga.jaga_adhdInsert", jindanVo);
		}
		result = (Integer) sqlSession.selectOne("jaga.jaga_soaInsert_result", jindanVo);
		return result;
	}
	public ModelMap jaga_hakseub(JindanVo jindanVo){
		ModelMap modelMap = new ModelMap();
//		List<JindanVo> resultList = (List<JindanVo>)sqlSession.selectList("jaga.jaga_hakseub", jindanVo);
		List<JindanVo> resultList = (List<JindanVo>)sqlSession.selectList("jaga.jaga_adhd", jindanVo);
		modelMap.put("resultList", resultList);
		modelMap.put("resultCnt", resultList.size());
		modelMap.put("resultCntView", resultList.size()/3);
		return modelMap;
	}
	public int jaga_hakseubInsert(JindanVo jindanVo){
		int result = 0;
		String ans_num = getAns_num(jindanVo);
		jindanVo.setAns_num(ans_num);
		for(int i=0; i<jindanVo.getArr_jindan_quest_no().length; i++){
			jindanVo.setJindan_quest_no(jindanVo.getArr_jindan_quest_no()[i]);
			jindanVo.setAns_val(jindanVo.getArr_jindan_ans()[i]);
			sqlSession.insert("jaga.jaga_adhdInsert", jindanVo);
		}
		result = (Integer) sqlSession.selectOne("jaga.jaga_hakseubInsert_result", jindanVo);
		return result;
	}
}
