package model;

public class User {
    private String id;
    private String name;
    private String username;
    private String password;
    private String role;

    public User(String name,String username, String password, String role) {
        this.name = name;
        this.username =username;
        this.password = password;
        this.role = role;
    }

    public User(String id, String name,String username, String password, String role) {
        this.id = id;
        this.name = name;
        this.username =username;
        this.password = password;
        this.role = role;

    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
