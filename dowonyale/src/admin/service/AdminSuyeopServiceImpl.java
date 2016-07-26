package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminSuyeopDao;

import common.vo.SearchVo;
import common.vo.SuyeopVo;
import common.vo.SuyeopryoVo;
import common.vo.VoucherVo;

@Service
public class AdminSuyeopServiceImpl implements AdminSuyeopService{
	
	@Autowired
	private AdminSuyeopDao adminSuyeopDao;
	
	public ModelMap suyeopList(SearchVo searchVo){
		return (ModelMap)adminSuyeopDao.suyeopList(searchVo);
	}

	public ModelMap suyeopAllList(SearchVo searchVo){
		return (ModelMap)adminSuyeopDao.suyeopAllList(searchVo);
	}
	
	public ModelMap suyeopListExcel(SearchVo searchVo){
		return (ModelMap)adminSuyeopDao.suyeopListExcel(searchVo);
	}
	
	public Integer suyeopDuplChk(SearchVo searchVo){
		return (Integer)adminSuyeopDao.suyeopDuplChk(searchVo);
	}
	
	public Integer suyeopInsert(SuyeopVo suyeopVo){
		return (Integer)adminSuyeopDao.suyeopInsert(suyeopVo);
	}

	public Integer suyeopUpdate(SuyeopVo suyeopVo){
		return (Integer)adminSuyeopDao.suyeopUpdate(suyeopVo);
	}
	
	public Integer suyeopDelete(SuyeopVo suyeopVo){
		return (Integer)adminSuyeopDao.suyeopDelete(suyeopVo);
	}
	
	public Integer suyeopDeleteCancel(SuyeopVo suyeopVo){
		return (Integer)adminSuyeopDao.suyeopDeleteCancel(suyeopVo);
	}
	
	public VoucherVo suyeopSelectAdong(String adong_id){
		return (VoucherVo)adminSuyeopDao.suyeopSelectAdong(adong_id);
	}
	
	public SuyeopryoVo suyeopSelectSuyeopryo(String suyeop_gubun, String gwamok){
		return (SuyeopryoVo)adminSuyeopDao.suyeopSelectSuyeopryo(suyeop_gubun, gwamok);
	}
	
}
