vim9script

if executable('wl-copy')
    def g:WaylandAsyncCopy()
        var text = getreg('"')
        
        # Start wl-copy in raw mode completely in the background
        var job = job_start(['wl-copy'], {in_io: 'pipe', in_mode: 'raw'})
        
        # Feed the yanked text straight into the raw background pipeline
        var channel = job_getchannel(job)
        if ch_status(channel) == 'open'
            ch_sendraw(channel, text)
            ch_close_in(channel) # Tell wl-copy are finished sending text
        endif
    enddef

    # Map "+y to cleanly trigger the background raw copy
    vnoremap <silent> "+y y<Cmd>call g:WaylandAsyncCopy()<CR>
endif
