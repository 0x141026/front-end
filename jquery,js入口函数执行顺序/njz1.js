window.onload=function(){
	console.log("njz3333");
};
$(function(){
	var a = {a:34,b:'sssss'};
	window.a = a;
	console.log("njz111111");
});
$(document).ready(function(){
	console.log("njz6666666");
});
(function(){
	var a = 88;
	window.a = a;
	console.log("njz444444");
})(window);

(function(){
	console.log("njz55555");
})();
	
$(function(){
	var x = 3;
	console.log("njz222222");
	
});

$(window).load(function(){
	console.log("njz777777");
});
$(window).load(function(){
	console.log("njz888888");
});
window.onload=function(){
	console.log("njz99999");
};
var x = 77;
console.log("njz1执行和顺序：\n\n"+"立即执行函数(定义多个，依次执行)\n>$(function(){});或者$(document).ready(function(){});(定义多个依次执行)\n"
			+">window.onload=function(){};(定义多个只执行最后一个)\n>$(window).load(function(){});(定义多个，依次执行)");
alert("njz1执行和顺序：\n"+"立即执行函数(定义多个，依次执行)\n>$(function(){});或者$(document).ready(function(){});(定义多个依次执行)\n"
			+">window.onload=function(){};(定义多个只执行最后一个)\n>$(window).load(function(){});(定义多个，依次执行)");



