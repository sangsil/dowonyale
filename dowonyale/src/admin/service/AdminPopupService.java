package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.PopupVo;
import common.vo.SearchVo;

public interface AdminPopupService {
	
	public ModelMap popupList(SearchVo searchVo);
	public ModelMap popupListExcel(SearchVo searchVo);
	public ModelMap popup_detail(SearchVo searchVo);
	public Integer popupInsert(PopupVo popup);
	public Integer popupUpdate(PopupVo popup);
	public Integer popupDelete(PopupVo popup);
	public Integer popupDeleteCancel(PopupVo popup);
	
}
