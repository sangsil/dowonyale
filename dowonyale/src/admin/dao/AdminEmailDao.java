package admin.dao;

import java.util.List;

import common.vo.EmailVo;

public interface AdminEmailDao {
	
	public List<EmailVo> emailList(EmailVo emailVo);
	
}
