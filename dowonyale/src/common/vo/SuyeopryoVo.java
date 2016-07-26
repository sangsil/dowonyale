package common.vo;

import java.io.Serializable;

public class SuyeopryoVo implements Serializable{

	private static final long serialVersionUID = 6084706754971887801L;
	/**
	 * 테이블 칼럼
	 */
	
	private String suyeopryo_id;
	private String suyeop_month;
	private String gwamok;
	private String suyeop_gubun; 
	private String cash_charge; 
	private String card_charge; 
	private String del_yn; 
	private String in_date; 
	private String in_user; 
	private String up_date; 
	private String up_user;
	
	private String arr_suyeopryo_id;
	private String in_user_name;
	private String up_user_name;
	private String gwamok_name;
	private String suyeop_gubun_name; 
	private String singyu_name;
	private String user_name;
	private String adong_name;
	private String napip_gbn_name;
	
	public String getSuyeopryo_id() {
		return suyeopryo_id;
	}
	public void setSuyeopryo_id(String suyeopryo_id) {
		this.suyeopryo_id = suyeopryo_id;
	}
	public String getGwamok() {
		return gwamok;
	}
	public void setGwamok(String gwamok) {
		this.gwamok = gwamok;
	}
	public String getSuyeop_gubun() {
		return suyeop_gubun;
	}
	public void setSuyeop_gubun(String suyeop_gubun) {
		this.suyeop_gubun = suyeop_gubun;
	}
	public String getCash_charge() {
		return cash_charge;
	}
	public void setCash_charge(String cash_charge) {
		this.cash_charge = cash_charge;
	}
	public String getCard_charge() {
		return card_charge;
	}
	public void setCard_charge(String card_charge) {
		this.card_charge = card_charge;
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
	public String getArr_suyeopryo_id() {
		return arr_suyeopryo_id;
	}
	public void setArr_suyeopryo_id(String arr_suyeopryo_id) {
		this.arr_suyeopryo_id = arr_suyeopryo_id;
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
	public String getGwamok_name() {
		return gwamok_name;
	}
	public void setGwamok_name(String gwamok_name) {
		this.gwamok_name = gwamok_name;
	}
	public String getSuyeop_gubun_name() {
		return suyeop_gubun_name;
	}
	public void setSuyeop_gubun_name(String suyeop_gubun_name) {
		this.suyeop_gubun_name = suyeop_gubun_name;
	}
	public String getSingyu_name() {
		return singyu_name;
	}
	public void setSingyu_name(String singyu_name) {
		this.singyu_name = singyu_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getAdong_name() {
		return adong_name;
	}
	public void setAdong_name(String adong_name) {
		this.adong_name = adong_name;
	}
	public String getNapip_gbn_name() {
		return napip_gbn_name;
	}
	public void setNapip_gbn_name(String napip_gbn_name) {
		this.napip_gbn_name = napip_gbn_name;
	}
	public String getSuyeop_month() {
		return suyeop_month;
	}
	public void setSuyeop_month(String suyeop_month) {
		this.suyeop_month = suyeop_month;
	}
}
