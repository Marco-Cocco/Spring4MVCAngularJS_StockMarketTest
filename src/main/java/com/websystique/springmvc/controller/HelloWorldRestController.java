package com.websystique.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.stockmarket.entities.collection.SimpleTrade;
import com.stockmarket.factories.SimpleStockFactory;
import com.websystique.springmvc.utils.UtilsTest;

@RestController
public class HelloWorldRestController {
 
	@Autowired
	SimpleStockFactory simpleStockFactory;

	@Autowired
	@Qualifier("utilsTester")
	UtilsTest utilsTest;


	@RequestMapping(value = "/stockmarket/{symbol}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<SimpleTrade> getStockMarketStatus(@PathVariable("symbol") String stockSymbols) {
		 
		SimpleTrade simpleTrade = simpleStockFactory.getSimpleTrade(
				 utilsTest.getRandomDoubleInRange(0, 100)
				, utilsTest.getRandomDoubleInRange(0, 100)
				, utilsTest.getRandomStock(simpleStockFactory, stockSymbols)
				, utilsTest.getRandomTradeIndicator());
		
		return new ResponseEntity<SimpleTrade>(simpleTrade, HttpStatus.OK);
	}
 
}