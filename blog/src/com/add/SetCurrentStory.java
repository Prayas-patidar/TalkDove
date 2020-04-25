package com.add;

public class SetCurrentStory {
   static String id;
	
public String getId() {
		return id;
	}

	public void setId(String id) {
		SetCurrentStory.id = id;
	}

	

public  String execute(){
	try{
	 new StoryDisplay().setId(StoryDisplay.stories.get(Integer.parseInt(id)));
	 return "success";
	}catch(Exception ee){
		 return "fail";
	}
	}
}
