package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.SearchVo;

public interface AdminGongjiService {
	
	public ModelMap gongjiList(SearchVo searchVo);
	public ModelMap gongjiListExcel(SearchVo searchVo);
	public ModelMap gongji_detail(SearchVo searchVo);
	public Integer gongjiInsert(BoardVo gongji);
	public Integer gongjiUpdate(BoardVo gongji);
	public Integer gongjiDelete(BoardVo gongji);
	public Integer gongjiDeleteCancel(BoardVo gongji);
	
}
