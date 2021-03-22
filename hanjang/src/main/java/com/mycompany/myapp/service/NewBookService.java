package com.mycompany.myapp.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.mycompany.myapp.vo.BookVO;

@Service
public class NewBookService {

	private static String interKey = "BA6560491284A2D95D0B5AEFBEE97D064EC633386A6C652A22C74BED0E7FBDCC";

	public List<BookVO> searchBook(String categoryId) {
		List<BookVO> list = null;
		if(categoryId == null) {
			categoryId = "100";
		}
		try {
			URL url;
			url = new URL("http://book.interpark.com/api/newBook.api?key=" + interKey + "&categoryId=" + categoryId);

			URLConnection urlConn = url.openConnection();

			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();
			parser.setInput(new InputStreamReader(urlConn.getInputStream()));

			int eventType = parser.getEventType();
			BookVO b = null;

			while (eventType != XmlPullParser.END_DOCUMENT) {
				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<BookVO>();
					break;
				case XmlPullParser.END_TAG: { // 두번째 반복될때
					String tag = parser.getName();
					if (tag.equals("item")) {
						list.add(b);
						b = null;
					}
				}
				case XmlPullParser.START_TAG: {
					String tag = parser.getName();
					switch (tag) {
					case "item":
						b = new BookVO();
						break;
					case "itemId":
						if (b != null)
							b.setItemID(parser.nextText());
						break;
					case "title":
						if (b != null)
							b.setTitle(parser.nextText());
						break;
					case "isbn":
						if (b != null)
							b.setIsbn(parser.nextText());
						break;
					case "author":
						if (b != null)
							b.setAuthor(parser.nextText());
						break;
					case "description":
						if (b != null)
							b.setDescription(parser.nextText());
						break;
					case "priceStandard":
						if (b != null)
							b.setPriceStandard(parser.nextText());
						break;
					case "coverLargeUrl":
						if (b != null)
							b.setCoverLargeUrl(parser.nextText());
						break;
					case "categoryId":
						if (b != null)
							b.setCategoryId(parser.nextText());
						break;
					case "categoryName":
						if (b != null)
							b.setCategoryName(parser.nextText());
						break;
					case "publisher":
						if (b != null)
							b.setPublisher(parser.nextText());
						break;
					case "pubDate":
						if (b != null)
							b.setPubDate(parser.nextText());
						break;
					}
				}
				}

				eventType = parser.next();
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (XmlPullParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

}
