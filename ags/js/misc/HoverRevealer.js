import { Widget, Utils } from '../imports.js';

export default ({
    indicator,
    child,
    direction = 'left',
    duration = 300,
    connections,
    eventboxConnections,
    binds,
    ...rest
}) => {
    let open = false;
    let hoverTimeout = null; // Track the hover timeout
    const vertical = direction === 'down' || direction === 'up';
    const posStart = direction === 'down' || direction === 'right';
    const posEnd = direction === 'up' || direction === 'left';

    const revealer = Widget.Revealer({
        transition: `slide_${direction}`,
        connections,
        binds,
        transitionDuration: duration,
        child,
    });

    const box = Widget.EventBox({
        ...rest,
        connections: eventboxConnections,
        onHover: () => {
            // Check if there's an existing hover timeout
            if (hoverTimeout !== null) {
                clearTimeout(hoverTimeout);
            }

            // Set a new hover timeout of 100 ms
            hoverTimeout = setTimeout(() => {
                if (open) return;

                revealer.revealChild = true;
                ags.Utils.timeout(duration, () => open = true);
                hoverTimeout = null; // Reset the hover timeout
            }, 300); // 100 ms delay
        },
        onHoverLost: () => {
            // Check if there's an existing hover timeout
            if (hoverTimeout !== null) {
                clearTimeout(hoverTimeout);
                hoverTimeout = null; // Reset the hover timeout
            }

            if (!open) return;

            revealer.revealChild = false;
            open = false;
        },
        child: Widget.Box({
            vertical,
            children: [
                posStart && indicator,
                revealer,
                posEnd && indicator,
            ],
        }),
    });

    return Widget.Box({
        children: [box],
    });
};

