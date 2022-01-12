def solution(m, musicinfos):
    m = m.replace('C#', 'c').replace('D#', 'd').replace('F#', 'f').replace('G#', 'g').replace('A#', 'a')
    answer = (0, '(None)')

    for musicinfo in musicinfos:
        info = musicinfo.split(',')
        time = (int(info[1][:2]) - int(info[0][:2])) * 60 + (int(info[1][3:]) - int(info[0][3:]))
        title = info[2]
        music = info[3].replace('C#', 'c').replace('D#', 'd').replace('F#', 'f').replace('G#', 'g').replace('A#', 'a')
        full_music = music * (time // len(music)) + music[:(time % len(music))]

        if m in full_music:
            if answer[0] < time:
                answer = (time, title)

    return answer[1]