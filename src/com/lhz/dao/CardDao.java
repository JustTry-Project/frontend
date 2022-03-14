package com.lhz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lhz.pojo.Card;

public interface CardDao {
	
	//添加食品
	int addFood(Card card);
	
	//根据用户查询菜单
	List<Card> getCardsByUser(String uid);
	
	//删除菜单
	int deleteCards(String uid);
	
	//删除菜单
	int deleteCardsById(String cid);
	
	//修改食品菜单支付状态
	int updateCardPay(String uid);
	
	//获取食品数量
	Long getFoodNum(String uid);
}	
