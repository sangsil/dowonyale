package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.SearchVo;

@Repository
public class AdminOnlineDaoImpl implements AdminOnlineDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap onlineList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminOnline.onlineList_totalCnt", searchVo);
		modelMap.put("totalCnt", total);
		
		List<BoardVo> resultList = (List<BoardVo>)sqlSession.selectList("adminOnline.onlineList", searchVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap onlineListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminOnline.onlineList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<BoardVo> resultList = (List<BoardVo>)sqlSession.selectList("adminOnline.onlineList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	public ModelMap online_detail(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		BoardVo result = (BoardVo) sqlSession.selectOne("adminOnline.online_detail", searchVo);
		modelMap.put("result", result);
		
		System.out.println("getBoard_id:"+result.getBoard_id());
		System.out.println("getBoard_title:"+result.getBoard_title());
		System.out.println("getBoard_txt:"+result.getBoard_txt());
		
		return modelMap;
	}

	public Integer onlineInsert(BoardVo boardVo){
		
//		int result =  sqlSession.insert("UserBoard_insertQna", boardVo);
//		
//		
//		//file
//		List<FileVo> fileList = boardVo.getFileList();
//		FileVo tempFile = null;
//		if(fileList != null && fileList.size() > 0){
//			int fileCnt = fileList.size();
//			for(int i=0; i<fileCnt; i++){
//				tempFile = (FileVo)fileList.get(i);
//				tempFile.setBoard_id(Integer.toString(result));
//				tempFile.setIn_user(boardVo.getIn_user());
//				tempFile.setIn_date(boardVo.getIn_date());
//				sqlSession.insert("UserBoard_insertQna_attach", tempFile);
//			}
//		}		
		
		return sqlSession.insert("adminOnline.onlineInsert", boardVo);
	}
	
	public Integer onlineUpdate(BoardVo boardVo){
		return (Integer)sqlSession.update("adminOnline.onlineUpdate", boardVo);
	}
	public Integer onlineDelete(BoardVo boardVo){
		String[] arr_board_id = boardVo.getArr_board_id().split(",");
		int result = 0;
		for(int i=0; i<arr_board_id.length; i++){
			boardVo.setBoard_id(arr_board_id[i]);
			result = (Integer)sqlSession.update("adminOnline.onlineDelete", boardVo);
		}
		return result;
	}
	public Integer onlineDeleteCancel(BoardVo boardVo){
		String[] arr_board_id = boardVo.getArr_board_id().split(",");
		int result = 0;
		for(int i=0; i<arr_board_id.length; i++){
			boardVo.setBoard_id(arr_board_id[i]);
			result = (Integer)sqlSession.update("adminOnline.onlineDeleteCancel", boardVo);
		}
		return result;
	}
}
