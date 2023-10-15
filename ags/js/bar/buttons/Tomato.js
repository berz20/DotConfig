import PanelButton from '../PanelButton.js';
import { Notifications, Utils, Widget, Variable } from '../../imports.js';
import Gdk from 'gi://Gdk';

import { tomato } from '../../variables.js';

export default () => PanelButton({
   className: 'tomato',
   // hexpand: false,
   // valign: 'center',
   onClicked: btn => {
      const menu = Widget.Menu({
         className: 'tomato menu',
         children: [
            Widget.MenuItem({
               child: Widget.Label('Start-Stop       '),
               onActivate: () => Utils.execAsync('i3-gnome-pomodoro start-stop'),
            }),
            Widget.MenuItem({
               child: Widget.Label('Toggle        '),
               onActivate: () => Utils.execAsync('i3-gnome-pomodoro toggle'),
            }),
         ],
      }).popup_at_widget(btn, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH, null);
   },
   // onClicked: () => execAsync('i3-gnome-pomodoro start-stop'),
   // onSecondaryClick: () => execAsync('i3-gnome-pomodoro toggle'),
   connections: [[tomato, label => {
      label.label = `${tomato.value}`;
   }]],
});
