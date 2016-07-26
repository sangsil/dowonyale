package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.PopupVo;
import common.vo.SearchVo;

@Repository
public class AdminPopupDaoImpl implements AdminPopupDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap popupList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminPopup.popupList_totalCnt", searchVo);
		modelMap.put("totalCnt", total);
		
		List<PopupVo> resultList = (List<PopupVo>)sqlSession.selectList("adminPopup.popupList", searchVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap popupListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminPopup.popupList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<PopupVo> resultList = (List<PopupVo>)sqlSession.selectList("adminPopup.popupList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	public ModelMap popup_detail(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		PopupVo result = (PopupVo) sqlSession.selectOne("adminPopup.popup_detail", searchVo);
		modelMap.put("result", result);
		
		System.out.println("getPopup_id:"+result.getPopup_id());
		System.out.println("getPopup_title:"+result.getPopup_title());
		System.out.println("getPopup_txt:"+result.getPopup_txt());
		
		return modelMap;
	}

	public Integer popupInsert(PopupVo popupVo){
		
//		int result =  sqlSession.insert("UserPopup_insertQna", popupVo);
//		
//		
//		//file
//		List<FileVo> fileList = popupVo.getFileList();
//		FileVo tempFile = null;
//		if(fileList != null && fileList.size() > 0){
//			int fileCnt = fileList.size();
//			for(int i=0; i<fileCnt; i++){
//				tempFile = (FileVo)fileList.get(i);
//				tempFile.setPopup_id(Integer.toString(result));
//				tempFile.setIn_user(popupVo.getIn_user());
//				tempFile.setIn_date(popupVo.getIn_date());
//				sqlSession.insert("UserPopup_insertQna_attach", tempFile);
//			}
//		}		
		
		return sqlSession.insert("adminPopup.popupInsert", popupVo);
	}
	
	public Integer popupUpdate(PopupVo popupVo){
		return (Integer)sqlSession.update("adminPopup.popupUpdate", popupVo);
	}
	public Integer popupDelete(PopupVo popupVo){
		String[] arr_popup_id = popupVo.getArr_popup_id().split(",");
		int result = 0;
		for(int i=0; i<arr_popup_id.length; i++){
			popupVo.setPopup_id(arr_popup_id[i]);
			result = (Integer)sqlSession.update("adminPopup.popupDelete", popupVo);
		}
		return result;
	}
	public Integer popupDeleteCancel(PopupVo popupVo){
		String[] arr_popup_id = popupVo.getArr_popup_id().split(",");
		int result = 0;
		for(int i=0; i<arr_popup_id.length; i++){
			popupVo.setPopup_id(arr_popup_id[i]);
			result = (Integer)sqlSession.update("adminPopup.popupDeleteCancel", popupVo);
		}
		return result;
	}
}
