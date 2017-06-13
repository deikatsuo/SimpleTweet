/* alertwindow.vala
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
	[GtkTemplate (ui = "/org/deikatsuo/simpletweet/ui/alertwindow.ui")]
 	public class AlertWindow:Gtk.ApplicationWindow {
 		[GtkChild]
 		private Gtk.HeaderBar HeaderBar;
 		[GtkChild]
 		private Gtk.Button CloseButton;
 		[GtkChild]
 		private Gtk.Label AlertMessage;
 		
 		public AlertWindow(string msg) {
 			AlertMessage.label = msg;
 		}
 		
 		/*
 		 * Mengubah title dan subtitle pada alert window
 		 * @param array[] - {title,subtitle}
 		 */
 		public void title(string[] s) {
 			HeaderBar.title = s[0];
 			HeaderBar.subtitle = s[1];
 		}
 		
 		[GtkCallback]
 		public void CloseButton_clicked_cb() {
 			this.destroy();
 		}
 	}
}
