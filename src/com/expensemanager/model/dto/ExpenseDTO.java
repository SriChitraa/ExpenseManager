package com.expensemanager.model.dto;

public class ExpenseDTO {
  public ExpenseDTO(String category, int amount) {
		this.category = category;
		this.y = amount;
	}
private String category;
	private int y;
}
