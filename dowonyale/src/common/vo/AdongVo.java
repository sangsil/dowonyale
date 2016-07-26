package common.vo;

import java.io.Serializable;

public class AdongVo implements Serializable{

	private static final long serialVersionUID = -2424927793583660461L;
	
	/**
	 * 테이블 칼럼
	 */
	private String adong_id;
	private String adong_name;
	private String parent_name;
	private String adong_birth;
	private String end_date;
	private String adong_sex;
	private String zip_code;
	private String voucher_id;
	private String addr1;
	private String addr2;
	private String phone1;
	private String phone2;
	private String phone3;	
	private String adongPyeongga;	
	private String del_yn;
	private String in_user;
	private String in_date;
	private String up_user;
	private String up_date;
	
	private String arr_adong_id;
	private String in_user_name;
	private String up_user_name;
	
	public String getAdong_id() {
		return adong_id;
	}
	public void setAdong_id(String adong_id) {
		this.adong_id = adong_id;
	}
	public String getAdong_name() {
		return adong_name;
	}
	public void setAdong_name(String adong_name) {
		this.adong_name = adong_name;
	}
	public String getParent_name() {
		return parent_name;
	}
	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}
	public String getAdong_birth() {
		return adong_birth;
	}
	public void setAdong_birth(String adong_birth) {
		this.adong_birth = adong_birth;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getAdong_sex() {
		return adong_sex;
	}
	public void setAdong_sex(String adong_sex) {
		this.adong_sex = adong_sex;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
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
	public String getUp_user() {
		return up_user;
	}
	public void setUp_user(String up_user) {
		this.up_user = up_user;
	}
	public String getUp_date() {
		return up_date;
	}
	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}
	public String getArr_adong_id() {
		return arr_adong_id;
	}
	public void setArr_adong_id(String arr_adong_id) {
		this.arr_adong_id = arr_adong_id;
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
	public String getVoucher_id() {
		return voucher_id;
	}
	public void setVoucher_id(String voucher_id) {
		this.voucher_id = voucher_id;
	}
	public String getAdongPyeongga() {
		return adongPyeongga;
	}
	public void setAdongPyeongga(String adongPyeongga) {
		this.adongPyeongga = adongPyeongga;
	}
}
