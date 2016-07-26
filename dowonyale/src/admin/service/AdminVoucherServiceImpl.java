package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import admin.dao.AdminVoucherDao;

import common.vo.SearchVo;
import common.vo.VoucherVo;

@Service
public class AdminVoucherServiceImpl implements AdminVoucherService{
	
	@Autowired
	private AdminVoucherDao adminVoucherDao;
	
	public ModelMap voucherList(SearchVo searchVo){
		return (ModelMap)adminVoucherDao.voucherList(searchVo);
	}

	public ModelMap voucherAllList(SearchVo searchVo){
		return (ModelMap)adminVoucherDao.voucherAllList(searchVo);
	}
	
	public ModelMap voucherListExcel(SearchVo searchVo){
		return (ModelMap)adminVoucherDao.voucherListExcel(searchVo);
	}
	
	public Integer voucherDuplChk(SearchVo searchVo){
		return (Integer)adminVoucherDao.voucherDuplChk(searchVo);
	}
	
	public Integer voucherInsert(VoucherVo voucherVo){
		return (Integer)adminVoucherDao.voucherInsert(voucherVo);
	}

	public Integer voucherUpdate(VoucherVo voucherVo){
		return (Integer)adminVoucherDao.voucherUpdate(voucherVo);
	}
	
	public Integer voucherDelete(VoucherVo voucherVo){
		return (Integer)adminVoucherDao.voucherDelete(voucherVo);
	}
	
	public Integer voucherDeleteCancel(VoucherVo voucherVo){
		return (Integer)adminVoucherDao.voucherDeleteCancel(voucherVo);
	}
	
}
