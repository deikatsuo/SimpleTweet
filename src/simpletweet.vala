/* simpletweet.vala
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
 	public class SimpleTweet:Gtk.Application {
 		public static Gtk.ApplicationWindow window;
		private St.Account account;
		
 		public SimpleTweet() {
 			GLib.Object(application_id: "org.deikatsuo.simpletweet");
 			account = new St.Account();
 		}
 	
 		public override void activate() {
			if (account.default() != "") {
				launch_window_for(account.default());
			}
			else {
				new StWindow.GreetingWindow(this).show();
			}
		}
		
		public void launch_window_for(string user) {
			new StWindow.MainWindow(this, user).show();
		}
 	}
}
