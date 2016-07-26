package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.JindanVo;
import common.vo.SearchVo;

public interface AdminJindanService {
	
	public ModelMap jindanList(SearchVo searchVo);
	public ModelMap jindanListExcel(SearchVo searchVo);
	public ModelMap jindanDetail(JindanVo jindan);
	public Integer jindanInsert(JindanVo jindan);
	public Integer jindanUpdate(JindanVo jindan);
	public Integer jindanDelete(JindanVo jindan);
	public Integer jindanDeleteCancel(JindanVo jindan);
	
}
