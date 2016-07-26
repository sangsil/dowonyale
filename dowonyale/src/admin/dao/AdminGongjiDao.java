package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.SearchVo;

public interface AdminGongjiDao {
	
	public ModelMap gongjiList(SearchVo searchVo);
	public ModelMap gongjiListExcel(SearchVo searchVo);
	public ModelMap gongji_detail(SearchVo searchVo);
	public Integer gongjiInsert(BoardVo boardVo);
	public Integer gongjiUpdate(BoardVo boardVo);
	public Integer gongjiDelete(BoardVo boardVo);
	public Integer gongjiDeleteCancel(BoardVo boardVo);
}
