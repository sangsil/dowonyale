package user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.SearchVo;

@Repository
public class KeomuDaoImpl implements KeomuDao{
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap gongjiList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		int total = (Integer)sqlSession.selectOne("keomu.gongjiList_allCnt", searchVo);
		modelMap.put("totalCnt", total);
		List<BoardVo> resultList = (List<BoardVo>)sqlSession.selectList("keomu.gongjiList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	public ModelMap gongji_detail(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		BoardVo result = (BoardVo) sqlSession.selectOne("keomu.gongji_detail", searchVo);
		modelMap.put("result", result);
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap onlineList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		int total = (Integer)sqlSession.selectOne("keomu.onlineList_allCnt", searchVo);
		modelMap.put("totalCnt", total);
		List<BoardVo> resultList = (List<BoardVo>)sqlSession.selectList("keomu.onlineList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	public ModelMap online_detail(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		BoardVo result = (BoardVo) sqlSession.selectOne("keomu.online_detail", searchVo);
		modelMap.put("result", result);
		return modelMap;
	}
	public int online_insert(BoardVo boardVo){
		return sqlSession.insert("keomu.online_insert", boardVo);
	}
	public int online_update(BoardVo boardVo){
		return sqlSession.update("keomu.online_update", boardVo);
	}
	public int online_delete(BoardVo boardVo){
		return sqlSession.update("keomu.online_delete", boardVo);
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap jayuList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		int total = (Integer)sqlSession.selectOne("keomu.jayuList_allCnt", searchVo);
		modelMap.put("totalCnt", total);
		List<BoardVo> resultList = (List<BoardVo>)sqlSession.selectList("keomu.jayuList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	public ModelMap jayu_detail(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		BoardVo result = (BoardVo) sqlSession.selectOne("keomu.jayu_detail", searchVo);
		modelMap.put("result", result);
		return modelMap;
	}
	
	public int jayu_insert(BoardVo boardVo){
		return sqlSession.insert("keomu.jayu_insert", boardVo);
	}
	public int jayu_update(BoardVo boardVo){
		return sqlSession.insert("keomu.jayu_update", boardVo);
	}
	public int jayu_delete(BoardVo boardVo){
		return sqlSession.update("keomu.jayu_delete", boardVo);
	}
	
	
	/*이전글*/
	public String pre_board_id(SearchVo searchVo){
		String pre_board_id="";
		pre_board_id = (String) sqlSession.selectOne("keomu.pre_board_id", searchVo);
		return pre_board_id;
	}
	/*다음글*/
	public String next_board_id(SearchVo searchVo){
		String next_board_id="";
		next_board_id = (String) sqlSession.selectOne("keomu.next_board_id", searchVo);
		return next_board_id;
	}
	
	/*조회수증가*/
	public Integer addHitCnt(SearchVo searchVo){
		return (Integer)sqlSession.update("keomu.addHitCnt", searchVo);
	}
}
