package org.crud.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="role")
public final class Role {
	
	@Id
	@GeneratedValue
	@Column(name="role_id")
	private int id;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "role", cascade = CascadeType.ALL)
	private Set<User> users;
	
	@Column(name="role_name", nullable = false)
	private String roleName;
	
	public Role(){};
	
	public Role(String roleName){
		setRoleName(roleName);
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Override
	public String toString() {
		StringBuilder users = new StringBuilder();
		for(User user:this.getUsers()){
			users.append(user+"\n");
		}
		return "Role [id=" + id + ", roleName=" + roleName
				+ ", users:\n"+users+"]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result
				+ ((roleName == null) ? 0 : roleName.hashCode());
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
		Role other = (Role) obj;
		if (id != other.id)
			return false;
		if (roleName == null) {
			if (other.roleName != null)
				return false;
		} else if (!roleName.equals(other.roleName))
			return false;
		if (users == null) {
			if (other.users != null)
				return false;
		} else if (!users.equals(other.users))
			return false;
		return true;
	}
	
}
