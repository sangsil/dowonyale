package common.vo;

import java.io.Serializable;

public class VoucherVo implements Serializable{

	private static final long serialVersionUID = 5433507136440595944L;
	/**
	 * 테이블 칼럼
	 */
	
	private String voucher_id; 
	private String charge_month; 
	private String gwamok;
	private String gwamok_name;
	private String suyeop_gubun; 
	private String suyeop_gubun_name; 
	private String voucher_amt; 
	private String suyeop_cnt; 
	private String suyeop_amt; 
	private String del_yn; 
	private String in_date; 
	private String in_user; 
	private String up_date; 
	private String up_user;
	
	private String arr_voucher_id;
	private String in_user_name;
	private String up_user_name;
	
	public String getVoucher_id() {
		return voucher_id;
	}
	public void setVoucher_id(String voucher_id) {
		this.voucher_id = voucher_id;
	}
	public String getCharge_month() {
		return charge_month;
	}
	public void setCharge_month(String charge_month) {
		this.charge_month = charge_month;
	}
	public String getGwamok() {
		return gwamok;
	}
	public void setGwamok(String gwamok) {
		this.gwamok = gwamok;
	}
	public String getGwamok_name() {
		return gwamok_name;
	}
	public void setGwamok_name(String gwamok_name) {
		this.gwamok_name = gwamok_name;
	}
	public String getSuyeop_gubun() {
		return suyeop_gubun;
	}
	public void setSuyeop_gubun(String suyeop_gubun) {
		this.suyeop_gubun = suyeop_gubun;
	}
	public String getSuyeop_gubun_name() {
		return suyeop_gubun_name;
	}
	public void setSuyeop_gubun_name(String suyeop_gubun_name) {
		this.suyeop_gubun_name = suyeop_gubun_name;
	}
	public String getVoucher_amt() {
		return voucher_amt;
	}
	public void setVoucher_amt(String voucher_amt) {
		this.voucher_amt = voucher_amt;
	}
	public String getSuyeop_cnt() {
		return suyeop_cnt;
	}
	public void setSuyeop_cnt(String suyeop_cnt) {
		this.suyeop_cnt = suyeop_cnt;
	}
	public String getSuyeop_amt() {
		return suyeop_amt;
	}
	public void setSuyeop_amt(String suyeop_amt) {
		this.suyeop_amt = suyeop_amt;
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
	public String getArr_voucher_id() {
		return arr_voucher_id;
	}
	public void setArr_voucher_id(String arr_voucher_id) {
		this.arr_voucher_id = arr_voucher_id;
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
}
