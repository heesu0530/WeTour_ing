package com.project.vo.hotel;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class H_AdminProductVo {
	private int rn;
	private int p_no;
	private int stock;
	private int price;
	private int quantity;
	private String p_name;
	private String detail;
	private String pr_date;
	private String image;
	private String path;
	private int start;
	private int end;
}
