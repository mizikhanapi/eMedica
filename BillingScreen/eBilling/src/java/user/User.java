/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

/**
 *
 * @author Mike Ho
 */
public class User {
    private String ic_no;
    private String username;
    private String password;
    private String name;
    private String birth_date;
    private String email;
    private String id_type;
    private String id_no;
    private String sex_code;
    private String mobile_no;

    public void setIC(String ic_no)
    {
        this.ic_no = ic_no;
    }
    public String getIC()
    {
        return ic_no;
    }
    public void setUsername(String username)
    {
        this.username = username;
    }
    public String getUsername()
    {
        return username;
    }
    public void setPassword(String password)
    {
        this.password = password;
    }
    public String getPassword()
    {
        return password;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    public String getName()
    {
        return name;
    }
    public void setBirthdate(String birth_date)
    {
        this.birth_date = birth_date;
    }
    public String getBirthdate()
    {
        return birth_date;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }
    public String getEmail()
    {
        return birth_date;
    }
    public void setIdType(String id_type)
    {
        this.id_type = id_type;
    }
    public String getIdType()
    {
        return id_type;
    }
    public void setIdNo(String id_no)
    {
        this.id_no = id_no;
    }
    public String getIdNo()
    {
        return id_no;
    }
    public void setSexCode(String sex_code)
    {
        this.sex_code = sex_code;
    }
    public String getSexCode()
    {
        return sex_code;
    }
    public void setMobileNo(String mobile_no)
    {
        this.mobile_no = mobile_no;
    }

    public String getMobileNo()
    {
        return mobile_no;
    }
}
