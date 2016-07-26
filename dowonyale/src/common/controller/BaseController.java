package common.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class BaseController {
	
	public void getResultJsonPW(Map<String, Object> resultMap, HttpServletResponse res) throws IOException {
		PrintWriter pw = null;
		res.setContentType("application/json");
		res.setContentType("text/xml;charset=utf-8");
		res.setHeader("Cache-Control", "no-cache");
		pw = new PrintWriter(res.getWriter());
		System.out.println("----------------------------------------------------------------------");
		System.out.println(JSONObject.fromObject(resultMap).toString());
		System.out.println("----------------------------------------------------------------------");
		pw.println(JSONObject.fromObject(resultMap).toString());
		pw.flush();
		pw.close();
	}	
	
	public String nullChk(String str)
	{
		return (str == null)?"":str;
	}
	
}
