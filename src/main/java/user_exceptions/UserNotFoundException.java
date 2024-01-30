package user_exceptions;

public class UserNotFoundException extends Exception{
	private String msg;
	public UserNotFoundException(String msg){
		this.msg = msg;
	}
}
