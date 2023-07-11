package kr.ezen.bbs.domain;

import lombok.Data;


@Data
public class ProductDTO {
    private int pNum;
    private String pName;
    private String pCategory_fk;
    private String pCompany;
    private String pImage;
    private int pQty;
    private int price;
    private String pSpec;
    private String pContent;
    private int pPoint;
    private String pInputDate;

    private int totPrice;
    private int totPoint;

    public ProductDTO(){}

    public ProductDTO(int pNum, String pName, String pCategory_fk, String pCompany, String pImage, int pQty, int price,
                      String pSpec, String pContent, int pPoint, String pInputDate, int totPrice, int totPoint) {
        super();
        this.pNum = pNum;
        this.pName = pName;
        this.pCategory_fk = pCategory_fk;
        this.pCompany = pCompany;
        this.pImage = pImage;
        this.pQty = pQty;
        this.price = price;
        this.pSpec = pSpec;
        this.pContent = pContent;
        this.pPoint = pPoint;
        this.pInputDate = pInputDate;

        this.totPrice = totPrice;
        this.totPoint = totPoint;
    }

    public int getpNum() {
        return pNum;
    }

    public void setpNum(int pNum) {
        this.pNum = pNum;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpCategory_fk() {
        return pCategory_fk;
    }

    public void setpCategory_fk(String pCategory_fk) {
        this.pCategory_fk = pCategory_fk;
    }

    public String getpCompany() {
        return pCompany;
    }

    public void setpCompany(String pCompany) {
        this.pCompany = pCompany;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public int getpQty() {
        return pQty;
    }

    public void setpQty(int pQty) {
        this.pQty = pQty;

        totPrice = this.pQty*price;
        totPoint = this.pQty*pPoint;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getpSpec() {
        return pSpec;
    }

    public void setpSpec(String pSpec) {
        this.pSpec = pSpec;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public int getpPoint() {
        return pPoint;
    }

    public void setpPoint(int pPoint) {
        this.pPoint = pPoint;
    }

    public String getpInputDate() {
        return pInputDate;
    }

    public void setpInputDate(String pInputDate) {
        this.pInputDate = pInputDate;
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

    @Override
    public String toString() {
        return "ProductDTO [pNum=" + pNum + ", pName=" + pName + ", pCategory_fk=" + pCategory_fk + ", pCompany="
                + pCompany + ", pImage=" + pImage + ", pQty=" + pQty + ", price=" + price + ", pSpec=" + pSpec
                + ", pContent=" + pContent + ", pPoint=" + pPoint + ", pInputDate=" + pInputDate + ", totPrice="
                + totPrice + ", totPoint=" + totPoint + "]";
    }





}

