package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminPopupDao;

import common.vo.PopupVo;
import common.vo.SearchVo;

@Service
public class AdminPopupServiceImpl implements AdminPopupService{
	
	@Autowired
	private AdminPopupDao adminPopupDao;
	
	public ModelMap popupList(SearchVo searchVo){
		return (ModelMap)adminPopupDao.popupList(searchVo);
	}
	
	public ModelMap popupListExcel(SearchVo searchVo){
		return (ModelMap)adminPopupDao.popupListExcel(searchVo);
	}
	
	public ModelMap popup_detail(SearchVo searchVo){
		return (ModelMap)adminPopupDao.popup_detail(searchVo);
	}
	
	public Integer popupInsert(PopupVo popupVo){
		return (Integer)adminPopupDao.popupInsert(popupVo);
	}

	public Integer popupUpdate(PopupVo popupVo){
		return (Integer)adminPopupDao.popupUpdate(popupVo);
	}
	
	public Integer popupDelete(PopupVo popupVo){
		return (Integer)adminPopupDao.popupDelete(popupVo);
	}
	
	public Integer popupDeleteCancel(PopupVo popupVo){
		return (Integer)adminPopupDao.popupDeleteCancel(popupVo);
	}
	
}
