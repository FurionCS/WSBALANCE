package com.wsbalance.util;

import java.lang.reflect.Method;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;

import com.wsbalance.pojo.Performance;

public class ExportUtils {
	/**
	 * ����sheet��ͷ��Ϣ
	 * @author David
	 * @param headersInfo
	 * @param sheet
	 */
	public static void outputHeaders(String[] headersInfo,HSSFSheet sheet ){
		HSSFRow row = sheet.createRow(0);
		for (int i = 0; i < headersInfo.length; i++) {
			sheet.setColumnWidth(i, 4000);
			row.createCell(i).setCellValue(headersInfo[i]);
		}
	}
	
	public static void outputColumns(String[] headersInfo,
			List columnsInfo,HSSFSheet sheet,int rowIndex ){
		HSSFRow row ;
		//ѭ�����������
		for (int i = 0; i < columnsInfo.size(); i++) {
			row = sheet.createRow(rowIndex+i);
			Object obj = columnsInfo.get(i);
			//ѭ��ÿ�ж�����
			//for (int j = 0; j < headersInfo.length; j++) {
				Performance p=(Performance) columnsInfo.get(i);
				row.createCell(0).setCellValue(p.getAgname());
				row.createCell(1).setCellValue(p.getAgwxnum());
				row.createCell(2).setCellValue(p.getMoney());
				row.createCell(3).setCellValue(p.getTeam());
				row.createCell(4).setCellValue(p.getPersonmoney());
			//}
		}
		
	}
	
}