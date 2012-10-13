$(function () {

    Codeage = function () {
        var that = this;
        this.urls = {
            force_earn : '/user/force_earn'
        }
        this.achievements_cont = $('#achievements_container')
        this.spinner = $('<span>').addClass('spinner')
        this.force_earn = function ( callback ) {
            this.achievements_cont.append(this.spinner);
            console.log('forcing earn');
            $.get(this.urls.force_earn, {}, function ( data ) {
                callback( data );
            })
        }
        this.fetch_achievements = function ( data ) {
            that.achievements_cont.replaceWith( data );
        }
    }
    var codeage = new Codeage;

    /* event handlers */
    $('#force_earn').click (function () {
        codeage.force_earn(codeage.fetch_achievements);
    })
})