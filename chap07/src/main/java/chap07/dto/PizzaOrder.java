package chap07.dto;

public class PizzaOrder {
	
	private String name;
	private String address;
	private String city;
	private String email;
	private String phone;
	private String crust;
	private String pizza_size;
	private String topping;
	private String instruction;
	
	public PizzaOrder(String name, String address, String city, 
			String email, String phone, String crust, 
			String pizza_size, String topping, String instruction){
		this.name = name;
		this.address = address;
		this.city = city;
		this.email = email;
		this.phone = phone;
		this.crust = crust;
		this.pizza_size = pizza_size;
		this.topping = topping;
		this.instruction = instruction;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public String getCity() {
		return city;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public String getCrust() {
		return crust;
	}

	public String getpizza_size() {
		return pizza_size;
	}

	public String getTopping() {
		return topping;
	}

	public String getInstruction() {
		return instruction;
	}
	
}
