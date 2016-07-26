package user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import user.dao.MainDao;

import common.vo.BoardVo;
import common.vo.UserVo;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDao mainDao;
	
	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}

	public ModelMap getNews(BoardVo boardVo){
		
//		int maxRows = userVo.getMaxRows();
//		if(maxRows == 0) userVo.setMaxRows(10);
		
		return (ModelMap)mainDao.getNews(boardVo);
	}
	@Override
	public ModelMap getPopup_list() {
		return (ModelMap)mainDao.getPopup_list();
	}
	
	
	
	
	
	public ModelMap getThanks(UserVo userVo) {
		return mainDao.getThanks(userVo);
	}

	public ModelMap thanksView(UserVo userVo){
		return (ModelMap)mainDao.thanksView(userVo);
	}
	
	public ModelMap editUser(UserVo userVo) {
		return mainDao.editUser(userVo);
	}
	
	public ModelMap deleteUser(UserVo userVo) {
		return mainDao.deleteUser(userVo);
	}
	
	public ModelMap recommend(UserVo userVo) {
		return mainDao.recommend(userVo);
	}

	public ModelMap getList(UserVo userVo) {
		// TODO Auto-generated method stub
		return null;
	}


}
