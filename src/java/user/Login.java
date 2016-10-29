package user;

public class Login implements java.io.Serializable {

    String username, password;

    public Login() {}

    public Login(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUser() {
        return username;
    }

    public void setUser(String user) {
        username = user;
    }

    public String getPass() {
        return password;
    }

    public void setPass(String pass) {
        password = pass;
    }
}
