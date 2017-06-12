/* greetingwindow.vala
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
	[GtkTemplate (ui = "/org/deikatsuo/simpletweet/ui/greetingwindow.ui")]
	public class GreetingWindow:Gtk.ApplicationWindow {
		[GtkChild]
		private Gtk.HeaderBar HeaderBar;
		[GtkChild]
		private Gtk.Spinner Loading;
		[GtkChild]
		private Gtk.Button CancelButton;
		[GtkChild]
		private Gtk.Button ResetButton;
		[GtkChild]
		private Gtk.Button RequestTokenButton;
		[GtkChild]
		private Gtk.Entry RequestPinEntry;
		[GtkChild]
		private Gtk.Button ConnectButton;
		
		public GreetingWindow(St.SimpleTweet app) {
			
			this.destroy.connect (Gtk.main_quit);
		}
		
		[GtkCallback]
		private void RequestTokenButton_clicked_cb() {
			RequestTokenButton.visible = false;
			Loading.visible = true;
			Loading.active = true;
			
			St.VaTweet tweet = new St.VaTweet();
			if(tweet.request_token()) {
				Loading.visible = false;
				Loading.active = false;
				
				GLib.TimeVal time = GLib.TimeVal();
				//Gtk.show_uri_on_window(this, tweet.get_token_link(), ));
				
				RequestPinEntry.text = time.get_current_time();
				RequestPinEntry.visible = true;
				ConnectButton.visible = true;
			} 
			
		}
	}
}
