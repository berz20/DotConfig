import PanelButton from '../PanelButton.js';
import { Hyprland, Utils, Widget } from '../../imports.js';

export const ClientLabel = substitutes => Widget.Label({
    binds: [['label', Hyprland.active.client, 'class', c => substitutes
        .find(([from]) => from === c)?.[1] || c]],
});

export const ClientIcon = substitutes => Widget.Icon({
    connections: [[Hyprland.active.client, icon => {
        let classIcon = Hyprland.active.client.class;
        let titleIcon = Hyprland.active.client.title;
        substitutes.forEach(([from, to]) => {
            if (classIcon === from)
                classIcon = to;

            if (titleIcon === from)
                titleIcon = to;
        });

        classIcon += '-symbolic';
        titleIcon += '-symbolic';

        const hasTitleIcon = Utils.lookUpIcon(titleIcon);
        const hasClassIcon = Utils.lookUpIcon(classIcon);

        if (hasClassIcon)
            icon.icon = classIcon;

        if (hasTitleIcon)
            icon.icon = titleIcon;

        icon.visible = hasTitleIcon || hasClassIcon;
    }]],
});

const FocusClientLabel = (revealer) => PanelButton({
    className: 'focused-client',
    onClicked: button => {
        // const icon = button.child;
        revealer.revealChild = !revealer.revealChild;
        // icon._animate(icon);
    },
    content: Widget.Box({
        children: [
            ClientIcon([
                ['transmission-gtk', 'transmission'],
                ['blueberry.py', 'bluetooth'],
                ['org.wezfurlong.wezterm', 'folder-code'],
                ['com.raggesilver.BlackBox', 'folder-code'],
                ['Caprine', 'facebook-messenger'],
                ['', 'preferences-desktop-display'],
                ['foot', 'utilities-terminal'],
                ['thunar', 'system-file-manager'],
                ['nwg-look', 'gnome-tweak-tool'],
                ['libreoffice-startcenter', 'libreoffice-main'],
                ['Gimp-2.10', 'revolt'],
                ['org.pwmt.zathura', 'libreoffice-base'],
                ['evince', 'libreoffice-base'],
                ['org.telegram.desktop', 'internet-mail'],
                ['Spotify', 'tauonmb'],
            ]),
            ClientLabel([
                ['transmission-gtk', ' Transmission'],
                ['com.obsproject.Studio', ' OBS'],
                ['com.usebottles.bottles', ' Bottles'],
                ['com.github.wwmm.easyeffects', ' Easy Effects'],
                ['org.gnome.TextEditor', ' Text Editor'],
                ['org.gnome.design.IconLibrary', ' Icon Library'],
                ['blueberry.py', ' Blueberry'],
                ['org.wezfurlong.wezterm', ' Wezterm'],
                ['com.raggesilver.BlackBox', ' BlackBox'],
                ['firefox', ' Firefox'],
                ['org.gnome.Nautilus', ' Files'],
                ['libreoffice-writer', ' Writer'],
                ['', ' Desktop'],
                ['org.inkscape.Inkscape', ' Inkscape'],
                ['org.telegram.desktop', ' Telegram'],
                ['org.pwmt.zathura', ' Zathura'],
                ['evince', ' Evince'],
                ['thunderbird', ' Thunderbird'],
                ['blueberry.py', ' Blueberry'],
                ['org.wezfurlong.wezterm', ' Wezterm'],
                ['foot', ' Foot'],
                ['thunar', ' Thunar'],
                ['gnome-pomodoro', ' Pomodoro'],
                ['firefox', ' Firefox'],
                ['libreoffice-impress', ' Impress'],
                ['libreoffice-writer', ' Writer'],
                ['libreoffice-draw', ' Draw'],
                ['libreoffice-calc', ' Calc'],
                ['libreoffice-math', ' Math'],
                ['libreoffice-base', ' Base'],
                ['libreoffice-startcenter', ' LibreOffice'],
                ['nwg-look', ' Nwg Look'],
                ['Gimp-2.10', ' Gimp'],
                ['Spotify', ' Spotify'],
            ]),
        ],
    }),
});

export default ({ children, direction = 'left' }) => {
    const posStart = direction === 'up' || direction === 'left';
    const posEnd = direction === 'down' || direction === 'right';
    const revealer = Widget.Revealer({
        transition: `slide_${direction}`,
        child: Widget.Box({
            children,
        }),
    });

    return Widget.Box({
        vertical: direction === 'up' || direction === 'down',
        children: [
            posStart && revealer,
            FocusClientLabel(revealer),
            posEnd && revealer,
        ],
    });
};

// export default () => PanelButton({
//     className: 'focused-client',
//     content: Widget.Box({
//         children: [
//             ClientIcon([
//                 ['transmission-gtk', 'transmission'],
//                 ['blueberry.py', 'bluetooth'],
//                 ['org.wezfurlong.wezterm', 'folder-code'],
//                 ['com.raggesilver.BlackBox', 'folder-code'],
//                 ['Caprine', 'facebook-messenger'],
//                 ['', 'preferences-desktop-display'],
//                 ['foot', 'utilities-terminal'],
//                 ['thunar', 'system-file-manager'],
//                 ['nwg-look', 'gnome-tweak-tool'],
//                 ['libreoffice-startcenter', 'libreoffice-main'],
//                 ['Gimp-2.10', 'revolt'],
//                 ['org.pwmt.zathura', 'libreoffice-base'],
//                 ['evince', 'libreoffice-base'],
//                 ['org.telegram.desktop', 'internet-mail'],
//                 ['Spotify', 'tauonmb'],
//             ]),
//             ClientLabel([
//                 ['transmission-gtk', ' Transmission'],
//                 ['com.obsproject.Studio', ' OBS'],
//                 ['com.usebottles.bottles', ' Bottles'],
//                 ['com.github.wwmm.easyeffects', ' Easy Effects'],
//                 ['org.gnome.TextEditor', ' Text Editor'],
//                 ['org.gnome.design.IconLibrary', ' Icon Library'],
//                 ['blueberry.py', ' Blueberry'],
//                 ['org.wezfurlong.wezterm', ' Wezterm'],
//                 ['com.raggesilver.BlackBox', ' BlackBox'],
//                 ['firefox', ' Firefox'],
//                 ['org.gnome.Nautilus', ' Files'],
//                 ['libreoffice-writer', ' Writer'],
//                 ['', ' Desktop'],
//                 ['org.inkscape.Inkscape', ' Inkscape'],
//                 ['org.telegram.desktop', ' Telegram'],
//                 ['org.pwmt.zathura', ' Zathura'],
//                 ['evince', ' Evince'],
//                 ['thunderbird', ' Thunderbird'],
//                 ['blueberry.py', ' Blueberry'],
//                 ['org.wezfurlong.wezterm', ' Wezterm'],
//                 ['foot', ' Foot'],
//                 ['thunar', ' Thunar'],
//                 ['gnome-pomodoro', ' Pomodoro'],
//                 ['firefox', ' Firefox'],
//                 ['libreoffice-impress', ' Impress'],
//                 ['libreoffice-writer', ' Writer'],
//                 ['libreoffice-draw', ' Draw'],
//                 ['libreoffice-calc', ' Calc'],
//                 ['libreoffice-math', ' Math'],
//                 ['libreoffice-base', ' Base'],
//                 ['libreoffice-startcenter', ' LibreOffice'],
//                 ['nwg-look', ' Nwg Look'],
//                 ['Gimp-2.10', ' Gimp'],
//                 ['Spotify', ' Spotify'],
//             ]),
//         ],
//     }),
// });
