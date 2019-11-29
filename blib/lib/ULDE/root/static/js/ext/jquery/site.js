// JavaScript Document$(function(){
	// Open up .popup links in a new window
	$(".popup").bind("click",function(){
		window.open('https://www.clientspace.org/'+$(this).attr("href"),'ActiveX','toolbar=NO,width=500,height=300,scrollbars=yes,resizable=yes');
		return false;
	});
});

var DL=(function(){
	Table=function(elem,options){
		if(typeof(options.filters)!='object'){
			options.filters={};
		}
		var createBlankFilter=function(){
			var r={};
			for(var x in options.filters){
				r[x]="";
			}
			return r;
		};
		var filters=createBlankFilter();
		var sorts=options.sorts||{};
		var fn={
			getHeader:function(){
				return elem.find("tr.header");
			},
			getHeaderCells:function(){
				return fn.getHeader().find("th");
			},
			getHeaderCell:function(column){
				if(typeof(column)=='string'){
					column=fn.getColumnIndex(column);
				}
				return fn.getHeaderCells().eq(column);
			},
			getColumnNames:function(){
				var a=[];
				fn.getHeaderCells().each(function(){
					a.push($(this).text());
				});
				return a;
			},
			getColumnIndex:function(column){
				var n=false;
				fn.getHeaderCells().each(function(i){
					if($(this).text().toLowerCase()==column.toLowerCase()){
						n=i;
					}
				});
				if(n===false){
					throw("The column named '"+column+"' could not been found.");
				}
				return n;
			},
			getRows:function(hidden){
				// Hidden is a boolean flag to determine whether to include hidden rows
				hidden=(typeof(hidden)=='undefined')?false:hidden;
				var rows=elem.find("tr").not(".header");
				if(!hidden){
					rows=rows.not(":hidden");
				}
				return rows;
			},
			getRow:function(n,hidden){
				hidden=(typeof(hidden)=='undefined')?false:hidden;
				return fn.getRows(hidden).eq(n);
			},
			getCell:function(n,column,hidden){
				hidden=(typeof(hidden)=='undefined')?false:hidden;
				if(typeof(column)=='string'){
					column=fn.getColumnIndex(column);
				}
				return fn.getRow(n,hidden).find("td").eq(column);
			},
			getCellValue:function(n,column,hidden){
				hidden=(typeof(hidden)=='undefined')?false:hidden;
				if(typeof(column)=='string'){
					column=fn.getColumnIndex(column);
				}				
				return fn.getCell(n,column,hidden).text();
			},
			sort:{
				applySort:function(column,asc){
					if(sorts[column]){
						asc=(typeof(asc)=='undefined'||asc===false)?-1:1;				
						fn.sort.removeSort();		
						fn.getHeaderCell(column).addClass((asc>0)?"asc":"desc");
						var n=fn.getColumnIndex(column);
						var rows=fn.getRows().sort(function(a,b){
							if($(a).find("td").eq(n).text()>$(b).find("td").eq(n).text()){
								return asc;
							}else{
								return asc*-1;
							}
						}).prependTo(elem);
						return fn.updateClasses();
					}
				},
				toggleSort:function(column){
					if(fn.getHeaderCell(column).hasClass("asc")){
						return fn.sort.applySort(column,false);
					}else{
						return fn.sort.applySort(column,true);
					}
				},
				removeSort:function(){
					fn.getHeaderCells().removeClass("asc desc");
					fn.getRows(true).sort(function(a,b){
						if(a.originalRowOrderIndex>b.originalRowOrderIndex){
							return 1;
						}else{
							return -1;
						}
					}).prependTo(elem);
					return fn.updateClasses();
				}
			},
			filter:{
				applyFilter:function(column,value){
					filters[column]=value;
					return fn.filter.filterRows();
				},
				filterRows:function(){
					fn.getRows(true).show();
					for(var x in filters){
						if(filters[x].length>0){
							fn.getRows(true).each(function(i){
								if(!fn.getCellValue(i,x,true).toLowerCase().match(filters[x].toLowerCase())){
									fn.getRow(i,true).hide();
								};
							});
							fn.getHeaderCell(x).addClass("filtered");
						}else{
							fn.getHeaderCell(x).removeClass("filtered");
						}
					}
					return fn.updateClasses();
				},
				removeFilter:function(){
					filters=createBlankFilter();
					return fn.updateClasses();
				}
			},
			updateClasses:function(){
				fn.getRows(true).removeClass("odd even first last")
				var rows=fn.getRows();
				rows.each(function(i){
					var row=$(this);
					if(i==0){
						row.addClass("first");
					}
					row.addClass((i%2==0)?"odd":"even");
					if(i==rows.length-1){
						row.addClass("last");
					}
				});
				return fn;
			}			
		}
		fn.filter.removeFilter();
		
		var filterInterval=false;
		var filterform=$('<div class="filterform"><div><input type="text" /></div></div>').appendTo("body").hide();
		filterform.find(":input").focus(function(){
			var input=$(this);
			filterInterval=setInterval(function(){
				fn.filter.applyFilter(filterform.column,input.val());
			},100);
		}).blur(function(){
			clearInterval(filterInterval);
			filterform.hide();
		});
		
		fn.getRows(true).each(function(i){
			this.originalRowOrderIndex=i;
		});
		fn.getHeaderCells().each(function(){
			
			if(typeof(filters[$(this).text()])=='string'){
				$(this).prepend($('<div class="filterbutton"></div>').click(function(){
					var column=$(this).parent("th");
					var columnName=column.text();
					filterform.show().css({position:"absolute",top:column.offset().top+column.outerHeight(),left:column.offset().left}).width(column.outerWidth()).find(":input").val(filters[columnName]);
					filterform.column=columnName;
				}));
			}
			if(sorts[$(this).text()]){
				$(this).prepend($('<div class="sortbutton"></div>').click(function(){
					fn.sort.toggleSort($(this).parent("th").text());				
				}));
			}
			
		});
		return fn;
	};
	
	return {
		Table:Table
	};
})();