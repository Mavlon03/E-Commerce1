package uz.pdp.online.classes;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private Integer id = idGen++;
    private String name;
    private Integer userId;
    private Date date;
    private static Integer idGen = 1;


}
