import PanelButton from '../PanelButton.js';
import { Notifications, Utils, Widget, Variable } from '../../imports.js';
import Gdk from 'gi://Gdk';

import { lock } from '../../variables.js';

let selectedTimeout = 300; // Default selected timeout in seconds

// Create the panel button with the popup menu
export default () =>
   PanelButton({
      className: 'lock-time',
      // hexpand: false,
      // valign: 'center',
      content: Widget.Icon('com.github.bilelmoussaoui.Authenticator-symbolic'),
      onClicked: btn => {
         const menuItems = [
            {
               label: '5 m    ',
               timeout: 300,
               name: '5 Minutes',
            },
            {
               label: '15 m   ',
               timeout: 900,
               name: '15 Minutes',
            },
            {
               label: '30 m   ',
               timeout: 1800,
               name: '30 Minutes',
            },
            {
               label: 'Off    ',
               timeout: 0,
               name: 'No Lock',
            },
         ];

         const menu = Widget.Menu({
            className: 'lock-time menu',
            children: menuItems.map(item => {
               const menuItem = Widget.MenuItem({
                  child: Widget.Label(item.label),
                  onActivate: () => {
                     selectedTimeout = item.timeout;
                     updateMenuStyle();
                     Utils.execAsync(`/home/berz/.config/hypr/scripts/toggle_lockscreen_timeout.sh set ${item.timeout}`);
                     btn._id = Notifications.Notify(
                        'Lock Time',
                        btn._id || null,
                        'com.github.bilelmoussaoui.Authenticator-symbolic',
                        item.name,
                        'Lock Time',
                        [],
                        {},
                     );
                  },
               });

               if (item.timeout === selectedTimeout) {
                  menuItem.style = `background-color: #a9b665; color: #1f1e1d`; // Green color for selected item
               }

               return menuItem;
            }),
         });

         function updateMenuStyle() {
            menuItems.forEach(item => {
               const menuItem = menu.get_children().find(child => child.label.text === item.label);
               if (menuItem) {
                  menuItem.style = item.timeout === selectedTimeout ? `background-color: #a9b665; color: #1f1e1d` : '';
               }
            });
         }

         menu.popup_at_widget(btn, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH, null);
      },
   });
