package common.vo;

public class MngmVo {
	private String usr_sn;
	private String usr_nm;
	private String cmnt;
	private String reg_dtti;
	private String del_yn;
	private String dr_sn;
	
	private int startNum;
	private int maxRows;
	private String cPage;
	
	private String searchType;
	private String searchText;
	
	private int total;
	
	private int excelStartNum;
	private int excelMaxRows;
	public String getUsr_sn() {
		return usr_sn;
	}
	public void setUsr_sn(String usr_sn) {
		this.usr_sn = usr_sn;
	}
	public String getUsr_nm() {
		return usr_nm;
	}
	public void setUsr_nm(String usr_nm) {
		this.usr_nm = usr_nm;
	}
	public String getCmnt() {
		return cmnt;
	}
	public void setCmnt(String cmnt) {
		this.cmnt = cmnt;
	}
	public String getReg_dtti() {
		return reg_dtti;
	}
	public void setReg_dtti(String reg_dtti) {
		this.reg_dtti = reg_dtti;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getMaxRows() {
		return maxRows;
	}
	public void setMaxRows(int maxRows) {
		this.maxRows = maxRows;
	}
	public String getcPage() {
		return cPage;
	}
	public void setcPage(String cPage) {
		this.cPage = cPage;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getExcelStartNum() {
		return excelStartNum;
	}
	public void setExcelStartNum(int excelStartNum) {
		this.excelStartNum = excelStartNum;
	}
	public int getExcelMaxRows() {
		return excelMaxRows;
	}
	public void setExcelMaxRows(int excelMaxRows) {
		this.excelMaxRows = excelMaxRows;
	}
	public String getDr_sn() {
		return dr_sn;
	}
	public void setDr_sn(String dr_sn) {
		this.dr_sn = dr_sn;
	}

}
