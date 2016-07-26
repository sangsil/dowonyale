package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.BiyongVo;
import common.vo.SearchVo;
import common.vo.UserVo;

@Repository
public class AdminBiyongDaoImpl implements AdminBiyongDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap biyongList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminBiyong.biyongList_totalCnt", searchVo);
		modelMap.put("totalCnt", total);
		
		List<BiyongVo> resultList = (List<BiyongVo>)sqlSession.selectList("adminBiyong.biyongList", searchVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap biyongListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminBiyong.biyongList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<BiyongVo> resultList = (List<BiyongVo>)sqlSession.selectList("adminBiyong.biyongList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	public ModelMap biyong_detail(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		BiyongVo result = (BiyongVo) sqlSession.selectOne("adminBiyong.biyong_detail", searchVo);
		List<UserVo> result_teacherList = (List<UserVo>) sqlSession.selectList("adminBiyong.biyongTeacherList", searchVo);
		
		modelMap.put("result", result);
		modelMap.put("result_teacherList", result_teacherList);
		
		return modelMap;
	}

	public Integer biyongInsert(BiyongVo biyongVo){
		
//		int result =  sqlSession.insert("UserBiyong_insertQna", biyongVo);
//		
//		
//		//file
//		List<FileVo> fileList = biyongVo.getFileList();
//		FileVo tempFile = null;
//		if(fileList != null && fileList.size() > 0){
//			int fileCnt = fileList.size();
//			for(int i=0; i<fileCnt; i++){
//				tempFile = (FileVo)fileList.get(i);
//				tempFile.setBiyong_id(Integer.toString(result));
//				tempFile.setIn_user(biyongVo.getIn_user());
//				tempFile.setIn_date(biyongVo.getIn_date());
//				sqlSession.insert("UserBiyong_insertQna_attach", tempFile);
//			}
//		}		
		
		return sqlSession.insert("adminBiyong.biyongInsert", biyongVo);
	}
	
	public Integer biyongUpdate(BiyongVo biyongVo){
		return (Integer)sqlSession.update("adminBiyong.biyongUpdate", biyongVo);
	}
	public Integer biyongDelete(BiyongVo biyongVo){
		String[] arr_biyong_id = biyongVo.getArr_biyong_id().split(",");
		int result = 0;
		for(int i=0; i<arr_biyong_id.length; i++){
			biyongVo.setBiyong_id(arr_biyong_id[i]);
			result = (Integer)sqlSession.update("adminBiyong.biyongDelete", biyongVo);
		}
		return result;
	}
	public Integer biyongDeleteCancel(BiyongVo biyongVo){
		String[] arr_biyong_id = biyongVo.getArr_biyong_id().split(",");
		int result = 0;
		for(int i=0; i<arr_biyong_id.length; i++){
			biyongVo.setBiyong_id(arr_biyong_id[i]);
			result = (Integer)sqlSession.update("adminBiyong.biyongDeleteCancel", biyongVo);
		}
		return result;
	}
}
