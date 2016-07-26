package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminGyoukDao;

import common.vo.BoardVo;
import common.vo.SearchVo;

@Service
public class AdminGyoukServiceImpl implements AdminGyoukService{
	
	@Autowired
	private AdminGyoukDao adminGyoukDao;
	
	public ModelMap gyoukList(SearchVo searchVo){
		return (ModelMap)adminGyoukDao.gyoukList(searchVo);
	}
	
	public ModelMap gyoukListExcel(SearchVo searchVo){
		return (ModelMap)adminGyoukDao.gyoukListExcel(searchVo);
	}
	
	public ModelMap gyouk_detail(SearchVo searchVo){
		return (ModelMap)adminGyoukDao.gyouk_detail(searchVo);
	}	
	public Integer gyoukInsert(BoardVo boardVo){
		return (Integer)adminGyoukDao.gyoukInsert(boardVo);
	}

	public Integer gyoukUpdate(BoardVo boardVo){
		return (Integer)adminGyoukDao.gyoukUpdate(boardVo);
	}
	
	public Integer gyoukDelete(BoardVo boardVo){
		return (Integer)adminGyoukDao.gyoukDelete(boardVo);
	}
	public Integer gyoukDeleteCancel(BoardVo boardVo){
		return (Integer)adminGyoukDao.gyoukDeleteCancel(boardVo);
	}
}
