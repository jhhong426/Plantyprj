package com.plantynet.domain;

public class SurResultDTO {

	private String item;
	private String item_no;
	private int male_score;
	private int female_score;
	
	
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getItem_no() {
		return item_no;
	}
	public void setItem_no(String item_no) {
		this.item_no = item_no;
	}
	public int getMale_score() {
		return male_score;
	}
	public void setMale_score(int male_score) {
		this.male_score = male_score;
	}
	public int getFemale_score() {
		return female_score;
	}
	public void setFemale_score(int female_score) {
		this.female_score = female_score;
	}
	
	@Override
	public String toString() {
		return "SurResultDTO [item=" + item + ", item_no=" + item_no + ", male_score=" + male_score + ", female_score="
				+ female_score + "]";
	}
	
	
	
	
	
}
