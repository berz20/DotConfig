import PanelButton from '../PanelButton.js';
import { Notifications, Utils, Widget, Variable } from '../../imports.js';
import Gdk from 'gi://Gdk';

let SelectedVariant = 'us'; // Default selected variant of keyboard

// Create the panel button with the popup menu
export default () =>
   PanelButton({
      className: 'kb-layout',
      // hexpand: false,
      // valign: 'center',
      // halign: 'center',
      content: Widget.Icon('input-keyboard-symbolic'),
      onClicked: btn => {
         const menuItems = [
            {
               label: 'IT       ',
               variant: 'nodeadkeys',
               name: 'IT Layout',
            },
            {
               label: 'US       ',
               variant: 'us',
               name: 'US Layout',
            },
         ];

         const menu = Widget.Menu({
            className: 'kb-layout menu',
            children: menuItems.map(item => {
               const menuItem = Widget.MenuItem({
                  child: Widget.Label(item.label),
                  onActivate: () => {
                     SelectedVariant = item.variant;
                     updateMenuStyle();
                     execAsync(`hyprctl keyword input:kb_variant ${item.variant}`);
                     btn._id = Notifications.instance.Notify(
                        'keyboard Layout',
                        btn._id || null,
                        'input-keyboard-symbolic',
                        item.name,
                        '',
                        [],
                        {},
                     );
                  },
               });

               if (item.variant === SelectedVariant) {
                  menuItem.style = `background-color: #a9b665; color: #1f1e1d`; // Green color for selected item
               }

               return menuItem;
            }),
         });

         function updateMenuStyle() {
            menuItems.forEach(item => {
               const menuItem = menu.get_children().find(child => child.label.text === item.label);
               if (menuItem) {
                  menuItem.style = item.variant === SelectedVariant ? `background-color: #a9b665; color: #1f1e1d` : '';
               }
            });
         }

         menu.popup_at_widget(btn, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH, null);

      },
   });
