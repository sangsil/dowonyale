package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.AdongVo;
import common.vo.SearchVo;

public interface AdminAdongService {
	
	public ModelMap adongList(SearchVo searchVo);
	public ModelMap adongListExcel(SearchVo searchVo);
	public Integer adongDuplChk(SearchVo searchVo);
	public Integer adongInsert(AdongVo adongVo);
	public Integer adongUpdate(AdongVo adongVo);
	public Integer adongDelete(AdongVo adongVo);
	public Integer adongDeleteCancel(AdongVo adongVo);
	
}
