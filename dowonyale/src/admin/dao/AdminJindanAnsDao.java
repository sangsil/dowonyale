package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.JindanVo;
import common.vo.SearchVo;

public interface AdminJindanAnsDao {
	
	public ModelMap jindanAnsList(SearchVo searchVo);
	public ModelMap jindanAnsListExcel(SearchVo searchVo);
	public ModelMap jindanAnsDetail(JindanVo jindan);
	public Integer jindanAnsDelete(JindanVo jindanVo);
	public Integer jindanAnsDeleteCancel(JindanVo jindanVo);
}
