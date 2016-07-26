package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.SearchVo;
import common.vo.VoucherVo;

public interface AdminVoucherDao {
	
	public ModelMap voucherList(SearchVo searchVo);
	public ModelMap voucherAllList(SearchVo searchVo);
	public ModelMap voucherListExcel(SearchVo searchVo);
	public Integer voucherDuplChk(SearchVo searchVo);
	public Integer voucherInsert(VoucherVo voucherVo);
	public Integer voucherUpdate(VoucherVo voucherVo);
	public Integer voucherDelete(VoucherVo voucherVo);
	public Integer voucherDeleteCancel(VoucherVo voucherVo);
}
