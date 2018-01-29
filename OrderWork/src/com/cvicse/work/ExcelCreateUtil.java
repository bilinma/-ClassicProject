package com.cvicse.work;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.write.Label;
import jxl.write.NumberFormat;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import com.cvicse.bo.CodeLookUp;

/**
 * 
 * @author ma_xbin
 * 
 */
public class ExcelCreateUtil {

	public static List<CodeLookUp> readExcel(String path) {
		File f = new File(path);

		File[] files = f.listFiles();
		FileInputStream fis = null;
		List<CodeLookUp> codeLookUpList = new ArrayList<CodeLookUp>();

		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat sf = new SimpleDateFormat("dd");
		int day = Integer.parseInt(sf.format(date)) - 1;
		String createDate = simpleDateFormat.format(date) + "-" + day;

		try {
			for (int i = 0; i < files.length; i++) {
				String reportPath = files[i].getPath().toString();
				int xlspos = reportPath.lastIndexOf(".");
				String xls = reportPath.substring(xlspos + 1);
				if (xls.equals("xls") || xls.equals("XLS")) {
					CodeLookUp codeLookUp = new CodeLookUp();
					fis = new FileInputStream(reportPath);
					jxl.Workbook rwb = Workbook.getWorkbook(fis);
					Sheet sheet = rwb.getSheet(0);

					String isHave = sheet.getCell(2, 5).getContents().trim();
					codeLookUp.setIsHave(isHave);
					codeLookUp.setCodeName(sheet.getCell(2, 3).getContents()
							.trim());
					codeLookUp.setCreateDate(createDate);
//					codeLookUp.setCreateDate(sheet.getCell(5, 1).getContents()
//							.trim());
					codeLookUp.setLooker(sheet.getCell(2, 1).getContents()
							.trim());
					codeLookUp.setTime(0.50);
					codeLookUp
							.setRows(sheet.getCell(2, 4).getContents().trim());
					codeLookUp.setCoder(sheet.getCell(2, 2).getContents()
							.trim());
					if (!"无".equals(isHave)) {
						String problemRow = sheet.getCell(1, 7).getContents()
								.trim();
						if (problemRow.substring(0, 1).matches("^[0-9]{1}$")) {
							codeLookUp.setCodeName(sheet.getCell(2, 3)
									.getContents().trim()
									+ " " + problemRow);
						} else {
							codeLookUp.setCodeName(sheet.getCell(1, 7)
									.getContents().trim());
						}
						codeLookUp.setProblem(sheet.getCell(2, 7).getContents()
								.trim());
						codeLookUp.setProblemType(sheet.getCell(3, 7)
								.getContents().trim());
						codeLookUp.setProblemLevel(sheet.getCell(4, 7)
								.getContents().trim());
						codeLookUp.setFollower(sheet.getCell(5, 7)
								.getContents().trim());
						codeLookUp.setIsClose(sheet.getCell(6, 7).getContents()
								.trim());
					}
					System.out.println(files[i].getPath().toString());
					CodeLookView.jta.setText(CodeLookView.jta.getText()+"\n");
					System.out.println(codeLookUp.toString());
					CodeLookView.jta.setText(CodeLookView.jta.getText()+"\n"+(i+1)+codeLookUp.toString());
					codeLookUpList.add(codeLookUp);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			CodeLookView.jta.setText(CodeLookView.jta.getText()+e.getMessage()+"\n");
		} finally {
			try {
				if (fis != null) {
					fis.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
				CodeLookView.jta.setText(CodeLookView.jta.getText()+e.getMessage()+"\n");
			}
		}
		return codeLookUpList;
	}

	public static void writeExcel(String fileName,
			List<CodeLookUp> codeLookUpList) {
		WritableWorkbook wwb = null;

		try {
			// 首先要使用Workbook类的工厂方法创建一个可写入的工作薄(Workbook)对象
			wwb = Workbook.createWorkbook(new File(fileName));

		} catch (IOException e) {
			e.printStackTrace();
			CodeLookView.jta.setText(CodeLookView.jta.getText()+e.getMessage()+"\n");
		}

		if (wwb != null) {
			// 创建一个可写入的工作表
			// Workbook的createSheet方法有两个参数，第一个是工作表的名称，第二个是工作表在工作薄中的位置
			WritableSheet ws = wwb.createSheet("sheet1", 0);

			try {
				WritableFont font1 = new WritableFont(WritableFont.ARIAL, 10,
						WritableFont.NO_BOLD);
				WritableCellFormat formatText = new WritableCellFormat(font1);
				formatText.setAlignment(Alignment.CENTRE);
				formatText.setWrap(true);

				// 设置数值显示格式
				NumberFormat fontDouble = new NumberFormat("#,##0.00");
				WritableCellFormat formatDouble = new WritableCellFormat(
						fontDouble);
				formatDouble.setAlignment(Alignment.CENTRE);

				// 下面开始添加单元格
				for (int row = 0; row < codeLookUpList.size(); row++) {
					// 这里需要注意的是，在Excel中，第一个参数表示列，第二个表示行
					CodeLookUp codeLookUp = codeLookUpList.get(row);
					try {
						// 将生成的单元格添加到工作表中
						ws.addCell(new Label(1, row, codeLookUp.getCodeName()));
						ws.addCell(new Label(2, row,
								codeLookUp.getCreateDate(), formatText));
						ws.addCell(new Label(3, row, codeLookUp.getLooker(),
								formatText));
						ws.addCell(new jxl.write.Number(4, row, codeLookUp
								.getTime(), formatDouble));
						ws.addCell(new Label(5, row, codeLookUp.getRows(),
								formatText));
						ws.addCell(new Label(6, row, codeLookUp.getCoder(),
								formatText));
						if (!"无".equals(codeLookUp.getIsHave().trim())) {
							ws.addCell(new Label(7, row, codeLookUp
									.getProblem()));
							ws.addCell(new Label(8, row, codeLookUp
									.getProblemType()));
							ws.addCell(new Label(9, row, codeLookUp
									.getProblemLevel(), formatText));
							ws.addCell(new Label(10, row, codeLookUp
									.getFollower(), formatText));
							ws.addCell(new Label(11, row, codeLookUp
									.getIsClose(), formatText));
						} else {
							ws.addCell(new Label(7, row, "无问题"));
							ws.addCell(new Label(10, row, codeLookUp
									.getLooker(), formatText));
						}
					} catch (RowsExceededException e) {
						e.printStackTrace();
						CodeLookView.jta.setText(CodeLookView.jta.getText()+e.getMessage()+"\n");
					} catch (WriteException e) {
						e.printStackTrace();
						CodeLookView.jta.setText(CodeLookView.jta.getText()+e.getMessage()+"\n");
					}

				}
				// 从内存中写入文件中
				wwb.write();
				CodeLookView.jta.setText(CodeLookView.jta.getText()+"\n ------------------------汇 总 完 成！！！------------------------\n");
				// 关闭资源，释放内存
				wwb.close();
			} catch (IOException e) {
				e.printStackTrace();
				CodeLookView.jta.setText(CodeLookView.jta.getText()+e.getMessage()+"\n");
			} catch (WriteException e) {
				e.printStackTrace();
				CodeLookView.jta.setText(CodeLookView.jta.getText()+e.getMessage()+"\n");
			}
		}
	}

}
