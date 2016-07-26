package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminBiyongDao;

import common.vo.BiyongVo;
import common.vo.SearchVo;

@Service
public class AdminBiyongServiceImpl implements AdminBiyongService{
	
	@Autowired
	private AdminBiyongDao adminBiyongDao;
	
	public ModelMap biyongList(SearchVo searchVo){
		return (ModelMap)adminBiyongDao.biyongList(searchVo);
	}
	
	public ModelMap biyongListExcel(SearchVo searchVo){
		return (ModelMap)adminBiyongDao.biyongListExcel(searchVo);
	}
	
	public ModelMap biyong_detail(SearchVo searchVo){
		return (ModelMap)adminBiyongDao.biyong_detail(searchVo);
	}
	
	public Integer biyongInsert(BiyongVo biyongVo){
		return (Integer)adminBiyongDao.biyongInsert(biyongVo);
	}

	public Integer biyongUpdate(BiyongVo biyongVo){
		return (Integer)adminBiyongDao.biyongUpdate(biyongVo);
	}
	
	public Integer biyongDelete(BiyongVo biyongVo){
		return (Integer)adminBiyongDao.biyongDelete(biyongVo);
	}
	
	public Integer biyongDeleteCancel(BiyongVo biyongVo){
		return (Integer)adminBiyongDao.biyongDeleteCancel(biyongVo);
	}
	
}
