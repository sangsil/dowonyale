package user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.PopupVo;
import common.vo.UserVo;

@Repository
public class MainDaoImpl implements MainDao{
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	
	
	@SuppressWarnings("unchecked")
	public ModelMap getNews(BoardVo boardVo){
		ModelMap modelMap = new ModelMap();

		//최신글 세개
		List<UserVo> newResultList = (List<UserVo>)sqlSession.selectList("main.getNews_board_list", boardVo);
		modelMap.put("resultList", newResultList);
		
		return modelMap;
	}
	
	@Override
	public ModelMap getPopup_list() {
		ModelMap modelMap = new ModelMap();
		// 팝업리스트
		List<PopupVo> resultList_popup = (List<PopupVo>)sqlSession.selectList("main.getPopup_list");
		modelMap.put("resultList_popup", resultList_popup);
		return modelMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	@SuppressWarnings("unchecked")
	public ModelMap getList(UserVo userVo){
		ModelMap modelMap = new ModelMap();
		
		//전체등록수
		int allCnt = (Integer)sqlSession.selectOne("user.select_all_cnt", userVo);
		modelMap.put("allCnt", allCnt);
		
		//회원정보
		UserVo memberInfo = (UserVo) sqlSession.selectOne("user.select_member_info", userVo);
		modelMap.put("memberInfo", memberInfo);
		
		//추천수 많은 리스트
		List<UserVo> resultList_topRecommend = (List<UserVo>)sqlSession.selectList("user.select_event_list_topRecommend", userVo);
		modelMap.put("resultList_topRecommend", resultList_topRecommend);
		
		//전체 리스트
		List<UserVo> resultList = (List<UserVo>)sqlSession.selectList("user.select_event_list", userVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap getThanks(UserVo userVo)
	{
		ModelMap modelMap = new ModelMap();
		
		//등록
		sqlSession.insert("user.insert_cmnt", userVo);
		int cnt = (Integer)sqlSession.selectOne("user.select_all_cnt", userVo);
		modelMap.put("cnt", cnt);

		//회원정보
		UserVo memberInfo = (UserVo) sqlSession.selectOne("user.select_member_info", userVo);
		modelMap.put("memberInfo", memberInfo);
		
		//최신댓글
		List<UserVo> newResultList = (List<UserVo>)sqlSession.selectList("user.select_event_new_list", userVo);
		modelMap.put("newResultList", newResultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap thanksView(UserVo userVo){
		ModelMap modelMap = new ModelMap();
		
		int cnt = (Integer)sqlSession.selectOne("user.select_all_cnt", userVo);
		modelMap.put("cnt", cnt);
		
		//회원정보
		UserVo memberInfo = (UserVo) sqlSession.selectOne("user.select_member_info", userVo);
		modelMap.put("memberInfo", memberInfo);
		
		//최신댓글
		List<UserVo> newResultList = (List<UserVo>)sqlSession.selectList("user.select_event_new_list", userVo);
		modelMap.put("newResultList", newResultList);
		
		return modelMap;
	}
	
	public ModelMap recommend(UserVo userVo){
		ModelMap modelMap = new ModelMap();
		//댓글추천
		sqlSession.update("user.update_recommend", userVo);
		return modelMap;
	}
	
	public ModelMap editUser(UserVo userVo){
		ModelMap modelMap = new ModelMap();
		//댓글수정
		sqlSession.update("user.edit_cmnt", userVo);
		return modelMap;
	}
	
	public ModelMap deleteUser(UserVo userVo){
		ModelMap modelMap = new ModelMap();
		//댓글삭제
		sqlSession.delete("user.delete_cmnt", userVo);
		return modelMap;
	}

}
