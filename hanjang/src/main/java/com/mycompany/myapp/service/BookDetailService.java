package com.mycompany.myapp.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Service;

@Service("bookDetailService") // Detail 요소 크롤링 서비스@Service
public class BookDetailService {

	public String getCrawlingUrl(String title) throws IOException {
		
		String crawlingUrl = "https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=All&SearchWord="+title+"&x=0&y=0";
		
		Document doc = Jsoup.connect(crawlingUrl).get();
		Elements elem = doc.select(".bo3");
		
		String result = elem.attr("href");
		System.out.println(result);
		
		return result;
	}
	
	public void executeCrawling(String url) throws IOException {
		
		Document doc = Jsoup.connect(url).get();
		Elements elem = doc.select("div_TOC_Short");
		
		System.out.println(elem.size());
		String[] strs = elem.text().split(" ");
		for(String str : strs) {
			System.out.println(str);
		}
		
		
		
		/*String result = elem.get(1).text(); // 책 설명 부분이 안 들어옴
		System.out.println(result);*/
		
		
	}
	
	public ArrayList seleniumExample(String inputUrl, HttpServletRequest req) throws InterruptedException {
		ArrayList<String> arr_result = new ArrayList<String>();
		
		WebDriver driver;
		WebElement element;
		String url;
		
		String rootPath = req.getSession().getServletContext().getRealPath("");		
		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = rootPath +"resources/driver/chromedriver.exe";
		System.out.println(WEB_DRIVER_PATH);
		String TEST_URL = inputUrl;
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions options = new ChromeOptions();
		options.addArguments("start-maximized"); // 최대크기로
        options.addArguments("headless");
        options.setCapability("ignoreProtectedModeSettings", true);
		
		driver = new ChromeDriver(options);
		
		driver.get(TEST_URL);
		
		WebDriverWait wait = new WebDriverWait(driver, 30);
		Thread.sleep(10000);
		WebElement parent = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#Ere_prod_allwrap")));
		
		
		List<WebElement> contents = parent.findElements(By.cssSelector(".Ere_prod_mconts_box"));
		System.out.println("조회된 콘텐츠 수 : " + contents.size());
		for(WebElement content : contents) {
			WebElement result = content.findElement(By.cssSelector(".Ere_prod_mconts_R"));
			String text = result.getText();
			System.out.println("=====================");
			System.out.println(text);
			System.out.println("=====================");
			arr_result.add(text);
		}
		
		driver.quit();
		return arr_result;
	}
	
	
}
