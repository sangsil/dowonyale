package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.JindanVo;
import common.vo.SearchVo;

public interface AdminJindanDao {
	
	public ModelMap jindanList(SearchVo searchVo);
	public ModelMap jindanListExcel(SearchVo searchVo);
	public ModelMap jindanDetail(JindanVo jindan);
	public Integer jindanInsert(JindanVo jindanVo);
	public Integer jindanUpdate(JindanVo jindanVo);
	public Integer jindanDelete(JindanVo jindanVo);
	public Integer jindanDeleteCancel(JindanVo jindanVo);
}
