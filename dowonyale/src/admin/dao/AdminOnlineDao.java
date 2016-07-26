package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.SearchVo;

public interface AdminOnlineDao {
	
	public ModelMap onlineList(SearchVo searchVo);
	public ModelMap onlineListExcel(SearchVo searchVo);
	public ModelMap online_detail(SearchVo searchVo);
	public Integer onlineInsert(BoardVo boardVo);
	public Integer onlineUpdate(BoardVo boardVo);
	public Integer onlineDelete(BoardVo boardVo);
	public Integer onlineDeleteCancel(BoardVo boardVo);
}
