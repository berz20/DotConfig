import { Utils } from './imports.js';
const WP = `/home/${Utils.USER}/Pictures/Wallpapers/`;

const editScheme = (scheme, edit) => {
    const obj = {};
    Object.keys(scheme).forEach(color => obj[color] = edit(scheme[color]));
    return obj;
};

const gnome = {
    red: '#f66151',
    green: '#57e389',
    yellow: '#f6d32d',
    blue: '#62a0ea',
    magenta: '#c061cb',
    teal: '#5bc8aF',
    orange: '#ffa348',
};

const charm = {
    red: '#e55f86',
    green: '#00D787',
    yellow: '#EBFF71',
    blue: '#51a4e7',
    magenta: '#9077e7',
    teal: '#51e6e6',
    orange: '#E79E64',
};

const gruv = {
    red: '#ea6962',
    green: '#a9b665',
    yellow: '#e1bb7e',
    blue: '#89b4fa',
    magenta: '#cba6f7',
    teal: '#89b482',
    orange: '#E49263',
};

const dark = {
    color_scheme: 'dark',
    bg_color: '#1f1e1d',
    fg_color: '#c7b89d',
    hover_fg: '#FFECC9',
    ...gruv,
};

const light = {
    color_scheme: 'light',
    bg_color: '#fffffa',
    fg_color: '#141414',
    hover_fg: '#0a0a0a',
    ...editScheme(gnome, c => `darken(${c}, 8%)`),
};

const misc = {
    wm_gaps: 6,
    radii: 10,
    spacing: 6,
    shadow: 'rgba(0, 0, 0, .6)',
    drop_shadow: true,
    transition: 200,
    screen_corners: true,
    bar_style: 'normal',
    layout: 'topbar',
    desktop_clock: 'center center',
    font: 'Ubuntu Nerd Font',
    mono_font: 'Mononoki Nerd Font',
    font_size: 15,
};

const colors = {
    wallpaper_fg: 'white',
    // hypr_active_border: 'rgba(3f3f3fFF)',
    // hypr_inactive_border: 'rgba(3f3f3fDD)',
    hypr_active_border: 'rgba(a9b665aa) rgba(89b4faaa) 45deg',
    hypr_inactive_border: 'rgba(414868aa)',
    accent: '$green',
    accent_fg: '#141414',
    widget_bg: '$fg_color',
    widget_opacity: 94,
    // active_gradient: 'to right, $accent, lighten($accent, 6%)',
    active_gradient: 'to right, $accent, lighten(mix($teal, $blue, 70%),8%)',
    border_color: '$fg_color',
    border_opacity: 97,
    border_width: 2,
};

// themes
const kitty_dark = {
    wallpaper: WP + 'kitty.jpeg',
    name: 'kitty_dark',
    icon: '󰄛',
    ...dark,
    ...misc,
    ...colors,
};

const kitty_light = {
    wallpaper: WP + 'kitty.jpeg',
    name: 'kitty_light',
    icon: '󰄛',
    ...light,
    ...misc,
    ...colors,
    widget_bg: '$accent',
    widget_opacity: 84,
};

const leaves_dark = {
    ...kitty_dark,
    wallpaper: WP + 'leaves.jpg',
    name: 'leaves_dark',
    icon: '󰌪',
    accent: '$green',
    widget_opacity: 92,
    active_gradient: 'to right, $accent, darken($accent, 14%)',
    border_opacity: 86,
    bg_color: 'transparentize(#171717, 0.3)',
    hypr_active_border: 'rgba(57e389FF)',
    bar_style: 'floating',
    radii: 0,
    wallpaper_fg: 'white',
    additional_scss: `
        window#quicksettings .quicksettings {
            margin-right: $wm_gaps;
        }
    `,
};

const leaves_light = {
    ...leaves_dark,
    ...light,
    name: 'leaves_light',
    accent: 'darken($green, 10%)',
    bg_color: 'transparentize(#fff, 0.1)',
    active_gradient: 'to right, $accent, darken($accent, 6%)',
};

const ivory = {
    wallpaper: WP + 'ivory.png',
    name: 'ivory',
    icon: '󰟆',
    ...light,
    ...misc,
    ...colors,
    bg_color: '#fffff0',
    bar_style: 'separated',
    widget_bg: '$accent',
    widget_opacity: 64,
    drop_shadow: false,
    border_width: 2,
    border_opacity: 0,
    active_gradient: 'to right, $accent, darken($accent, 6%)',
    wallpaper_fg: '$bg_color',
    hypr_active_border: 'rgba(111111FF)',
    additional_scss: `
        window#quicksettings .quicksettings,
        window#dashboard .dashboard {
            margin-top: 0;
        }
    `,
};

const cutefish = {
    ...kitty_dark,
    wallpaper: WP + 'cutefish.jpeg',
    name: 'cutefish',
    icon: '󰈺',
    accent: 'lighten($blue, 20%)',
    active_gradient: 'to right, $accent, lighten(mix($orange, $blue, 70%), 20%)',
    border_opacity: 94,
    brorder_width: 2,
    radii: 9,
    desktop_clock: 'end end',
    hypr_active_border: 'rgba(3f3f3fFF)',
    bg_color: 'transparentize(#171717, 0.3)',
};

const cherry = {
    ...kitty_dark,
    wallpaper: WP + 'cherry.png',
    name: 'cherry',
    icon: '',
    accent: '$blue',
    active_gradient: 'to right, $accent, lighten(mix($magenta, $blue, 70%), 18%)',
    brorder_width: 2,
    radii: 13,
    bg_color: 'transparentize(#171717, 0.3)',
};

export default [
    kitty_dark,
    kitty_light,
    leaves_dark,
    leaves_light,
    ivory,
    cutefish,
    cherry,
];
