function frame_load(){
	//いいね数を取得
	var url=document.getElementById("url").value;
	$(function() {
    	//var url = 'http://markezine.jp/article/detail/19196';
		$.getJSON('http://graph.facebook.com/?id=' + encodeURI(url) + '&callback=?', {}, function(json) {
        	$('#likes').text(json.shares);
			})
	});
	

　	var url=document.getElementById("url").value;
　	target_frame.location.href=url;

}

//クリアボタン
function result_clear(){
　document.getElementById("result").value='';
}

//テキスト抽出ボタン
//動的にscriptタグを作成
function getSource() {
    var elm = document.getElementById("url");
    var sc = document.createElement("script");
    sc.id = "_ryokurian_getSourceScript";
    sc.charset = "utf-8";
    //ソースにcgiを指定し、パラメータでアドレスとコールバック関数を渡す
    //このcgiが出力するのはたったこれだけコード → _ryokurian_getSource("urlエンコード(rawurlencode)されたhtmlソース")
    sc.src = "http://www.ryokurian.jp/atelier/geso/geso.php?url=" + encodeURI(elm.value) + "&fnc=_ryokurian_getSource&out=utf-8";
    var org = document.getElementById(sc.id);
    if (org == undefined) {
        document.getElementsByTagName("head")[0].appendChild(sc);
    } else {
        document.getElementsByTagName("head")[0].replaceChild(sc, org);
    }
}

//cgiに渡すコールバック関数
function _ryokurian_getSource(html) {
	//urlデコードしてhtmlソースを復元
	if (html.match(/^error:(.+)/)) {
		document.getElementById("source").value = RegExp.$1;
	} else {
		document.getElementById("source").value = decodeURIComponent(html);
	}
}
