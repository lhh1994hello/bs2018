package com.huat.bs.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelUtil {
	public static HSSFWorkbook getHSSFWorkbook(String sheetName, String[] title, String[][] values, HSSFWorkbook wb) {
		// 第一步，创建�?个webbook，对应一个Excel文件
		if (wb == null) {
			wb = new HSSFWorkbook();
		}
		// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet(sheetName);
		sheet.setDefaultRowHeightInPoints(20);//设置单元格的默认高度

		// 第三步，在sheet中添加表头第0�?,注意老版本poi对Excel的行数列数有限制short
		HSSFRow row = sheet.createRow(0);
		// 第四步，创建单元格，并设置�?�表�? 设置表头居中
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建�?个居中格�?
		//style.setAlignment(HSSFCellStyle.VERTICAL_CENTER);
		
		style.setFillForegroundColor((short) 13);// 设置背景�?
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		//设置字体
		HSSFFont font = wb.createFont();
		font.setFontHeightInPoints((short) 260);//设置字体大小
		font.setFontHeightInPoints((short) 14); // 字体高度
		HSSFCell cell = null;
		//设置列宽
		sheet.setColumnWidth(0, 5000); //第一个参数代表列id(�?0�?�?),�?2个参数代表宽度�??
		sheet.setColumnWidth(1, 3000); 
		sheet.setColumnWidth(2, 3000); 
		sheet.setColumnWidth(3, 4000); 
		sheet.setColumnWidth(4, 6000); 
		sheet.setColumnWidth(5, 6000); 
		sheet.setColumnWidth(6, 2500); 
		sheet.setColumnWidth(8, 10000); 
		// 创建标题
		for (int i = 0; i < title.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(title[i]);
			cell.setCellStyle(style);
		}
		// 创建内容
		for (int i = 0; i < values.length; i++) {
			row = sheet.createRow(i + 1);
			for (int j = 0; j < values[i].length; j++) {
				row.createCell(j).setCellValue(values[i][j]);
			}
		}
		return wb;
	}
}
