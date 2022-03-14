package com.lhz.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lhz.dao.CardDao;
import com.lhz.pojo.Card;
import com.lhz.utils.StringRandom;

@Service
public class CardServiceImpl implements CardService {
	
	@Autowired
	private CardDao cardDao;

	@Override
	public boolean addCard(Card card) {
		boolean flag = false;
		card.setCid(StringRandom.RandomId());
		card.setCtime(new Date());
		card.setPay('0');
		int row = cardDao.addFood(card);
		if(row>0) {
			flag=true;
		}
		return flag;
	}

	@Override
	public List<Card> getCardsByUid(String uid) {
		return cardDao.getCardsByUser(uid);
	}

	@Override
	public int deleteCardsById(String cid) {
		int row = cardDao.deleteCardsById(cid);
		return row;
	}

	@Override
	public Long getFoodNum(String uid) {
		return cardDao.getFoodNum(uid);
	}
	
	
	
}
