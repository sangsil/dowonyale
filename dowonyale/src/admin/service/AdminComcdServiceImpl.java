package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminComcdDao;

import common.vo.ComcdVo;
import common.vo.SearchVo;

@Service
public class AdminComcdServiceImpl implements AdminComcdService{
	
	@Autowired
	private AdminComcdDao adminComcdDao;
	
	public ModelMap comcdList(SearchVo searchVo){
		return (ModelMap)adminComcdDao.comcdList(searchVo);
	}
	
	public ModelMap comcdListExcel(SearchVo searchVo){
		return (ModelMap)adminComcdDao.comcdListExcel(searchVo);
	}
	
	public Integer comcdDuplChk(SearchVo searchVo){
		return (Integer)adminComcdDao.comcdDuplChk(searchVo);
	}
	
	public Integer comcdInsert(ComcdVo comcdVo){
		return (Integer)adminComcdDao.comcdInsert(comcdVo);
	}

	public Integer comcdUpdate(ComcdVo comcdVo){
		return (Integer)adminComcdDao.comcdUpdate(comcdVo);
	}
	
	public Integer comcdDelete(ComcdVo comcdVo){
		return (Integer)adminComcdDao.comcdDelete(comcdVo);
	}
	
	public Integer comcdDeleteCancel(ComcdVo comcdVo){
		return (Integer)adminComcdDao.comcdDeleteCancel(comcdVo);
	}
	
	
	public ModelMap comcdDetail(String cd_id){
		return (ModelMap)adminComcdDao.comcdDetail(cd_id);
	}
}

