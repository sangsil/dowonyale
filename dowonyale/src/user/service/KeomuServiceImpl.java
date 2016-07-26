package user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import user.dao.KeomuDao;

import common.vo.BoardVo;
import common.vo.SearchVo;

@Service
public class KeomuServiceImpl implements KeomuService{
	
	@Autowired
	private KeomuDao keomuDao;
	
	public ModelMap gongjiList(SearchVo searchVo){
		return (ModelMap)keomuDao.gongjiList(searchVo);
	}
	public ModelMap gongji_detail(SearchVo searchVo){
		return (ModelMap)keomuDao.gongji_detail(searchVo);
	}
	
	public String pre_board_id(SearchVo searchVo){
		return keomuDao.pre_board_id(searchVo);

	}
	public String next_board_id(SearchVo searchVo){
		return keomuDao.next_board_id(searchVo);
	}
	public Integer addHitCnt(SearchVo searchVo){
		return (Integer)keomuDao.addHitCnt(searchVo);
	}
	
	public ModelMap onlineList(SearchVo searchVo){
		return (ModelMap)keomuDao.onlineList(searchVo);
	}
	public ModelMap online_detail(SearchVo searchVo){
		return (ModelMap)keomuDao.online_detail(searchVo);
	}
	
	public int online_insert(BoardVo boardVo){
		return keomuDao.online_insert(boardVo);
	}
	
	public int online_update(BoardVo boardVo){
		return keomuDao.online_update(boardVo);
	}
	
	public int online_delete(BoardVo boardVo){
		return keomuDao.online_delete(boardVo);
	}
	
	public ModelMap jayuList(SearchVo searchVo){
		return (ModelMap)keomuDao.jayuList(searchVo);
	}
	public ModelMap jayu_detail(SearchVo searchVo){
		return (ModelMap)keomuDao.jayu_detail(searchVo);
	}

	public int jayu_insert(BoardVo boardVo){
		return keomuDao.jayu_insert(boardVo);
	}
	
	public int jayu_update(BoardVo boardVo){
		return keomuDao.jayu_update(boardVo);
	}
	
	public int jayu_delete(BoardVo boardVo){
		return keomuDao.jayu_delete(boardVo);
	}
	
	
}
