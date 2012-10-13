$(function () {

    Codeage = function () {
        var that = this;

        this.spinner = $('<span>').addClass('spinner')
        this.force_earn = function ( callback ) {
            this.achievements_cont = $('#achievements_container');
            this.achievements_cont.append(this.spinner);
            console.log('forcing earn');
            $.get(Routes.force_earn_user_index_path(), {}, function ( data ) {
                that.ap_last_at = data.last_at;
                callback( data );
            })
        }
        this.poll_achievements = function () {
            that.ap_interval = setInterval(function () {
                $.get(Routes.poll_achievements_user_index_path(), {last_at : that.ap_last_at}, that.fetch_achievements);
            } , 1000);
        }
        this.fetch_achievements = function ( data ) {
            if (data) {
                that.achievements_cont.replaceWith( data );
                clearInterval( that.ap_interval );
            }

        }
    }
    var codeage = new Codeage;

    /* event handlers */
    $('#force_earn').live ('click', function () {
        codeage.force_earn(codeage.poll_achievements);
    })

    /* common */
    setTimeout(function () {
        $('.flash').fadeOut(3000)
    }, 2000);
})