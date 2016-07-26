package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminUserDao;

import common.vo.AdongVo;
import common.vo.ComcdVo;
import common.vo.SearchVo;
import common.vo.UserVo;

@Service
public class AdminUserServiceImpl implements AdminUserService{
	
	@Autowired
	private AdminUserDao adminUserDao;
	
	public ModelMap userList(SearchVo searchVo){
		return (ModelMap)adminUserDao.userList(searchVo);
	}
	
	public ModelMap userListExcel(SearchVo searchVo){
		return (ModelMap)adminUserDao.userListExcel(searchVo);
	}
	
	public Integer userDuplChk(SearchVo searchVo){
		return (Integer)adminUserDao.userDuplChk(searchVo);
	}
	
	public Integer userEmailDuplChk(UserVo userVo){
		return (Integer)adminUserDao.userEmailDuplChk(userVo);
	}
	
	public Integer userInsert(UserVo userVo){
		return (Integer)adminUserDao.userInsert(userVo);
	}

	public Integer userUpdate(UserVo userVo){
		return (Integer)adminUserDao.userUpdate(userVo);
	}
	
	public Integer userDelete(UserVo userVo){
		return (Integer)adminUserDao.userDelete(userVo);
	}
	
	public Integer userDeleteCancel(UserVo userVo){
		return (Integer)adminUserDao.userDeleteCancel(userVo);
	}
	
	
	public List<ComcdVo> com_cd_list(String high_cd_id){
		return (List<ComcdVo>)adminUserDao.com_cd_list(high_cd_id);
	}

	public List<ComcdVo> com_cd_list_desc(String high_cd_id){
		return (List<ComcdVo>)adminUserDao.com_cd_list_desc(high_cd_id);
	}
	
	public List<UserVo> com_teacher_list(){
		return (List<UserVo>)adminUserDao.com_teacher_list();
	}
	
	public List<AdongVo> com_adong_list(){
		return (List<AdongVo>)adminUserDao.com_adong_list();
	}
	
}
