package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminLogDao;
import common.vo.LogVo;
import common.vo.SearchVo;

@Service
public class AdminLogServiceImpl implements AdminLogService{
	
	@Autowired
	private AdminLogDao adminLogDao;
	
	public List<LogVo> logList(SearchVo searchVo){
		return adminLogDao.logList(searchVo);
	}
	
	@Override
	public Integer logList_allCnt(SearchVo searchVo) {
		return (Integer)adminLogDao.logList_allCnt(searchVo);
	}

	@Override
	public Integer logList_totalCnt(SearchVo searchVo) {
		return (Integer)adminLogDao.logList_totalCnt(searchVo);
	}
	
	@Override
	public ModelMap logListExcel(SearchVo searchVo){
		return (ModelMap)adminLogDao.logListExcel(searchVo);
	}
	
	@Override
	public Integer logInsert(LogVo logVo){
		return (Integer)adminLogDao.logInsert(logVo);
	}

	@Override
	public LogVo logVisitor(SearchVo searchVo) {
		return adminLogDao.logVisitor(searchVo);
	}

	@Override
	public List<LogVo> logVisitorUrl(SearchVo searchVo) {
		return adminLogDao.logVisitorUrl(searchVo);
	}

	@Override
	public List<LogVo> join_gbn(SearchVo searchVo) {
		return adminLogDao.join_gbn(searchVo);
	}

	@Override
	public List<LogVo> logBrowser_gbn(SearchVo searchVo) {
		return adminLogDao.logBrowser_gbn(searchVo);
	}

	@Override
	public List<LogVo> logMobine_gbn(SearchVo searchVo) {
		return adminLogDao.logMobine_gbn(searchVo);
	}

	@Override
	public List<LogVo> logVisitor_Month(SearchVo searchVo) {
		List<LogVo> resultList = adminLogDao.logVisitor_Month(searchVo);
		
		for(int i=0; i<resultList.size(); i++){
			System.out.println("resultList["+i+"]:"+resultList.get(i).getTitle());
		}
		
		return resultList;
	}
}
