package com.entities;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
private int pId;
private String pName;
@Column(length=3000)
private String pDesc;
private String pPhoto;
private int pPrice;
private int pDiscount;
private int pQuantity;
@ManyToOne (cascade = CascadeType.PERSIST)
@JoinColumn(name="CategoryId")
private Category category;

public Product(String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity, Category category) {
	super();
	this.pName = pName;
	this.pDesc = pDesc;
	this.pPhoto = pPhoto;
	this.pPrice = pPrice;
	this.pDiscount = pDiscount;
	this.pQuantity = pQuantity;
	this.category=category;
}
public Product() {
	super();
	// TODO Auto-generated constructor stub
}


public Category getCategory() {
	return category;
}
public void setCategory(Category category) {
	this.category = category;
}
public String getpName() {
	return pName;
}
public void setpName(String pName) {
	this.pName = pName;
}
public String getpDesc() {
	return pDesc;
}
public void setpDesc(String pDesc) {
	this.pDesc = pDesc;
}
public String getpPhoto() {
	return pPhoto;
}
public void setpPhoto(String pPhoto) {
	this.pPhoto = pPhoto;
}
public int getpPrice() {
	return pPrice;
}
public void setpPrice(int pPrice) {
	this.pPrice = pPrice;
}
public int getpDiscount() {
	return pDiscount;
}
public void setpDiscount(int pDiscount) {
	this.pDiscount = pDiscount;
}
public int getpQuantity() {
	return pQuantity;
}
public void setpQuantity(int pQuantity) {
	this.pQuantity = pQuantity;
}

public int getpId() {
	return pId;
}
public void setpId(int pId) {
	this.pId = pId;
}
@Override
public String toString() {
	return "Product [pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pPrice=" + pPrice
			+ ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + "]";
}

//TO calculate the discount price. and we will fetch this entity in out index.jsp
public int getPriceAfterDiscount() {
	int d=(int) ((this.getpDiscount()/100.0)*this.getpPrice());   //here we have taken the discount of the product and after dividing by 100.0 we are multiplying it by the Price we entered and we have entered in the string so we are typecasting it to int
return this.getpPrice()-d;
}



}
