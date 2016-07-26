package user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import user.dao.JagaDao;

import common.vo.JindanVo;

@Service
public class JagaServiceImpl implements JagaService{
	
	@Autowired
	private JagaDao jagaDao;
	
	public void setJagaDao(JagaDao jagaDao) {
		this.jagaDao = jagaDao;
	}

	public ModelMap jaga_adhd(JindanVo jindanVo){
		return (ModelMap)jagaDao.jaga_adhd(jindanVo);
	}
	public int jaga_adhdInsert(JindanVo jindanVo){
		return jagaDao.jaga_adhdInsert(jindanVo);
	}
	public ModelMap jaga_soa(JindanVo jindanVo){
		return (ModelMap)jagaDao.jaga_soa(jindanVo);
	}
	public int jaga_soaInsert(JindanVo jindanVo){
		return jagaDao.jaga_soaInsert(jindanVo);
	}
	public ModelMap jaga_hakseub(JindanVo jindanVo){
		return (ModelMap)jagaDao.jaga_hakseub(jindanVo);
	}
	public int jaga_hakseubInsert(JindanVo jindanVo){
		return jagaDao.jaga_hakseubInsert(jindanVo);
	}
}
