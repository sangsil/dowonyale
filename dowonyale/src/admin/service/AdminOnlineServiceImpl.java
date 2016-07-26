package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminOnlineDao;

import common.vo.BoardVo;
import common.vo.SearchVo;

@Service
public class AdminOnlineServiceImpl implements AdminOnlineService{
	
	@Autowired
	private AdminOnlineDao adminOnlineDao;
	
	public ModelMap onlineList(SearchVo searchVo){
		return (ModelMap)adminOnlineDao.onlineList(searchVo);
	}
	
	public ModelMap onlineListExcel(SearchVo searchVo){
		return (ModelMap)adminOnlineDao.onlineListExcel(searchVo);
	}
	
	public ModelMap online_detail(SearchVo searchVo){
		return (ModelMap)adminOnlineDao.online_detail(searchVo);
	}
	
	public Integer onlineInsert(BoardVo boardVo){
		return (Integer)adminOnlineDao.onlineInsert(boardVo);
	}

	public Integer onlineUpdate(BoardVo boardVo){
		return (Integer)adminOnlineDao.onlineUpdate(boardVo);
	}
	
	public Integer onlineDelete(BoardVo boardVo){
		return (Integer)adminOnlineDao.onlineDelete(boardVo);
	}
	
	public Integer onlineDeleteCancel(BoardVo boardVo){
		return (Integer)adminOnlineDao.onlineDeleteCancel(boardVo);
	}
	
}
