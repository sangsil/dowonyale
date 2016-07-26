package admin.dao;

import java.util.List;

import org.springframework.ui.ModelMap;

import common.vo.AdongVo;
import common.vo.ComcdVo;
import common.vo.SearchVo;
import common.vo.UserVo;

public interface AdminUserDao {
	
	public ModelMap userList(SearchVo searchVo);
	public ModelMap userListExcel(SearchVo searchVo);
	public Integer userDuplChk(SearchVo searchVo);
	public Integer userEmailDuplChk(UserVo userVo);
	public Integer userInsert(UserVo userVo);
	public Integer userUpdate(UserVo userVo);
	public Integer userDelete(UserVo userVo);
	public Integer userDeleteCancel(UserVo userVo);
	
	public List<ComcdVo> com_cd_list(String high_cd_id);
	public List<ComcdVo> com_cd_list_desc(String high_cd_id);
	public List<UserVo> com_teacher_list();
	public List<AdongVo> com_adong_list();
}
