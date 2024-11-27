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
    private Integer productId;
    private Integer userId;
    private Integer amount;
    private Date date;
    private static Integer idGen = 1;

    public Order(Integer productId, Integer userId, Integer amount, Date date) {
        this.productId = productId;
        this.userId = userId;
        this.amount = amount;
        this.date = date;
    }
}
