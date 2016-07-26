package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.SearchVo;

public interface AdminGyoukDao {
	
	public ModelMap gyoukList(SearchVo searchVo);
	public ModelMap gyoukListExcel(SearchVo searchVo);
	public ModelMap gyouk_detail(SearchVo searchVo);
	public Integer gyoukInsert(BoardVo boardVo);
	public Integer gyoukUpdate(BoardVo boardVo);
	public Integer gyoukDelete(BoardVo boardVo);
	public Integer gyoukDeleteCancel(BoardVo boardVo);
}
