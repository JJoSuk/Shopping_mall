package kr.ezen.bbs.domain;

public class CartDTO {
	private int cNum;
	private String id;
	private int pNum;
	private int pQty;

	private String pName;
	private String pImage;
	private int price;
	private int pPoint;
	private String pSpec;

	private int totPrice;
	private int totPoint;

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public int getpQty() {
		return pQty;
	}

	public void setpQty(int pQty) {
		this.pQty = pQty;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getpPoint() {
		return pPoint;
	}

	public void setpPoint(int pPoint) {
		this.pPoint = pPoint;
	}

	public String getpSpec() {
		return pSpec;
	}

	public void setpSpec(String pSpec) {
		this.pSpec = pSpec;
	}

	public int getTotPrice() {
		return totPrice;
	}

	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}

	public int getTotPoint() {
		return totPoint;
	}

	public void setTotPoint(int totPoint) {
		this.totPoint = totPoint;
	}

	public void setTotal() {
		this.totPrice = this.pQty * price;
		this.totPoint = this.pQty * pPoint;
	}

	@Override
	public String toString() {
		return "CartDTO [cNum=" + cNum + ", id=" + id + ", pNum=" + pNum + ", pQty=" + pQty + ", pName=" + pName
				+ ", pImage=" + pImage + ", price=" + price + ", pPoint=" + pPoint + ", pSpec=" + pSpec + ", totPrice="
				+ totPrice + ", totPoint=" + totPoint + "]";
	}

}
