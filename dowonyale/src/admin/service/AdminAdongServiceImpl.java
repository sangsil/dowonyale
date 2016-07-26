package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminAdongDao;

import common.vo.AdongVo;
import common.vo.SearchVo;

@Service
public class AdminAdongServiceImpl implements AdminAdongService{
	
	@Autowired
	private AdminAdongDao adminAdongDao;
	
	public ModelMap adongList(SearchVo searchVo){
		return (ModelMap)adminAdongDao.adongList(searchVo);
	}
	
	public ModelMap adongListExcel(SearchVo searchVo){
		return (ModelMap)adminAdongDao.adongListExcel(searchVo);
	}
	
	public Integer adongDuplChk(SearchVo searchVo){
		return (Integer)adminAdongDao.adongDuplChk(searchVo);
	}
	
	public Integer adongInsert(AdongVo adongVo){
		return (Integer)adminAdongDao.adongInsert(adongVo);
	}

	public Integer adongUpdate(AdongVo adongVo){
		return (Integer)adminAdongDao.adongUpdate(adongVo);
	}
	
	public Integer adongDelete(AdongVo adongVo){
		return (Integer)adminAdongDao.adongDelete(adongVo);
	}
	
	public Integer adongDeleteCancel(AdongVo adongVo){
		return (Integer)adminAdongDao.adongDeleteCancel(adongVo);
	}
	
}
