# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    # url = '/admin/picture'
    $('#banner_file').fileupload
        # url: url
        dataType: 'json'
        done: (e, data) ->
            # $('.progress-bar').parents('.row').addClass('hide');
            $.each(data.result.files, (index, file) ->
                $('.progress-bar').parents('.row').addClass('hide')

                div = $('<div/>', {class: 'col-md-4'})
                panel = $('<div/>', {class: 'panel panel-default'}).appendTo(div)
                img = $('<img/>', {src: file.small_url, class: 'img-responsive', 'data-index': file.index, 'data-id': file.id}).appendTo(panel)
                a_destroy = $('<a/>',
                    {
                        'data-confirm': "Are you sure?",
                        'data-method' : "delete",
                        'data-remote' : "true",
                        'data-type'   : "json",
                        href          : file.delete_url,
                        id            : "result",
                        rel           : "nofollow",
                        html: 'Destroy'
                    }).appendTo(panel)
                div.appendTo('.banners');

            #     $('<p/>').text(file.name).appendTo('#pictrue_upload')
            )
        progressall: (e, data) ->
            $('.row.hide').removeClass('hide')
            progress = parseInt(data.loaded / data.total * 100, 10)
            $('.progress .progress-bar').css('width', "#{progress}%")
    # .prop('disabled', !$.support.fileInput)
    # .parent()
    # .addClass($.support.fileInput ? undefined : 'disabled')

    $(document).bind 'dragover': (e) ->
        dropZone = $('#dropzone'); timeout = window.dropZoneTimeout

        if(!timeout)
            dropZone.addClass('in')
        else
            clearTimeout(timeout)

        found = false; node = e.target;
        loop
            if( node is dropZone[0])
                found = true
                break;
            node = node.parentNode
            break if(node isnt null)
        if(found)
            dropZone.addClass('hover')
        else
            dropZone.removeClass('hover')

        window.dropZoneTimeout =
            setTimeout ->
                window.dropZoneTimeout = null;
                dropZone.removeClass('in hover');
            , 100

    $(document).on 'ajax:success', 'a#result', (e, data, status, xhr) ->
        $(this).parents('.col-md-4').remove()


    $('.banners').sortable
        connectWith: ".col-md-4",
        stop: (event, ui) ->
            indexArr = {}
            $('.banners img').each (key, val) ->
                indexArr[$(this).data('id')] = ++key

            some = false
            for i, j of indexArr
                if parseInt(i) isnt j
                    some = true
                    break
            if some
                $.post 'banner/update_indexs',
                    {indexs:(indexArr)}, (data) ->
                        console.log 'ok' if(data.status is 'ok')
                    , 'json'

