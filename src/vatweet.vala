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

		public void VaTweet() {
			Rest.OAuthProxy api = new Rest.OAuthProxy (
			"bBOoFJDcJTceZy88fKHJcMnZh", // the consumer key
			"It3xhlH2L46PcchsV4MAIeSlN46ajJI03RbO26wfbXQ75rm6bF", // the consumer secret
			"https://api.twitter.com/", // the endpoint url
			false);
		}
	}
}
