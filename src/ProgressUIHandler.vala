/***
  Copyright (C) 2007, 2011 Red Hat, Inc.
  Copyright (C) 2013 Julián Unrrein <junrrein@gmail.com>

  This program is free software: you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License version 3, as published
  by the Free Software Foundation.

  This program is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranties of
  MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR
  PURPOSE. See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along
  with this program. If not, see <http://www.gnu.org/licenses/>.

  Authors: Alexander Larsson <alexl@redhat.com>
           Cosimo Cecchi <cosimoc@redhat.com>
           Julián Unrrein <junrrein@gmail.com>
***/

private struct TimeoutData {
    Marlin.Progress.Info info;
    Marlin.Progress.UIHandler ui_handler;
}

public class Marlin.Progress.UIHandler : Object {
    
    private Marlin.Progress.InfoManager manager;
    
    private Gtk.Widget progress_window;
    private Gtk.Widget window_vbox;
    private int active_infos;
    
    private bool notification_supports_persistence;
    private Notify.Notification progress_notification;
    private Gtk.StatusIcon status_icon;
#if HAVE_UNITY
    private Marlin.QuicklistHandler quicklist_handler;
#endif

    private const string ACTION_DETAILS = "details";
    
    public UIHandler () {
        this.manager = new Marlin.Progress.InfoManager ();
        manager.new_progress_info.connect ((info) => {
            new_progress_info_cb (manager, info);
        });
        
        this.notification_supports_persistence = server_has_persistence ();
    }
    
    private void status_icon_activate_cb (Gtk.StatusIcon icon) {
        icon.set_visible (false);
        (progress_window as Gtk.Window).present ();
    }
    
    private void notification_show_details_cb (Notify.Notification notification,
                                               string action_name) {
        if (action_name == ACTION_DETAILS)
            return;
            
        progress_notification.close ();
        (progress_window as Gtk.Window).present ();
    }
    
    private void ensure_notification () {
        if (this.progress_notification != null)
            return;
            
        this.progress_notification = new Notify.Notification (_("File Operations"),
                                                              null, null);
        
        this.progress_notification.set_category ("transfer");
        this.progress_notification.set_hint ("resident", new Variant.boolean (true));
        this.progress_notification.add_action (ACTION_DETAILS,
                                               _("Show Details"),
                                               notification_show_details_cb);
    }
    
    private void ensure_status_icon () {
    }
    
    private void update_notification () {
    }
    
    private void update_status_icon () {
    }
    
#if HAVE_UNITY
    private void unity_progress_changed (Marlin.Progress.Info info) {
    }
    
    private bool disable_unity_urgency (Unity.LauncherEntry entry) {
        return false;
    }
    
    private void unity_quicklist_show_activated (Dbusmenu.Menuitem menu,
                                                 int timestamp) {
    }
    
    private void unity_quicklist_cancel_activated (Dbusmenu.Menuitem menu,
                                                   int timestamp) {
    }
    
    private void build_unity_quicklist () {
    }
    
    private void show_unity_quicklist (Marlin.LauncherEntry marlin_lentry,
                                       bool show) {
    }
    
    private void update_unity_launcher_entry (Marlin.Progress.Info info,
                                              Marlin.LauncherEntry marlin_lentry) {
    }
    
    private void update_unity_launcher (Marlin.Progress.Info info,
                                        bool added) {
    }
#endif

    private bool progress_window_delete_event (Gtk.Widget widget,
                                               Gdk.Event event) {
        return true;
    }

    private void ensure_window () {
    }
    
    private void update_notification_or_status () {
    }
    
    private void add_to_window (Marlin.Progress.Info info) {
    }
    
    private void show_complete_notification () {
    }
    
    private void hide_notification_or_status () {
    }
    
    private void progress_info_finished_cb (Marlin.Progress.Info info) {
    }
    
    private void handle_new_progress_info (Marlin.Progress.Info info) {
    }
    
    private bool new_op_started_timeout (TimeoutData data) {
        return false;
    }
    
    private void release_application (Marlin.Progress.Info info) {
    }
    
    private void progress_info_started_cb (Marlin.Progress.Info info) {
    }
    
    private void new_progress_info_cb (Marlin.Progress.InfoManager manager,
                                       Marlin.Progress.Info info) {
    }
    
    private bool server_has_persistence () {
        return false;
    }
}
