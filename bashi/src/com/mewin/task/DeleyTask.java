package com.mewin.task;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mewin.service.UserService;

@Component
public class DeleyTask {

	@Resource
	UserService userService;
	/**
	 * 任务延时定时执行 每天晚上 0点检查
	 * corn：秒 分 时 天 月 星期（1-7）
	 */
	@Scheduled(cron = "0 42 9 * * ?")
	public void problemDeley() {
		
		/*//检查是否延期
		problemService.validatePass();
		//发送通知
		List<Problem> pList = problemService.getPassProblem();
		for(int i=0;i<pList.size();i++){
			Problem p = pList.get(i);
			noticeService.notice("admin",
					userService.getById(p.getUserId()).getAccount(),
					p.getId(), 3);
		}
		
		System.out.println("task start" + new Date());*/
	}

	/**
	 * cron 表达式说明
	 * (1)*：表示匹配该域的任意值，假如在Minutes域使用*,即表示每分钟都会触发事件。
	 * 
	 * (2)?:只能用在DayofMonth和DayofWeek两个域。它也匹配域的任意值，但实际不会。因为DayofMonth和DayofWeek会
	 * 相互影响。例如想在每月的20日触发调度，不管20日到底是星期几，则只能使用如下写法： 13 13 15 20 *
	 * ?,其中最后一位只能用？，而不能使用*，如果使用*表示不管星期几都会触发，实际上并不是这样。
	 * 
	 * (3)-:表示范围，例如在Minutes域使用5-20，表示从5分到20分钟每分钟触发一次
	 * 
	 * (4)/：表示起始时间开始触发，然后每隔固定时间触发一次，例如在Minutes域使用5/20,则意味着5分钟触发一次，而25，45等分别触发一次.
	 * 
	 * (5),:表示列出枚举值值。例如：在Minutes域使用5,20，则意味着在5和20分每分钟触发一次。
	 * 
	 * (6)L:表示最后，只能出现在DayofWeek和DayofMonth域，如果在DayofWeek域使用5L,意味着在最后的一个星期四触发。
	 * 
	 * (7)W:表示有效工作日(周一到周五),只能出现在DayofMonth域，系统将在离指定日期的最近的有效工作日触发事件。例如：在
	 * DayofMonth使用5W，如果5日是星期六，则将在最近的工作日：星期五，即4日触发。如果5日是星期天，则在6日触发；如果5日在星期一到星期五
	 * 中的一天，则就在5日触发。另外一点，W的最近寻找不会跨过月份
	 * 
	 * (8)LW:这两个字符可以连用，表示在某个月最后一个工作日，即最后一个星期五。
	 * 
	 * (9)#:用于确定每个月第几个星期几，只能出现在DayofMonth域。例如在4#2，表示某月的第二个星期三。
	 */

}
