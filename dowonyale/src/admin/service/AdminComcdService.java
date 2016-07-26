package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.ComcdVo;
import common.vo.SearchVo;

public interface AdminComcdService {
	
	public ModelMap comcdList(SearchVo searchVo);
	public ModelMap comcdListExcel(SearchVo searchVo);
	public Integer comcdDuplChk(SearchVo searchVo);
	public Integer comcdInsert(ComcdVo comcdVo);
	public Integer comcdUpdate(ComcdVo comcdVo);
	public Integer comcdDelete(ComcdVo comcdVo);
	public Integer comcdDeleteCancel(ComcdVo comcdVo);
	
	public ModelMap comcdDetail(String cd_id);
	
}
