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
		private string token="token";
		private string error="?";
		private string req_token_link="";
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
			req_token_link = "http://twitter.com/oauth/authorize?oauth_token="+token;
			return true;
		}
		public string get_token_link() {
			return req_token_link;
		}

	}
}
