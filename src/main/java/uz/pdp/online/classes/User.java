package uz.pdp.online.classes;

import jdk.jfr.DataAmount;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer id = idGen++;
    private String firstname;
    private String lastname;
    private String phone;
    private Integer password;
    private String role;
    private String photoUrl;
    private static Integer idGen = 1;

    public User(String firstname, String lastname, String phone, Integer password, String role, String photoUrl) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.password = password;
        this.role = role;
        this.photoUrl = photoUrl;
    }

    public User(String firstname, String lastname, String phone, Integer password, String role) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.password = password;
        this.role = role;
    }
}
