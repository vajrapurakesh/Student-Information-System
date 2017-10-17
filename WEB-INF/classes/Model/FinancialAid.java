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
public class FinancialAid {

    private int f_Id;
    private String f_Requirements;
    private float f_AmountEligible;

    /**
     * @return the f_Id
     */
    public int getF_Id() {
        return f_Id;
    }

    /**
     * @param f_Id the f_Id to set
     */
    public void setF_Id(int f_Id) {
        this.f_Id = f_Id;
    }

    /**
     * @return the f_Requirements
     */
    public String getF_Requirements() {
        return f_Requirements;
    }

    /**
     * @param f_Requirements the f_Requirements to set
     */
    public void setF_Requirements(String f_Requirements) {
        this.f_Requirements = f_Requirements;
    }

    /**
     * @return the f_AmountEligible
     */
    public float getF_AmountEligible() {
        return f_AmountEligible;
    }

    /**
     * @param f_AmountEligible the f_AmountEligible to set
     */
    public void setF_AmountEligible(float f_AmountEligible) {
        this.f_AmountEligible = f_AmountEligible;
    }

}
