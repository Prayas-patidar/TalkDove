package com.currentpost;

import com.opensymphony.xwork2.ActionSupport;

public class currentpostid extends ActionSupport {
 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
static String postid=null;

public  String getPostid() {
	return postid;
}

public  void setPostid(String postid) {
	currentpostid.postid = postid;
}
public String execute(){
	System.out.println("postid= "+postid);
	if(postid.equals(null))
	return "1";
	return "2";
}
}
