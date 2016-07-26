package common.vo;

import java.io.Serializable;

public class ComcdVo implements Serializable{
	
	private static final long serialVersionUID = 438230941471416378L;
	/**
	 * 테이블 칼럼
	 */
	private String high_cd_id;	
	private String high_cd_name;	
	private String high_cd_type;	
	private String cd_id;			
	private String cd_name;		
	private String order_no;
	private String del_yn;
	private String in_date;
	private String in_user;
	private String up_date;
	private String up_user;
	
	private String arr_cd_id;
	private String in_user_name;
	private String up_user_name;
	
	public String getHigh_cd_id() {
		return high_cd_id;
	}
	public void setHigh_cd_id(String high_cd_id) {
		this.high_cd_id = high_cd_id;
	}
	public String getHigh_cd_name() {
		return high_cd_name;
	}
	public void setHigh_cd_name(String high_cd_name) {
		this.high_cd_name = high_cd_name;
	}
	public String getHigh_cd_type() {
		return high_cd_type;
	}
	public void setHigh_cd_type(String high_cd_type) {
		this.high_cd_type = high_cd_type;
	}
	public String getCd_id() {
		return cd_id;
	}
	public void setCd_id(String cd_id) {
		this.cd_id = cd_id;
	}
	public String getCd_name() {
		return cd_name;
	}
	public void setCd_name(String cd_name) {
		this.cd_name = cd_name;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	public String getIn_user() {
		return in_user;
	}
	public void setIn_user(String in_user) {
		this.in_user = in_user;
	}
	public String getUp_date() {
		return up_date;
	}
	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}
	public String getUp_user() {
		return up_user;
	}
	public void setUp_user(String up_user) {
		this.up_user = up_user;
	}
	public String getArr_cd_id() {
		return arr_cd_id;
	}
	public void setArr_cd_id(String arr_cd_id) {
		this.arr_cd_id = arr_cd_id;
	}
	public String getIn_user_name() {
		return in_user_name;
	}
	public void setIn_user_name(String in_user_name) {
		this.in_user_name = in_user_name;
	}
	public String getUp_user_name() {
		return up_user_name;
	}
	public void setUp_user_name(String up_user_name) {
		this.up_user_name = up_user_name;
	}
	/**
	 * 테이블 칼럼
	 */
}
