package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminGongjiDao;

import common.vo.BoardVo;
import common.vo.SearchVo;

@Service
public class AdminGongjiServiceImpl implements AdminGongjiService{
	
	@Autowired
	private AdminGongjiDao adminGongjiDao;
	
	public ModelMap gongjiList(SearchVo searchVo){
		return (ModelMap)adminGongjiDao.gongjiList(searchVo);
	}
	
	public ModelMap gongjiListExcel(SearchVo searchVo){
		return (ModelMap)adminGongjiDao.gongjiListExcel(searchVo);
	}
	
	public ModelMap gongji_detail(SearchVo searchVo){
		return (ModelMap)adminGongjiDao.gongji_detail(searchVo);
	}
	
	public Integer gongjiInsert(BoardVo boardVo){
		return (Integer)adminGongjiDao.gongjiInsert(boardVo);
	}

	public Integer gongjiUpdate(BoardVo boardVo){
		return (Integer)adminGongjiDao.gongjiUpdate(boardVo);
	}
	
	public Integer gongjiDelete(BoardVo boardVo){
		return (Integer)adminGongjiDao.gongjiDelete(boardVo);
	}
	
	public Integer gongjiDeleteCancel(BoardVo boardVo){
		return (Integer)adminGongjiDao.gongjiDeleteCancel(boardVo);
	}
	
}
