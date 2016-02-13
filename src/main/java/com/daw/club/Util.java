package com.daw.club;

public class Util {
    
    /**Limpia el parámetro o devuelve uno por defecto*/
    public static String getParam(String param, String defecto) {        
        if (param!=null && !param.trim().equals(""))
            param=param.trim();
        else
            param=defecto;
        return param;
    }
    /**Devuelve true si el parámetro existe o false en caso contrario*/
    public static boolean getParamBool(String param) {
        boolean result=false;
        if (param!=null && !param.trim().equals(""))
            result=true;
        return result;
    }
    
}
