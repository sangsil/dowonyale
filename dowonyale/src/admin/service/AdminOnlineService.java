package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.SearchVo;

public interface AdminOnlineService {
	
	public ModelMap onlineList(SearchVo searchVo);
	public ModelMap onlineListExcel(SearchVo searchVo);
	public ModelMap online_detail(SearchVo searchVo);
	public Integer onlineInsert(BoardVo online);
	public Integer onlineUpdate(BoardVo online);
	public Integer onlineDelete(BoardVo online);
	public Integer onlineDeleteCancel(BoardVo online);
	
}
