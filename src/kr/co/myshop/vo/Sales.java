 package kr.co.myshop.vo;

public class Sales {
	private int saleNo;			//판매번호
	private String cusId;		//구매자아이디
	private int proNo;		//상품번호
	private int amount;			//판매수량
	private String saleDate;	//판매일
	private int parselNo;		//택배배송번호
	private int salePayNo;		//결제번호
	private int parselState;
	
	public int getSaleNo() {
		return saleNo;
	}
	public void setSaleNo(int saleNo) {
		this.saleNo = saleNo;
	}
	public String getCusId() {
		return cusId;
	}
	public void setCusId(String cusId) {
		this.cusId = cusId;
	}
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
	}
	public int getParselNo() {
		return parselNo;
	}
	public void setParselNo(int parselNo) {
		this.parselNo = parselNo;
	}
	public int getSalePayNo() {
		return salePayNo;
	}
	public void setSalePayNo(int salePayNo) {
		this.salePayNo = salePayNo;
	}
	public int getParselState() {
		return parselState;
	}
	public void setParselState(int parselState) {
		this.parselState = parselState;
	}

	
}
