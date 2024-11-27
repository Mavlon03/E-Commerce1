package uz.pdp.online.classes;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
private Integer id = idGen++;
private static Integer idGen = 1;
private String name;
private Integer price;
private Integer categoryId;
private String photoUrl;

    public Product(String name, Integer price, Integer categoryId, String photoUrl) {
        this.name = name;
        this.price = price;
        this.categoryId = categoryId;
        this.photoUrl = photoUrl;
    }

}
