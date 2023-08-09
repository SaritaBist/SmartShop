/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.Handler;

/**
 *
 * @author Sarita
 */
public class handler {
    public static String get10words(String desc)
    {
        String[] strs=desc.split(" ");
        if(strs.length>10)
        {
           String res="";
           for(int i=0;i<10;i++)
           {
             res=res+strs[i]+" ";  
           }
           return (res+"...");
        }
        else
        {
            return (desc+"...");
        }
    }
}
