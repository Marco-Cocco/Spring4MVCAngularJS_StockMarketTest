package com.websystique.springmvc.utils;

public enum E_StockSymbols { 
 
	TEA 
	, POP
	, ALE
	, GIN
	, JOE;
 
	public static E_StockSymbols getRandomStockSymbol() {
		return values()[(int) (Math.random() * values().length)];
	}
	 
}
