package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.ChiryosaVo;
import common.vo.SearchVo;

public interface AdminChiryosaDao {
	
	public ModelMap chiryosaList(SearchVo searchVo);
	public ModelMap chiryosaListExcel(SearchVo searchVo);
	public ModelMap chiryosa_detail(SearchVo searchVo);
	public Integer chiryosaInsert(ChiryosaVo chiryosaVo);
	public Integer chiryosaUpdate(ChiryosaVo chiryosaVo);
	public Integer chiryosaDelete(ChiryosaVo chiryosaVo);
	public Integer chiryosaDeleteCancel(ChiryosaVo chiryosaVo);
}
