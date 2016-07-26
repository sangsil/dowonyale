package user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import user.dao.IntroDao;

@Service
public class IntroServiceImpl implements IntroService{
	
	@Autowired
	private IntroDao introDao;
	
	public void setIntroDao(IntroDao introDao) {
		this.introDao = introDao;
	}

	public ModelMap intro_chiryosaList(){
		return (ModelMap)introDao.intro_chiryosaList();
	}
}
