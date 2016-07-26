package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.SearchVo;
import common.vo.SuyeopryoVo;

public interface AdminSuyeopryoService {
	
	public ModelMap suyeopryoList(SearchVo searchVo);
	public ModelMap suyeopryoAllList(SearchVo searchVo);
	public ModelMap suyeopryoListExcel(SearchVo searchVo);
	public Integer suyeopryoDuplChk(SearchVo searchVo);
	public Integer suyeopryoInsert(SuyeopryoVo suyeopryoVo);
	public Integer suyeopryoUpdate(SuyeopryoVo suyeopryoVo);
	public Integer suyeopryoDelete(SuyeopryoVo suyeopryoVo);
	public Integer suyeopryoDeleteCancel(SuyeopryoVo suyeopryoVo);
	
}
