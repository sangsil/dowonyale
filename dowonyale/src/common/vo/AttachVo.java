package common.vo;

import java.io.Serializable;

public class AttachVo implements Serializable {

	private static final long serialVersionUID = -6400582857851738911L;
	private String	attach_sn;
	private String	board_id;	
	private String	board_gbn;
	private String	attach_size;
	private String	attach_name;
	private String	attach_re_name;
	private String	del_yn;
	private String	attach_gbn;
//	private String	file_path = "/home/hosting_users/namuhtest/uploadfiles/";
	private String	file_path = "c:\\test\\";
	private String	in_date;
	private String	in_user;
	private String	up_date;
	private String	up_user;
	
	public String getAttach_sn() {
		return attach_sn;
	}
	public void setAttach_sn(String attach_sn) {
		this.attach_sn = attach_sn;
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
	public String getAttach_size() {
		return attach_size;
	}
	public void setAttach_size(String attach_size) {
		this.attach_size = attach_size;
	}
	public String getAttach_name() {
		return attach_name;
	}
	public void setAttach_name(String attach_name) {
		this.attach_name = attach_name;
	}
	public String getAttach_re_name() {
		return attach_re_name;
	}
	public void setAttach_re_name(String attach_re_name) {
		this.attach_re_name = attach_re_name;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getAttach_gbn() {
		return attach_gbn;
	}
	public void setAttach_gbn(String attach_gbn) {
		this.attach_gbn = attach_gbn;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
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
}
