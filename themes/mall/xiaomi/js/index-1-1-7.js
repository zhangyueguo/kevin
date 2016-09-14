/*!
 * @version 1-1-7
 * @onlineVersion : 1-1-7
 */
KISSY.config("combine",!0),KISSY.ready(function(S){function getData(e,t,n){S.io({url:e,dataType:"jsonp",jsonpCallback:n,timeout:3e5,scriptCharset:"utf-8",success:function(e){200==e.code?t&&t(e.data,e.nowTime):t&&t()},error:function(){t&&t()}})}function getRemindData(e,t,n){S.io({url:e,dataType:"jsonp",jsonpCallback:n,timeout:3e5,success:function(e){t&&t(e)},error:function(){t&&t()}})}function getTime(e){if(!e)return!1;var t,n,a=e.split(" "),i=new Date,o=2013,s=7,l=17,r=0,c=0,d=0;return a[0]&&(t=a[0].split("-"),o=t[0]?parseInt(t[0],10):2013,s=t[1]?parseInt(t[1],10):7,l=t[2]?parseInt(t[2],10):17),a[1]&&(n=a[1].split(":"),r=n[0]?parseInt(n[0],10):0,c=n[1]?parseInt(n[1],10):0,d=n[2]?parseInt(n[2],10):0),i.setFullYear(o),i.setMonth(s-1),i.setDate(l),i.setHours(r),i.setMinutes(c),i.setSeconds(d),i.getTime()}function getQueryString(e,t){var n=new RegExp("(^|&)"+t+"=([^&]*)(&|$)","i"),a=e.indexOf("?");if(-1!=a){var i=e.substr(a+1).match(n);if(null!=i)return decodeURIComponent(i[2])}return null}window.global_variables={};var $=S.Node.all,DOM=S.DOM,location=window.location,domin=location.host,href=location.href,url="http://"+domin,huodongURL="http://huodong.yunos.net",loginURL="https://login.daily.taobao.net/member/login.jhtml?redirectURL="+encodeURIComponent(href);("yun.taobao.com"==domin||"yunapi.tmall.com"==domin)&&(url="http://yunapi.tmall.com",huodongURL="http://huodong.yunos.com",loginURL="https://login.taobao.com/member/login.jhtml?redirectURL="+encodeURIComponent(href)),Date.prototype.Format=function(e){var t={"M+":this.getMonth()+1,"d+":this.getDate(),"h+":this.getHours(),"m+":this.getMinutes(),"s+":this.getSeconds(),"q+":Math.floor((this.getMonth()+3)/3),S:this.getMilliseconds()};/(y+)/.test(e)&&(e=e.replace(RegExp.$1,(this.getFullYear()+"").substr(4-RegExp.$1.length)));for(var n in t)new RegExp("("+n+")").test(e)&&(e=e.replace(RegExp.$1,1==RegExp.$1.length?t[n]:("00"+t[n]).substr((""+t[n]).length)));return e},KISSY.add("yunos-remind",function(e,t,n,a,i){var o,s,l,r,c,d,u,h,m,g,f,b=['<div class="an-form">',"<h4>\u5f00\u573a\u63d0\u9192</h4>",'<div class="form-li"><input class="user-phone an-input" placeholder="\u624b\u673a\u53f7\u7801" value="{{phone}}"></div>','<p class="an-cc-tip">\u4e91\u624b\u673a\u9891\u9053\u5c06\u5728\u5f00\u573a\u524d\u4ee5\u77ed\u4fe1\u65b9\u5f0f\u63d0\u9192\u60a8</p>','<div class="buttons"><button class="submit">\u5f00\u542f</button></div>',"</div>"].join(""),p=['<div class="an-form an-success">',"<h4>\u4eb2\uff0c\u60a8\u5df2\u5bf9\u8be5\u5546\u54c1\u8bbe\u7f6e\u4e86\u5f00\u573a\u63d0\u9192</h4>",'<p class="an-cc-tip">\u4e91\u624b\u673a\u9891\u9053\u5728\u5f00\u573a\u524d\u4ee5\u77ed\u4fe1\u65b9\u5f0f\u63d0\u9192\u60a8</p>','<div class="buttons"><button class="ok">\u5b8c\u6210</button></div>',"</div>"].join(""),v=['<div class="an-form an-failure">',"<h4>{{text}}</h4>",'<div class="buttons"><button class="ok">\u5b8c\u6210</button></div>',"</div>"].join(""),w=['<div class="an-form an-failure">',"<h4>\u4eb2\uff0c\u60a8\u8fd8\u6ca1\u767b\u5165\u54e6</h4>",'<p class="can-not-text"><a href="{{loginUrl}}">\u9a6c\u4e0a\u767b\u5f55</a></p>',"</div>"].join(""),y={mobile:"\u4f60\u8f93\u5165\u7684\u624b\u673a\u53f7\u7801\u683c\u5f0f\u4e0d\u6b63\u786e",mobile_empty:"\u624b\u673a\u53f7\u7801\u4e0d\u80fd\u4e3a\u7a7a","default":"\u4e91\u624b\u673a\u9891\u9053\u5728\u5f00\u573a\u524d\u4ee5\u77ed\u4fe1\u65b9\u5f0f\u63d0\u9192\u60a8"},k={201:"\u4f60\u5df2\u8ba2\u9605\uff0c\u4e0d\u53ef\u91cd\u590d\u8ba2\u9605",202:"\u5199\u6570\u636e\u5e93\u5931\u8d25\u5bfc\u81f4\u8ba2\u9605\u5931\u8d25",301:"\u53c2\u6570\u4e0d\u5168",302:"\u53c2\u6570\u5f02\u5e38"},_="input-error",C="tip-err",T="disable",S=/^((13[0-9])|(15[^4,\D])|(18[0-9]))\d{8}$/,I=function(){var e=t.get("_l_g_"),n=t.get("_nk_"),a=t.get("ck1"),i=t.get("tracknick"),o=e&&n||a&&i;return o};return{init:function(e){o=e.target,g=e.banner,l=o.attr("data-pnumber"),c=o.attr("data-pid"),d=o.attr("data-id"),u=o.attr("data-name"),h=o.attr("data-url"),m=o.attr("data-time").replace(/(\s*)(-*)(:*)/g,""),f=e.callback,this._isRemined()},_isRemined:function(){var e=this;I()?getRemindData(huodongURL+"/message/countByUser.do?groupId="+c+"&itemId="+d,function(t){200===t.code?l=t.data:501==t.code?(e._madeDialog(new a(w).render({loginUrl:loginURL})),r.center(),r.show()):l=!1,e._overlay()},"countByUserBack"):(this._madeDialog(new a(w).render({loginUrl:loginURL})),r.center(),r.show()),g&&(s&&clearTimeout(s),s=setTimeout(function(){g.stop()},2e3))},_madeDialog:function(e){r?r.set("bodyContent",e):(r=new n.Dialog({width:330,height:210,elCls:"J_Notice",closeAction:"hide",closable:!0,bodyContent:e,mask:!0,align:{points:["cc","cc"]}}),r.render(),this._submit())},_overlay:function(){var t=new a(b).render({phone:l!==!1&&e.trim(l)?e.trim(l):""});null===l&&(t=p,f&&f(o.one(".b-remind-state"))),this._madeDialog(t),r.center(),r.show(),this._placeholder()},_placeholder:function(){new i({node:".user-phone"})},_submit:function(){var e,t=r.get("contentEl");$("."+r.get("elCls")).delegate("click",".ks-ext-close-x",function(){g&&(s&&clearTimeout(s),g.play())}),t.delegate("click",".ok",function(){s&&clearTimeout(s),r.hide(),g&&g.play()}),t.delegate("click",".submit",function(n){var i=t.one(".user-phone"),s=t.one(".an-cc-tip"),g=$(n.currentTarget),b=i.val();if(!g.hasClass(T)){if(""==b&&(e="mobile_empty")||!S.test(b)&&(e="mobile"))return i.addClass(_),s.addClass(C).text(y[e]),void 0;g.addClass(T),getRemindData(huodongURL+"/message/subscribe.do?groupId="+c+"&itemId="+d+"&phone="+b+"&itemName="+encodeURIComponent(u)+"&itemUrl="+encodeURIComponent(h)+"&openTime="+m,function(e){200===e.code||203===e.code?(200===e.code&&f&&f(o.one(".b-remind-state")),r.set("bodyContent",p),g.removeClass(T),l=!0):501===e.code?r.set("bodyContent",new a(w).render({loginUrl:loginURL})):r.set("bodyContent",new a(v).render({text:k[e.code]}))},"subscribeBack")}})}}},{requires:["cookie","overlay","xtemplate","gallery/placeholder/1.0/index"]}),S.use("node, anim, swf",function(e,t,n,a){function o(e){var t,n=!1;if(/.swf$/.exec(e.img)&&(n=!0),t=DOM.create(['<div style="background-color:'+e.backCol+';" class="topB-banner" data-spm="2">','<div class="topB-banner-con"  style="height: 0px;">','<div class="bigImg">',n?"":'<a target="_blank"  href="'+e.imgLink+'"><img src="'+e.img+'" /></a>',"</div>",e.smallImg?'<a target="_blank" href="'+e.imgLink+'" class="samllImg">'+'<img src="'+e.smallImg+'" />'+"</a>":"",'<div class="top-banner-close-con">','<a class="top-banner-close" href="#"></a>',"</div>","</div>","</div>"].join("")),$("body").prepend(t),n){var o=$(".topB-banner .bigImg"),s={version:"9.0.124",fixedAttributes:{allowScriptAccess:"always",allowNetworking:"all",scale:"noscale",wmode:"opaque",allowFullScreen:"true"},flashVars:{}};new a({render:o,attrs:{width:1190,height:e.hs},src:decodeURIComponent(G_data[i].img),params:s})}return t}function s(t){if(t&&G_data){var a=t.time;e.each(G_data,function(e){var t=e.startTime;if(t){var i,s,l=getTime(t),r=getTime(a);if(r>=l&&(i=e.end?getTime(e.end):1e13,i>r)){if(s=o(e)){s=$(s);var c=s.one(".topB-banner-con");if(c){var d,u=c.one(".top-banner-close"),h=c.one(".bigImg"),m=c.one(".samllImg"),g=c.one(".top-banner-close"),f=m?!0:!1,b=e.timer?parseInt(e.timer):null,p=new n(c,{height:"60px"},.5,"easeOutStrong",function(){m.css({height:60,zIndex:5,opacity:0}),new n(m,{opacity:1},.5,"easeOutStrong",function(){h.remove()}).run()}),v=new n(c,{height:0},.5,"easeOutStrong",function(){s.remove(),c.toggleClass("new")});u.css("display","block"),new n(c,{height:e.hs+"px"},.5,"ease",function(){b&&(d=setTimeout(function(){f?(f=!1,p.run()):v.run()},b))}).run(),g.on("click",function(e){e.preventDefault(),d&&(clearTimeout(d),d=null),f?(f=!1,p.run()):v.run()})}}return}}})}}G_data&&(window.J_time_callback=function(e){window.nowTime=e,s(e)},e.jsonp("http://www.yunos.com/login-api.php?script=true&callback=J_time_callback&callback2={callback}",function(){}))}),S.use("node",function(e){e.each($(".good-list"),function(e){$(e).delegate("mouseenter mouseleave","li",function(e){var t=$(e.currentTarget),n=t.parent("ul");"mouseenter"==e.type&&(n.children().removeClass("cur"),t.addClass("cur"))})})}),S.use("node, gallery/slide/1.3/, anim, yunos-remind, sizzle",function(e,t,n,a,i){function o(){$("#Y_SlideTopB ol").children().length>1&&(r=new n("#Y_SlideTopB",{contentClass:"ks-switchable-content",pannelClass:"ks-switchable-item",navClass:"ks-switchable-nav",selectedClass:"ks-active",effect:"fade",easing:"easeOutStrong",countdown:!0,eventType:"mouseenter",speed:500,timeout:5e3}),r.play())}function s(e){e&&e.hasClass("b-remind-btn")&&(e.removeClass("b-remind-btn"),e.addClass("b-reminded-btn"),e.one("span").html("\u9884\u7ea6\u6210\u529f"))}function l(t){for(var n=g.children(),a=1e3*t.timestamp,o=0,l=n.length;l>o;o++){var c=$(n[o]),d=c.attr("data-remind"),u=c.attr("data-pid"),h=c.attr("data-id"),m=c.attr("data-num")?Math.abs(parseInt(2*c.attr("data-num"))):0,f=c.attr("data-time"),b=getTime(f);if("true"===d&&b&&b-18e5>a){var p,v=c.one("a");v.html('<div class="b-remind"><div class="b-remind-state" data-spm-click="gostr=/yunos;locaid=d000'+(o+1)+'"><span></span></div><p class="b-remind-num"><em></em>\u4eba\u5df2\u9884\u7ea6</p></div>'),p=v.one(".b-remind-num em"),getRemindData(huodongURL+"/message/countByUser.do?groupId="+u+"&itemId="+h,e.bind(function(e,t,n){var a=t.one(".b-remind-state"),i=a.one("span");e.attr("data-pnumber",n?n.data:null),200===n.code?null===n.data?(a.addClass("b-reminded-btn"),i.html("\u5df2\u7ecf\u9884\u7ea6")):(a.addClass("b-remind-btn"),i.html("\u9a6c\u4e0a\u9884\u7ea6")):(a.addClass("b-remind-btn"),i.html("\u9a6c\u4e0a\u9884\u7ea6"))},void 0,c,v),"countByUserBack"+o),getRemindData(huodongURL+"/message/countByItem.do?groupId="+u+"&itemId="+h,e.bind(function(e,t,n){200===n.code?e.html(n.data+t):e.html(t)},void 0,p,m),"reservationNumBack"+o)}}$("#Y_SlideTopB").delegate("click",".b-reminded-btn",function(e){e.halt()}),$("#Y_SlideTopB").delegate("click",".b-remind-btn",function(e){e.halt();var t=$(e.currentTarget).parent(".ks-switchable-item");i.init({target:t,banner:r,callback:s})})}var r,c="http://act.yun.taobao.com/go/act/yunos/yunos-new-year.php#yp-lottery",d=getQueryString(href,"id"),u=["#c62626","#ffa71d","#ff81b9"],h=["http://gtms01.alicdn.com/tps/i1/T1hY4yFtRbXXXqiszx-1600-450.png","http://gtms01.alicdn.com/tps/i1/T1NENxFzVgXXXqiszx-1600-450.png","http://gtms01.alicdn.com/tps/i1/T1U1xsFpVaXXXqiszx-1600-450.png"],m=$("#Y_SlideTopB"),g=m.one(".ks-switchable-content");m.one(".ks-switchable-nav"),m.delegate("mouseenter mouseleave","li",function(e){r&&("mouseenter"==e.type?r.stop():r.play())}),d?getData(huodongURL+"/heka/get.do?id="+d,function(t){if(!t)return o(),void 0;var n,a=$("#Y_SlideTopB"),i=a.one(".ks-switchable-content"),s=a.one(".ks-switchable-nav"),l=parseInt(t.photoId);(!e.isNumber(l)||1>l||l>3)&&(l=1),n='<li class="ks-switchable-item huodong'+l+'" style="background-color:'+u[l-1]+';z-index:2">'+'<s style="background-image: url('+h[l-1]+');background-repeat:no-repeat;background-position: center center;">'+"</s>"+'<a target="_blank" href="'+c+'" >'+'<p class="huodong-to">'+t.receiver+"</p>"+'<p class="huodong-mes">'+t.message+"</p>"+'<p class="huodong-by">'+t.sender+"</p>"+"</a>"+"</li>",i.prepend(n),s.append("<li></li>"),o()},"huodongCallback"):o();var f=$("#Y_FastonTopB");f&&f.children().length>1&&f.children().on("mouseenter mouseleave",function(t){var n,i=$("li i",f),o=t.target,s=$(t.target);"LI"!=o.nodeName&&(s=s.parent("li")),n=s.one("i"),"mouseenter"==t.type?(e.each(i,function(e){e[0]!=n[0]&&(a.isRunning(e)&&a.stop(e),new a(e,{opacity:.3},.45,"ease",function(){}).run())}),a.isRunning(n)&&a.stop(n),new a(n,{opacity:0},.45,"ease",function(){}).run()):e.each(i,function(e){a.isRunning(e)&&a.stop(e),new a(e,{opacity:0},.45,"ease",function(){}).run()})}),window.nowTime?l(window.nowTime):(window.J_time_callbackT=function(e){l(e)},e.jsonp("http://www.yunos.com/login-api.php?script=true&callback=J_time_callbackT&callback2={callback}",function(){}))}),S.use("node, anim",function(e,t,n){function a(e){var t=document.documentElement.scrollTop?$(document.documentElement):$(document.body);n.isRunning(t)&&n.stop(t),new n(t,{scrollTop:e},.25,"ease",function(){}).run()}function i(){DOM.viewportWidth()<1281&&DOM.viewportWidth()>1024?l.css("marginLeft","594px"):DOM.viewportWidth()<=1024?l.css("marginLeft","557px"):l.css("marginLeft","620px")}var o,s=$(".s-contact-info"),l=$("#sidebar"),r=null,c=["#J_FMobile","#J_FFree","#J_FTV","#J_FRecommend","#J_FTry","#J_FC2b","#J_FForum"];$(".sidebar-item").on("mouseenter mouseleave",function(e){var t,a=$(e.currentTarget);a.hasClass("s-totop")||(n.isRunning(a)&&n.stop(a),"mouseenter"==e.type?(t={left:"-40px",width:"40px"},a.hasClass("s-contact")&&(a.addClass("s-contact-hover"),s.css("display","block"),t.overflow="visible"),new n(a,t,.1,"easeIn",function(){}).run()):(t={left:0,width:0},a.hasClass("s-contact")&&(a.removeClass("s-contact-hover"),s.css("display","none"),t.overflow="visible"),new n(a,t,.1,"easeOut",function(){}).run()))}),l.delegate("click",".sidebar-item",function(t){var n=$(t.currentTarget);if(!n.hasClass("s-contact")){t.halt();var i=n.attr("href"),o=i.substring(i.indexOf("#")),s=0;e.each(c,function(e){e==o&&(s=$(o)?$(o).offset().top:0)}),a(s)}});var d=document.documentElement.scrollTop||document.body.scrollTop;d>200&&l.css("display","block"),$(window).on("scroll",function(){var e=document.documentElement.scrollTop||document.body.scrollTop;o&&clearTimeout(o),o=setTimeout(function(){e>200?l.show():l.hide()},300)}),i(),$(window).on("resize",function(){r&&clearTimeout(r),r=setTimeout(function(){i()},400)})}),S.use("node, anim, gallery/countdown/1.3/index, mustache",function(e,t,n,a){var i={init:function(){this.con=$(".ad-floor1"),this.getData(),this.getBuyNum()},getData:function(){getData(url+"/api/tbchannel/rank/phone/list",e.bind(this.dataHandle,this),"phoneCallback")},getActiveID:function(){var t=$(".slide",this.con.one("#slider")),n="";return e.each(t,function(e){var e=$(e),t=e.attr("data-id");n?t&&(n+=","+t):n+=t}),n},getBuyNum:function(){var t=this.getActiveID();t&&getData(url+"/api/tbchannel/totalsoldquantity/getbyids?itemIds="+t,e.bind(this.setBuyNum,this),"getbyidsCallback")},setBuyNum:function(t){if(t){var n=$(".slide",this.con.one("#slider"));e.each(n,function(e){var e=$(e),n=t[e.attr("data-id")];n&&e.one("a").append('<p class="active-buynum">'+n+"\u4eba\u5df2\u8d2d\u4e70</p>")})}},setDownTime:function(t){function n(e,t,n){e.append('<div class="cd cd-large cd-slide"><i></i><span class="clock">${d}${h}${m}${s}</span></div>');var i=a({el:e.children(".cd"),leftTime:t,effetc:"slide"});i.notify(0,function(){n?(e.removeClass("timeDownB"),e.addClass("timeDownO"),this.left=n,n=0):e.children(".cd").remove()})}if(t){var i=$(".slide",this.con.one("#slider"));e.each(i,function(e){var e=$(e),a=getTime(e.attr("data-timeB")),i=getTime(e.attr("data-timeO"));if(a&&a>1e3*t){e.addClass("timeDownB");var o=0;i&&i>a&&(o=i-a),n(e,Math.round(a/1e3)-t,o)}else i&&i>1e3*t&&(e.addClass("timeDownO"),n(e,Math.round(i/1e3)-t))})}},dataHandle:function(e,t){if(e){var e=this.analysisData(e);this.setHTML(e),this.setDownTime(t)}},analysisData:function(e){for(var t,n=0,a=e.length;a>n;n++)e[n].number=n+1,1==e[n].number&&(e[n].cur=!0,t=e[n].weekSaleCount),5==e[n].number&&(e[n].last=!0),e[n].percent=100*(e[n].weekSaleCount/t);return e},setHTML:function(t){var n=this.con.one(".mobile-Top-list"),a=e.mustache.to_html($("#tpl-mobileSale").html(),{data:t});n.html(a)}};i.init();var o=function(){function e(e,t,n){for(var a=e.getElementsByTagName(t),i=0,o=a.length,s=[];o>i;i++)$(a[i]).hasClass(n)&&s.push(a[i]);return 1==s.length&&(s=s[0]),s}function t(e,t){e.filters?e.filters.alpha.opacity=Math.round(t):e.style.opacity=t/100}function n(t,n,a,i,o){this.slides=[],this.over=!1,this.S=this.S0=n,this.iW=a,this.iH=i,this.oP=o,this.oc=document.getElementById(t),this.frm=e(this.oc,"div","slide"),this.NF=this.frm.length,this.resize();for(var s=0;s<this.NF;s++)this.slides[s]=new Slide(this,s);this.oc.parent=this,this.view=this.slides[0],this.Z=this.mx,this.oc.onmouseout=function(){return!1}}return n.prototype={run:function(){this.Z+=this.over?.5*(this.mn-this.Z):.5*(this.mx-this.Z),this.view.calc();for(var e=this.NF;e--;)this.slides[e].move()},resize:function(){this.wh=this.oc.clientWidth,this.ht=this.oc.clientHeight,this.wr=this.wh*this.iW,this.r=this.ht/this.wr,this.mx=this.wh/this.NF,this.mn=this.wh*(1-this.iW)/(this.NF-1)},mouseout:function(){this.over=!1,t(this.view.img,this.oP),this.view.img.style.marginLeft="0px"}},Slide=function(n,a){this.parent=n,this.N=a,this.x0=this.x1=a*n.mx,this.v=0,this.loaded=!1,this.cpt=0,this.start=new Date,this.obj=n.frm[a],this.img=e(this.obj,"img","diapo"),0==a&&(this.obj.style.borderLeft="none"),this.obj.style.left=Math.floor(this.x0)+"px",t(this.img,n.oP),this.obj.parent=this,this.obj.onmouseover=function(){return this.parent.over(),!1}},Slide.prototype={calc:function(){for(var e=this.parent,t=0;t<=this.N;t++)e.slides[t].x1=t*e.Z;for(var t=this.N+1;t<e.NF;t++)e.slides[t].x1=e.wh-(e.NF-t)*e.Z},move:function(){var e=this.parent,t=(this.x1-this.x0)/e.S;this.N&&Math.abs(t)>.5&&(this.obj.style.left=Math.floor(this.x0+=t)+"px");var n=this.N<e.NF-1?e.slides[this.N+1].x0-this.x0:e.wh-this.x0;if(Math.abs(n-this.v)>.5)this.v=n,this.cpt++;else if(!this.pro){this.pro=!0;var a=new Date-this.start;this.cpt>1&&(e.S=Math.max(2,28/(a/this.cpt)*e.S0))}this.loaded||this.img.complete&&(this.img.style.visibility="visible",this.loaded=!0)},over:function(){this.parent.resize(),this.parent.over=!0,t(this.parent.view.img,this.parent.oP),this.parent.view=this,this.start=new Date,this.cpt=0,this.pro=!1,this.calc(),t(this.img,100)}},{init:function(e){this.s1=new n("slider",6,1.84/e,.3125,100),setInterval(function(){o.s1.run()},16)}}}(),s=3.66;o.init(s),$("#slider .slide")[0].onmouseover()}),S.use("node, anim, gallery/slide/1.1/",function(e,t,n,a){window.global_variables.blockObj||(window.global_variables.blockObj={}),window.global_variables.blockObj.win_yunos={init:function(){this.con=$(".mode-yunos"),this.render(),this.binder()},render:function(){var e=this.con.one("#Y_SlideYunosB");$("ol",e).children().length>1&&(this.slideObj=new a("#Y_SlideYunosB",{contentClass:"ks-switchable-content",pannelClass:"ks-switchable-item",effect:"fade",easing:"easeOutStrong",countdown:!0,autoSlide:!0,speed:1e3,timeout:4e3}))},binder:function(){var e=$("#Y_SlideYunosB"),t=this.con.one(".yunos-smallP"),a=this.con.one(".yunos-close"),i=this;a.on("click",function(o){o.preventDefault(),a.hide(),i.slideObj&&i.slideObj.stop();var s=t.one("img").height();new n(e,{height:s},.5,"easeOutStrong",function(){t.css({zIndex:10,opacity:0}),new n(t,{opacity:1},.5,"easeOutStrong",function(){i.con.css("height",s),e.remove()}).run()}).run()})}}}),S.use("node, gallery/switchable/1.3.1/, mustache",function(e,t,n){window.global_variables.blockObj||(window.global_variables.blockObj={}),window.global_variables.blockObj.win_recommend={init:function(){this.con=$(".mode-recommended"),this.con&&this.getData()},scroll:function(){var e=this.con.one(".mobile-buyer-sycle");new n.Slide(e,{contentCls:"buyner",hasTriggers:!1,effect:"scrolly",easing:"easeOutStrong",interval:5,steps:3,duration:.5})},getData:function(){getData(url+"/api/tbchannel/phone/buyer/list",e.bind(this.dataHandle,this),"buyerCallback")},dataHandle:function(e){return e?(this.setHTML(e),this.scroll(),void 0):(this.scroll(),void 0)},setHTML:function(t){var n=this.con.one(".mobile-buyer-sycle ul"),a=e.mustache.to_html($("#tpl-mobilebuyer").html(),{data:t});n.html(a)},render:function(){}}}),S.use("node, anim",function(e,t,n){window.global_variables.blockObj||(window.global_variables.blockObj={}),window.global_variables.blockObj.win_taoGold={init:function(){this.con=$(".mode-taogold"),this.con&&this.binder()},binder:function(){var e=this.con.one(".taoGold-mobile-list");e.delegate("mouseenter mouseleave","li",function(e){var t=$(e.currentTarget),a=t.one("img");n.isRunning(a)&&n.stop(a),"mouseenter"==e.type?new n(a,{marginLeft:"-10px"},.2,"ease",function(){}).run():new n(a,{marginLeft:0},.2,"ease",function(){}).run()})}}}),S.use("node, gallery/switchable/1.3.1/, gallery/digitalScroll/1.0/index, mustache",function(e,t,n,a){window.global_variables.blockObj||(window.global_variables.blockObj={}),window.global_variables.blockObj.win_oyuan={init:function(){this.con=$(".mode-oyuan"),this.con&&this.getDate()},getDate:function(){getData(url+"/api/tbchannel/contract/phone/info",e.bind(this.dataHandle,this),"phoneinfoCallback")},dataHandle:function(e){this.setCount(e),this.setBuyer(e)},scrollNum:function(e){new a({data:e,nodeList:DOM.query("#oyuan_num li"),durationList:.5})},setCount:function(e){var t,n=1e6,a=[],i=this;for(e?t=e.count:(t=parseInt($("#oyuan_num").attr("data-num")),t||(t=0));n;)a.push(parseInt(t/n)),t%=n,n=parseInt(n/10);this.firstIN=!0;var o=DOM.scrollTop();o+DOM.viewportHeight()>DOM.offset(i.con).top+200&&i.firstIN&&(this.firstIN=!1,this.scrollNum(a)),$(window).on("scroll",function(){var e=DOM.scrollTop();e+DOM.viewportHeight()>DOM.offset(i.con).top+200&&i.firstIN&&(i.firstIN=!1,i.scrollNum(a))})},scroll:function(){var e=this.con.one(".oyuan-buyner");new n.Slide(e,{contentCls:"buyner",hasTriggers:!1,effect:"scrolly",easing:"easeOutStrong",interval:5,steps:2,duration:.5})},setBuyer:function(t){if(!t)return this.scroll(),!1;var n=this.con.one(".oyuan-sale .oyuan-buyner-list"),a=e.mustache.to_html($("#tpl-oyuanbuy").html(),{data:t.list});n.html(a),this.scroll()}}}),S.use("node, gallery/switchable/1.3.1/, mustache",function(e,t,n){window.global_variables.blockObj||(window.global_variables.blockObj={}),window.global_variables.blockObj.win_tyg={init:function(){this.con=$(".mode-tyg"),this.con&&"none"!=this.con.css("display")&&this.getData()},scroll:function(){var e=this.con.one(".tyg-user-pl-con");new n.Slide(e,{contentCls:"buyner",hasTriggers:!1,effect:"scrolly",easing:"easeOutStrong",interval:5,steps:3,duration:.5})},getOtherID:function(){var t=$(".tyg-list li",this.con),n="";return e.each(t,function(e){var t=$(e).attr("data-id");t&&(n+=n?","+t:t)}),n},getMainID:function(){var e=this.con.one(".tyg-recommend");return e.attr("data-id")},analysisDetailData:function(e,t){t&&(t.vipLevel?6==t.vipLevel&&(t.noAddsign=!0):delete t.vipLevel,t.itemID=e,t.lastPrice=t.reversePrice-t.promotedPrice)},getData:function(){var t=this.getOtherID(),n=this.getMainID();return t||n?(getData(url+"/api/tbchannel/tyg/phone/info?itemIds="+t+"&itemIdAddGrade="+n,e.bind(this.dataHandle,this),"tygCallback"),void 0):(this.scroll(),void 0)},dataHandle:function(e){if(!e)return this.scroll(),void 0;var t=this.con.one(".tyg-recommend"),n=t.attr("data-id");n&&e[n]?this.mainRHandle(n,e[n]):this.scroll(),this.otherHandle(e)},otherHandle:function(t){if(t){var n=$(".tyg-list li",this.con),a=this;e.each(n,function(n){var i,n=$(n),o=n.attr("data-id");o&&t[o]&&(a.analysisDetailData(o,t[o]),i=e.mustache.to_html($("#tpl-tygOther").html(),{data:[t[o]]}),a.setHTML(n,i))})}},mainRHandle:function(t,n){this.analysisDetailData(t,n);var a,i=this.con.one(".tyg-recommend"),o=i.one(".tyg-recommend-con"),s=i.one(".tyg-pl-star"),l=i.one(".tyg-user-pl"),r=e.mustache.to_html($("#tpl-tygMianD").html(),{data:[n]}),c=n.userGradeList;if(c&&c.length){for(var d=0,u=c.length;u>d;d++)c[d].createTime=new Date(c[d].createTime).Format("yyyy-MM-dd hh:mm:ss");a=e.mustache.to_html($("#tpl-tygMainBuyer").html(),{data:c})}n.gradeAvgTotal&&0!=n.gradeAvgTotal&&(s.one(".star-line span").css("width",100*(n.gradeAvgTotal/5)+"%"),s.one(".star").html(n.gradeAvgTotal+"\u5206")),this.setHTML(o,r),a&&this.setHTML(l,a),this.scroll()},setHTML:function(e,t){e.html(t)}}}),S.use("node, gallery/switchable/1.3.1/",function(e,t,n){window.global_variables.blockObj||(window.global_variables.blockObj={}),window.global_variables.blockObj.win_tvMod={init:function(){this.con=$(".mode-TV"),this.con&&this.scroll()},scroll:function(){var e=this.con.one(".TV-buyner");new n.Slide(e,{contentCls:"buyner",hasTriggers:!1,effect:"scrolly",easing:"easeOutStrong",interval:5,steps:3,duration:.5})}}}),S.use("node",function(S,Node){function replaceParamVal(url,paramName,replaceWith){if(S.isArray(paramName)){for(var i=0,l=paramName.length;l>i;i++)url=arguments.callee(url,paramName[i],replaceWith[i]);return url}var re=eval("/("+paramName+"=)([^&]*)/gi");return url=url.replace(re,paramName+"="+replaceWith)}window.global_variables.blockObj||(window.global_variables.blockObj={}),window.global_variables.blockObj.win_c2b={init:function(){this.con=$(".mode-c2b"),this.con&&(this.dz=this.con.one(".c2b-dz"),this.systemUI(),this.bindUI())},changebefore:function(e){var t=this.dz.one(".wg-img-show");t.one(".wg-positive").css({background:"url("+e+")"})},changeTB:function(e,t){var n=this.dz.one(".wg-img-show"),a=n.one(".wg-back"),i=new Image,o=new Image;i.onload=function(){a.one(".wg-back-top").css({background:"url("+e+")"})},o.onload=function(){a.one(".wg-back-bottom").css({background:"url("+t+")"})},i.src=e,o.src=t},changeMid:function(e){var t=this.dz.one(".wg-img-show"),n=t.one(".wg-back"),a=new Image;a.onload=function(){n.one(".wg-back-center").css({background:"url("+e+")"})},a.src=e},changeLink:function(){var e,t,n,a,i=this.con.one(".myTab-params"),o=i.one(".to-c2b-dz");S.each(i.children("dl"),function(a){var a=$(a),i=a.attr("data-name"),o=a.one(".selected").attr("data-id");switch(i){case"front":e=o;break;case"backMid":t=o;break;case"backUp":n=o}}),a=o.attr("data-href"),a=replaceParamVal(a,["front","backMid","backUp"],[e,t,n]),o.attr("href",a)},changeImg:function(e){var t=e.parent("dl"),n=t.attr("data-name");switch(n){case"front":this.changebefore(e.attr("data-img"));break;case"backMid":this.changeMid(e.attr("data-img"));break;case"backUp":this.changeTB(e.attr("data-top"),e.attr("data-bottom"))}},systemUI:function(){var e=this;S.each($(".selected",this.dz.one(".myTab-params")),function(t){e.colorChangeAfter($(t))})},colorChangeAfter:function(e){this.changeImg(e),this.changeLink()},colorHandle:function(e){var t,n;return n=e.target?"LI"==e.target.nodeName?$(e.target):$(e.target).parent("li"):e,n.hasClass("selected")?!1:(t=n.parent("ul"),t.children().removeClass("selected"),n.addClass("selected"),this.colorChangeAfter(n),void 0)},bindUI:function(){var e=$("li",this.dz.one(".myTab-params"));e.on("click",S.bind(this.colorHandle,this))}}}),S.use("",function(){var e=$(".partner");e.length&&e.delegate("mouseenter mouseleave",".panner-list a",function(e){var t=$(e.currentTarget),n=t.one("img");"mouseenter"==e.type?n.attr("src",n.attr("data-imga")):n.attr("src",n.attr("data-imgb"))})}),S.use("gallery/slide/1.1/, gallery/switchable/1.3.1/, datalazyload, anim",function(e,t,n,a,i){function o(e,t,n,a,o){e.on("mouseenter mouseleave",function(e){var s,l=$(e.currentTarget);l.hasClass(t)||(l=l.parent("."+t)),s=l.one("."+n),"true"!==l.attr("data-first")?s.css("top",o):l.attr("data-first",!0),s&&(i.isRunning(s)&&i.stop(s),"mouseenter"==e.type?new i(s,{top:a},.2,"ease",function(){}).run():new i(s,{top:o},.2,"ease",function(){}).run())})}var s,l=$("#Ban_TV"),r=$("#Ban_community");s=new a({type:"img",diff:{top:100,bottom:100},container:".mallMain"}),$("#J_FYunos").length&&s.addCallback("#J_FYunos",function(){var e=window.global_variables.blockObj.win_yunos;e&&(e.init(),s.removeCallback("#J_FYunos",arguments.callee))}),$("#J_FRecommend").length&&s.addCallback("#J_FRecommend",function(){var e=window.global_variables.blockObj.win_recommend;e&&(e.init(),s.removeCallback("#J_FRecommend",arguments.callee))}),$("#J_FTaoGold").length&&s.addCallback("#J_FTaoGold",function(){var e=window.global_variables.blockObj.win_taoGold;e&&(e.init(),s.removeCallback("#J_FTaoGold",arguments.callee))}),$("#J_FFree").length&&s.addCallback("#J_FFree",function(){var e=window.global_variables.blockObj.win_oyuan;e&&(e.init(),KISSY.use("chooseContract",function(){}),s.removeCallback("#J_FFree",arguments.callee))}),$("#J_FC2b").length&&s.addCallback("#J_FC2b",function(){var e=window.global_variables.blockObj.win_c2b;e&&(e.init(),s.removeCallback("#J_FC2b",arguments.callee))}),$("#J_FTV").length&&s.addCallback("#J_FTV",function(){var e=window.global_variables.blockObj.win_tvMod;e&&(e.init(),l&&$("ol",l).children().length>1&&new n.Slide("#Ban_TV",{effect:"scrollx",easing:"easeOutStrong"}),s.removeCallback("#J_FTV",arguments.callee))}),$("#J_FTry").length&&s.addCallback("#J_FTry",function(){var e=window.global_variables.blockObj.win_tyg;e&&(e.init(),s.removeCallback("#J_FTry",arguments.callee))}),$("#J_FForum").length&&s.addCallback("#J_FForum",function(){r&&$("ol",r).children().length>1&&new n.Slide("#Ban_community",{effect:"scrollx",easing:"easeOutStrong"}),s.removeCallback("#J_FForum",arguments.callee)}),new t("Ban_top",{contentClass:"ks-switchable-content",pannelClass:"tab-content",navClass:"ks-switchable-nav",selectedClass:"ks-active",eventType:"mouseenter"}).on("switch",function(){}),$("#J_FFree").length&&new t("Tab_oyuan",{contentClass:"ks-switchable-content",pannelClass:"tab-content",navClass:"ks-switchable-nav",selectedClass:"ks-active",eventType:"mouseenter"}).on("switch",function(){s._initLoadEvent()}),$("#J_FForum").length&&new t("T_community",{contentClass:"ks-switchable-content",pannelClass:"tab-content",navClass:"ks-switchable-nav",selectedClass:"ks-active",eventType:"mouseenter"}).on("switch",function(){s._initLoadEvent()});var c=$(".mode-recommended"),d=$(".recommend-hot",c),u=$(".recommend-new",c);o(d,"recommend-good","recommend-reason","200px","390px"),o(u,"recommend-new","recommend-reason","180px","370px");var h=$(".TV-recommend");h.length&&o($(".tv-single",h),"tv-single","tv-param","154px","274px");var m=$("#Tab_oyuan");m.length&&o($(".oyuan-single-ad",m),"oyuan-single-ad","oyuan-ad-param","104px","224px")})}),function(){KISSY.add("xoverlay",function(e,t,n,a){var $=t.all,i="overlay-contract-w",o="overlay-contract-w0 overlay-contract-w1 overlay-contract-w2 overlay-contract-w3 overlay-contract-w4",s=$(".overlay-contract"),l=$(".overlay-contract-bd"),r='<i class="overlay-contract-icon"></i><p class="overlay-contract-info">\u6ca1\u6709\u627e\u5230\u4f60\u8981\u7684\u5408\u7ea6\u673a</p><a href="http://yun.taobao.com/0yuan" target="_blank" class="overlay-contract-link">\u770b\u770b\u5176\u4ed6\u5408\u7ea6\u673a</a>',c='<i class="overlay-contract-icon"></i><p class="overlay-contract-info">\u4eb2\uff0c\u5e2e\u4f60\u627e\u5230<span>{{count}}</span>\u6b3e\u9002\u5408\u4f60\u7684\u5408\u7ea6\u673a</p><div class="choose-result" id="J_CSlide"><span class="choose-result-left disable"></span><span class="choose-result-right"></span><div class="choose-result-item"><div class="ks-switchable-content">{{#each data}}<div class="choose-result-i"><a href="{{href}}" target="_blank" class="choose-result-img"><img src="{{img}}"></a><p class="choose-result-title"><a href="{{href}}" target="_blank">{{name}}</a></p><p class="choose-result-desc">{{desc}}</p><p class="choose-result-price">&yen;<strong>{{price}}</strong></p> </div>{{/each}}</div></div>';return{render:function(e){this._close(),this._initOverlay(e)},_close:function(){$(".overlay-contract-close").on("click",function(e){e.halt(),l.empty(),s.undelegate("click",".choose-result-left"),s.undelegate("click",".choose-result-right"),s.hide()})},_initOverlay:function(e){var t="",a=Math.min(4,e.length);s.removeClass(o),s.addClass(i+a),0==a?(t=r,s.delegate("click",".overlay-contract-link",function(){setTimeout(function(){s.hide()},.4)})):t=new n(c).render({data:e,count:e.length}),l.html(t),s.show(),a>3&&this._slide()},_slide:function(){new a.Carousel("#J_CSlide",{effect:"scrollx",easing:"easeOutStrong",steps:3,viewSize:[690],circular:!1,hasTriggers:!1,prevBtnCls:"choose-result-left",nextBtnCls:"choose-result-right",disableBtnCls:"disable",lazyDataType:"img-src"})}}},{requires:["node","xtemplate","gallery/switchable/1.3.1/"]}),KISSY.add("chooseContract",function(e,t,n,a,i,o){function s(e){var t=new o("#"+e,{width:177,height:30,menuCfg:{align:{offset:[0,-1]},height:150,elStyle:{overflow:"auto",overflowX:"hidden"}}});
return t.on("valueChange",function(t){var n=t.$select;g.attr("data-"+e,n[0].value)}),t.render(),t}function l(t,n){var a=[],i=n.fee,o=n.flow,s=n.duration,l=function(e,t){return-1==e||e==t};return e.each(t,function(e){var t=e.set;l(i,parseInt(t.fee))&&l(s,parseInt(t.duration))&&l(o,parseInt(t.flow))&&a.push(e)}),a}function r(){var t,n,a=e.clone(window.g_contracts),i=a.length,o=[];for(t=0;i>t;t++){var s=a[t],l=s.set,r=l.fee,c=l.duration,d=l.flow,u=[],h=[],m=[];if(-1!==(r+"").indexOf(",")){for(u=r.split(","),h=d.split(","),m=c.split(","),n=0;n<u.length;n++){var g=e.clone(s),f=g.set;f.fee=u[n],f.flow=h[n],f.duration=m[n],a.push(g)}o.push(t)}}for(var b=0,p=o.length;p>b;b++)o[b]=Math.max(0,o[b]-b),a.splice(o[b],1);window.gg_contracts=a}function c(){var t=function(e,t){var n=-1,a=t.length-1;if(-1==e)n=-1;else if(e>=t[a])n=t[a];else if(e<=t[0])n=t[0];else for(var i=1;a+1>i;i++)if(e>t[i-1]&&e<=t[i]){n=t[i];break}return n};e.each(window.gg_contracts,function(e){var n=e.set;n.fee=t(n.fee,f),n.duration=t(n.duration,b),n.flow=t(n.flow,p)})}function d(e){for(var t,n=[],a=0;a<e.length;a++){t=!0;for(var i=0;i<n.length;i++)if(e[a].name===n[i].name){t=!1;break}t&&n.push(e[a])}return n}var $=t.all,u="data-",h="oyuan-fee",m="oyuan-flow",g=$(".choose-btn"),f=(s(h),s(m),[49,99,199,299,300]),b=[99,199,399,599,600],p=[149,299,599,999,1e3];r(),c(),g.on("click",function(e){e.halt();var t=$(this),n=parseInt(t.attr(u+h))||-1,a=parseInt(t.attr(u+m))||-1,o=l(window.gg_contracts||[],{fee:n,flow:a,duration:-1}),s=d(o);i.render(s)})},{requires:["node","overlay","xtemplate","xoverlay","gallery/select/1.4/index","gallery/select/1.4/theme/default.css"]})}();