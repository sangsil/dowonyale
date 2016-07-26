package user.dao;

import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.UserVo;

public interface MainDao {
	
	ModelMap getNews(BoardVo boardVo);
	ModelMap getPopup_list();
	
	
	
	
	
	
	
	
	
	ModelMap getList(UserVo userVo);
	
	ModelMap getThanks(UserVo userVo);
	
	ModelMap thanksView(UserVo userVo);
	
	ModelMap editUser(UserVo userVo);
	
	ModelMap deleteUser(UserVo userVo);
	
	ModelMap recommend(UserVo userVo);
}
