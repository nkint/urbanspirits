import processing.core.PApplet;
import twitter4j.FilterQuery;
import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;
import twitter4j.TwitterStream;
import twitter4j.TwitterStreamFactory;
import twitter4j.conf.ConfigurationBuilder;
import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;



interface TwitterScraperClient {
	void onNewTweet(Status newTweet);
}

public class TwitterScraper {

	private TwitterScraperClient parent;
	private String[] keywords;

	public TwitterScraper(TwitterScraperClient parent, String[] keywords) {
		this.parent = parent;
		this.keywords = keywords;
		setup();
	}

	final String CONSUMER_KEY = "AQtAAZovbGkeBNH7Wg0LTg";
	final String CONSUMER_SECRET = "97lvI7A0m7Qd8ucww3cZQqWsegCRcVSq8LF5FcUorlk";
	final String ACCESS_TOKEN = "1562954719-JCAI5HQOHBnXDoaO0SFLpIrLxgAYihiqDlf8lr0";
	final String ACCESS_TOKEN_SECRET = "ygbyWhaeM34Mw8XpeC5YdGU7wgtyAGwdDVKxmGKoEg";
	final String USERNAME = "urbanspirit5";
	final String PASS = "medialab2013";

	public void setup() {
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true);
		cb.setOAuthConsumerKey(CONSUMER_KEY);
		cb.setOAuthConsumerSecret(CONSUMER_SECRET);
		cb.setOAuthAccessToken(ACCESS_TOKEN);
		cb.setOAuthAccessTokenSecret(ACCESS_TOKEN_SECRET);

		TwitterStream twitterStream = new TwitterStreamFactory(cb.build()).getInstance();
		StatusListener listener = new TwitterStreamListener();

		FilterQuery fq = new FilterQuery();
		fq.track(keywords);

		twitterStream.addListener(listener);
		twitterStream.filter(fq);
	}

	public class TwitterStreamListener implements StatusListener {

		public void onStatus(Status status) {
			System.out.println("@" + status.getUser().getScreenName() + " - " + status.getText());
			parent.onNewTweet(status);
		}

		public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
			System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
		}

		public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
			System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
		}

		public void onScrubGeo(long userId, long upToStatusId) {
			System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
		}

		public void onException(Exception ex) {
			ex.printStackTrace();
		}

		@Override
		public void onStallWarning(StallWarning warning) {
			System.out.println("Got stall warning:" + warning);
		}
	}
}

