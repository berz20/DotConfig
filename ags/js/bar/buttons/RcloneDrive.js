import PanelButton from '../PanelButton.js';
import { Notifications, Utils, Widget, Variable } from '../../imports.js';

// Create the panel button with the popup menu
export default () =>
   PanelButton({
      className: 'rclonedrive',
      // hexpand: false,
      // valign: 'center',
      // halign: 'center',
    onClicked: () => {
        Utils.execAsync('hyprctl dispatch workspace special:term')
            .then(() => Utils.execAsync('foot -e rclonedrive'));
    },
      content: Widget.Icon('google-drive'),
   });
