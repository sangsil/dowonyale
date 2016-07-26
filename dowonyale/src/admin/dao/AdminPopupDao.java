package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.PopupVo;
import common.vo.SearchVo;

public interface AdminPopupDao {
	
	public ModelMap popupList(SearchVo searchVo);
	public ModelMap popupListExcel(SearchVo searchVo);
	public ModelMap popup_detail(SearchVo searchVo);
	public Integer popupInsert(PopupVo popupVo);
	public Integer popupUpdate(PopupVo popupVo);
	public Integer popupDelete(PopupVo popupVo);
	public Integer popupDeleteCancel(PopupVo popupVo);
}
