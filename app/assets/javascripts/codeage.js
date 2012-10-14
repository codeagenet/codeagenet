$(function () {

    /* adjust badges display / visual effects */

    $.fn.codeage_bubble = function () {
         this.each (function () {
             $this = $(this);
             var left = parseInt( $this.attr('data-left') );
             var right = parseInt( $this.attr('data-right') );
             var bottom = parseInt( $this.attr('data-bottom') );
             var top = parseInt( $this.attr('data-top') );
             var orientation = $this.attr('data-orientation');

             var css_attrs = {
                 'left': isNaN(left) ? 'auto' : left + 'px',
                 'right': isNaN(right) ? 'auto' : right + 'px',
                 'bottom': isNaN(bottom) ? 'auto' : bottom + 'px',
                 'top': isNaN(top) ? 'auto' : top + 'px'
             }
             console.log(css_attrs);
             $this
                 .css(css_attrs)
                 .addClass('bubble')
                 .addClass('speech')
                 .addClass('bubble' + (orientation ? orientation : 'left'));
         })
    }

    $.fn.codeage_badge = function () {
        this.each (function () {
            var $this = $(this);
            var $description = $this.children('.description');
            var $img = $this.children('img');
            $description.codeage_bubble();

            $this.click(function (){
                $this.addClass('preview')
                $description.fadeIn(200);
            }).mouseout(function() {
                $this.removeClass('preview')
                $description.fadeOut(500);
            });
        })
    }

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


        this.badge_elems = $('.codeage-badge').codeage_badge();
    }
    var codeage = new Codeage;

    /* event handlers */
    $('#force_earn').live ('click', function () {
        codeage.force_earn(codeage.poll_achievements);
    })

    /* common */
    setTimeout(function () {
        $('.flash').animate({opacity:0}, 2000, null, function() {$(this).slideUp(1500)})
    }, 2000);
})