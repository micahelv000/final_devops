package edu.cmu.cs.webapp.tartan.formbean;

import java.util.ArrayList;
import java.util.List;

import org.mybeans.form.FormBean;

public class ChangePwdForm extends FormBean {
	private String confirmPassword;
	private String newPassword;
	private String oldPassword;
	
	public String getConfirmPassword() { return confirmPassword; }
	public String getNewPassword()     { return newPassword;     }
	public String getOldPassword()     { return oldPassword;     }
	
	public void setConfirmPassword(String s) { confirmPassword = s.trim(); }
	public void setNewPassword(String s)     { newPassword     = s.trim(); }
	public void setOldPassword(String s)     { oldPassword     = s.trim(); }

	
	public List<String> getValidationErrors() {
		List<String> errors = new ArrayList<String>();

		if (oldPassword == null || oldPassword.length() == 0) {
			errors.add("Old Password is required");
		}
		
		if (newPassword == null || newPassword.length() == 0) {
			errors.add("New Password is required");
		}
		
		if (confirmPassword == null || confirmPassword.length() == 0) {
			errors.add("Confirm Pwd is required");
		}
		
		if (errors.size() > 0) {
			return errors;
		}
		
		if (newPassword.equals(oldPassword)) {
			errors.add("New passwords cannot be the same as the old password.");
		}
		
		if (!newPassword.equals(confirmPassword)) {
			errors.add("New passwords do not match");
		}

		return errors;
	}
}
