package com.mewin.action;

import org.springframework.stereotype.Controller;
import com.mewin.base.BaseAction;
import com.mewin.util.HqlHelper;
import com.mewin.entity.Order;

@Controller
public class OrderAction extends BaseAction<Order> {
	private static final long serialVersionUID = 1L;
	private Order order = new Order();

	public void f_add() {

		String msg = "1";

		if (order.getAddress().length() > 100
				|| order.getAddress().length() <= 2) {
			msg = "地址数据不合法！";
		} else if (order.getBacktime() == null) {
			msg = "日期数据不合法！";
		}else if (order.getName().length()<2 ||order.getName().length()>50) {
			msg = "姓名数据不合法！";
		} else if (order.getIdCard().length()<15) {
			msg = "身份证数据不合法！";
		}else if (order.getPhone().length()<11) {
			msg = "电话号码数据不合法！";
		}else if (order.getYuanwang().length()<10) {
			msg = "愿望需要10个字以上！";
		}else if (order.getIdCard().length()<15) {
			msg = "身份证数据不合法！";
		}else if (order.getIdCard().length()<15) {
			msg = "身份证数据不合法！";
		}else if (order.getIdCard().length()<15) {
			msg = "身份证数据不合法！";
		}
		if(msg.equals("1"))
			orderService.save(order);
		write(msg);
	}

	public String list() {
		new HqlHelper(Order.class, "e").addOrder("e.id", false)
				.buildPageBeanForStruts2(pageNum, orderService);
		return "list";
	}

	public void f_getOne() {
		jsonWrite(orderService.getById(order.getId()));
	}

	public String add() {
		orderService.save(order);
		return "toList";
	}

	public String addUI() {
		return "addUI";
	}

	public String edit() {
		orderService.update(order);
		return "toList";
	}

	public String editUI() {
		put("order", orderService.getById(order.getId()));
		return "addUI";
	}

	public String delete() {
		for (String i : ids.split(",")) {
			orderService.delete(Long.parseLong(i));
		}
		return "toList";
	}

	public String delete_ajax() {
		for (String i : ids.split(",")) {
			orderService.delete(Long.parseLong(i));
		}
		return null;
	}

	public Order getModel() {
		return order;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
