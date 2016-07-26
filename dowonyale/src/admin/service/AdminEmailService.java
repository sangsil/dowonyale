package admin.service;

import java.util.List;


import common.vo.EmailVo;

public interface AdminEmailService {
	
	public List<EmailVo> emailList(EmailVo emailVo);
	
}
