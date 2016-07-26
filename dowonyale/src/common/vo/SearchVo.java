package common.vo;

import java.io.Serializable;
import java.util.List;

public class SearchVo implements Serializable{

	private static final long serialVersionUID = 1617543227712750393L;

	/**
	 * 페이징
	 */
	private int total;
	private int startNum;
	private int maxRows;
	private String cPage;
	
	/**
	 * 검색
	 */
	private String search_type;
	private String search_value;
	private int order_cnt=10;
	
	/**
	 * 회원
	 */
	private String id;
	private String login_gbn;
	private String user_id;
	private String user_name;
	private String email;
	
	/**
	 * 보드
	 * @return
	 */
	private String board_id;
	private String board_gbn;
	
	/**
	 * 진단
	 */
	private String jindan_id; 
	private String search_jindan_gbn; 
	private String jindan_ans_id;
	
	private String in_user;

	/**
	 * 치료사
	 * @return
	 */
	private String chiryosa_id;
	
	private String biyong_id;
	
	/**
	 * 팝업
	 */
	private String popup_gbn;
	private String popup_id;
	
	/**
	 * 로그 
	 * @return
	 */
	private String fromDate;
	private String toDate;
	private String fromYear;
	private String toYear;
	private String searchYear;
	private List<String> logTerm;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
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
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public String getSearch_value() {
		return search_value;
	}
	public void setSearch_value(String search_value) {
		this.search_value = search_value;
	}
	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLogin_gbn() {
		return login_gbn;
	}
	public void setLogin_gbn(String login_gbn) {
		this.login_gbn = login_gbn;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_gbn() {
		return board_gbn;
	}
	public void setBoard_gbn(String board_gbn) {
		this.board_gbn = board_gbn;
	}
	public String getJindan_id() {
		return jindan_id;
	}
	public void setJindan_id(String jindan_id) {
		this.jindan_id = jindan_id;
	}
	public String getSearch_jindan_gbn() {
		return search_jindan_gbn;
	}
	public void setSearch_jindan_gbn(String search_jindan_gbn) {
		this.search_jindan_gbn = search_jindan_gbn;
	}
	public String getJindan_ans_id() {
		return jindan_ans_id;
	}
	public void setJindan_ans_id(String jindan_ans_id) {
		this.jindan_ans_id = jindan_ans_id;
	}
	public String getIn_user() {
		return in_user;
	}
	public void setIn_user(String in_user) {
		this.in_user = in_user;
	}
	public String getChiryosa_id() {
		return chiryosa_id;
	}
	public void setChiryosa_id(String chiryosa_id) {
		this.chiryosa_id = chiryosa_id;
	}
	public String getBiyong_id() {
		return biyong_id;
	}
	public void setBiyong_id(String biyong_id) {
		this.biyong_id = biyong_id;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getFromYear() {
		return fromYear;
	}
	public void setFromYear(String fromYear) {
		this.fromYear = fromYear;
	}
	public String getToYear() {
		return toYear;
	}
	public void setToYear(String toYear) {
		this.toYear = toYear;
	}
	public String getSearchYear() {
		return searchYear;
	}
	public void setSearchYear(String searchYear) {
		this.searchYear = searchYear;
	}
	public List<String> getLogTerm() {
		return logTerm;
	}
	public void setLogTerm(List<String> logTerm) {
		this.logTerm = logTerm;
	}
	public String getPopup_gbn() {
		return popup_gbn;
	}
	public void setPopup_gbn(String popup_gbn) {
		this.popup_gbn = popup_gbn;
	}
	public String getPopup_id() {
		return popup_id;
	}
	public void setPopup_id(String popup_id) {
		this.popup_id = popup_id;
	}
}
