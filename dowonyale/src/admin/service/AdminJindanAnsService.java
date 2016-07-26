package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.JindanVo;
import common.vo.SearchVo;

public interface AdminJindanAnsService {
	
	public ModelMap jindanAnsList(SearchVo searchVo);
	public ModelMap jindanAnsListExcel(SearchVo searchVo);
	public ModelMap jindanAnsDetail(JindanVo jindan);
	public Integer jindanAnsDelete(JindanVo jindan);
	public Integer jindanAnsDeleteCancel(JindanVo jindan);
	
}
