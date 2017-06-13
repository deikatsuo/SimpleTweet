/* vatweet.vala
 *
 * Copyright (C) 2017 Yue
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace St {
	public class VaTweet:GLib.Object {
		private Rest.OAuthProxy api;
		private string token="";
		private string token_secret="";
		private string error="?";
		private string req_token_url="";
		
		/*
		 * Request token
		 * @return bool
		 *
		 */
		public bool request_token() {
			api = new Rest.OAuthProxy (
				"bBOoFJDcJTceZy88fKHJcMnZh",
				"It3xhlH2L46PcchsV4MAIeSlN46ajJI03RbO26wfbXQ75rm6bF",
				"https://api.twitter.com/",
				false
			);
			try {
				api.request_token ("oauth/request_token", "oob");
			} catch (Error e) {
				error = e.message;
				return false;
			}
			
			token = api.get_token ();
			req_token_url = "http://twitter.com/oauth/authorize?oauth_token="+token;
			return true;
		}
		
		/*
		 * Token url
		 * @return token url
		 */
		public string get_token_url() {
			return req_token_url;
		}
		
		public bool access_token(string pin) {
			try {
				api.access_token ("oauth/access_token", pin);
				token_secret = api.get_token_secret();
			} catch (Error e) {
				new Alert(e.message, {"Ooops"});
				return false;
			}
			return true;
		}
		
		public string get_token() {
			return token;
		}
		
		public string get_token_secret() {
			return token_secret;
		}
	}
}
