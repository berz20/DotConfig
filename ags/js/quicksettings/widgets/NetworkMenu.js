import icons from '../../icons.js';
import { SimpleToggleButton } from '../ToggleButton.js';
import { Notifications, Widget, Utils } from '../../imports.js';

export default () => Widget.Button({
    className: 'simple-toggle',
    child: Widget.Box({
        child: Widget.Icon('org.gnome.Settings-symbolic'),
    }),
    onClicked: () => Utils.execAsync('/home/berz/.config/hypr/wofi/network_menu'),
});
