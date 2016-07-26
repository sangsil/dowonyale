package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.SearchVo;

public interface AdminJayuService {
	
	public ModelMap jayuList(SearchVo searchVo);
	public ModelMap jayuListExcel(SearchVo searchVo);
	public ModelMap jayu_detail(SearchVo searchVo);
	public Integer jayuInsert(BoardVo jayu);
	public Integer jayuUpdate(BoardVo jayu);
	public Integer jayuDelete(BoardVo jayu);
	public Integer jayuDeleteCancel(BoardVo jayu);
	
}
