package common.vo;

import java.io.Serializable;
import java.util.List;

public class BoardVo implements Serializable{
	
	private static final long serialVersionUID = -607873519481855204L;
	/**
	 * 테이블 칼럼
	 */
	private String board_id;	
	private String board_gbn;	
	private String board_title;	
	private String board_txt;			
	private String hit_cnt;			
	private String del_yn;
	private String reply_yn;
	private String in_date;
	private String in_user;
	private String up_date;
	private String up_user;
	
	private String arr_board_id;
	private String in_user_name;
	private String up_user_name;
	
	/**
	 * 첨부파일
	 */
	private String	file_name;
	private String	file_re_name;
	private List<FileVo> fileList;
	
	
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
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_txt() {
		return board_txt;
	}
	public void setBoard_txt(String board_txt) {
		this.board_txt = board_txt;
	}
	public String getHit_cnt() {
		return hit_cnt;
	}
	public void setHit_cnt(String hit_cnt) {
		this.hit_cnt = hit_cnt;
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
	public String getArr_board_id() {
		return arr_board_id;
	}
	public void setArr_board_id(String arr_board_id) {
		this.arr_board_id = arr_board_id;
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
	public String getReply_yn() {
		return reply_yn;
	}
	public void setReply_yn(String reply_yn) {
		this.reply_yn = reply_yn;
	}
}
