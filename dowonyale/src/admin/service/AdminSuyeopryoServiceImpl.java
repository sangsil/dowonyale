package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminSuyeopryoDao;

import common.vo.SearchVo;
import common.vo.SuyeopryoVo;

@Service
public class AdminSuyeopryoServiceImpl implements AdminSuyeopryoService{
	
	@Autowired
	private AdminSuyeopryoDao adminSuyeopryoDao;
	
	public ModelMap suyeopryoList(SearchVo searchVo){
		return (ModelMap)adminSuyeopryoDao.suyeopryoList(searchVo);
	}

	public ModelMap suyeopryoAllList(SearchVo searchVo){
		return (ModelMap)adminSuyeopryoDao.suyeopryoAllList(searchVo);
	}
	
	public ModelMap suyeopryoListExcel(SearchVo searchVo){
		return (ModelMap)adminSuyeopryoDao.suyeopryoListExcel(searchVo);
	}
	
	public Integer suyeopryoDuplChk(SearchVo searchVo){
		return (Integer)adminSuyeopryoDao.suyeopryoDuplChk(searchVo);
	}
	
	public Integer suyeopryoInsert(SuyeopryoVo suyeopryoVo){
		return (Integer)adminSuyeopryoDao.suyeopryoInsert(suyeopryoVo);
	}

	public Integer suyeopryoUpdate(SuyeopryoVo suyeopryoVo){
		return (Integer)adminSuyeopryoDao.suyeopryoUpdate(suyeopryoVo);
	}
	
	public Integer suyeopryoDelete(SuyeopryoVo suyeopryoVo){
		return (Integer)adminSuyeopryoDao.suyeopryoDelete(suyeopryoVo);
	}
	
	public Integer suyeopryoDeleteCancel(SuyeopryoVo suyeopryoVo){
		return (Integer)adminSuyeopryoDao.suyeopryoDeleteCancel(suyeopryoVo);
	}
	
}
