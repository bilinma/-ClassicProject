package cn.edn.yan.util;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.tags.ImageTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

public class PictureUrl {
	public static String getImageURL(String txt) throws ParserException {
		String img = null;
		Parser parser;
		NodeFilter filter = new TagNameFilter("img");
		parser = Parser.createParser(txt, "utf-8");
		NodeList nodelist = parser.parse(filter);
		if (nodelist.size() != 0) {
			Node[] nodes = nodelist.toNodeArray();
//			for (int i = 0; i < nodes.length; i++) {
			for (int i = 0; i < 1; i++) {
				ImageTag image = (ImageTag) nodes[i];
//				if ("".equals(img)) {
//					img = image.getImageURL().toString();
//				} else {
//					System.out.println(img);
//					img = img + "," + image.getImageURL().toString();
//				}
				img = image.getImageURL().toString();
			}
		}
		return img;
	}
}
