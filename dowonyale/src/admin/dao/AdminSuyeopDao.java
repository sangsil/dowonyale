package admin.dao;

import org.springframework.ui.ModelMap;

import common.vo.SearchVo;
import common.vo.SuyeopVo;
import common.vo.SuyeopryoVo;
import common.vo.VoucherVo;

public interface AdminSuyeopDao {
	
	public ModelMap suyeopList(SearchVo searchVo);
	public ModelMap suyeopAllList(SearchVo searchVo);
	public ModelMap suyeopListExcel(SearchVo searchVo);
	public Integer suyeopDuplChk(SearchVo searchVo);
	public Integer suyeopInsert(SuyeopVo suyeopVo);
	public Integer suyeopUpdate(SuyeopVo suyeopVo);
	public Integer suyeopDelete(SuyeopVo suyeopVo);
	public Integer suyeopDeleteCancel(SuyeopVo suyeopVo);
	public VoucherVo suyeopSelectAdong(String adong_id);
	public SuyeopryoVo suyeopSelectSuyeopryo(String suyeop_gubun, String gwamok);
}
