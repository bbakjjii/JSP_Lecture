package chap08.dto;

public class Menu {
	
	private String name;
	private Integer price;
	private String image;
	
	// 기본 생성자
	public Menu() {}
	
	public Menu(String name, Integer price, String image) {
		this.name = name;
		this.price = price;
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
