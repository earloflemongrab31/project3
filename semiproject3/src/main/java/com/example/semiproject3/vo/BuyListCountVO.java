package com.example.semiproject3.vo;

public class BuyListCountVO {
private String itemName;
private int cnt;

public String getItemName() {
	return itemName;
}
public void setItemName(String itemName) {
	this.itemName = itemName;
}
public int getCnt() {
	return cnt;
}
public void setCnt(int cnt) {
	this.cnt = cnt;
}
@Override
public String toString() {
	return "BuyListCountVO [itemName=" + itemName + ", cnt=" + cnt + "]";
}
public BuyListCountVO() {
	super();
}

}