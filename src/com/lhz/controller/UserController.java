package com.lhz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.lhz.pojo.Card;
import com.lhz.pojo.Food;
import com.lhz.pojo.Orders;
import com.lhz.pojo.User;
import com.lhz.service.CardService;
import com.lhz.service.FoodService;
import com.lhz.service.TypeService;
import com.lhz.service.UserService;
import com.lhz.utils.StringRandom;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private FoodService foodService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private UserService userService;
	@Autowired
	private CardService cardService;
	
	//跳转登录页面
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "login";
	}
	
	//跳转注册页面
	@RequestMapping("/toRegister")
	public String toRegister() {
		return "register";
	}
	
	//跳转首页
	@RequestMapping("/index")
	public String toIndex(HttpServletRequest reqeust) {
		reqeust.setAttribute("foods", foodService.getFoodsByTid(null));
		reqeust.setAttribute("types", typeService.getTypes());
		return "index";
	}
	
	//跳转分类页面
	@RequestMapping("/fenlei")
	public String toFenlei(HttpServletRequest reqeust) {
		reqeust.setAttribute("foods", foodService.getFoodsByTid("3"));
		return "fenlei";
	}
	//跳转菜单页面
	@RequestMapping("/menu")
	public String toMenu(HttpServletRequest reqeust) {
		return "menu";
	}
	//跳转个人信息页面
	@RequestMapping("/person")
	public String toPerson() {
		return "person";
	}
	//跳转分类页面
	@RequestMapping("/list")
	public String toList(String tid,HttpServletRequest reqeust) {
		reqeust.setAttribute("foods", foodService.getFoodsByTid(tid));
		if("1".equals(tid)) {
			reqeust.setAttribute("title", 1);
		}else if("2".equals(tid)) {
			reqeust.setAttribute("title", 2);
		}else if("3".equals(tid)) {
			reqeust.setAttribute("title", 3);
		}else {
			reqeust.setAttribute("title", 4);
		}
		return "list";
	}
	//检查是否存在用户
	@RequestMapping("/checkUser")
	@ResponseBody
	public Object checkUser(String username){
		return JSON.toJSONString(userService.checkUser(username));
	}
	//根据食品名称查询食品
	@RequestMapping("/getFoodByName")
	@ResponseBody
	public Object getFoodByName(String fname){
		List<Food> foods = foodService.getFoodByName(fname);
		return JSON.toJSONString(foods);
	}
	
	//用户登录
	@RequestMapping("/login")
	@ResponseBody
	public Object login(String username,String password,HttpSession session) {
		Map  msg = userService.login(username, password);
		if("1".equals((String)msg.get("state"))) {
			session.setAttribute("user", (User)msg.get("user"));
			return JSON.toJSONString(true);
		}else {
			return JSON.toJSONString(false);
		}
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "person";
	}
	
	//用户注册
	@PostMapping("/addUser")
	@ResponseBody
	public Object addUser(String username,String password,String phone,String nike) {
		User user = new User();
		user.setUsername(username);
		user.setNike(nike);
		user.setPassword(password);
		user.setPhone(phone);
		boolean state = userService.register(user);
		return JSON.toJSONString(state);
	}
	
	
	//把食品添加到菜单
	@RequestMapping("/addCard")
	@ResponseBody
	public Object addCard(String fid,int num,double tprice,HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		Map<String,String> msg = new HashMap<String,String>();
		if(user==null) {
			msg.put("state", "-1");
			return JSON.toJSONString(msg);
		}else {
			Card card = new Card();
			card.setFid(fid);
			card.setNum(num);
			card.setTprice(tprice);
			card.setUid(user.getUid());
			boolean state = cardService.addCard(card);
			if(state) {
				msg.put("state", "1");
			}else {
				msg.put("state","0");
			}
			return JSON.toJSONString(msg);
		}
	}
	
	
	//获取菜单信息
	@RequestMapping("/getCards")
	@ResponseBody
	public Object getCards(HttpSession session) {
		User user = (User)session.getAttribute("user");
		List<Card> cards = new ArrayList<Card>();
		if(user!=null) {
			cards = cardService.getCardsByUid(user.getUid());
		}
		return JSON.toJSONString(cards);
	}
	
	//获取食品数量
	@RequestMapping("/getFoodNum")
	@ResponseBody
	public Object getFoodNum(HttpSession session) {
		User user = (User)session.getAttribute("user");
		Long num = 0L;
		if(user!=null) {
			num = cardService.getFoodNum(user.getUid());
		}
		return JSON.toJSONString(num);
	}
	
	//获取菜单信息
	@GetMapping("/deleteCardById")
	@ResponseBody
	public Object deleteCardById(String cid) {
		int row = cardService.deleteCardsById(cid);
		return JSON.toJSONString(row);
	}
	
	//支付食品
	@PostMapping("/payFood")
	@ResponseBody
	public Object payFood(double price,HttpSession session) {
		
		User user = (User)session.getAttribute("user");
		List<String> cids = new ArrayList<String>();
		List<Card> cards = cardService.getCardsByUid(user.getUid());
		for(Card card:cards) {
			cids.add(card.getCid());
		}
		String wait = StringRandom.RandomId();
		int state = userService.payFood(price,cids,user,wait);
		if(state==1) {
			//刷新客户端的信息
			User user2 = userService.getUserById(user.getUid());
			session.setAttribute("user", user2);
		}
		return JSON.toJSONString(state);
	}
	
	//账户充值
	@PostMapping("/addAcount")
	@ResponseBody
	public Object addAcount(double price,HttpSession session) {
		User user = (User)session.getAttribute("user");
		int state = userService.addAcount(price, user);
		if(state==1) {
			//刷新客户端的信息
			User user2 = userService.getUserById(user.getUid());
			session.setAttribute("user", user2);
		}
		return JSON.toJSONString(state);
	}
	
	//获取餐号
	@PostMapping("/getCanhao")
	@ResponseBody
	public Object getCanhao(HttpSession session) {
		User user = (User)session.getAttribute("user");
		List<Orders> can = new ArrayList<Orders>();
		if(user!=null) {
			can = userService.getCanhao(user.getUid());
			return JSON.toJSONString(can);
		}
		return JSON.toJSONString(can);
	}
	
	//获取历史订单
	@GetMapping("/getOrders")
	@ResponseBody
	public Object getOrders(HttpSession session) {
		User user = (User)session.getAttribute("user");
		List<Orders> orders = userService.getOrders(user.getUid());
		return JSON.toJSONString(orders);
	}
	
	//删除历史订单
	@GetMapping("/deleteOrder")
	@ResponseBody
	public Object deleteOrder(String oid) {
		int row = userService.deleteOrder(oid);
		return JSON.toJSONString(row);
	}
	
}
