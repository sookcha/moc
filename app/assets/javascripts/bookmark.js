function d2p_make_link(userToken) {
        var d2pdiv = document.getElementById('output');
        var d2pcode = document.createElement('a');
        var d2pprev = document.getElementById('d2pcode');
        d2pcode.href = "javascript:(function(){D2P_SCRIPT=document.createElement('SCRIPT');D2P_SCRIPT.type = 'text/javascript';D2P_SCRIPT.src = 'http://cloudsquare.kr/SimplePush/bookmarkpush.php?url=' + escape(location.href) +'&token=" + userToken + "'; document.getElementsByTagName('head')[0].appendChild(D2P_SCRIPT);})();";
        d2pcode.id = "d2pcode";

        if(d2pprev){
                document.getElementById('output').removeChild(d2pprev);
        }

        d2pcode.innerHTML = "D2P";
        d2pdiv.appendChild(d2pcode);
        d2pdiv.style.display = 'block';
}