package org.crud.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {

	@Id
	@Column(name = "user_id")
	@GeneratedValue
	private int userId;

	@Column(name = "email", nullable = false)
	private String email;

	@Column(name = "first_name", nullable = false)
	private String firstName;

	@Column(name = "last_name", nullable = false)
	private String lastName;

	@Column(name = "password", nullable = false)
	private String password;

	@GeneratedValue
	@Column(name = "reg_date")
	private String regDate;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id")
	private Role role;

	@Column(name = "banned", nullable = false)
	private boolean banned;

	public User() {
	}

	public User(String email, String firstName, String lastName, String password) {
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public boolean isBanned() {
		return banned;
	}

	public void setBanned(boolean banned) {
		this.banned = banned;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", email=" + email + ", firstName="
				+ firstName + ", lastName=" + lastName + ", password="
				+ password + ", regDate=" + regDate + ", roleName="
				+ role.getRoleName() + ", banned=" + banned + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (banned ? 1231 : 1237);
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result
				+ ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result
				+ ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((regDate == null) ? 0 : regDate.hashCode());
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		result = prime * result + userId;
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
		User other = (User) obj;
		if (banned != other.banned)
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (regDate == null) {
			if (other.regDate != null)
				return false;
		} else if (!regDate.equals(other.regDate))
			return false;
		if (role == null) {
			if (other.role != null)
				return false;
		} else if (!role.equals(other.role))
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}
	
}
