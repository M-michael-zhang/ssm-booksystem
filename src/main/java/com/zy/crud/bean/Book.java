package com.zy.crud.bean;

public class Book {
    private Integer bid;

    private String bname;

    private Double bprice;

    private Integer bnumber;

    private String bauthor;

    private String bpress;

    private String bisbn;

    public Book() {
    }

    public Book(Integer bid, String bname, Double bprice, Integer bnumber, String bauthor, String bpress, String bisbn) {
        this.bid = bid;
        this.bname = bname;
        this.bprice = bprice;
        this.bnumber = bnumber;
        this.bauthor = bauthor;
        this.bpress = bpress;
        this.bisbn = bisbn;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname == null ? null : bname.trim();
    }

    public Double getBprice() {
        return bprice;
    }

    public void setBprice(Double bprice) {
        this.bprice = bprice;
    }

    public Integer getBnumber() {
        return bnumber;
    }

    public void setBnumber(Integer bnumber) {
        this.bnumber = bnumber;
    }

    public String getBauthor() {
        return bauthor;
    }

    public void setBauthor(String bauthor) {
        this.bauthor = bauthor == null ? null : bauthor.trim();
    }

    public String getBpress() {
        return bpress;
    }

    public void setBpress(String bpress) {
        this.bpress = bpress == null ? null : bpress.trim();
    }

    public String getBisbn() {
        return bisbn;
    }

    public void setBisbn(String bisbn) {
        this.bisbn = bisbn == null ? null : bisbn.trim();
    }
}
