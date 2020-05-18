package com.add;

public class ChooseStory {
	  static String id;
		
	  public String getId() {
	  		return id;
	  	}

	  	public void setId(String id) {
	  		ChooseStory.id = id;
	  	}

	  	

	  public  String execute(){
	  	try{
	  		System.out.println(Integer.parseInt(id));
	  		StoryDisplay.current= Integer.parseInt(id);
	  	 new StoryDisplay().setId(StoryDisplay.stories.get(Integer.parseInt(id)));
	  	 return "success";
	  	}catch(Exception ee){
	  		System.out.println(""+ee);
	  		 return "fail";
	  	}
	  	}
}
