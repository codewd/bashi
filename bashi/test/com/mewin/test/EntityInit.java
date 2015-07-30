package com.mewin.test;
import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mewin.entity.*;
import com.mewin.service.*;


public class EntityInit {
	
	private ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationContext.xml");

//	@Test
//	public void t1() {
//		BsheepService bs = (BsheepService) ac.getBean("bsheepServiceImpl");
//		FangyiService fs = (FangyiService) ac.getBean("fangyiServiceImpl");
//		FanyuService fans = (FanyuService) ac.getBean("fanyuServiceImpl");
//		GongchengService gs = (GongchengService) ac.getBean("gongchengServiceImpl");
//		PeitaiService ps = (PeitaiService) ac.getBean("peitaiServiceImpl");
//		ShoujingService ss = (ShoujingService) ac.getBean("shoujingServiceImpl");
//		TuzaiService ts = (TuzaiService) ac.getBean("tuzaiServiceImpl");
//		XiangmuService xs = (XiangmuService) ac.getBean("xiangmuServiceImpl");
//		YunshuService ys = (YunshuService) ac.getBean("yunshuServiceImpl");
//		UserService us = (UserService) ac.getBean("userServiceImpl");
//		
//		for(int i=0;i<300;i++){
//			
//			Bsheep b = new Bsheep();
//			b.setBorn(new Date());
//			b.setErbiao(String.valueOf(System.currentTimeMillis()));
//			b.setFuqin("795665648");
//			b.setMuqin("795665648");
//			b.setPinzhong("巴盟羊");
//			b.setRongchang(13.96);
//			b.setSex(0);
//			b.setTichang("1.2");
//			b.setTigao("0.8");
//			b.setXiongwei("1.1");
//			b.setWeight(38);
//			b.setPeizhong("已配种");
//			bs.save(b);
//			
//			Fangyi f = new Fangyi();
//			f.setErbiao(String.valueOf(System.currentTimeMillis()));
//			f.setFyrq(new Date());
//			f.setBhm("感冒");
//			f.setYmbh("123456");
//			f.setYbrq(new Date());
//			f.setZlfs("灌药");
//			f.setYyjl("12.7 ml");
//			f.setYypz("感冒灵");
//			f.setShouyi("吴鹏飞");
//			fs.save(f);
//			
//			Fanyu fy = new Fanyu();
//			fy.setErbiao(String.valueOf(System.currentTimeMillis()));
//			fy.setCsrq(new Date());
//			fy.setWeight(3.8);
//			fy.setSex(0);
//			fy.setPinzhong("巴盟羊");
//			fy.setBaotai("双胞胎");
//			fy.setSyfs("人工");
//			fy.setFuqin("8798876875");
//			fy.setMuqin("8798876876");
//			fans.save(fy);
//			
//			Gongcheng gc = new Gongcheng();
//			gc.setXmgh("年底完成建设实验室");
//			gc.setYszj(100.68);
//			gc.setFuzeren("李刚");
//			gc.setGongqi("12个月");
//			gs.save(gc);
//			
//			Peitai pt = new Peitai();
//			pt.setErbiao(String.valueOf(System.currentTimeMillis()));
//			pt.setYzsj(new Date());
//			pt.setFqqk("偶尔有发情的迹象");
//			pt.setPlqk("排卵情况");
//			pt.setXblx("细胞类型");
//			pt.setYzsl("300");
//			pt.setBz("备注");
//			ps.save(pt);
//			
//			Shoujing sj = new Shoujing();
//			sj.setErbiao(String.valueOf(System.currentTimeMillis()));
//			sj.setFqyw("发情药物");
//			sj.setFqsj(new Date());
//			sj.setSjsj(new Date());
//			sj.setJzeb(String.valueOf(System.currentTimeMillis()));
//			sj.setBz("备注");
//			ss.save(sj);
//			
//			Tuzai tz = new Tuzai();
//			tz.setErbiao(String.valueOf(System.currentTimeMillis()));
//			tz.setRiqi(new Date());
//			tz.setJgrq(new Date());
//			tz.setBuwei("羊脊骨");
//			tz.setWeight("13.8");
//			ts.save(tz);
//			
//			Xiangmu xm = new Xiangmu();
//			xm.setXmm("盖房子");
//			xm.setFzdw("米真项目部");
//			xm.setFzr("李刚");
//			xm.setXmzt("正在建设");
//			xs.save(xm);
//			
//			Yunshu yun = new Yunshu(); 
//			yun.setDdrq(new Date());
//			yun.setFuzeren("李刚");
//			yun.setDianhua("13347892266");
//			yun.setYsdh("8436173737");
//			yun.setSjxm("张三");
//			yun.setSjdh("15282737721");
//			yun.setChehao("蒙J A6756");
//			yun.setDdqd("调动清单");
//			yun.setShrq(new Date());
//			yun.setDdmdd("临河");
//			ys.save(yun);
//			
//			
//			
//			
//		}
//		
//		
//		User test = new User();
//		test.setAccount("test");
//		test.setPsd("test");
//		us.save(test);
//		
//		User admin = new User();
//		admin.setAccount("admin");
//		admin.setPsd("admin");
//		
//		
//	}

}
