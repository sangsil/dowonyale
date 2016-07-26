package user.service;

import org.springframework.ui.ModelMap;

import common.vo.BoardVo;
import common.vo.SearchVo;

public interface KeomuService {
	
	public ModelMap gongjiList(SearchVo searchVo);
	public ModelMap gongji_detail(SearchVo searchVo);
	public String pre_board_id(SearchVo searchVo);
	public String next_board_id(SearchVo searchVo);
	public Integer addHitCnt(SearchVo searchVo);
	public ModelMap onlineList(SearchVo searchVo);
	public ModelMap online_detail(SearchVo searchVo);
	public int online_insert(BoardVo boardVo);
	public int online_update(BoardVo boardVo);
	public int online_delete(BoardVo boardVo);
	public ModelMap jayuList(SearchVo searchVo);
	public ModelMap jayu_detail(SearchVo searchVo);
	public int jayu_insert(BoardVo boardVo);
	public int jayu_update(BoardVo boardVo);
	public int jayu_delete(BoardVo boardVo);
	
}
