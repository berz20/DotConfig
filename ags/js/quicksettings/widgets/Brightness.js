import icons from '../../icons.js';
import Brightness from '../../services/brightness.js';
import { Widget } from '../../imports.js';

const BrightnessSlider = () => Widget.Slider({
    drawValue: false,
    hexpand: true,
    binds: [['value', Brightness, 'screen']],
    onChange: ({ value }) => Brightness.screen = value,
});

const TypeIndicator = () => Widget.Button({
    onPrimaryClick: '/home/berz/.config/hypr/scripts/brightness --warm',
    onSecondaryClick: '/home/berz/.config/hypr/scripts/brightness --dark',
    child: Widget.Icon({
        connections: [
            [Brightness, (icon) => {
                if (Brightness.screen !== 0) {
                    if (Brightness.screen < 0.3)
                    icon.icon = "display-brightness-low-symbolic";
                    else if (Brightness.screen < 0.6)
                    icon.icon = "display-brightness-medium-symbolic";
                    else
                    icon.icon = "display-brightness-high-symbolic";

                    icon.tooltipText = `Screen Brightness ${Math.floor(Brightness.screen * 100)}%`;
                }
            }],
        ],
    }),
});

export default () => Widget.Box({
    className: 'slider',
    children: [
        TypeIndicator(),
        BrightnessSlider(),
    ],
});
