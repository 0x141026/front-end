window.onload=function(){
	console.log("3333");
};
$(function(){
	console.log(a);
	console.log(x);
	console.log("111111");
});
$(document).ready(function(){
	console.log("6666666");
});
(function(){
	console.log("444444");
})(window);

(function(){
	console.log("55555");
})();
	
$(function(){
	var x = 3;
	console.log("222222");
	
});

$(window).load(function(){
	console.log("777777");
});
$(window).load(function(){
	console.log("888888");
});
window.onload=function(){
	console.log("99999");
};
//var x = 66;
console.log("njz执行和顺序：\n\n"+"立即执行函数(定义多个，依次执行)\n>$(function(){});或者$(document).ready(function(){});(定义多个依次执行)\n"
			+">window.onload=function(){};(定义多个只执行最后一个)\n>$(window).load(function(){});(定义多个，依次执行)");
alert("njz执行和顺序：\n"+"立即执行函数(定义多个，依次执行)\n>$(function(){});或者$(document).ready(function(){});(定义多个依次执行)\n"
			+">window.onload=function(){};(定义多个只执行最后一个)\n>$(window).load(function(){});(定义多个，依次执行)");
alert("js文件引入的先后顺序是有说法的！！\n后面的js全局变量会覆盖前面的；");
alert("防止立即执行函数执行不了！！所以记住每种入口函数最后都要加;");




