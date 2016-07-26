package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminEmailDao;
import admin.dao.AdminLogDao;
import common.vo.EmailVo;
import common.vo.LogVo;
import common.vo.SearchVo;

@Service
public class AdminEmailServiceImpl implements AdminEmailService{
	
	@Autowired
	private AdminEmailDao adminEmailDao;

	@Override
	public List<EmailVo> emailList(EmailVo emailVo) {
		return adminEmailDao.emailList(emailVo);
	}
}
