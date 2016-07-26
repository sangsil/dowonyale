package common.vo;

import java.io.Serializable;

public class LogVo implements Serializable{

	private static final long serialVersionUID = -2224927793583660461L;
	
	/**
	 * 테이블 칼럼
	 */
	private String log_id;
	private String log_url;
	private String device_gbn;
	private String mobile_yn;
	private String in_ip;
	private String in_user;
	private String in_date;
	private String nowYear;
	
	private String yearT;
	private String monthT;
	private String dayT;
	private String title;
	private String cnt1;
	private String cnt2;
	private String menu_name;
	
	public String getLog_id() {
		return log_id;
	}
	public void setLog_id(String log_id) {
		this.log_id = log_id;
	}
	public String getLog_url() {
		return log_url;
	}
	public void setLog_url(String log_url) {
		this.log_url = log_url;
	}
	public String getDevice_gbn() {
		return device_gbn;
	}
	public void setDevice_gbn(String device_gbn) {
		this.device_gbn = device_gbn;
	}
	public String getMobile_yn() {
		return mobile_yn;
	}
	public void setMobile_yn(String mobile_yn) {
		this.mobile_yn = mobile_yn;
	}
	public String getIn_ip() {
		return in_ip;
	}
	public void setIn_ip(String in_ip) {
		this.in_ip = in_ip;
	}
	public String getIn_user() {
		return in_user;
	}
	public void setIn_user(String in_user) {
		this.in_user = in_user;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	public String getNowYear() {
		return nowYear;
	}
	public void setNowYear(String nowYear) {
		this.nowYear = nowYear;
	}
	public String getYearT() {
		return yearT;
	}
	public void setYearT(String yearT) {
		this.yearT = yearT;
	}
	public String getMonthT() {
		return monthT;
	}
	public void setMonthT(String monthT) {
		this.monthT = monthT;
	}
	public String getDayT() {
		return dayT;
	}
	public void setDayT(String dayT) {
		this.dayT = dayT;
	}
	public String getCnt1() {
		return cnt1;
	}
	public void setCnt1(String cnt1) {
		this.cnt1 = cnt1;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getCnt2() {
		return cnt2;
	}
	public void setCnt2(String cnt2) {
		this.cnt2 = cnt2;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
