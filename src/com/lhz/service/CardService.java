package com.lhz.service;

import java.util.List;

import com.lhz.pojo.Card;

public interface CardService {
	
	//添加菜单
	boolean addCard(Card card);
	
	//根据用户查询菜单
	List<Card> getCardsByUid(String uid);
	
	//删除食品菜单
	int deleteCardsById(String cid);
	
	//获取菜单食品数量
	Long getFoodNum(String uid);
}
