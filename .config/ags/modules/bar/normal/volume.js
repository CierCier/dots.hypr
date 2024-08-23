


const audio = await Service.import('audio');


const VolumePanel = () => {


    const volume_slider = Widget.Slider({
        hexpand: true,
        class_name : 'bar-util-btn icon-material txt-norm bar-volume-slider',

        draw_value: false,
        on_change : ({value}) => {
            audio.speaker.volume = value;

        },
        value: audio.speaker.bind('volume')
    })

    return Widget.Box({
        class_name: 'bar-util-btn icon-material txt-norm',
        children: [
            Widget.Icon({icon: 'audio-volume-high'}),
            volume_slider
        ]
    })
}

export default VolumePanel;