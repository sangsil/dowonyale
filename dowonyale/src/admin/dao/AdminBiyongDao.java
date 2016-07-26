package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.BiyongVo;
import common.vo.SearchVo;

public interface AdminBiyongDao {
	
	public ModelMap biyongList(SearchVo searchVo);
	public ModelMap biyongListExcel(SearchVo searchVo);
	public ModelMap biyong_detail(SearchVo searchVo);
	public Integer biyongInsert(BiyongVo biyongVo);
	public Integer biyongUpdate(BiyongVo biyongVo);
	public Integer biyongDelete(BiyongVo biyongVo);
	public Integer biyongDeleteCancel(BiyongVo biyongVo);
}
