(function(window,$){
	var njz=function (){
		return{
			//功能：判断权利人是否都一样
			//形参说明：传两个需要对比的数组，第一个参数叫左边数组，第二个参数叫右边数组
			judge:function(leftArr, rightArr){
				if(leftArr.length != rightArr.length){
					return "不一样";
				}else{
					var flat=0;//判断是否人都相同，1表示不同，0都相同
					for(var j=0;j<leftArr.length;j++){
						//输出左边第j个元素在右边哪个位置找到
						console.log(jQuery.inArray(leftArr[j],rightArr));
						if(jQuery.inArray(leftArr[j],rightArr)==-1){
							console.log("左边第"+j+"个元素在右边数组里没找到。");
							flat=1;
							break;
						}else{};
					}
					if(flat==0){
						console.log("一样");
						return "一样";
					}else{console.log("不一样");return "不一样";}
					
				} 
			}
			//
		};
	}();
	window.njz=njz;
})(window,jQuery);