package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.LogVo;
import common.vo.SearchVo;

@Repository
public class AdminLogDaoImpl implements AdminLogDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public List<LogVo> logList(SearchVo searchVo){
		List<LogVo> resultList = (List<LogVo>)sqlSession.selectList("adminLog.logList", searchVo);
		return resultList;
	}
	@Override
	public Integer logList_allCnt(SearchVo searchVo) {
		return (Integer)sqlSession.selectOne("adminLog.logList_allCnt", searchVo);
	}

	@Override
	public Integer logList_totalCnt(SearchVo searchVo) {
		return (Integer)sqlSession.selectOne("adminLog.logList_totalCnt", searchVo);
	}
	
	@Override
	public ModelMap logListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminLog.logList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<LogVo> resultList = (List<LogVo>)sqlSession.selectList("adminLog.logList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	@Override
	public Integer logInsert(LogVo logVo){
		return (Integer)sqlSession.insert("adminLog.logInsert", logVo);
	}

	@Override
	public LogVo logVisitor(SearchVo searchVo) {
		LogVo resultList = (LogVo) sqlSession.selectOne("adminLog.logVisitor", searchVo);
		return resultList;
	}

	@Override
	public List<LogVo> logVisitorUrl(SearchVo searchVo) {
		List<LogVo> resultList = (List<LogVo>)sqlSession.selectList("adminLog.logVisitorUrl", searchVo);
		return resultList;
	}

	@Override
	public List<LogVo> join_gbn(SearchVo searchVo) {
		List<LogVo> resultList = (List<LogVo>)sqlSession.selectList("adminLog.join_gbn", searchVo);
		return resultList;
	}

	@Override
	public List<LogVo> logBrowser_gbn(SearchVo searchVo) {
		List<LogVo> resultList = (List<LogVo>)sqlSession.selectList("adminLog.logBrowser_gbn", searchVo);
		return resultList;
	}

	@Override
	public List<LogVo> logMobine_gbn(SearchVo searchVo) {
		List<LogVo> resultList = (List<LogVo>)sqlSession.selectList("adminLog.logMobine_gbn", searchVo);
		return resultList;
	}

	@Override
	public List<LogVo> logVisitor_Month(SearchVo searchVo) {
		List<LogVo> resultList = (List<LogVo>)sqlSession.selectList("adminLog.logVisitor_Month", searchVo);
		return resultList;
	}
	
}
