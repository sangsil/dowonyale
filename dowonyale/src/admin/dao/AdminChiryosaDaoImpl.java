package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.ChiryosaVo;
import common.vo.SearchVo;
import common.vo.UserVo;

@Repository
public class AdminChiryosaDaoImpl implements AdminChiryosaDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap chiryosaList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminChiryosa.chiryosaList_totalCnt", searchVo);
		modelMap.put("totalCnt", total);
		
		List<ChiryosaVo> resultList = (List<ChiryosaVo>)sqlSession.selectList("adminChiryosa.chiryosaList", searchVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap chiryosaListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminChiryosa.chiryosaList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<ChiryosaVo> resultList = (List<ChiryosaVo>)sqlSession.selectList("adminChiryosa.chiryosaList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	public ModelMap chiryosa_detail(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		ChiryosaVo result = (ChiryosaVo) sqlSession.selectOne("adminChiryosa.chiryosa_detail", searchVo);
		List<UserVo> result_teacherList = (List<UserVo>) sqlSession.selectList("adminChiryosa.chiryosaTeacherList", searchVo);
		
		modelMap.put("result", result);
		modelMap.put("result_teacherList", result_teacherList);
		
		return modelMap;
	}

	public Integer chiryosaInsert(ChiryosaVo chiryosaVo){
		
//		int result =  sqlSession.insert("UserChiryosa_insertQna", chiryosaVo);
//		
//		
//		//file
//		List<FileVo> fileList = chiryosaVo.getFileList();
//		FileVo tempFile = null;
//		if(fileList != null && fileList.size() > 0){
//			int fileCnt = fileList.size();
//			for(int i=0; i<fileCnt; i++){
//				tempFile = (FileVo)fileList.get(i);
//				tempFile.setChiryosa_id(Integer.toString(result));
//				tempFile.setIn_user(chiryosaVo.getIn_user());
//				tempFile.setIn_date(chiryosaVo.getIn_date());
//				sqlSession.insert("UserChiryosa_insertQna_attach", tempFile);
//			}
//		}		
		
		return sqlSession.insert("adminChiryosa.chiryosaInsert", chiryosaVo);
	}
	
	public Integer chiryosaUpdate(ChiryosaVo chiryosaVo){
		return (Integer)sqlSession.update("adminChiryosa.chiryosaUpdate", chiryosaVo);
	}
	public Integer chiryosaDelete(ChiryosaVo chiryosaVo){
		String[] arr_chiryosa_id = chiryosaVo.getArr_chiryosa_id().split(",");
		int result = 0;
		for(int i=0; i<arr_chiryosa_id.length; i++){
			chiryosaVo.setChiryosa_id(arr_chiryosa_id[i]);
			result = (Integer)sqlSession.update("adminChiryosa.chiryosaDelete", chiryosaVo);
		}
		return result;
	}
	public Integer chiryosaDeleteCancel(ChiryosaVo chiryosaVo){
		String[] arr_chiryosa_id = chiryosaVo.getArr_chiryosa_id().split(",");
		int result = 0;
		for(int i=0; i<arr_chiryosa_id.length; i++){
			chiryosaVo.setChiryosa_id(arr_chiryosa_id[i]);
			result = (Integer)sqlSession.update("adminChiryosa.chiryosaDeleteCancel", chiryosaVo);
		}
		return result;
	}
}
