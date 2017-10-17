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
public class Course {
    private String c_Id;
    private String c_Name;
    private String c_Credits;
    private String c_Desc;
    private String t_ClassRoom;
    private int t_MaximumSeats;
    private String R_Semester;
    private int P_Id;
    private String p_FirstName;
    private String p_LastName;

    /**
     * @return the c_Id
     */
    public String getC_Id() {
        return c_Id;
    }

    /**
     * @param c_Id the c_Id to set
     */
    public void setC_Id(String c_Id) {
        this.c_Id = c_Id;
    }

    /**
     * @return the c_Name
     */
    public String getC_Name() {
        return c_Name;
    }

    /**
     * @param c_Name the c_Name to set
     */
    public void setC_Name(String c_Name) {
        this.c_Name = c_Name;
    }

    /**
     * @return the c_Credits
     */
    public String getC_Credits() {
        return c_Credits;
    }

    /**
     * @param c_Credits the c_Credits to set
     */
    public void setC_Credits(String c_Credits) {
        this.c_Credits = c_Credits;
    }

    /**
     * @return the c_Desc
     */
    public String getC_Desc() {
        return c_Desc;
    }

    /**
     * @param c_Desc the c_Desc to set
     */
    public void setC_Desc(String c_Desc) {
        this.c_Desc = c_Desc;
    }

    /**
     * @return the t_ClassRoom
     */
    public String getT_ClassRoom() {
        return t_ClassRoom;
    }

    /**
     * @param t_ClassRoom the t_ClassRoom to set
     */
    public void setT_ClassRoom(String t_ClassRoom) {
        this.t_ClassRoom = t_ClassRoom;
    }

    /**
     * @return the t_MaximumSeats
     */
    public int getT_MaximumSeats() {
        return t_MaximumSeats;
    }

    /**
     * @param t_MaximumSeats the t_MaximumSeats to set
     */
    public void setT_MaximumSeats(int t_MaximumSeats) {
        this.t_MaximumSeats = t_MaximumSeats;
    }

    /**
     * @return the R_Semester
     */
    public String getR_Semester() {
        return R_Semester;
    }

    /**
     * @param R_Semester the R_Semester to set
     */
    public void setR_Semester(String R_Semester) {
        this.R_Semester = R_Semester;
    }

    /**
     * @return the P_Id
     */
    public int getP_Id() {
        return P_Id;
    }

    /**
     * @param P_Id the P_Id to set
     */
    public void setP_Id(int P_Id) {
        this.P_Id = P_Id;
    }

    /**
     * @return the p_FirstName
     */
    public String getP_FirstName() {
        return p_FirstName;
    }

    /**
     * @param p_FirstName the p_FirstName to set
     */
    public void setP_FirstName(String p_FirstName) {
        this.p_FirstName = p_FirstName;
    }

    /**
     * @return the p_LastName
     */
    public String getP_LastName() {
        return p_LastName;
    }

    /**
     * @param p_LastName the p_LastName to set
     */
    public void setP_LastName(String p_LastName) {
        this.p_LastName = p_LastName;
    }
}
