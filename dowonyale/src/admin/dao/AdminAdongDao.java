package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.AdongVo;
import common.vo.SearchVo;

public interface AdminAdongDao {
	
	public ModelMap adongList(SearchVo searchVo);
	public ModelMap adongListExcel(SearchVo searchVo);
	public Integer adongDuplChk(SearchVo searchVo);
	public Integer adongInsert(AdongVo adongVo);
	public Integer adongUpdate(AdongVo adongVo);
	public Integer adongDelete(AdongVo adongVo);
	public Integer adongDeleteCancel(AdongVo adongVo);
}
