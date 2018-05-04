package com.bilin.crm.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

public class DateUtils {

	public static final String LONG_DATE = "yyyy-MM-dd HH:mm:ss";
	public static final String SHORT_DATE = "yyyy-MM-dd";
	public static String NO_SUPPORT_CANCEL = "NO_SUPPORT_CANCEL";

	private DateUtils() {
	}

	public static String formatDate(String formatter, String date) throws Exception {
		if(StringUtils.isBlank(date))return "";
		if(StringUtils.isBlank(formatter))return date;
		DateFormat format = new SimpleDateFormat(formatter);
		return format.format(format.parse(date));
	}
	
	public static String formatDate(String formatter, Date date) throws Exception {
		if(date==null)return "";
		if(StringUtils.isBlank(formatter))return "";
		DateFormat format = new SimpleDateFormat(formatter);
		return format.format(date);
	}

	public static String startDate(String enable_tag, String start_absolute_date, String start_offset, String start_unit) throws Exception {
		switch (enable_tag.charAt(0)) {
		case '0':
			return startDateOffset(sysdate(), start_offset, start_unit);
		case '1':
			return startDateOffset(firstDayOfMonth(1), start_offset, start_unit);
		case '2':
			return startDateOffset(tomorrow(0), start_offset, start_unit);
		case '3':
			return startDateOffset(firstDayOfMonth(1), start_offset, start_unit);
		case '4':
			return start_absolute_date;
		default:
			return null;
		}
	}

	public static String productStartDate(String enableTag, String startAbsoluteDate, String startOffset, String startUnit)
			throws Exception {
		switch (enableTag.charAt(0)) {
		case '0': // 绝对值，立即生效
			return startDateOffset(sysdate(), startOffset, startUnit);
		case '1': // 相对值，下月1号生效
			return startDateOffset(firstDayOfMonth(1), startOffset, startUnit);
		case '2': // 用户自己选择，BOOKING_TAG = 1
			return null;
		default:
			return null;
		}
	}

	public static String startDateOffset(String date, String offset, String unit) throws Exception {
		if (StringUtils.isBlank(offset) || StringUtils.isBlank(unit)) {
			return date;
		}

		switch (unit.charAt(0)) {
		case '0':
			return addDays(date, Integer.parseInt(offset));
		case '1':
			return addDaysNature(date, Integer.parseInt(offset));
		case '2':
			return addMonths(date, Integer.parseInt(offset));
		case '3':
			return addMonthsNature(date, Integer.parseInt(offset));
		case '4':
			return addYears(date, Integer.parseInt(offset));
		case '5':
			return addYearsNature(date, Integer.parseInt(offset));
		default:
			return null;
		}
	}

	public static String endDate(String start_date, String end_enable_tag, String end_absolute_date, String end_offset, String end_unit)
			throws Exception {
		switch (end_enable_tag.charAt(0)) {
		case '0':
			return end_absolute_date;
		case '1':
			return endDateOffset(start_date, end_offset, end_unit);
		case '2':
			return null; // 手工录入，不支持
		default:
			return null;
		}
	}

	public static String endDateOffset(String date, String offset, String unit) throws Exception {

		if (StringUtils.isBlank(offset) || StringUtils.isBlank(unit)) {
			return date;
		}

		switch (unit.charAt(0)) {
		case '0':
			return addDays(date, Integer.parseInt(offset));
		case '1':
			return addDaysNature(date, Integer.parseInt(offset));
		case '2':
			return addMonths(date, Integer.parseInt(offset));
		case '3':
			return addMonthsNature(date, Integer.parseInt(offset));
		case '4':
			return addYears(date, Integer.parseInt(offset));
		case '5':
			return addYearsNature(date, Integer.parseInt(offset));
		default:
			return null;
		}
	}

	public static String cancelDate(String cancel_tag, String cancel_absolute_date, String cancel_offset, String cancel_unit)
			throws Exception {
		switch (cancel_tag.charAt(0)) {
		case '0':
			return sysdate();
		case '1':
			return yerstoday(1);
		case '2':
			return today(1);
		case '3':
			return lastDayOfMonth(0);
		case '4':
			return NO_SUPPORT_CANCEL; // 不支持单笔取消，但支持产品变更中继承
		default:
			return null;
		}
	}

	public static String cancelDate(String cancel_tag, String cancel_absolute_date, String cancel_offset, String cancel_unit,
			String end_date) throws Exception {
		switch (cancel_tag.charAt(0)) {
		case '0':
			return sysdate();
		case '1':
			return yerstoday(1);
		case '2':
			return today(1);
		case '3':
			return lastDayOfMonth(0);
		case '4':
			return end_date; // 返回优惠本身的结束时间
		default:
			return null;
		}
	}

	public static String yerstoday(int tag) throws Exception {
		Calendar c = addCalendarDays(sysdate(), -1);
		switch (tag) {
		case 0:
			c.set(Calendar.HOUR_OF_DAY, c.getMinimum(Calendar.HOUR_OF_DAY));
			c.set(Calendar.MINUTE, c.getMinimum(Calendar.MINUTE));
			c.set(Calendar.SECOND, c.getMinimum(Calendar.SECOND));

			break;
		case 1:
			c.set(Calendar.HOUR_OF_DAY, c.getMaximum(Calendar.HOUR_OF_DAY));
			c.set(Calendar.MINUTE, c.getMaximum(Calendar.MINUTE));
			c.set(Calendar.SECOND, c.getMaximum(Calendar.SECOND));

			break;
		}
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static String today(int tag) throws Exception {
		Calendar c = addCalendarDays(sysdate(), 0);
		switch (tag) {
		case 0:
			c.set(Calendar.HOUR_OF_DAY, c.getMinimum(Calendar.HOUR_OF_DAY));
			c.set(Calendar.MINUTE, c.getMinimum(Calendar.MINUTE));
			c.set(Calendar.SECOND, c.getMinimum(Calendar.SECOND));

			break;
		case 1:
			c.set(Calendar.HOUR_OF_DAY, c.getMaximum(Calendar.HOUR_OF_DAY));
			c.set(Calendar.MINUTE, c.getMaximum(Calendar.MINUTE));
			c.set(Calendar.SECOND, c.getMaximum(Calendar.SECOND));

			break;
		}
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static String sysdate() {
		Calendar c = Calendar.getInstance();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static String tomorrow(int tag) throws Exception {
		Calendar c = addCalendarDays(sysdate(), 1);
		switch (tag) {
		case 0:
			c.set(Calendar.HOUR_OF_DAY, c.getMinimum(Calendar.HOUR_OF_DAY));
			c.set(Calendar.MINUTE, c.getMinimum(Calendar.MINUTE));
			c.set(Calendar.SECOND, c.getMinimum(Calendar.SECOND));

			break;
		case 1:
			c.set(Calendar.HOUR_OF_DAY, c.getMaximum(Calendar.HOUR_OF_DAY));
			c.set(Calendar.MINUTE, c.getMaximum(Calendar.MINUTE));
			c.set(Calendar.SECOND, c.getMaximum(Calendar.SECOND));

			break;
		}
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static String addDays(String date, int day_offset) throws Exception {
		Calendar c = addCalendarDays(date, day_offset);
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static String addDaysNature(String date, int day_offset) throws Exception {
		Calendar c = addCalendarDays(date, day_offset - 1);
		c.set(Calendar.HOUR_OF_DAY, c.getMaximum(Calendar.HOUR_OF_DAY));
		c.set(Calendar.MINUTE, c.getMaximum(Calendar.MINUTE));
		c.set(Calendar.SECOND, c.getMaximum(Calendar.SECOND));
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static Calendar addCalendarDays(String date, int day_offset) throws Exception {
		Calendar c = Calendar.getInstance();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		c.setTime(format.parse(date));
		c.add(Calendar.DAY_OF_MONTH, day_offset);
		return c;
	}

	public static String firstDayOfMonth(int month_offset) throws Exception {
		Calendar c = addCalendarMonths(sysdate(), month_offset);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMinimum(Calendar.DAY_OF_MONTH));
		c.set(Calendar.HOUR_OF_DAY, c.getMinimum(Calendar.HOUR_OF_DAY));
		c.set(Calendar.MINUTE, c.getMinimum(Calendar.MINUTE));
		c.set(Calendar.SECOND, c.getMinimum(Calendar.SECOND));
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static String lastDayOfMonth(int month_offset) throws Exception {
		Calendar c = addCalendarMonths(sysdate(), month_offset);

		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		c.set(Calendar.HOUR_OF_DAY, c.getMaximum(Calendar.HOUR_OF_DAY));
		c.set(Calendar.MINUTE, c.getMaximum(Calendar.MINUTE));
		c.set(Calendar.SECOND, c.getMaximum(Calendar.SECOND));
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	
	public static int getMonth(String date) throws Exception {
		Calendar c = Calendar.getInstance();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		c.setTime(format.parse(date));
		return c.get(Calendar.MONTH) + 1;
	}

	public static String firstDayOfMonth(String date, int month_offset) throws Exception {
		Calendar c = addCalendarMonths(date, month_offset);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMinimum(Calendar.DAY_OF_MONTH));
		c.set(Calendar.HOUR_OF_DAY, c.getMinimum(Calendar.HOUR_OF_DAY));
		c.set(Calendar.MINUTE, c.getMinimum(Calendar.MINUTE));
		c.set(Calendar.SECOND, c.getMinimum(Calendar.SECOND));
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static String lastDayOfMonth(String date, int month_offset) throws Exception {
		Calendar c = addCalendarMonths(date, month_offset);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		c.set(Calendar.HOUR_OF_DAY, c.getMaximum(Calendar.HOUR_OF_DAY));
		c.set(Calendar.MINUTE, c.getMaximum(Calendar.MINUTE));
		c.set(Calendar.SECOND, c.getMaximum(Calendar.SECOND));
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static String addMonths(String date, int month_offset) throws Exception {
		Calendar c = addCalendarMonths(date, month_offset);
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static String addMonthsNature(String date, int month_offset) throws Exception {
		Calendar c = addCalendarMonths(date, month_offset - 1);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		c.set(Calendar.HOUR_OF_DAY, c.getMaximum(Calendar.HOUR_OF_DAY));
		c.set(Calendar.MINUTE, c.getMaximum(Calendar.MINUTE));
		c.set(Calendar.SECOND, c.getMaximum(Calendar.SECOND));
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static Calendar addCalendarMonths(String date, int month_offset) throws Exception {
		Calendar c = Calendar.getInstance();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		c.setTime(format.parse(date));
		c.add(Calendar.MONTH, month_offset);
		return c;
	}

	public static String addYears(String date, int year_offset) throws Exception {
		Calendar c = addCalendarYears(date, year_offset);
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static String addYearsNature(String date, int year_offset) throws Exception {
		Calendar c = addCalendarYears(date, year_offset - 1);
		c.set(Calendar.MONTH, c.getMaximum(Calendar.MONTH));
		c.set(Calendar.DAY_OF_MONTH, c.getMaximum(Calendar.DAY_OF_MONTH));
		c.set(Calendar.HOUR_OF_DAY, c.getMaximum(Calendar.HOUR_OF_DAY));
		c.set(Calendar.MINUTE, c.getMaximum(Calendar.MINUTE));
		c.set(Calendar.SECOND, c.getMaximum(Calendar.SECOND));
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static Calendar addCalendarYears(String date, int year_offset) throws Exception {
		Calendar c = Calendar.getInstance();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		c.setTime(format.parse(date));
		c.add(Calendar.YEAR, year_offset);
		return c;
	}

	public static String addSeconds(String date, int second_offset) throws Exception {
		Calendar c = addCalendarSeconds(date, second_offset);
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(c.getTime());
	}

	public static Calendar addCalendarSeconds(String date, int second_offset) throws Exception {
		Calendar c = Calendar.getInstance();
		String newDate = date;

		if (date == null)
			date = "";
		if (date.length() > 7 && date.length() < 11) {
			newDate = date + " 00:00:00";
		}
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		c.setTime(format.parse(newDate));
		c.add(Calendar.SECOND, second_offset);
		return c;
	}

	public static String getLastDayOfMonth(String date, int month) throws Exception {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String tmpDate = "2011-01-01 00:00:00";
		Calendar c = Calendar.getInstance();
		c.setTime(format.parse(tmpDate));

		Calendar c1 = Calendar.getInstance();
		c1.setTime(format.parse(date));

		c.set(Calendar.YEAR, c1.get(Calendar.YEAR));
		c.set(Calendar.MONTH, month - 1);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		c.set(Calendar.HOUR_OF_DAY, c.getActualMaximum(Calendar.HOUR_OF_DAY));
		c.set(Calendar.MINUTE, c.getActualMaximum(Calendar.MINUTE));
		c.set(Calendar.SECOND, c.getActualMaximum(Calendar.SECOND));
		return format.format(c.getTime());
	}
	
	/**
	 * 
	 * @Description: 获取当月第一天 
	 *
	 * @param ap
	 * @return
	 * @return：返回结果描述
	 * @throws：异常描述
	 *
	 * Modification History:
	 *
	 */  
    public static String getFirstDayOfMonth(String ap){     
       String str = "";   
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");       

       Calendar lastDate = Calendar.getInstance();   
       lastDate.set(Calendar.DATE,1);//设为当前月的1号   
       //根据参数条件,进行日期操作		
		if("am".equals(ap)){
			lastDate.set(Calendar.HOUR_OF_DAY,0);
			lastDate.set(Calendar.MINUTE,0);
			lastDate.set(Calendar.SECOND,0);
		}else{
			lastDate.set(Calendar.HOUR_OF_DAY,23);
			lastDate.set(Calendar.MINUTE,59);
			lastDate.set(Calendar.SECOND,59);
		}
       str=sdf.format(lastDate.getTime());   
       return str;     
    } 
    
    /**
     * 
     * @Description: 计算当月最后一天,返回字符串   
     *
     * @param ap
     * @return
     * @return：返回结果描述
     * @throws：异常描述
     *
     * Modification History:
     *
     */
    public static String getLastDayOfMonth(String ap){     
       String str = "";   
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");       

       Calendar lastDate = Calendar.getInstance();   
       lastDate.set(Calendar.DATE,1);//设为当前月的1号   
       lastDate.add(Calendar.MONTH,1);//加一个月，变为下月的1号   
       lastDate.add(Calendar.DATE,-1);//减去一天，变为当月最后一天  
       //根据参数条件,进行日期操作		
		if("am".equals(ap)){
			lastDate.set(Calendar.HOUR_OF_DAY,0);
			lastDate.set(Calendar.MINUTE,0);
			lastDate.set(Calendar.SECOND,0);
		}else{
			lastDate.set(Calendar.HOUR_OF_DAY,23);
			lastDate.set(Calendar.MINUTE,59);
			lastDate.set(Calendar.SECOND,59);
		}
          
       str=sdf.format(lastDate.getTime());   
       return str;     
    }
    
    /**
     * 
     * @Description: 获取当前月份
     *
     * @param ap
     * @return：返回月份格式 yyyy-MM
     * @return：返回结果描述
     * @throws：异常描述
     *
     * Modification History:
     *
     */
    public static String getNowMonth(){     
    	SimpleDateFormat nowsdf=new SimpleDateFormat("yyyy-MM"); 
 	    Calendar curDate = Calendar.getInstance();   
 	    curDate.set(Calendar.DATE,1);//设为当前月的1号   
 	    //根据参数条件,进行日期操作		
 		curDate.set(Calendar.HOUR_OF_DAY,0);
 		curDate.set(Calendar.MINUTE,0);
 		curDate.set(Calendar.SECOND,0);

 		return nowsdf.format(curDate.getTime());
    }

	public static String getFirstDayOfMonth(String date, int month) throws Exception {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String tmpDate = "2011-01-01 00:00:00";
		Calendar c = Calendar.getInstance();
		c.setTime(format.parse(tmpDate));

		Calendar c1 = Calendar.getInstance();
		c1.setTime(format.parse(date));

		c.set(Calendar.YEAR, c1.get(Calendar.YEAR));
		c.set(Calendar.MONTH, month - 1);
		c.set(Calendar.DAY_OF_MONTH, c.getActualMinimum(Calendar.DAY_OF_MONTH));
		c.set(Calendar.HOUR_OF_DAY, c.getActualMinimum(Calendar.HOUR_OF_DAY));
		c.set(Calendar.MINUTE, c.getActualMinimum(Calendar.MINUTE));
		c.set(Calendar.SECOND, c.getActualMinimum(Calendar.SECOND));
		return format.format(c.getTime());
	}

	/**
     * 根据当前日期获得另外的时间点-day
     * @param int number 按天数做计算规则
     * @param String ap 接受时间与结束时间判断条件.am表示上午、pm表示下午
     * @param String formatter 日期格式，如："yyyy-MM-dd HH:mm:ss"、"yyyyMMddHH:mm:ss"
     * @throws Exception
     * @return String
     * @author 梁波
     */
    public static String getNextDayByDate(int number,String formatter,String ap) throws Exception {
        //生成新的Calendar变量cal
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, number);
        //根据参数条件,进行日期操作     
        if ("am".equals(ap)){
            cal.set(Calendar.HOUR_OF_DAY, 0);
            cal.set(Calendar.MINUTE, 0);
            cal.set(Calendar.SECOND, 0);
        }else if("pm".equals(ap)){
            cal.set(Calendar.HOUR_OF_DAY, 23);
            cal.set(Calendar.MINUTE, 59);
            cal.set(Calendar.SECOND, 59);
        }
        //格式化日期,并返回
        SimpleDateFormat dateformat = new SimpleDateFormat(formatter);
        return dateformat.format(cal.getTime());
    }
    /**
	 * 把时间串按照响应的格式转换成日期对象
	 * 
	 * @param dateStr
	 *            时间串
	 * @param format
	 *            指定的格式
	 * @return 
	 * @return 返回java.util.Date的对象,转换失败时返回当前的时间对象
	 */
	public static Date string2Date(String dateStr, String format) throws Exception {
		if (dateStr == null || format == null) {
			throw new Exception("日期转换失败:dateStr or format is null");
		}
		try {
			SimpleDateFormat dateFormater = new SimpleDateFormat(format);
			return dateFormater.parse(dateStr);
		} catch (Exception e) {
			throw e;
		}
	}
	
	/**
	 * 获取需要统计数据的日期
	 * 
	 * @param kind 要增加的年 月 或者日 Calendar.DAY_OF_MONTH
	 * @param num 距离当前日期的天数（如：-1表示前一天，0表示当天，1表示后一天。） 
	 * @param standDate 作为标准的时间
	 * retrun String date
	 * @throws Exception
	 */
	public static String getDate(int kind, int num, String format, String standDate) throws Exception {
		Date sDate = string2Date(standDate, format);
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.setTime(sDate);
		cal.add(kind, num);
		SimpleDateFormat dateformat = new SimpleDateFormat(format);
		String date = dateformat.format(cal.getTime());
		return date;
	}
	
	/**
	 * 计算时限方法
	 * 
	 * @param date(起始时间)
	 * @param time(小时*1000*3600)
	 * @param list
	 * @throws Exception
	 */
	public static void getLimitTimeCom(Date date, long time, ArrayList list,
			int startHour, int endHour) throws Exception {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int nowhour = cal.get(Calendar.HOUR_OF_DAY);
		if (nowhour >= endHour || nowhour < startHour) {
			if (nowhour >= 0 && nowhour < 8) {

			} else {
				cal.add(Calendar.DAY_OF_MONTH, +1);
			}
			// cal.add(Calendar.DAY_OF_MONTH , +1);
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH);
			int day = cal.get(Calendar.DAY_OF_MONTH);
			cal.clear();
			cal.set(year, month, day, startHour, 0, 0);
			if (time <= 12 * 1000 * 3600) {
				long lm1 = cal.getTime().getTime() + time;
				Date d = new Date();
				d.setTime(lm1);
				list.add(d);
			} else {
				cal.add(Calendar.DAY_OF_MONTH, +1);
				getLimitTimeCom(cal.getTime(), time - 12 * 1000 * 3600, list,
						startHour, endHour);
			}
		} else {
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH);
			int day = cal.get(Calendar.DAY_OF_MONTH);
			Calendar calTest = Calendar.getInstance();
			calTest.set(year, month, day, endHour, 0, 0);
			long lm = calTest.getTime().getTime() - cal.getTime().getTime();
			if (time <= lm) {
				long lm1 = cal.getTime().getTime() + time;
				Date d = new Date();
				d.setTime(lm1);
				list.add(d);
			} else {
				cal.add(Calendar.DAY_OF_MONTH, +1);
				int year1 = cal.get(Calendar.YEAR);
				int month1 = cal.get(Calendar.MONTH);
				int day1 = cal.get(Calendar.DAY_OF_MONTH);
				Calendar calTest1 = Calendar.getInstance();
				calTest1.set(year1, month1, day1, startHour, 0, 0);
				getLimitTimeCom(calTest1.getTime(), (time - lm), list,
						startHour, endHour);
			}
		}
	}

	/**
	 * 计算时限对外开放方法
	 * 
	 * @param date
	 * @param time（小时*1000*3600）
	 * @return
	 * @throws Exception
	 */
	public static Date getDateLimit(Date date, long time, int startHour,int endHour)throws Exception {
		ArrayList list = new ArrayList();
		getLimitTimeCom(date, time, list, startHour, endHour); // 早8点到晚22点
		if (list.size() > 0) {
			return (Date) list.get(0);
		}
		return null;
	}
	
	/**
	 * 使用指定的格式格式当前的日期对象
	 * 
	 * @param obj
	 *            Date 要格式化的时间对象 为空时返回但前时间
	 * @param format
	 *            String 指定的格式
	 * @return String 返回的时间串
	 */
	public static String date2String(java.util.Date obj, String format) {
		if (obj == null) {
			obj = new java.util.Date();
		} // yyyyMMddHHmmss
		SimpleDateFormat dateFormater = new SimpleDateFormat(format);
		return dateFormater.format(obj);
	}
	
	/**
	 * 格式化两个时间字符串，并判断两个时间的先后.
	 * 
	 * @param time1
	 * @param time2
	 * @return
	 * @throws Exception
	 */
	public static boolean before(String time1, String time2) throws Exception {
		Date date1 = string2Date(time1, "yyyy-MM-dd HH:mm:ss");
		Date date2 = string2Date(time2, "yyyy-MM-dd HH:mm:ss");
		return date1.before(date2);

	}
	
	  /**
     * 将String形的yyyy-MM-dd HH:mm:ss转化为String形的yyyyMMddHHmmss
     * @param time
     * @return
     * @throws ParseException
     */
    public static String transferFormateTime(String time) throws Exception{
    	SimpleDateFormat f =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	Date date=f.parse(time);
    	SimpleDateFormat sf =new SimpleDateFormat("yyyyMMddHHmmss");
    	return sf.format(date);
    }

}
