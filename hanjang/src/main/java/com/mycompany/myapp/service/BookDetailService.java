package com.mycompany.myapp.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Service;

@Service("bookDetailService") // Detail 요소 크롤링 서비스@Service
public class BookDetailService {

	public String getCrawlingUrl(String title) throws IOException {

		String crawlingUrl = "https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=All&SearchWord=" + title
				+ "&x=0&y=0";

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
		for (String str : strs) {
			System.out.println(str);
		}

		/*
		 * String result = elem.get(1).text(); // 책 설명 부분이 안 들어옴
		 * System.out.println(result);
		 */

	}

	public ArrayList<String> seleniumExample(String inputUrl, HttpServletRequest req) throws InterruptedException {
		ArrayList<String> arr_result = new ArrayList<String>();

		WebDriver driver;

		String rootPath = req.getSession().getServletContext().getRealPath("");
		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = rootPath + "resources/driver/chromedriver.exe";
		System.out.println(WEB_DRIVER_PATH);
		String TEST_URL = inputUrl;

		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		options.setCapability("ignoreProtectedModeSettings", true);

		driver = new ChromeDriver(options);

		driver.get(TEST_URL);
		int contentSize = 0;
		int count = 0;
		try {
			while (count < 6) {
				JavascriptExecutor jse = (JavascriptExecutor) driver;

				jse.executeScript("window.scrollBy(0,2000)", "");
				Thread.sleep(1000);
				
				List<WebElement> list = driver.findElements(By.cssSelector(".Ere_prod_mconts_R"));

				System.out.println("조회된 콘텐츠 수 : " + list.size());
				
				for (WebElement content : list) {
					if(!arr_result.contains(content.getText())) {
						System.out.println(content.getText());
						System.out.println("=================");
						arr_result.add(content.getText());
					}
				}
				
				count++;
				
				if(contentSize > 4) {
					break;
				} else {
					contentSize = list.size();
				}
			
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			driver.quit();
		} finally {
			driver.quit();
		}

		return arr_result;
	}

}
