package com.lhz.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.lhz.service.AdminService;
import com.lhz.service.FoodService;
import com.lhz.service.OrderService;
import com.lhz.service.TypeService;
import com.lhz.utils.StringRandom;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private TypeService typeService;
	
	@Autowired
	private FoodService foodService;
	@Autowired
	private OrderService orderService;
	
	/*管理员登录*/
	@PostMapping("/checkAdmin")
	@ResponseBody
	public Object checkAdmin(@RequestBody String json) {
		Map map = (Map)JSON.parse(json);
		boolean flag = adminService.login((String)map.get("adminname"),(String)map.get("password"));
		return JSON.toJSONString(flag);
	}
	
	/*获取用户信息*/
	@PostMapping("/getUsers")
	@ResponseBody
	public Object getUsers(@RequestBody String json) {
		Map map = (Map)JSON.parse(json);
		return JSON.toJSONString(adminService.getUsers(map));
	}
	/*根据id删除用户*/
	@GetMapping("/deleteUser")
	@ResponseBody
	public Object deleteUser(String uid) {
		int flag = adminService.deleteUser(uid);
		return JSON.toJSONString(flag);
	}
	/*修改用户基本信息*/
	@PostMapping("/updateUserBase")
	@ResponseBody
	public Object updateUserBase(@RequestBody String json) {
		Map map = (Map)JSON.parse(json);
		return JSON.toJSONString(adminService.updateUserBase(map));
	}
	
	/*获取食品信息*/
	@PostMapping("/getFoods")
	@ResponseBody
	public Object getFoods(@RequestBody String json) {
		Map map = (Map)JSON.parse(json);
		return JSON.toJSONString(adminService.getFoods(map));
	}
	
	/*根据id删除食品*/
	@GetMapping("/deleteFood")
	@ResponseBody
	public Object deleteFood(String fid) {
		int flag = adminService.deleteFood(fid);
		return JSON.toJSONString(flag);
	}
	
	/*获取所有的食品类型*/
	@GetMapping("/getTypes")
	@ResponseBody
	public Object getTypes() {
		return JSON.toJSONString(typeService.getTypes());
	}
	
	/*修改食品基本信息*/
	@PostMapping("/updateFoodBase")
	@ResponseBody
	public Object updateFoodBase(@RequestBody String json) {
		Map map = (Map)JSON.parse(json);
		return JSON.toJSONString(foodService.updateFoodBase(map));
	}
	
	/*图片上传*/
	@PostMapping("/uploadImg")
    @ResponseBody
    public Object uploadImg(@RequestParam(required=false) MultipartFile file){
        String fileName = file.getOriginalFilename();
        String newImg = StringRandom.randImgName(fileName);
        Map msg = new HashMap();
        try{
        	//写入图片位置
            file.transferTo(new File("E://others/friend/lihaihen/dincan/WebContent/food/"+newImg));
        }catch (Exception e){
            msg.put("flag",false);
            e.printStackTrace();
        }
        msg.put("flag",true);
        //返回图片位置
        msg.put("img","/food/"+newImg);
        return JSON.toJSONString(msg);
    }
	//删除照片
	@GetMapping("/deleteUpload")
    @ResponseBody
    public void deleteUpload(String img){
        Map msg = new HashMap();
        try{
            File file = new File("E://others/friend/lihaihen/dincan/WebContent"+img);
            if(file.exists()){
                file.delete();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
	
	/*添加食品*/
	@PostMapping("/addFood")
	@ResponseBody
	public Object addFood(@RequestBody String json) {
		Map map = (Map)JSON.parse(json);
		return JSON.toJSONString(foodService.addFood(map));
	}
	
	/*获取餐号信息*/
	@PostMapping("/getOrdersPa")
	@ResponseBody
	public Object getOrdersPa(@RequestBody String json) {
		Map map = (Map)JSON.parse(json);
		return JSON.toJSONString(orderService.getOrdersPa(map));
	}
	
	/*获取餐号具体信息*/
	@GetMapping("/getOrders")
	@ResponseBody
	public Object getOrders(String wait) {
		return JSON.toJSONString(orderService.getOrders(wait));
	}
	
	/*修改订餐状态信息*/
	@GetMapping("/updateOrder")
	@ResponseBody
	public Object updateOrder(String oid,String wstate) {
		return JSON.toJSONString(orderService.updateOrder(oid, wstate));
	}
	
	/*修改订餐整体状态信息*/
	@GetMapping("/updateOrders")
	@ResponseBody
	public Object updateOrders(String wait,String wstate) {
		return JSON.toJSONString(orderService.updateOrders(wait, wstate));
	}
	
}
