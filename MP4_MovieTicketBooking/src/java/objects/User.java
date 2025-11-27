package objects;

public class User {
    private String username;
    private String password;
    private String name;
    // New fields
    private String age;
    private String contact;
    private String address;

    public User() {}

    // Updated Constructor to accept ALL fields
    public User(String username, String password, String name, String age, String contact, String address) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.age = age;
        this.contact = contact;
        this.address = address;
    }

    // --- Getters and Setters ---

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getAge() { return age; }
    public void setAge(String age) { this.age = age; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
}