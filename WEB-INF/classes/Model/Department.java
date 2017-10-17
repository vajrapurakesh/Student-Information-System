/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author admin
 */
public class Department {

    private int d_ID;
    private String d_Name;
    private String d_Location;

    /**
     * @return the d_ID
     */
    public int getD_ID() {
        return d_ID;
    }

    /**
     * @param d_ID the d_ID to set
     */
    public void setD_ID(int d_ID) {
        this.d_ID = d_ID;
    }

    /**
     * @return the d_Name
     */
    public String getD_Name() {
        return d_Name;
    }

    /**
     * @param d_Name the d_Name to set
     */
    public void setD_Name(String d_Name) {
        this.d_Name = d_Name;
    }

    /**
     * @return the d_Location
     */
    public String getD_Location() {
        return d_Location;
    }

    /**
     * @param d_Location the d_Location to set
     */
    public void setD_Location(String d_Location) {
        this.d_Location = d_Location;
    }

}
