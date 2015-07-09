package org.crud.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

	@Column(name = "product_id")
	@Id
	@GeneratedValue
	private int id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "serial")
	private String serial;
	
	@Column(name = "price")
	private BigDecimal price;
	
	@Column(name = "e_date")
	private String expDate;
	
	@Column(name = "m_date")
	private String manufDate;
	
	@Column(name = "weight")
	private float weight;
	
	@Column(name = "dimensions")
	private String dimensions;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSerial() {
		return serial;
	}

	public void setSerial(String serial) {
		this.serial = serial;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getExpDate() {
		return expDate;
	}

	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}

	public String getManufDate() {
		return manufDate;
	}

	public void setManufDate(String manufDate) {
		this.manufDate = manufDate;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public String getDimensions() {
		return dimensions;
	}
	
	public void setDimensions(String dimensions) {
		this.dimensions = dimensions;
	}

	public void setDimensions(int length, int width, int height) {
		this.dimensions = length + "x" + width + "x" + height;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", serial=" + serial
				+ ", price=" + price + ", expDate=" + expDate + ", manufDate="
				+ manufDate + ", weight=" + weight + ", dimensions="
				+ dimensions + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((dimensions == null) ? 0 : dimensions.hashCode());
		result = prime * result + ((expDate == null) ? 0 : expDate.hashCode());
		result = prime * result + id;
		result = prime * result
				+ ((manufDate == null) ? 0 : manufDate.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result + ((serial == null) ? 0 : serial.hashCode());
		result = prime * result + Float.floatToIntBits(weight);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (dimensions == null) {
			if (other.dimensions != null)
				return false;
		} else if (!dimensions.equals(other.dimensions))
			return false;
		if (expDate == null) {
			if (other.expDate != null)
				return false;
		} else if (!expDate.equals(other.expDate))
			return false;
		if (id != other.id)
			return false;
		if (manufDate == null) {
			if (other.manufDate != null)
				return false;
		} else if (!manufDate.equals(other.manufDate))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		if (serial == null) {
			if (other.serial != null)
				return false;
		} else if (!serial.equals(other.serial))
			return false;
		if (Float.floatToIntBits(weight) != Float.floatToIntBits(other.weight))
			return false;
		return true;
	}
	
	

}
