/* mainwindow.vala
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
 
namespace StWindow {
	[GtkTemplate (ui = "/org/deikatsuo/simpletweet/ui/mainwindow.ui")]
 	public class MainWindow:Gtk.ApplicationWindow {
 		[GtkChild]
 		private Gtk.HeaderBar HeaderBar;
 		[GtkChild]
 		private Gtk.Revealer NotificationRevealer;
 		
 		private St.SimpleTweet simpletweet;
 		public string user;
 		
 		public MainWindow(St.SimpleTweet simpletweet, string? user) {
 			this.simpletweet = simpletweet;
 			
			this.destroy.connect (Gtk.main_quit);
 		}
 	}
}
