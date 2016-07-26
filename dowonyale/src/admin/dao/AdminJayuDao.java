package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.SearchVo;

public interface AdminJayuDao {
	
	public ModelMap jayuList(SearchVo searchVo);
	public ModelMap jayuListExcel(SearchVo searchVo);
	public ModelMap jayu_detail(SearchVo searchVo);
	public Integer jayuInsert(BoardVo boardVo);
	public Integer jayuUpdate(BoardVo boardVo);
	public Integer jayuDelete(BoardVo boardVo);
	public Integer jayuDeleteCancel(BoardVo boardVo);
}
