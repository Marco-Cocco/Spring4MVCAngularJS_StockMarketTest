package com.websystique.springmvc.utils;

import java.util.Random;

import org.springframework.stereotype.Component;

import com.stockmarket.entities.collection.SimpleStock;
import com.stockmarket.enums.constants.E_TradeIndicator;
import com.stockmarket.enums.constants.E_Type;
import com.stockmarket.factories.SimpleStockFactory; 

//@Scope("prototype") 
@Component("utilsTester")
public class UtilsTest {
 
	public SimpleStock getRandomStock(SimpleStockFactory simpleStockFactory, String	stockSymbol){
		 
			E_StockSymbols stockSymbols = E_StockSymbols.valueOf(stockSymbol);

		switch(stockSymbols){

		case TEA:
			return simpleStockFactory.getSimpleStock(stockSymbols.name(), E_Type.COMMON, 0, 0, 100); 

		case POP:
			return simpleStockFactory.getSimpleStock(stockSymbols.name(), E_Type.COMMON, 8, 0, 100);

		case ALE:
			return simpleStockFactory.getSimpleStock(stockSymbols.name(), E_Type.COMMON, 23, 0, 60);

		case GIN:
			return simpleStockFactory.getSimpleStock(stockSymbols.name(), E_Type.PREFERRED, 8, 2, 100);

		case JOE:
			return simpleStockFactory.getSimpleStock(stockSymbols.name(), E_Type.COMMON, 13, 0, 250);

		default:
			return null; 
		} 
	}
 
	public E_TradeIndicator getRandomTradeIndicator(){ 
		return E_TradeIndicator.values()[(int) (Math.random() * E_TradeIndicator.values().length)]; 
	}

	public double getRandomDoubleInRange(double min, double max) {

		if (min >= max) {
			throw new IllegalArgumentException("max must be greater than min");
		}

		Random r = new Random(); 
		return	min + (max - min) * r.nextDouble();
	}

}
