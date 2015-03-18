(function($) {
$(function(){

var wiki = $("#content .wiki").first();
if(wiki.size() > 0 && !wiki.is("#preview")) {
  // on wiki page

  // BUILD TOC ---------------------------------------------------
  var toc = $('<div style="z-index: 9999; width: auto; padding: 8px; background-color: #fafafa; border: 1px solid #dedede; position: absolute; margin: -20px 0 0 20px;"/>').hide();
  wiki.prepend(toc);
  wiki.prepend($(" <a href='#' style='position: absolute; margin-left: -30px; font-weight: normal; font-size: 0.7em;' title='Table of contents'>TOC</a>").click(function() { toc.toggle("fast"); return false;}));

  var append_link = function() {
    var e = $(this);
    if(e.is(".end-fold")) return;
    var pref = "";
    if(e.is("h2")) pref = "&nbsp;&nbsp;";
    if(e.is("h3")) pref = "&nbsp;&nbsp;&nbsp;&nbsp;";
    if(e.is("h4")) pref = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    if(e.is("h5")) pref = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    if(e.is("h6")) pref = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

    var cl = e.clone();

    var l = $("a", cl);
    if(l.size() > 0) {
      l.detach();
      cl.wrapInner("<a href='" + l.attr("href") + "'/>");
    }

    toc.append(pref + cl.html() + "<br/>");
  };

  $("h1, h2, h3, h4, h5, h6", wiki).each(append_link);

  // BUILD ROLL-NEXT --------------------------------
  var build_roll_next = function() {
    var e = $(this).click(function() {
      if(e.hasClass("rolled-out")) {
        e.removeClass("rolled-out");
        var n = e.next();
        while(n && n.size() > 0 && !n.is(".end-fold")) {
          n.hide("fast");
          n = n.next();
        }
        $(".fold-indicator", e).animate({ borderBottomWidth: "2px", height: "18px", width: "180px", opacity: 1}, "fast");
      } else {
        e.addClass("rolled-out");
        var n = e.next();
        while(n && n.size() > 0 && !n.is(".end-fold")) {
          n.show("fast");
          n = n.next();
        }
        $(".fold-indicator", e).animate({ borderBottomWidth: 0, height: "60px", width: "0", opacity: 0.6 }, "fast");
      }
    }).attr("title", "Click to toggle fold").prepend("<div class='fold-indicator' style='position: absolute; height: 18px; width: 180px; margin-left: -5px; border-left: 2px solid #cccccc; border-bottom: 2px solid #cccccc;'/>").css("cursor", "pointer").hover(function(){
      // over
      $(e).css("backgroundColor", "#fafafa");
    }, function() {
      // out
      $(e).css("background", "none");
    });

    // HIDE TIPP END-FOLD
      var n = e.next();
      while(n && n.size() > 0 && !n.is(".end-fold")) {
        n.hide();
        n = n.next();
      }
  }

  $(".start-fold").each(build_roll_next);
  $(".end-fold").hide();
}

});
})(jQuery);
