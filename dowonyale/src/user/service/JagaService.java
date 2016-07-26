package user.service;

import org.springframework.ui.ModelMap;

import common.vo.JindanVo;

public interface JagaService {
	
	public ModelMap jaga_adhd(JindanVo jindanVo);
	public int jaga_adhdInsert(JindanVo jindanVo);
	public ModelMap jaga_soa(JindanVo jindanVo);
	public int jaga_soaInsert(JindanVo jindanVo);
	public ModelMap jaga_hakseub(JindanVo jindanVo);
	public int jaga_hakseubInsert(JindanVo jindanVo);
}
