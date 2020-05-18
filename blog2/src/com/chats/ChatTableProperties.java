package com.chats;

public interface ChatTableProperties {
	public static String field = "("
			+ "sender VARCHAR(45), "
			+ "reciever VARCHAR(45), "
			+ "message VARCHAR(200), "
			+ "attached LONGBLOB, "
			+ "datetime DATETIME,"
			+ "status varchar(10) DEFAULT 'pending'"
			+ ");"; 
	
	public static String fieldR = "("
			+ "fromid VARCHAR(45), "
			+ "toid VARCHAR(45), "
			+ "message VARCHAR(200), "
			+ "attached LONGBLOB, "
			+ "datetime DATETIME,"
			+ "status varchar(10) DEFAULT 'pending'"
			+ ");"; 
}
