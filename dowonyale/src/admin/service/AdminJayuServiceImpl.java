package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminJayuDao;

import common.vo.BoardVo;
import common.vo.SearchVo;

@Service
public class AdminJayuServiceImpl implements AdminJayuService{
	
	@Autowired
	private AdminJayuDao adminJayuDao;
	
	public ModelMap jayuList(SearchVo searchVo){
		return (ModelMap)adminJayuDao.jayuList(searchVo);
	}
	
	public ModelMap jayuListExcel(SearchVo searchVo){
		return (ModelMap)adminJayuDao.jayuListExcel(searchVo);
	}
	
	public ModelMap jayu_detail(SearchVo searchVo){
		return (ModelMap)adminJayuDao.jayu_detail(searchVo);
	}
	
	public Integer jayuInsert(BoardVo boardVo){
		return (Integer)adminJayuDao.jayuInsert(boardVo);
	}

	public Integer jayuUpdate(BoardVo boardVo){
		return (Integer)adminJayuDao.jayuUpdate(boardVo);
	}
	
	public Integer jayuDelete(BoardVo boardVo){
		return (Integer)adminJayuDao.jayuDelete(boardVo);
	}
	
	public Integer jayuDeleteCancel(BoardVo boardVo){
		return (Integer)adminJayuDao.jayuDeleteCancel(boardVo);
	}
	
}
