import icons from '../../icons.js';
import { SimpleToggleButton } from '../ToggleButton.js';
import { Network, Widget, Utils } from '../../imports.js';

export default () => SimpleToggleButton({
    icon: Widget.Icon({
        connections: [[Network, icon => {
            icon.icon = Network.wifi?.enabled
                ? 'airplane-mode-disabled-symbolic'
                : 'airplane-mode-symbolic';
        }]],
    }),
    toggle: () => Utils.execAsync('/home/berz/.config/hypr/scripts/airplane_mode.sh'),
    connection: [Network, () => !Network.wifi.enabled],
});
