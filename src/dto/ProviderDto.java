package dto;

public class ProviderDto{
	private String name, service, phone, email, address, address2, state, zipcode, city;
	private int provider_Id, rating, noOfRating;
	
	public int getProvider_Id() {
		return provider_Id;
	}

	public void setProvider_Id(int provider_Id) {
		this.provider_Id = provider_Id;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getName()
	{
		return name;
	}
	
	
	public void setService(String service)
	{
		this.service = service;
	}

	public String getService()
	{
		return service;
	}	
	
	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public String getPhone()
	{
		return phone;
	}
	
	
	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getEmail()
	{
		return email;
	}
	
	
	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getAddress()
	{
		return address;
	}
	
	
	public void setAddress2(String address2)
	{
		this.address2 = address2;
	}

	public String getAddress2()
	{
		return address2;
	}
	
	
	public void setState(String state)
	{
		this.state = state;
	}

	public String getState()
	{
		return state;
	}
	
	
	public void setZipCode(String zipcode)
	{
		this.zipcode = zipcode;
	}

	public String getZipCode()
	{
		return zipcode;
	}
	
	
	
	public void setCity(String city)
	{
		this.city = city;
	}

	public String getCity()
	{
		return city;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getNoOfRating() {
		return noOfRating;
	}

	public void setNoOfRating(int noOfRating) {
		this.noOfRating = noOfRating;
	}
}