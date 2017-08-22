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
		private string req_token_url="";
		private St.Schema schema;
		
		/*
		 * Constructor
		 */
		public VaTweet() {
			this.schema = new St.Schema ();
			this.api = new Rest.OAuthProxy (
				schema.get_consumer_key (),
				schema.get_consumer_secret (),
				"https://api.twitter.com/",
				false
			);
		}
		
		/*
		 * Request token
		 * @return boolean
		 */
		public bool request_token() {
			
			try {
				this.api.request_token ("oauth/request_token", "oob");
			} catch (Error e) {
				new Alert(e.message, {"Ooops! Gagal request token"});
				return false;
			}
			
			this.req_token_url = "http://twitter.com/oauth/authorize?oauth_token="+this.api.get_token ();
			return true;
		}
		
		/*
		 * Token url
		 * @return token url
		 */
		public string get_token_url() {
			return this.req_token_url;
		}
		
		/*
		 * Request pin
		 * @param pin
		 * @return boolean
		 */
		public bool access_token(string pin) {
			try {
				this.api.access_token ("oauth/access_token", pin);
			} catch (Error e) {
				new Alert(e.message, {"Ooops! Pin ditolak"});
				return false;
			}
			return true;
		}
		
		/*
		 * Get the token
		 * @return string, token
		 */
		public string get_token() {
			return this.api.get_token();
		}
		
		/*
		 * Get token secret
		 * @return string, token secret
		 */
		public string get_token_secret() {
			return this.api.get_token_secret ();
		}
	}
}
