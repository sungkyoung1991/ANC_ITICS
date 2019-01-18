/*
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

(function($) {
	
	$('.btn-example').click(function(){
        var $href = $(this).attr('href');
        layer_popup($href);
    });
    function layer_popup(el){

        var $el = $(el);        //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
            return false;
        });

    }
    
    /* 마우스막기 이벤트 */
    
 $(document).ready(function(){        
        
        //우클릭 방지
        /*
        $(document).on("contextmenu",function(e){
            console.log("c"+e);
            return false;
        });

        //드래그 방지
        $(document).on("dragstart",function(e){
            console.log("d"+e);
            return false;
        });
        
        //선택 방지 
        $(document).on("selectstart",function(e){
            console.log("s"+e);
            return false;
        });        
        */        

        /*//다음과 같이 이벤트를 한번에 등록가능
        $(document).on("contextmenu dragstart selectstart",function(e){
            return false;
        });*/
        //참고. IE에서는 텍스트컨트롤박스의 내용을 드래그해서 선택할수없었음
        //      또한 파이어폭스에서는 selectstart 시 이벤트가 발생되지 않았음.


        //disableSelection($("body")[0])
    });
    
    //선택 방지. (파이어폭스도 적용됨)
    function disableSelection(target)
    {
        //For IE This code will work
        if (typeof target.onselectstart!="undefined") 
        target.onselectstart=function(){return false}
        
        //For Firefox This code will work
        else if (typeof target.style.MozUserSelect!="undefined") 
        target.style.MozUserSelect="none"
        
        //All other  (ie: Opera) This code will work
        else 
        target.onmousedown=function(){return false}
        target.style.cursor = "default";
    }

    
    
    var LogoOffset = $( '.topFixLogo' ).offset();
    $( window ).scroll( function() {  //window에 스크롤링이 발생하면
          if ( $( document ).scrollTop() > LogoOffset.top ) {   // 위치 및 사이즈를 파악하여 미리 정한 css class를 add 또는 remove 합니다.
            $( '.topFixLogo' ).addClass( 'topFixLogoFixed' );
          }
          else {
            $( '.topFixLogo' ).removeClass( 'topFixLogoFixed' );
          }
     });
	

    $(document).ready(function(){ 
        $('a').click(function(e){
            var id = e.target.getAttribute('id');
            
            //alert(id);
            if ( ( id != '') && (id != null))
            	$(document).ready(function(){
            	    $("#contents").load("menu/"+ id + ".jsp");
            	    //alert(id + ".jsp");
            	});
           
        });
    });
    
    var getUrlParameter = function getUrlParameter(sParam) {
    	var sPageURL = decodeURIComponent(window.location.search.substring(1)),
    	sURLVariables = sPageURL.split('&'),
    	sParameterName,
    	i;
    	for (i = 0; i < sURLVariables.length; i++) {
    		sParameterName = sURLVariables[i].split('=');
    		if (sParameterName[0] === sParam) {
    			return sParameterName[1] === undefined ? true : sParameterName[1];
    		}
    	}
    };
    var menuname = getUrlParameter('menu');
    
  /*  if ( ( menuname != '') && (menuname != null))
    	
    	$(document).ready(function(){
    		
    		console.log('sk : main.js');
    		
    	    $("#contents").load("WEB-INF/views/menu/"+ menuname + ".jsp");
    	    
    	});*/
    
    /* 메뉴 버튼클릭 이벤트 모음 */
	/*$('#searchbtn').click(function(){ //배차등록서-BL조회 이벤트
		
		var formData = $("#HBLSearch").serialize();
		   $.ajax({
		        type: 'post',
		        url: './SearchFMS.do',
		        cache : false,
		        data : formData,
		        success: function(data){
		        	$('#searchbl').html(data);
		            //alert(data);
		        }
		   });
		   return false; //<- 이 문장으로 새로고침(reload)이 방지됨
		});*/
    
    //alert(bdid);

    
   
 /*   $(window).scroll(function() {
    	var scrollHeight = $(document).height();
    	var scrollPosition = $(window).height() + $(window).scrollTop();
    	if ((scrollHeight - scrollPosition) / scrollHeight === 0) {
    		$("body").css("background","red");
    	} else {
    		$("body").css("background","white");
    	}
    }); 페이지 끝 체크하는것 */

     
    

	skel.breakpoints({
		xlarge: '(max-width: 1680px)',
		large: '(max-width: 1280px)',
		medium: '(max-width: 980px)',
		small: '(max-width: 736px)',
		xsmall: '(max-width: 480px)',
		'xlarge-to-max': '(min-width: 1681px)',
		'small-to-xlarge': '(min-width: 481px) and (max-width: 1680px)'
	});

	$(function() {

		var	$window = $(window),
			$head = $('head'),
			$body = $('body');

		// Disable animations/transitions ...

			// ... until the page has loaded.
				$body.addClass('is-loading');

				$window.on('load', function() {
					setTimeout(function() {
						$body.removeClass('is-loading');
					}, 100);
				});

			// ... when resizing.
				var resizeTimeout;

				$window.on('resize', function() {

					// Mark as resizing.
						$body.addClass('is-resizing');

					// Unmark after delay.
						clearTimeout(resizeTimeout);

						resizeTimeout = setTimeout(function() {
							$body.removeClass('is-resizing');
						}, 100);

				});

		// Fix: Placeholder polyfill.
			$('form').placeholder();

		// Prioritize "important" elements on medium.
			skel.on('+medium -medium', function() {
				$.prioritize(
					'.important\\28 medium\\29',
					skel.breakpoint('medium').active
				);
			});

		// Fixes.

			// Object fit images.
				if (!skel.canUse('object-fit')
				||	skel.vars.browser == 'safari')
					$('.image.object').each(function() {

						var $this = $(this),
							$img = $this.children('img');

						// Hide original image.
							$img.css('opacity', '0');

						// Set background.
							$this
								.css('background-image', 'url("' + $img.attr('src') + '")')
								.css('background-size', $img.css('object-fit') ? $img.css('object-fit') : 'cover')
								.css('background-position', $img.css('object-position') ? $img.css('object-position') : 'center');

					});

		// Sidebar.
			var $sidebar = $('#sidebar'),
				$sidebar_inner = $sidebar.children('.inner');

			// Inactive by default on <= large.
				skel
					.on('+large', function() {
						$sidebar.addClass('inactive');
					})
					.on('-large !large', function() {
						$sidebar.removeClass('inactive');
					});

			// Hack: Workaround for Chrome/Android scrollbar position bug.
				if (skel.vars.os == 'android'
				&&	skel.vars.browser == 'chrome')
					$('<style>#sidebar .inner::-webkit-scrollbar { display: none; }</style>')
						.appendTo($head);

			// Toggle.
				if (skel.vars.IEVersion > 9) {

					$('<a href="#sidebar" class="toggle">Toggle</a>')
						.appendTo($sidebar)
						.on('click', function(event) {

							// Prevent default.
								event.preventDefault();
								event.stopPropagation();

							// Toggle.
								$sidebar.toggleClass('inactive');

						});

				}

			// Events.

				// Link clicks.
					$sidebar.on('click', 'a', function(event) {
						
						// >large? Bail.
							if (!skel.breakpoint('large').active)
								return;

						// Vars.
							var $a = $(this),
								href = $a.attr('href'),
								target = $a.attr('target');

						// Prevent default.
							event.preventDefault();
							event.stopPropagation();

						// Check URL.
							if (!href || href == '#' || href == '')
								return;

						// Hide sidebar.
							$sidebar.addClass('inactive');

						// Redirect to href.
							setTimeout(function() {

								if (target == '_blank')
									window.open(href);
									
								else
									window.location.href = href;

							}, 500);
							
							
					});
					
					//a 클릭시 클래스 추가
					 $(function(){
						 
						  var sBtn = $(" ul > li > ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
						  
						  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
							  $(" ul > li > ul > li > a").removeClass("active");     // 모든 a의 (active) 클래스를 삭제 한다.
							  $(this).addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
						  })
						 })

				// Prevent certain events inside the panel from bubbling.
					$sidebar.on('click touchend touchstart touchmove', function(event) {

						// >large? Bail.
							if (!skel.breakpoint('large').active)
								return;

						// Prevent propagation.
							event.stopPropagation();

					});

				// Hide panel on body click/tap.
					$body.on('click touchend', function(event) {

						// >large? Bail.
							if (!skel.breakpoint('large').active)
								return;

						// Deactivate.
							$sidebar.addClass('inactive');

					});

			// Scroll lock.
			// Note: If you do anything to change the height of the sidebar's content, be sure to
			// trigger 'resize.sidebar-lock' on $window so stuff doesn't get out of sync.

				$window.on('load.sidebar-lock', function() {

					var sh, wh, st;

					// Reset scroll position to 0 if it's 1.
						if ($window.scrollTop() == 1)
							$window.scrollTop(0);

					$window
						.on('scroll.sidebar-lock', function() {

							var x, y;

							// IE<10? Bail.
								if (skel.vars.IEVersion < 10)
									return;

							// <=large? Bail.
								if (skel.breakpoint('large').active) {

									$sidebar_inner
										.data('locked', 0)
										.css('position', '')
										.css('top', '');

									return;

								}

							// Calculate positions.
								x = Math.max(sh - wh, 0);
								y = Math.max(0, $window.scrollTop() - x);

							// Lock/unlock.
								if ($sidebar_inner.data('locked') == 1) {

									if (y <= 0)
										$sidebar_inner
											.data('locked', 0)
											.css('position', '')
											.css('top', '');
									else
										$sidebar_inner
											.css('top', -1 * x);

								}
								else {

									if (y > 0)
										$sidebar_inner
											.data('locked', 1)
											.css('position', 'fixed')
											.css('top', -1 * x);

								}

						})
						.on('resize.sidebar-lock', function() {

							// Calculate heights.
								wh = $window.height();
								sh = $sidebar_inner.outerHeight() + 30;

							// Trigger scroll.
								$window.trigger('scroll.sidebar-lock');

						})
						.trigger('resize.sidebar-lock');

					});

		// Menu.
			var $menu = $('#menu'),
				$menu_openers = $menu.children('ul').find('.opener');

			// Openers.
				$menu_openers.each(function() {

					var $this = $(this);

					$this.on('click', function(event) {

						// Prevent default.
							event.preventDefault();

						// Toggle.
							$menu_openers.not($this).removeClass('active');
							$this.toggleClass('active');

						// Trigger resize (sidebar lock).
							$window.triggerHandler('resize.sidebar-lock');

					});

				});

	});

})(jQuery);