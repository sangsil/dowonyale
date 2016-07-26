package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminJindanAnsDao;

import common.vo.JindanVo;
import common.vo.SearchVo;

@Service
public class AdminJindanAnsServiceImpl implements AdminJindanAnsService{
	
	@Autowired
	private AdminJindanAnsDao adminJindanAnsDao;
	
	public ModelMap jindanAnsList(SearchVo searchVo){
		return (ModelMap)adminJindanAnsDao.jindanAnsList(searchVo);
	}
	
	public ModelMap jindanAnsListExcel(SearchVo searchVo){
		return (ModelMap)adminJindanAnsDao.jindanAnsListExcel(searchVo);
	}
	
	public ModelMap jindanAnsDetail(JindanVo jindan){
		return (ModelMap)adminJindanAnsDao.jindanAnsDetail(jindan);
	}
	
	public Integer jindanAnsDelete(JindanVo jindanVo){
		return (Integer)adminJindanAnsDao.jindanAnsDelete(jindanVo);
	}
	
	public Integer jindanAnsDeleteCancel(JindanVo jindanVo){
		return (Integer)adminJindanAnsDao.jindanAnsDeleteCancel(jindanVo);
	}
	
}
