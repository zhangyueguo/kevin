$.fn.fxuiPlay = function(a) {
	return o = a || {}, this.each(function() {
		function y() {
			t = "left", s--, D(), E(s)
		}
		function z() {
			t = "right", s++, D(), E(s)
		}
		function C() {
			"left" == t ? s-- : s++, D(), E(s)
		}
		function D() {
			s >= q && (s = 0), 0 > s && (s = q - 1)
		}
		function E(a) {
			if (r != a) {
				e && v.eq(a).addClass("curr").siblings().removeClass("curr");
				var d, h, b = p.eq(r),
					c = p.eq(a);
				switch (f) {
				case 0:
					b.animate({
						opacity: 0
					}, g), c.animate({
						opacity: 1
					}, g);
					break;
				case 1:
					d = n.width(), h = n.height();
					var i = 1.5 * d,
						j = 1.5 * h,
						k = -(i - d) / 2,
						l = -(j - h) / 2;
					b.css({
						opacity: 0
					}), c.css({
						width: i,
						height: j,
						"margin-top": l,
						"margin-left": k,
						opacity: 1
					}).animate({
						width: d,
						height: h,
						margin: 0
					}, g);
					break;
				case 2:
					d = n.width(), h = n.height(), "left" == t ? (b.animate({
						left: -d
					}), c.css({
						left: d,
						top: 0
					})) : (b.animate({
						left: d
					}), c.css({
						left: -d,
						top: 0
					})), b.css({
						top: 0,
						width: d,
						height: h
					}), c.css({
						width: d,
						height: h,
						opacity: 1
					}).animate({
						left: 0,
						top: 0
					}, g);
					break;
				case 3:
					d = p.eq(a).width(), h = p.eq(a).height(), "left" == t && (b.animate({
						top: -h
					}, g), c.css({
						top: h,
						opacity: 1
					})), "right" == t && (b.animate({
						top: h
					}, g), c.css({
						top: -h,
						opacity: 1
					})), b.css({
						left: 0,
						width: d,
						height: h
					}), c.css({
						left: 0,
						width: d,
						height: h,
						opacity: 1
					}).animate({
						left: 0,
						top: 0
					}, g)
				}
				r = a
			}
		}
		var a = o.prev,
			b = o.next,
			c = o.auto,
			d = o.autotime || 5e3,
			e = o.no,
			f = o.effect || 0,
			g = o.efftime || 1e3,
			h = o.evt || "click",
			i = o.qq,
			j = 18339550,
			k = o.ismobi,
			l = $(this),
			n = (l.find(".play-out"), l.find(".play-box")),
			p = l.find(".play-item"),
			q = p.length,
			r = 0,
			s = 0,
			t = "left";
		if (i == j / 2) {
			if (p.css({
				position: "absolute",
				top: 0,
				left: 0,
				opacity: 0
			}).eq(0).css({
				opacity: 1
			}), e) {
				for (var v, w, u = "", x = 1; q >= x; x++) u += "<i>" + x + "</i>";
				e.html(u), v = e.find("i"), v.bind(h, function() {
					w = $(this).text() - 1, E(w), s = w
				}).eq(0).addClass("curr")
			}
			if (k) switch (f) {
			case 0:
			case 1:
			case 2:
				n.swipeLeft(y), n.swipeRight(z);
				break;
			case 3:
				n.swipeUp(y), n.swipeDown(z)
			}
			if (a && b && (a.click(y), b.click(z)), c) {
				var A = l,
					B = setInterval(function() {
						C(s)
					}, d);
				a && b && (A = A.add(a).add(b)), e && (A = A.add(e)), A.mouseover(function() {
					clearInterval(B)
				}).mouseout(function() {
					B = setInterval(function() {
						C(s)
					}, d)
				})
			}
		}
	})
};