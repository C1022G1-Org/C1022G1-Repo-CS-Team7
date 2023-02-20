package model;

public class Books {
    private int id;
    private String name;
    private String pageSize;
    private double cost;
    private String author;
    private String category;

    public Books() {
    }

    public Books(String name, String pageSize, double cost, String author, String category) {
        this.name = name;
        this.pageSize = pageSize;
        this.cost = cost;
        this.author = author;
        this.category = category;
    }


    public Books(int id, String name, String pageSize, double cost, String author, String category) {
        this.id = id;
        this.name = name;
        this.pageSize = pageSize;
        this.cost = cost;
        this.author = author;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPageSize() {
        return pageSize;
    }

    public void setPageSize(String pageSize) {
        this.pageSize = pageSize;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

}
