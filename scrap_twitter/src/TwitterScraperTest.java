import java.util.ArrayList;

import processing.core.PApplet;
import processing.core.PVector;
import twitter4j.FilterQuery;
import twitter4j.Status;
import twitter4j.StatusListener;
import twitter4j.TwitterStream;
import twitter4j.TwitterStreamFactory;
import twitter4j.conf.ConfigurationBuilder;


public class TwitterScraperTest extends PApplet {
	private static final long serialVersionUID = 1L;
	public static void main(String[] args) {
		PApplet.main(new String[] { "--present", "TwitterScraperTest" });
	}

	ArrayList<PVector> particles = new ArrayList<PVector>();
	
	TwitterScraper scraper;
	TwitterScraperClient client = new TwitterScraperClient() {
		@Override
		public void onNewTweet(Status newTweet) {
			System.out.println("TwitterScraperClient::onNewTweet");
			particles.add( new PVector(random(600), random(600)) );
		}
	};

	public void setup() {
		size(600,600);
		background(200);

		System.out.println("setup");
		String keywords[] = {"#test", };
		scraper = new TwitterScraper(client, keywords);
	}

	public void draw() {
		background(200);
		for(PVector p : particles) {
			stroke(100);
			fill(100);
			strokeWeight(20);
			point(p.x, p.y);
		}
	}
}
