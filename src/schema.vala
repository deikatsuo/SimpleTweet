/* schema.vala
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
	class Schema:GLib.Object {
		private GLib.Settings data;
		private GLib.Variant consumer;
		private GLib.Variant token;
		
		/*
		 * Constructor
		 */
		public Schema() {
			data = new GLib.Settings("org.deikatsuo.simpletweet");
			consumer = data.get_value("consumer");
			token = data.get_value("token");
		}
		
		/*
		 * Get current active user
		 * @return string user
		 */
		public string get_active_user() {
			return data.get_string("active-user");
		}
		
		/*
		 * Consumer key
		 * @return string consumer key
		 */
		public string get_consumer_key() {
			return consumer.lookup_value("key", GLib.VariantType.STRING).get_string();
		}
		
		/*
		 * Consumer key secret
		 * @return string consumer key secret
		 */
		public string get_consumer_secret() {
			return consumer.lookup_value("secret", GLib.VariantType.STRING).get_string();
		}
		
		/*
		 * User token
		 * @param string user ( get_active_user() )
		 * @return string user token
		 */
		public string get_token(string user) {
			GLib.Variant utoken = token.lookup_value(user, GLib.VariantType.ARRAY);
			return utoken.lookup_value("token", GLib.VariantType.STRING).get_string();
		}
		
		/*
		 * User token secret
		 * @param string user ( get_active_user() )
		 * @return string user token secret
		 */
		public string get_token_secret(string user) {
			GLib.Variant utoken = token.lookup_value(user, GLib.VariantType.ARRAY);
			return utoken.lookup_value("token_secret", GLib.VariantType.STRING).get_string();
		}
		
		/*
		 * Greeting
		 * @return boolean
		 */
		public bool is_first_time() {
			return data.get_boolean("greeting");
		}
	}
}
