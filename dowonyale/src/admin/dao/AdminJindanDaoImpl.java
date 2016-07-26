package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.JindanVo;
import common.vo.SearchVo;

@Repository
public class AdminJindanDaoImpl implements AdminJindanDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap jindanList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminJindan.jindanList_totalCnt", searchVo);
		modelMap.put("totalCnt", total);
		
		List<JindanVo> resultList = (List<JindanVo>)sqlSession.selectList("adminJindan.jindanList", searchVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap jindanListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminJindan.jindanList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<JindanVo> resultList = (List<JindanVo>)sqlSession.selectList("adminJindan.jindanList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap jindanDetail(JindanVo jindanVo){
		ModelMap modelMap = new ModelMap();
		List<JindanVo> resultList = (List<JindanVo>)sqlSession.selectList("adminJindan.jindanDetail", jindanVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}

	public Integer jindanInsert(JindanVo jindanVo){
		
//		int result =  sqlSession.insert("UserJindan_insertQna", jindanVo);
//		
//		
//		//file
//		List<FileVo> fileList = jindanVo.getFileList();
//		FileVo tempFile = null;
//		if(fileList != null && fileList.size() > 0){
//			int fileCnt = fileList.size();
//			for(int i=0; i<fileCnt; i++){
//				tempFile = (FileVo)fileList.get(i);
//				tempFile.setJindan_id(Integer.toString(result));
//				tempFile.setIn_user(jindanVo.getIn_user());
//				tempFile.setIn_date(jindanVo.getIn_date());
//				sqlSession.insert("UserJindan_insertQna_attach", tempFile);
//			}
//		}		
		
		int result = 0;
		
		for(int i=0; i<jindanVo.getArr_jindan_sub_quest_no().length; i++){
			jindanVo.setJindan_sub_quest_no(jindanVo.getArr_jindan_sub_quest_no()[i]);
			jindanVo.setJindan_txt(jindanVo.getArr_jindan_txt()[i]);
			result += sqlSession.insert("adminJindan.jindanInsert", jindanVo);
		}
		
		return result;
	}
	
	public Integer jindanUpdate(JindanVo jindanVo){
		int result = 0;
		
		result += (Integer)sqlSession.update("adminJindan.jindanUpdateDelete", jindanVo);
		for(int i=0; i<jindanVo.getArr_jindan_sub_quest_no().length; i++){
			jindanVo.setJindan_sub_quest_no(jindanVo.getArr_jindan_sub_quest_no()[i]);
			jindanVo.setJindan_txt(jindanVo.getArr_jindan_txt()[i]);
			result += sqlSession.insert("adminJindan.jindanInsert", jindanVo);
		}
		
		return result;
	}
	public Integer jindanDelete(JindanVo jindanVo){
		String[] arr_jindan_id = jindanVo.getArr_jindan_id().split(",");
		int result = 0;
		for(int i=0; i<arr_jindan_id.length; i++){
			jindanVo.setJindan_id(arr_jindan_id[i]);
			result = (Integer)sqlSession.update("adminJindan.jindanDelete", jindanVo);
		}
		return result;
	}
	public Integer jindanDeleteCancel(JindanVo jindanVo){
		String[] arr_jindan_id = jindanVo.getArr_jindan_id().split(",");
		int result = 0;
		for(int i=0; i<arr_jindan_id.length; i++){
			jindanVo.setJindan_id(arr_jindan_id[i]);
			result = (Integer)sqlSession.update("adminJindan.jindanDeleteCancel", jindanVo);
		}
		return result;
	}
}
