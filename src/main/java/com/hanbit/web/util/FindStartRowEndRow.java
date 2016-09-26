package com.hanbit.web.util;

import java.util.Scanner;

public class FindStartRowEndRow {
	public static void main(String[] args) {
		FindStartRowEndRow g = new FindStartRowEndRow();
		Scanner s = new Scanner(System.in);
		int totCount = s.nextInt();
		int pgNum = s.nextInt();
		int pgSize = s.nextInt();
		g.getStartRow(totCount,pgNum,pgSize);
	}

	public int[] getStartRow(int totCount, int pgNum, int pgSize) {
		
		int startRow = 0, endRow = 0;
		int[] rows= new int[2];
		
		if (pgNum <= totCount / pgSize + 1) {
			if (pgNum == 1) {
				startRow = 1;
				endRow = pgSize;
			} else {
				if (totCount == totCount / pgSize * pgSize) {
					startRow = (pgNum - 1) * pgSize + 1;
					endRow = pgNum * pgSize;

					System.out.println("전체 Row수  :" + totCount);
					System.out.println("page Size : " + pgSize);
					System.out.println("page Num :" + pgNum);
					System.out.println("star Row :  " + startRow);

				}
			}
		}
		rows[0]=startRow;
		rows[1]=endRow;
		return rows;
	}
}
