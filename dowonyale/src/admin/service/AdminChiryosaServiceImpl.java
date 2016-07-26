package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminChiryosaDao;

import common.vo.ChiryosaVo;
import common.vo.SearchVo;

@Service
public class AdminChiryosaServiceImpl implements AdminChiryosaService{
	
	@Autowired
	private AdminChiryosaDao adminChiryosaDao;
	
	public ModelMap chiryosaList(SearchVo searchVo){
		return (ModelMap)adminChiryosaDao.chiryosaList(searchVo);
	}
	
	public ModelMap chiryosaListExcel(SearchVo searchVo){
		return (ModelMap)adminChiryosaDao.chiryosaListExcel(searchVo);
	}
	
	public ModelMap chiryosa_detail(SearchVo searchVo){
		return (ModelMap)adminChiryosaDao.chiryosa_detail(searchVo);
	}
	
	public Integer chiryosaInsert(ChiryosaVo chiryosaVo){
		return (Integer)adminChiryosaDao.chiryosaInsert(chiryosaVo);
	}

	public Integer chiryosaUpdate(ChiryosaVo chiryosaVo){
		return (Integer)adminChiryosaDao.chiryosaUpdate(chiryosaVo);
	}
	
	public Integer chiryosaDelete(ChiryosaVo chiryosaVo){
		return (Integer)adminChiryosaDao.chiryosaDelete(chiryosaVo);
	}
	
	public Integer chiryosaDeleteCancel(ChiryosaVo chiryosaVo){
		return (Integer)adminChiryosaDao.chiryosaDeleteCancel(chiryosaVo);
	}
	
}
