package org.crud.validation;

import org.apache.log4j.Logger;
import org.crud.entity.User;
import org.crud.exceptions.InvalidUserInputException;
import org.crud.exceptions.NoSuchPasswordException;
import org.crud.utils.PasswordEncoder;

public abstract class InputValidation {

	private static final Logger log = Logger.getLogger(InputValidation.class);

	/*
	 * Email pattern description: ^ #start of the line [_A-Za-z0-9-\\+]+ #must
	 * start with string in the bracket [ ], must contains one or more (+) (
	 * #start of group #1 \\.[_A-Za-z0-9-]+ #follow by a dot "." and string in
	 * the bracket [ ], must contains one or more (+) )* #end of group #1, this
	 * group is optional (*)
	 * 
	 * @ #must contains a "@" symbol [A-Za-z0-9-]+ #follow by string in the
	 * bracket [ ], must contains one or more (+) ( #start of group #2 - first
	 * level TLD checking \\.[A-Za-z0-9]+ #follow by a dot "." and string in the
	 * bracket [ ], must contains one or more (+) )* #end of group #2, this
	 * group is optional (*) ( #start of group #3 - second level TLD checking
	 * \\.[A-Za-z]{2,} #follow by a dot "." and string in the bracket [ ], with
	 * minimum length of 2 ) #end of group #3 $ #end of the line
	 */
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	/*
	 * Password pattern description: ( - #Start of group (?=.*\d) - #must
	 * contain one digit from 0-9 (?=.*[a-z]) - #must contain at least one
	 * lowercase character (?=.*[A-Z]) - #must contain at least one uppercase
	 * character (?=.*[_#$%]) - #must contains one special symbols in the list
	 * "_#$%" . - #match anything with previous condition checking {6,20} -
	 * #length at least 6 characters and maximum of 20 ) - #End of group
	 */
	private static final String PASSWORD_PATTERN = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])"
			+ "(?=.*[_#$%]).{6,20})";
	// TODO: add support for complex names with unicode characters
	private static final String FIRSTNAME_PATTERN = "[A-Z�-�][a-z�-�]*";
	private static final String LASTNAME_PATTERN = "([A-Z�-�][a-zA-Z�-�]*)([\\s\\\'-][A-Z�-�]"
			+ "[a-z�-�]*)*";

	/**
	 * This method is used to validate specified input with help of specified
	 * regexp
	 * 
	 * @param input
	 *            - parameter value to validate
	 * @param regexp
	 *            - regular expression to match with input
	 * @return true, if input matches with regexp
	 */
	private static final boolean isInputValid(final String input, String regexp)
			throws InvalidUserInputException {
		if (input == null || "".equals(input)) {
			throw new InvalidUserInputException(input);
		}

		if (!input.matches(regexp)) {
			throw new InvalidUserInputException(input);
		}
		return true;
	}

	/**
	 * This method provides validation of user's input when registration occurs
	 * 
	 * @param user
	 *            - entity, which represents user registration information
	 * @return true, if all registration input are valid
	 * @throws InvalidUserInputException if some of parameters is't match it's pattern
	 */
	public static final boolean isRegInputValid(final User user)
			throws InvalidUserInputException {
		if (isInputValid(user.getEmail(), EMAIL_PATTERN)
				&& isInputValid(user.getFirstName(), FIRSTNAME_PATTERN)
				&& isInputValid(user.getLastName(), LASTNAME_PATTERN)
				&& isInputValid(user.getPassword(), PASSWORD_PATTERN)) {
			return true;
		}
		return false;
	}

	/**
	 * This method provides validation of user's input when login occurs
	 * 
	 * @param email
	 *            - email address, entered to the email field on login form
	 * @param password
	 *            - password, entered to the password field on login form
	 * @return true, if both parameters are valid
	 * @throws InvalidUserInputException if some of parameters is't match it's pattern
	 */
	public static final boolean isLoginInputValid(final String email,
			final String password) throws InvalidUserInputException {
		if (isInputValid(email, EMAIL_PATTERN)
				&& isInputValid(password, PASSWORD_PATTERN))
			return true;
		return false;
	}
	
	/**
	 * This method provides validation of user's input when changing a password 
	 * 
	 * @param user - entity which represents a user who tries to change a password
	 * @param curPass - current password value specified by user in change form.
	 * May differ from actual password
	 * @param newPass - new password value specified by user in change form
	 * @param passToCompare - value to compare with {@code newPass} parameter
	 * @return true if all parameters valid due to their patterns,
	 * {@code newPass} equals to actual password and to {@code passToCompare}
	 * @throws NoSuchPasswordException if {@code curPass} isn't equal to actual password
	 * @throws InvalidUserInputException if some of parameters is't match it's pattern
	 */

	public static final boolean isPassChangeInputValid(final User user,
			final String curPass, final String newPass,
			final String passToCompare) throws NoSuchPasswordException,
			InvalidUserInputException {
		if (isInputValid(curPass, PASSWORD_PATTERN)) {
			if (PasswordEncoder.matches(curPass, user.getPassword())) {
				if (isInputValid(newPass, PASSWORD_PATTERN)
						&& isInputValid(passToCompare, PASSWORD_PATTERN))
					if (newPass.equals(passToCompare)) {
						return true;
					} else {
						throw new InvalidUserInputException(newPass
								+ " is not equal to " + passToCompare);
					}
			} else
				throw new NoSuchPasswordException(curPass);
		}
		return false;
	}

	public static final boolean isFirstNameInputValid(final String name)
			throws InvalidUserInputException {
		if (isInputValid(name, FIRSTNAME_PATTERN))
			return true;
		return false;
	}

	public static final boolean isLastNameInputValid(final String name)
			throws InvalidUserInputException {
		if (isInputValid(name, LASTNAME_PATTERN))
			return true;
		return false;
	}
}
