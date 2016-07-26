package common.vo;

import java.io.Serializable;

public class UserVo implements Serializable{

	private static final long serialVersionUID = 3091756358460669286L;
	/**
	 * 테이블 칼럼
	 */
	private String id;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String email1;
	private String email2;
	private String birth_year;
	private String birth_month;
	private String birth_day;
	private String sex;
	private String phone1;
	private String phone2;
	private String phone3;
	private String child_name;
	private String del_yn;
	private String user_type;
	private String login_cnt;
	private String login_date;
	private String in_user;
	private String in_date;
	private String up_user;
	private String up_date;
	private String zip_code;
	private String addr1;
	private String addr2;
	private String tel1;
	private String tel2;
	private String tel3;	
	private String user_job;
	private String order_no;
	
	private String login_gbn;
	private String p_id;
	private String p_email;
	private String p_nickname;
	private String p_age;
	private String p_gender;
	private String p_name;
	private String p_birthday;
	private String p_user_img;
	
	// 테이블 칼럼
	private String arr_user_id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getBirth_year() {
		return birth_year;
	}

	public void setBirth_year(String birth_year) {
		this.birth_year = birth_year;
	}

	public String getBirth_month() {
		return birth_month;
	}

	public void setBirth_month(String birth_month) {
		this.birth_month = birth_month;
	}

	public String getBirth_day() {
		return birth_day;
	}

	public void setBirth_day(String birth_day) {
		this.birth_day = birth_day;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
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

	public String getChild_name() {
		return child_name;
	}

	public void setChild_name(String child_name) {
		this.child_name = child_name;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getLogin_cnt() {
		return login_cnt;
	}

	public void setLogin_cnt(String login_cnt) {
		this.login_cnt = login_cnt;
	}

	public String getLogin_date() {
		return login_date;
	}

	public void setLogin_date(String login_date) {
		this.login_date = login_date;
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

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getUser_job() {
		return user_job;
	}

	public void setUser_job(String user_job) {
		this.user_job = user_job;
	}

	public String getLogin_gbn() {
		return login_gbn;
	}

	public void setLogin_gbn(String login_gbn) {
		this.login_gbn = login_gbn;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getP_nickname() {
		return p_nickname;
	}

	public void setP_nickname(String p_nickname) {
		this.p_nickname = p_nickname;
	}

	public String getP_age() {
		return p_age;
	}

	public void setP_age(String p_age) {
		this.p_age = p_age;
	}

	public String getP_gender() {
		return p_gender;
	}

	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_birthday() {
		return p_birthday;
	}

	public void setP_birthday(String p_birthday) {
		this.p_birthday = p_birthday;
	}

	public String getP_user_img() {
		return p_user_img;
	}

	public void setP_user_img(String p_user_img) {
		this.p_user_img = p_user_img;
	}

	public String getArr_user_id() {
		return arr_user_id;
	}

	public void setArr_user_id(String arr_user_id) {
		this.arr_user_id = arr_user_id;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	
}
