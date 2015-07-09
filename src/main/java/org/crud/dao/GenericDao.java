package org.crud.dao;

import java.util.List;

public interface GenericDao <T>{

    public T add(T newInstance);

    public T find(int id);

    public void update(T transientObject);

    public void remove(Integer id);
    
    public List<T> list();
}
