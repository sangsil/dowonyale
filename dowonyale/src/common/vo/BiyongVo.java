package common.vo;

import java.io.Serializable;
import java.util.List;

public class BiyongVo implements Serializable{
	
	private static final long serialVersionUID = 2529459839802592169L;
	/**
	 * 테이블 칼럼
	 */
	private String biyong_id;
	private String user_id;
	private String biyong_session;
	private String biyong_group;
	private String biyong_sangdam;
	private String biyong_food;
	private String biyong_sogyeonseo;
	private String biyong_geongang;
	private String biyong_gukmin;
	private String biyong_goyong;
	private String biyong_sanjea;
	private String biyong_toijik;
	private String biyong_etc_txt;
	private String biyong_etc;		
	
	private String del_yn;
	private String in_date;
	private String in_user;
	private String up_date;
	private String up_user;
	
	private String arr_biyong_id;
	private String in_user_name;
	private String up_user_name;
	
	private String user_name;	
	/**
	 * 첨부파일
	 */
	private String	file_name;
	private String	file_re_name;
	private List<FileVo> fileList;
	
	public String getBiyong_id() {
		return biyong_id;
	}
	public void setBiyong_id(String biyong_id) {
		this.biyong_id = biyong_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBiyong_session() {
		return biyong_session;
	}
	public void setBiyong_session(String biyong_session) {
		this.biyong_session = biyong_session;
	}
	public String getBiyong_group() {
		return biyong_group;
	}
	public void setBiyong_group(String biyong_group) {
		this.biyong_group = biyong_group;
	}
	public String getBiyong_sangdam() {
		return biyong_sangdam;
	}
	public void setBiyong_sangdam(String biyong_sangdam) {
		this.biyong_sangdam = biyong_sangdam;
	}
	public String getBiyong_food() {
		return biyong_food;
	}
	public void setBiyong_food(String biyong_food) {
		this.biyong_food = biyong_food;
	}
	public String getBiyong_sogyeonseo() {
		return biyong_sogyeonseo;
	}
	public void setBiyong_sogyeonseo(String biyong_sogyeonseo) {
		this.biyong_sogyeonseo = biyong_sogyeonseo;
	}
	public String getBiyong_geongang() {
		return biyong_geongang;
	}
	public void setBiyong_geongang(String biyong_geongang) {
		this.biyong_geongang = biyong_geongang;
	}
	public String getBiyong_gukmin() {
		return biyong_gukmin;
	}
	public void setBiyong_gukmin(String biyong_gukmin) {
		this.biyong_gukmin = biyong_gukmin;
	}
	public String getBiyong_goyong() {
		return biyong_goyong;
	}
	public void setBiyong_goyong(String biyong_goyong) {
		this.biyong_goyong = biyong_goyong;
	}
	public String getBiyong_sanjea() {
		return biyong_sanjea;
	}
	public void setBiyong_sanjea(String biyong_sanjea) {
		this.biyong_sanjea = biyong_sanjea;
	}
	public String getBiyong_toijik() {
		return biyong_toijik;
	}
	public void setBiyong_toijik(String biyong_toijik) {
		this.biyong_toijik = biyong_toijik;
	}
	public String getBiyong_etc_txt() {
		return biyong_etc_txt;
	}
	public void setBiyong_etc_txt(String biyong_etc_txt) {
		this.biyong_etc_txt = biyong_etc_txt;
	}
	public String getBiyong_etc() {
		return biyong_etc;
	}
	public void setBiyong_etc(String biyong_etc) {
		this.biyong_etc = biyong_etc;
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
	public String getArr_biyong_id() {
		return arr_biyong_id;
	}
	public void setArr_biyong_id(String arr_biyong_id) {
		this.arr_biyong_id = arr_biyong_id;
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_re_name() {
		return file_re_name;
	}
	public void setFile_re_name(String file_re_name) {
		this.file_re_name = file_re_name;
	}
	public List<FileVo> getFileList() {
		return fileList;
	}
	public void setFileList(List<FileVo> fileList) {
		this.fileList = fileList;
	}
}
