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

import com.mycompany.myapp.vo.PopularBookVO;

@Service
public class DataForLibraryService {

	private static String authKey = "15b679fc6c1b62a7d548e8f3b34e3bfe340b9423e1f2fc2c7656b147ca26e601";
	// 인기도서출력서비스
	public List<PopularBookVO> popularBook(int pageNo, int pageSize) {
		List<PopularBookVO> list = null;
		try {
			URL url;
			url = new URL("http://data4library.kr/api/loanItemSrch?authKey="
					+ authKey + "&pageNo=" + pageNo + "&pageSize=" + pageSize);
			
			URLConnection urlConn = url.openConnection();
			
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();
			parser.setInput(new InputStreamReader(urlConn.getInputStream()));
			
			int eventType = parser.getEventType();
			PopularBookVO b = null;
			while(eventType != XmlPullParser.END_DOCUMENT) {
				switch(eventType) {
				case XmlPullParser.END_DOCUMENT: // 문서의 끝
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<PopularBookVO>();
					break;
				case XmlPullParser.END_TAG: {
					String tag = parser.getName();
					if(tag.equals("doc")) { // 여기부분 item-> doc으로 수정함
						list.add(b);
						b = null;
					}
				}
				case XmlPullParser.START_TAG: {
					String tag = parser.getName();
					switch(tag) {
					case "doc":
						b = new PopularBookVO();
						break;
					case "ranking":
						if(b != null)
							b.setRanking(parser.nextText());
						break;
					case "bookname":
						if(b != null)
							b.setBookname(parser.nextText());
							System.out.println("input bookname : " +b.getBookname()); // 테스트위해 콘솔창에 표시
						break;
					case "authors":
						if(b != null)
							b.setAuthors(parser.nextText());
						break;
					case "publisher":
						if(b != null)
							b.setPublisher(parser.nextText());
						break;
					case "publication_year":
						if(b != null)
							b.setPublication_year(parser.nextText());
						break;
					case "isbn13":
						if(b != null)
							b.setIsbn13(parser.nextText());
						break;
					case "bookImageURL":
						if(b != null)
							b.setBookImageURL(parser.nextText());
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
