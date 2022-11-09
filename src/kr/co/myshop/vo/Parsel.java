package kr.co.myshop.vo;
//
public class Parsel {
	private int parselNo;	//배송코드
	private String parselAddr;	//배송지
	private String cusTel;		//구매자 연락처
	private String parselCompany;	//배송회사
	private String parselTel;		//배송기사 연락처
	private int parselState;	//배송상태
	private String valeCode;		//화물코드
	public int getParselNo() {
		return parselNo;
	}
	public void setParselNo(int parselNo) {
		this.parselNo = parselNo;
	}
	public String getParselAddr() {
		return parselAddr;
	}
	public void setParselAddr(String parselAddr) {
		this.parselAddr = parselAddr;
	}
	public String getCusTel() {
		return cusTel;
	}
	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}
	public String getParselCompany() {
		return parselCompany;
	}
	public void setParselCompany(String parselCompany) {
		this.parselCompany = parselCompany;
	}
	public String getParselTel() {
		return parselTel;
	}
	public void setParselTel(String parselTel) {
		this.parselTel = parselTel;
	}
	public int getParselState() {
		return parselState;
	}
	public void setParselState(int parselState) {
		this.parselState = parselState;
	}
	public String getValeCode() {
		return valeCode;
	}
	public void setValeCode(String valeCode) {
		this.valeCode = valeCode;
	}
	
	
}
