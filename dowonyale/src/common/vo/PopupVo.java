package common.vo;

import java.io.Serializable;
import java.util.List;

public class PopupVo implements Serializable{
	
	private static final long serialVersionUID = -607873539481855204L;
	/**
	 * 테이블 칼럼
	 */
	private String popup_id;
    private String popup_gbn;
    private String popup_title;
    private String popup_txt;
    private String popup_width;
    private String popup_height;
    private String popup_top;
    private String popup_left;
    private String from_date;
    private String to_date;
    private String hit_cnt;
    private String del_yn;
    private String in_date;
    private String in_user;
    private String up_date;
    private String up_user;
    
	private String arr_popup_id;
	private String in_user_name;
	private String up_user_name;
	
	/**
	 * 첨부파일
	 */
	private String	file_name;
	private String	file_re_name;
	private List<FileVo> fileList;
	
	public String getPopup_id() {
		return popup_id;
	}
	public void setPopup_id(String popup_id) {
		this.popup_id = popup_id;
	}
	public String getPopup_gbn() {
		return popup_gbn;
	}
	public void setPopup_gbn(String popup_gbn) {
		this.popup_gbn = popup_gbn;
	}
	public String getPopup_title() {
		return popup_title;
	}
	public void setPopup_title(String popup_title) {
		this.popup_title = popup_title;
	}
	public String getPopup_txt() {
		return popup_txt;
	}
	public void setPopup_txt(String popup_txt) {
		this.popup_txt = popup_txt;
	}
	public String getPopup_width() {
		return popup_width;
	}
	public void setPopup_width(String popup_width) {
		this.popup_width = popup_width;
	}
	public String getPopup_height() {
		return popup_height;
	}
	public void setPopup_height(String popup_height) {
		this.popup_height = popup_height;
	}
	public String getPopup_top() {
		return popup_top;
	}
	public void setPopup_top(String popup_top) {
		this.popup_top = popup_top;
	}
	public String getPopup_left() {
		return popup_left;
	}
	public void setPopup_left(String popup_left) {
		this.popup_left = popup_left;
	}
	public String getFrom_date() {
		return from_date;
	}
	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}
	public String getTo_date() {
		return to_date;
	}
	public void setTo_date(String to_date) {
		this.to_date = to_date;
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
	public String getArr_popup_id() {
		return arr_popup_id;
	}
	public void setArr_popup_id(String arr_popup_id) {
		this.arr_popup_id = arr_popup_id;
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
}
