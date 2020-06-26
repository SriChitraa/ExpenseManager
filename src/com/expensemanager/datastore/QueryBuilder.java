package com.expensemanager.datastore;

public class QueryBuilder {
	
	public String buildExpenseQuery(String category, int userId, String startDate, String endDate) {

		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select * from expenses ");
		queryBuilder.append(" where 1 = 1");
		if (startDate != null && endDate != null) {
			queryBuilder.append(" and date between '" + startDate + "'and'" + endDate + "'");
		}
		if (category != null) {
			queryBuilder.append(" and category =" + category);
		}
		if (userId != 0) {
			queryBuilder.append(" and user_id =" + userId);
		}
		return queryBuilder.toString();
	}

}
