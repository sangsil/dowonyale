package common.vo;

import java.io.Serializable;

public class JindanVo implements Serializable{

	private static final long serialVersionUID = 6756608156053455647L;
	
	
	/**
	 * 테이블 칼럼
	 */
	private String jindan_id; 
	private String jindan_quest_no; 
	private String jindan_sub_quest_no; 
	private String jindan_gbn; 
	private String jindan_gbn_name; 
	private String jindan_txt; 
	private String del_yn; 
	private String in_date; 
	private String in_user; 
	private String up_date; 
	private String up_user;
	private String in_user_name;
	private String up_user_name;

	private String[] arr_jindan_sub_quest_no; 
	private String[] arr_jindan_txt; 
	private String[] arr_jindan_ans; 
	private String[] arr_jindan_quest_no; 
	private String resultCnt;
	
	private String jindan_ans_id; 
	private String user_id; 
	private String user_name; 
	private String ans_num; 
	private String ans_val;
	private String ans_status;
	private String arr_jindan_id;
	private String Arr_jindanAns_id;
	
	public String getJindan_id() {
		return jindan_id;
	}
	public void setJindan_id(String jindan_id) {
		this.jindan_id = jindan_id;
	}
	public String getJindan_quest_no() {
		return jindan_quest_no;
	}
	public void setJindan_quest_no(String jindan_quest_no) {
		this.jindan_quest_no = jindan_quest_no;
	}
	public String getJindan_sub_quest_no() {
		return jindan_sub_quest_no;
	}
	public void setJindan_sub_quest_no(String jindan_sub_quest_no) {
		this.jindan_sub_quest_no = jindan_sub_quest_no;
	}
	public String getJindan_gbn() {
		return jindan_gbn;
	}
	public void setJindan_gbn(String jindan_gbn) {
		this.jindan_gbn = jindan_gbn;
	}
	public String getJindan_txt() {
		return jindan_txt;
	}
	public void setJindan_txt(String jindan_txt) {
		this.jindan_txt = jindan_txt;
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
	public String getJindan_ans_id() {
		return jindan_ans_id;
	}
	public void setJindan_ans_id(String jindan_ans_id) {
		this.jindan_ans_id = jindan_ans_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAns_num() {
		return ans_num;
	}
	public void setAns_num(String ans_num) {
		this.ans_num = ans_num;
	}
	public String getAns_val() {
		return ans_val;
	}
	public void setAns_val(String ans_val) {
		this.ans_val = ans_val;
	}
	public String getArr_jindan_id() {
		return arr_jindan_id;
	}
	public void setArr_jindan_id(String arr_jindan_id) {
		this.arr_jindan_id = arr_jindan_id;
	}
	public String[] getArr_jindan_sub_quest_no() {
		return arr_jindan_sub_quest_no;
	}
	public void setArr_jindan_sub_quest_no(String[] arr_jindan_sub_quest_no) {
		this.arr_jindan_sub_quest_no = arr_jindan_sub_quest_no;
	}
	public String[] getArr_jindan_txt() {
		return arr_jindan_txt;
	}
	public void setArr_jindan_txt(String[] arr_jindan_txt) {
		this.arr_jindan_txt = arr_jindan_txt;
	}
	public String getJindan_gbn_name() {
		return jindan_gbn_name;
	}
	public void setJindan_gbn_name(String jindan_gbn_name) {
		this.jindan_gbn_name = jindan_gbn_name;
	}
	public String getResultCnt() {
		return resultCnt;
	}
	public void setResultCnt(String resultCnt) {
		this.resultCnt = resultCnt;
	}
	public String[] getArr_jindan_ans() {
		return arr_jindan_ans;
	}
	public void setArr_jindan_ans(String[] arr_jindan_ans) {
		this.arr_jindan_ans = arr_jindan_ans;
	}
	public String[] getArr_jindan_quest_no() {
		return arr_jindan_quest_no;
	}
	public void setArr_jindan_quest_no(String[] arr_jindan_quest_no) {
		this.arr_jindan_quest_no = arr_jindan_quest_no;
	}
	public String getArr_jindanAns_id() {
		return Arr_jindanAns_id;
	}
	public void setArr_jindanAns_id(String arr_jindanAns_id) {
		Arr_jindanAns_id = arr_jindanAns_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getAns_status() {
		return ans_status;
	}
	public void setAns_status(String ans_status) {
		this.ans_status = ans_status;
	}
}
