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
		private Gtk.Button ResetButton;
		[GtkChild]
		private Gtk.Button RequestTokenButton;
		[GtkChild]
		private Gtk.Entry RequestPinEntry;
		[GtkChild]
		private Gtk.Button ConnectButton;
		
		private St.VaTweet tweet;
		
		public GreetingWindow(St.SimpleTweet app) {
			
			this.destroy.connect (Gtk.main_quit);
		}
		
		[GtkCallback]
		private void RequestTokenButton_clicked_cb() {
			RequestTokenButton.hide();
			Loading.show();
			Loading.active = true;
			
			tweet = new St.VaTweet();
			if(tweet.request_token()) {
				Loading.hide();
				Loading.active = false;
				
				try {
      				GLib.AppInfo.launch_default_for_uri (tweet.get_token_url(), null);
    			} catch (GLib.Error e) {
      				new Alert(e.message, {"Alert!"});
    			}
				
				RequestPinEntry.show();
				ConnectButton.show();
			}
		}
		
		private void reset() {
			Loading.hide();
			RequestPinEntry.hide();
			RequestPinEntry.text = "";
			ConnectButton.hide();
			RequestTokenButton.show();
		}
		
		[GtkCallback]
		private void ConnectButton_clicked_cb() {
			RequestPinEntry.hide();
			ConnectButton.hide();
			Loading.show();
			Loading.active = true;
			if (tweet.access_token(RequestPinEntry.text)) {
				Loading.active = false;
				Loading.hide();
				
				string msg = "token: "+tweet.get_token()+"\n";
				msg = msg+"token secret: "+tweet.get_token_secret();
				new Alert(msg, {"Alert!"});
				
				reset();
			}
		}
		
		[GtkCallback]
		private void ResetButton_clicked_cb() {
			reset();
		}
	}
}
