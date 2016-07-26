package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.BiyongVo;
import common.vo.SearchVo;

public interface AdminBiyongService {
	
	public ModelMap biyongList(SearchVo searchVo);
	public ModelMap biyongListExcel(SearchVo searchVo);
	public ModelMap biyong_detail(SearchVo searchVo);
	public Integer biyongInsert(BiyongVo biyong);
	public Integer biyongUpdate(BiyongVo biyong);
	public Integer biyongDelete(BiyongVo biyong);
	public Integer biyongDeleteCancel(BiyongVo biyong);
	
}
