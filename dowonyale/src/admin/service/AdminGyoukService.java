package admin.service;

import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.SearchVo;

public interface AdminGyoukService {
	
	public ModelMap gyoukList(SearchVo searchVo);
	public ModelMap gyoukListExcel(SearchVo searchVo);
	public ModelMap gyouk_detail(SearchVo searchVo);
	public Integer gyoukInsert(BoardVo gyouk);
	public Integer gyoukUpdate(BoardVo gyouk);
	public Integer gyoukDelete(BoardVo gyouk);
	public Integer gyoukDeleteCancel(BoardVo gyouk);
	
}
