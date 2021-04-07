package com.mycompany.myapp.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

@Service("bookDetailService") // Detail 요소 크롤링 서비스
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

	public ArrayList<String> seleniumExample(String inputUrl, HttpServletRequest req) throws InterruptedException {
		ArrayList<String> arr_result = new ArrayList<String>(); // 크롤링 해올 리스트
		ArrayList<String> arr_index = new ArrayList<String>(); // 크롤링 대상 인덱스
		ArrayList<String> arr_final = new ArrayList<String>(); // 최종 결과물
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
		int count = 0; // while 반복 수
		try {
			while (count < 3) {
				JavascriptExecutor jse = (JavascriptExecutor) driver;

				jse.executeScript("window.scrollBy(0,2000)", "");
				Thread.sleep(1000);

				List<WebElement> index = driver.findElements(By.cssSelector(".Ere_prod_mconts_LS"));
				for(WebElement content : index) {
					if (!arr_index.contains(content.getText())) {
						arr_index.add(content.getText());
					}
				}
				
				List<WebElement> list = driver.findElements(By.cssSelector(".Ere_prod_mconts_R"));

				System.out.println("조회된 콘텐츠 수 : " + list.size());

				for (WebElement content : list) {
					if (!arr_result.contains(content.getText())) {
						arr_result.add(content.getText());
					}
				}

				count++;
			}
			// 책소개, 저자 및 역자 소개, 출판사 제공 책소개 분류
			for(int i = 0 ; i < arr_index.size(); i++) {
				if(arr_index.get(i).equals("책소개")) {
					arr_final.add(arr_result.get(i));
				}
				if(arr_index.get(i).equals("저자 및 역자소개")) {
					arr_final.add(arr_result.get(i));
				}
				if(arr_index.get(i).equals("출판사 제공 책소개")) {
					arr_final.add(arr_result.get(i));
				}
			}
			for(String test : arr_final) {
				System.out.println(test);
				System.out.println("test=================");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			driver.quit();
		} finally {
			driver.quit();
		}

		return arr_final;
	}

}
