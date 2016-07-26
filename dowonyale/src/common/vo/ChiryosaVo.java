package common.vo;

import java.io.Serializable;
import java.util.List;

public class ChiryosaVo implements Serializable{
	
	private static final long serialVersionUID = 2529459839802592169L;
	/**
	 * 테이블 칼럼
	 */
	private String chiryosa_id;	
	private String user_id;	
	private String chiryosa_carr;	
	private String order_no;			
	private String del_yn;
	private String in_date;
	private String in_user;
	private String up_date;
	private String up_user;
	
	private String arr_chiryosa_id;
	private String in_user_name;
	private String up_user_name;
	
	private String user_name;	
	private String user_job;	
	/**
	 * 첨부파일
	 */
	private String	file_name;
	private String	file_re_name;
	private List<FileVo> fileList;
	
	public String getChiryosa_id() {
		return chiryosa_id;
	}
	public void setChiryosa_id(String chiryosa_id) {
		this.chiryosa_id = chiryosa_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getChiryosa_carr() {
		return chiryosa_carr;
	}
	public void setChiryosa_carr(String chiryosa_carr) {
		this.chiryosa_carr = chiryosa_carr;
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
	public String getArr_chiryosa_id() {
		return arr_chiryosa_id;
	}
	public void setArr_chiryosa_id(String arr_chiryosa_id) {
		this.arr_chiryosa_id = arr_chiryosa_id;
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_job() {
		return user_job;
	}
	public void setUser_job(String user_job) {
		this.user_job = user_job;
	}
}
