package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminJindanDao;

import common.vo.JindanVo;
import common.vo.SearchVo;

@Service
public class AdminJindanServiceImpl implements AdminJindanService{
	
	@Autowired
	private AdminJindanDao adminJindanDao;
	
	public ModelMap jindanList(SearchVo searchVo){
		return (ModelMap)adminJindanDao.jindanList(searchVo);
	}
	
	public ModelMap jindanListExcel(SearchVo searchVo){
		return (ModelMap)adminJindanDao.jindanListExcel(searchVo);
	}
	
	public ModelMap jindanDetail(JindanVo jindan){
		return (ModelMap)adminJindanDao.jindanDetail(jindan);
	}
	
	public Integer jindanInsert(JindanVo jindanVo){
		return (Integer)adminJindanDao.jindanInsert(jindanVo);
	}

	public Integer jindanUpdate(JindanVo jindanVo){
		return (Integer)adminJindanDao.jindanUpdate(jindanVo);
	}
	
	public Integer jindanDelete(JindanVo jindanVo){
		return (Integer)adminJindanDao.jindanDelete(jindanVo);
	}
	
	public Integer jindanDeleteCancel(JindanVo jindanVo){
		return (Integer)adminJindanDao.jindanDeleteCancel(jindanVo);
	}
	
}
