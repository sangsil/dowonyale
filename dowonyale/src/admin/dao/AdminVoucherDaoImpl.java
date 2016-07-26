package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import common.vo.SearchVo;
import common.vo.VoucherVo;

@Repository
public class AdminVoucherDaoImpl implements AdminVoucherDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	@SuppressWarnings("unchecked")
	public ModelMap voucherList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminVoucher.voucherList_totalCnt", searchVo);
		modelMap.put("totalCnt", total);
		
		List<VoucherVo> resultList = (List<VoucherVo>)sqlSession.selectList("adminVoucher.voucherList", searchVo);
		modelMap.put("resultList", resultList);
		
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap voucherAllList(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		List<VoucherVo> resultList = (List<VoucherVo>)sqlSession.selectList("adminVoucher.voucherAllList", searchVo);
		modelMap.put("voucher_resultList", resultList);
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	public ModelMap voucherListExcel(SearchVo searchVo){
		ModelMap modelMap = new ModelMap();
		
		int total = (Integer)sqlSession.selectOne("adminVoucher.voucherList_allCnt", searchVo);
		searchVo.setStartNum(0);
		searchVo.setMaxRows(total);		
		List<VoucherVo> resultList = (List<VoucherVo>)sqlSession.selectList("adminVoucher.voucherList", searchVo);
		modelMap.put("resultList", resultList);
		return modelMap;
	}
	
	public Integer voucherDuplChk(SearchVo searchVo){
		return (Integer)sqlSession.selectOne("adminVoucher.voucherDuplChk", searchVo);
	}
	
	public Integer voucherInsert(VoucherVo voucherVo){
		return (Integer)sqlSession.insert("adminVoucher.voucherInsert", voucherVo);
	}
	
	public Integer voucherUpdate(VoucherVo voucherVo){
		return (Integer)sqlSession.update("adminVoucher.voucherUpdate", voucherVo);
	}
	public Integer voucherDelete(VoucherVo voucherVo){
		String[] arr_voucher_id = voucherVo.getArr_voucher_id().split(",");
		int result = 0;
		for(int i=0; i<arr_voucher_id.length; i++){
			voucherVo.setVoucher_id(arr_voucher_id[i]);
			result = (Integer)sqlSession.update("adminVoucher.voucherDelete", voucherVo);
		}
		return result;
	}
	public Integer voucherDeleteCancel(VoucherVo voucherVo){
		String[] arr_voucher_id = voucherVo.getArr_voucher_id().split(",");
		int result = 0;
		for(int i=0; i<arr_voucher_id.length; i++){
			voucherVo.setVoucher_id(arr_voucher_id[i]);
			result = (Integer)sqlSession.update("adminVoucher.voucherDeleteCancel", voucherVo);
		}
		return result;
	}
}
