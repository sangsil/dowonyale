package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.ChiryosaVo;
import common.vo.SearchVo;

public interface AdminChiryosaService {
	
	public ModelMap chiryosaList(SearchVo searchVo);
	public ModelMap chiryosaListExcel(SearchVo searchVo);
	public ModelMap chiryosa_detail(SearchVo searchVo);
	public Integer chiryosaInsert(ChiryosaVo chiryosa);
	public Integer chiryosaUpdate(ChiryosaVo chiryosa);
	public Integer chiryosaDelete(ChiryosaVo chiryosa);
	public Integer chiryosaDeleteCancel(ChiryosaVo chiryosa);
	
}
