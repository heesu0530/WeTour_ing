﻿// js calendar by jaewon
// last_modified : 2009/08/06
// Usage : <script type="text/javascript" src="calendar.js"></script>
//         <input type="text" id="start_date" name="start_date" value="20081027|null">
//         <input type="button" name="달력" onClick="calendar(event, 'start_date')">
var calendar_div;
var calendar_obj;
var calendar_tt;

// ex) calendar(event, 'object_name', 'YYYYMMDD')
// fmt option이 없으면 기본으로 설정.
// YYYY : 년
// MM : 월
// DD : 일
var calendar_fmt = "YYYY-MM-DD";

// 숨겨야 되는 select element 저장변수(Array)
var hidden_select;
// element의 x, y, width, height를 가져옴. (select외에 object를 인수로 사용해도 됨 ex:div)
function get_pos(selectObj)
{
    var pos = new Array();
    
    var pos_x = 0, pos_y = 0;
    
    // while에서 offsetParent를 찾아가는 방식이라
    // 다른 지정자에 인수로 넘어온 object를 넘겨줌.
    obj = selectObj;
    
    // 좌표계산
    while(obj.offsetParent)
    {
        pos_y += parseInt(obj.offsetTop);
        pos_x += parseInt(obj.offsetLeft);
        
        obj = obj.offsetParent;
    }
    pos_x += parseInt(obj.offsetLeft);
    pos_y += parseInt(obj.offsetTop);
    
    // 좌표저장
    pos.x = pos_x;
    pos.y = pos_y;
    pos.x2 = pos_x + selectObj.offsetWidth;
    pos.y2 = pos_y + selectObj.offsetHeight;
    
    return pos;
}

// IE와 Maxton에서 select elements를 숨김
// 달력 레이어의 좌표를 인수로 넘겨서 해당 좌표내에 select element가 있는지 체크하는 방식
function hide_select(x, y, x2, y2)
{
    var selects = document.getElementsByTagName('select');
    var hidden_count = 0;
    
    x = parseInt(x);
    y = parseInt(y);
    x2 = parseInt(x2);
    y2 = parseInt(y2);
    
    // X축이 겹치는지 체크하기 위한 변수
    var x_cross = false;
    // Y축이 겹치는지 체크하기 위한 변수
    var y_cross = false;
    
    // 숨겨야 할 select elements를 배열로 등록함.
    hidden_select = new Array();
    
    for(var i=0; i<selects.length; i++)
    {
        // select element의 좌표를 가져옴.
        selects[i].pos = new Array();
        selects[i].pos = get_pos(selects[i]);
        
        // X축이 달력 영역에 포함 되어 있는지 체크
        if((x <= selects[i].pos.x && x2 >= selects[i].pos.x) || (x <= selects[i].pos.x2 && x2 >= selects[i].pos.x2))
            x_cross = true;
        else
            x_cross = false;
        
        // Y축이 달력 영역에 포함되어 있는지 체크
        if((y <= selects[i].pos.y && y2 >= selects[i].pos.y) || (y <= selects[i].pos.y2 && y2 >= selects[i].pos.y2))
            y_cross = true;
        else
            y_cross = false;
        
        // X축이나 Y축이 달력 레이어와 겹쳐지면 해당 select element를 숨김
        if(x_cross == true && y_cross == true)
        {
            selects[i].style.visibility = "hidden";
            hidden_select[hidden_count++] = i;
        }
    }
}

// IE와 Maxton에서 숨겨진 select elements를 다시 표시해줌.
function show_select()
{
    var selects = document.getElementsByTagName('select');
    
    // hide_select function에서 숨긴 select elements를 다시 보여줌.
    for(var i=0; i<hidden_select.length; i++)
    {
        selects[hidden_select[i]].style.visibility = "visible";
    }
    hidden_select = null;
}

// 달력 레이어 초기화
// 달력 레이어를 만들고 클릭한 object의 위치를 계산해서 달력을 표시할 위치를 계산함
function calendar_set(e)
{
    if(!e) var e = window.event;
    var click_obj = e.target || e.srcElement;
    
    // 클릭한 object의 좌표를 가져옴
    var pos_x = 0;
    var pos_y = 0;
    var obj = click_obj;
    
    while(obj.offsetParent)
    {
        pos_y += parseInt(obj.offsetTop);
        pos_x += parseInt(obj.offsetLeft);
        
        obj = obj.offsetParent;
    }
    pos_x += parseInt(obj.offsetLeft);
    pos_y += parseInt(obj.offsetTop);
    
    pos_y += click_obj.offsetHeight;
    
    // 기존에 만든 달력 레이어가 있으면 재사용(좌표는 다시 계산함)하고 없으면 생성
    calendar_div = document.getElementById('calendar_div');
    
    if(!calendar_div)
    {
        calendar_div = document.createElement("DIV");
        document.body.appendChild(calendar_div);
    }
    calendar_div.id = "calendar_div";
    calendar_div.style.cssText = "width:160px; background-color:#ffffff; border:3px; border-style:double; border-color:#c2c2c2;";
    calendar_div.style.position = "absolute";
    calendar_div.style.top = pos_y + 'px';
    calendar_div.style.left = pos_x + 'px';
    
    calendar_div.style.visibility = "visible";
    
    // mouseover 상태에서는 창닫기 타이머를 제거함.
    calendar_div.onmouseover = function(e) {
        if(calendar_tt)
            window.clearTimeout(calendar_tt);
    }
    
    // mouseout이 되면 창닫기 타이머를 설정함
    // 설정된 시간 후에 창이 닫힘
    calendar_div.onmouseout = function() {
        if(calendar_tt)
            window.clearTimeout(calendar_tt);
        calendar_tt = window.setTimeout("calendar_hide()", 300);
    }
    
    //calendar_div.focus();
    
    // 더블클릭해도 창이 닫히도록..
    //calendar_div.ondblclick = calendar_close;
}

// 달력 레이어를 닫음
function calendar_close()
{
    document.getElementById('calendar_div').style.visibility = "hidden";
    document.getElementById('calendar_months').style.visibility = "hidden";
    document.getElementById('calendar_years').style.visibility = "hidden";
    
    if(hidden_select)
        show_select();
    
    //2010-04-29 양민 추가
    //달력을 닫으면 달력 상위개체 위치 이동
    if( document.getElementById("calendar_div_wrapper") ){
			
			document.getElementById("calendar_div_wrapper").style.cssText = "position:absolute; top:-5000px; left:-5000px;";
			
    }
    
    return false;
}

function calendar_years_change(calendar_y, calendar_m)
{
    var calendar_years = document.getElementById('calendar_years');
    var html = calendar_years_html(calendar_y, calendar_m);
    calendar_years.innerHTML = html;
}

// 년도 레이어
function calendar_years_html(calendar_y, calendar_m)
{
    var html = "";
    var margin_top = 0;
    var margin_left = 0;
    var prev_year, next_year;
    
    var year = Number(parseInt((Number(calendar_y) - 1)  / 10) * 10 + 1);
    // 년도선택 레이어 설정
    for(var i=0; i<10; i++)
    {
        margin_top = (i >= 4)? 2 : 0;
        margin_left = (i % 4 == 0)? 0 : 2;
        html += "<div style=\"margin-top:"+margin_top+"px; margin-left:"+margin_left+"px; float:left; width:35px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+String(year+i)+String(calendar_m)+"01')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">"+String(year+i)+"</div>";
    }
    
    prev_year = (year - i);
    next_year = (year + i);
    html += "<div style=\"margin-top:"+margin_top+"px; margin-left:"+margin_left+"px; float:left; width:35px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_years_change('"+String(prev_year)+"', '"+String(calendar_m)+"')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">이전</div>";
    html += "<div style=\"margin-top:"+margin_top+"px; margin-left:"+margin_left+"px; float:left; width:35px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_years_change('"+String(next_year)+"', '"+String(calendar_m)+"')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">다음</div>";
    
    return html;
}

// 달력 레이어에 달력을 출력함.
function calendar_draw(set_date)
{
    var days_arr = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
    
    var html = "<table border=\"0\" width=\"100%\">";
    var calendar_date, calendar_t;
    
    // 달력을 입력할 input box의 숫자만 검출한 값의 자릿수가 6자리 YYYYMM 이거나 8자리 YYYYMMDD라면 해당 년월에 맞게 달력을 표시함
    if(set_date && (set_date.length == 6 || set_date.length == 8))
    {
        calendar_date = set_date;
        var y = calendar_date.substring(0, 4);
        var m = calendar_date.substring(4, 6);
        var s_t = new Date(y, m-1, 1);
        if(s_t.getMonth()+1 != Number(m))
            calendar_t = null;
        else
            calendar_t = new Date(y, m-1, 1);
    }
    
    // 오늘 날짜를 구함. (오늘날짜는 font-weight:bold; 스타일 지정)
    var t = new Date();
    var today = t.getFullYear();
    
    if(t.getMonth()+1 < 10)
        today += '0' + String(t.getMonth()+1);
    else
        today += String(t.getMonth()+1);
    
    if(t.getDate() < 10)
        today += '0' + String(t.getDate());
    else
        today += String(t.getDate());
    
    // 달력을 입력할 input box의 값으로 기본값이 설정되지 않았다면 오늘을 기준으로 달력을 표시함
    if(!calendar_t)
    {
        var y = t.getFullYear();
        var m = t.getMonth();
        
        calendar_t = new Date(y, m, 1);
    }
    
    // 표시할 달력의 년월
    var calendar_yymm = calendar_t.getFullYear();
    calendar_yymm += (calendar_t.getMonth()+1 < 10)? String('0' + (calendar_t.getMonth() + 1)) : String(calendar_t.getMonth()+1);
    
    // 표시할 달력의 연도
    var calendar_y = Number(calendar_yymm.substring(0, 4));
    // 표시할 달력의 월
    var calendar_m = Number(calendar_yymm.substring(4, 6));
    
    // 이전달 링크 값 (◀클릭)
    var prev_m;
    if(Number(calendar_m) == 1)
    {
        prev_m = String(calendar_y - 1);
        prev_m += '12';
    }
    else
    {
        prev_m = String(calendar_y);
        prev_m += (calendar_m - 1 < 10)? '0' + (calendar_m - 1) : calendar_m - 1;
    }
    
    // 다음달 링크값 (▶클릭)
    var next_m;
    if(Number(calendar_m) == 12)
    {
        next_m = String(calendar_y + 1);
        next_m += '01';
    }
    else
    {
        next_m = String(calendar_y);
        next_m += (calendar_m + 1 < 10)? '0' + (calendar_m + 1) : calendar_m + 1;
    }
    
    // 이전 다음달 값을 계산하기 위해 달력표시 월의 값을 아래에서 스트링으로 변경
    calendar_m = (calendar_m < 10)? String('0' + calendar_m) : String(calendar_m);
    // 전년도
    var prev_y = String(calendar_y-1) + calendar_m;
    // 후년도
    var next_y = String(calendar_y+1) + calendar_m;
    
    // 년, 월, 닫기 버튼 html
    html += "<tr height=\"20\">";
    html += "<td colspan=\"6\" align=\"center\" valign=\"center;\">";
    html += "<span style=\"cursor:pointer; font-size: 12px;\" onClick=\"calendar_draw('"+prev_y+"')\">◀</span> ";
    html += "<span style=\"font-size: 12px; cursor:pointer;\" onClick=\"calendar_years_toggle()\">↕"+calendar_y+"</span> ";
    html += "<span style=\"cursor:pointer; font-size: 12px;\" onClick=\"calendar_draw('"+next_y+"')\">▶</span> ";
    html += "<span style=\"cursor:pointer; font-size: 12px;\" onClick=\"calendar_draw('"+prev_m+"')\">◀</span> ";
    html += "<span style=\"cursor:pointer; font-size: 12px;\" onClick=\"calendar_months_toggle()\">↕"+calendar_m+"</span> ";
    html += "<span style=\"cursor:pointer; font-size: 12px;\" onClick=\"calendar_draw('"+next_m+"')\">▶</span> ";
    html += "</td>";
    html += "<td align=\"center\" valign=\"center;\"><span style=\"cursor:pointer; font-size: 12px; font-weight:bold;\" onClick=\"calendar_close()\">X</span></td>";
    html += "</tr>";
    // 요일표시 html
    html += "<tr height=\"20\">";
    html += "<td style=\"background-color:#f0f0f0; text-align:center; font-weight:bold; font-size:11px;\">일</td>";
    html += "<td style=\"background-color:#f0f0f0; text-align:center; font-weight:bold; font-size:11px;\">월</td>";
    html += "<td style=\"background-color:#f0f0f0; text-align:center; font-weight:bold; font-size:11px;\">화</td>";
    html += "<td style=\"background-color:#f0f0f0; text-align:center; font-weight:bold; font-size:11px;\">수</td>";
    html += "<td style=\"background-color:#f0f0f0; text-align:center; font-weight:bold; font-size:11px;\">목</td>";
    html += "<td style=\"background-color:#f0f0f0; text-align:center; font-weight:bold; font-size:11px;\">금</td>";
    html += "<td style=\"background-color:#f0f0f0; text-align:center; font-weight:bold; font-size:11px;\">토</td>";
    html += "</tr>";
    
    // 달력 시작일의 요일을 구함
    var week = calendar_t.getDay();
    // 시작일이 일요일이 아니면 빈 TD 출력
    for(var i=0; i<week; i++)
    {
        html += "<td> </td>\n";
    }
    
    // 해당월의 마지막 날을 가져옴.
    if(String(calendar_t.getMonth()+1) == '2')
        max_days = ((( calendar_y % 4 == 0) && (calendar_y % 100 != 0)) || (calendar_y % 400 == 0))? 29 : 28;
    else
        max_days = days_arr[calendar_t.getMonth()];
    
    // 달력 출력
    var this_date = "";
    var style = "";
    for(var i=1; i<=max_days; i++)
    {
        if(week > 6)
        {
            html += "</tr>";
            week = 0;
        }
        if(week == 0)
        {
            html += "<tr height=\"20\">";
        }
        
        // 달력의 년월
        this_date = calendar_yymm;
        // 표시일
        this_date += (i <= 9)? String('0' + i) : String(i);
        
        style = "cursor:pointer; font-size:12px; text-align:center;";
        // input box의 값과 동일한 날은 underline 표시
        if(set_date == this_date)
            style += " text-decoration:underline;";
        // 오늘날짜는 진하게 표시
        if(today == this_date)
            style += " font-weight:bold;";
        // 일요일은 빨간색
        if(week == 0)
            style += " color:red;";
        // 토요일은 파란색
        if(week == 6)
            style += " color:blue;";
        html += "<td style=\""+style+"\" onClick=\"calendar_set_date('"+this_date+"');\" onMouseOver=\"this.style.backgroundColor = '#c2c2c2';\" onMouseOut=\"this.style.backgroundColor = '#ffffff';\">"+i+"</td>";
        week ++;
    }
    
    // 토요일로 끝나지 않았으면 빈 TD 출력
    if(week < 6)
    {
        for(var i=week; i<=6; i++)
        {
            html += "<td> </td>\n";
        }
    }
    html += "</tr>";
    html += "</table>";
    
    html += "<div id=\"calendar_years\" style=\"position:absolute; margin-left:3px; width:154px; visibility:hidden; background-color:#ffffff;\">";
    html += calendar_years_html(calendar_y, calendar_m);
    html += "</div>";
    
    // 월선택 레이어 설정
    html += "<div id=\"calendar_months\" style=\"position:absolute; margin-left:3px; width:154px; visibility:hidden; background-color:#ffffff;\">";
    html += "<div style=\"float:left; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"01')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">1</div>";
    html += "<div style=\"float:left; margin-left:2px; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"02')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">2</div>";
    html += "<div style=\"float:left; margin-left:2px; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"03')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">3</div>";
    html += "<div style=\"float:left; margin-left:2px; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"04')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">4</div>";
    html += "<div style=\"float:left; margin-left:2px; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"05')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">5</div>";
    html += "<div style=\"float:left; margin-left:2px; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"06')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">6</div>";
    html += "<div style=\"float:left; margin-top:1px; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"07')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">7</div>";
    html += "<div style=\"float:left; margin-left:2px; margin-top:1px; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"08')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">8</div>";
    html += "<div style=\"float:left; margin-left:2px; margin-top:1px; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"09')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">9</div>";
    html += "<div style=\"float:left; margin-left:2px; margin-top:1px; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"10')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">10</div>";
    html += "<div style=\"float:left; margin-left:2px; margin-top:1px; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"11')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">11</div>";
    html += "<div style=\"float:left; margin-left:2px; margin-top:1px; width:22px; height:20px; text-align:center; padding-top:2px; border:1px solid #c2c2c2; background-color:#e5e5e5; font-size:11px; cursor:pointer;\" onClick=\"calendar_draw('"+calendar_y+"12')\" onMouseOver=\"this.style.backgroundColor='#c2c2c2';\" onMouseOut=\"this.style.backgroundColor='#e5e5e5';\">12</div>";
    html += "</div>";
    
    // 달력 표시
    calendar_div.innerHTML = html;
    
    // IE/Maxton일때 숨겨진 select elements 표시
    if(hidden_select)
        show_select();
    
    // Crome, Firefox, Safari가 아니면 달력 영역과 겹치는 select elements 숨김
    if(navigator.userAgent.indexOf('Chrome') == -1 && navigator.userAgent.indexOf('Firefox') == -1 && navigator.userAgent.indexOf('Safari') == -1)
    {
        hide_select(parseInt(calendar_div.style.left), parseInt(calendar_div.style.top), parseInt(calendar_div.style.left) + parseInt(calendar_div.offsetWidth), parseInt(calendar_div.style.top) + parseInt(calendar_div.offsetHeight));
    }
}

// 선택한 날짜를 input box에 넣어줌.
function calendar_set_date(set_date)
{
    var week_arr_han = new Array("일", "월", "화", "수", "목", "금", "토");
    var week_arr_eng = new Array("Sun", "Mon", "Tue", "Wed", "The", "Fri", "Sat");
    
    // FMT 변경 (YYYY-MM-DD)
    if(calendar_obj)
    {
        var year = set_date.substring(0,4);
        var month = set_date.substring(4,6);
        var day = set_date.substring(6,8);
        var sel_date = new Date(year, month - 1, day);
        var week = sel_date.getDay();
        
        var calendar_value = calendar_fmt;
        calendar_value = calendar_value.replace(/yyyy/i, year);
        calendar_value = calendar_value.replace(/mm/i, month);
        calendar_value = calendar_value.replace(/dd/i, day);
        calendar_value = calendar_value.replace(/wh/i, week_arr_han[week]);
        calendar_value = calendar_value.replace(/we/i, week_arr_eng[week]);
        
        calendar_obj.value = calendar_value;
    }
    calendar_close();
    
    // input object에 날짜를 셋팅하고 추가적으로 작업해야할 경우가 있어서
    // document에 calendar_set_date_after function이 있으면 실행하게 함.
    // calendar_set_date_after() 예제
    // if(document.getElementById('sdate').value < '2009-09-14')
    // {
    //     alert('9월 14일 보다 이전을 선택할 수 없습니다');
    // }
    if(typeof calendar_set_date_after == 'function')
    {
        calendar_set_date_after();
    }
}

// 달력을 숨김
function calendar_hide()
{
    if(calendar_tt)
        window.clearTimeout(calendar_tt);
    calendar_close();
}

// 300ms 후에 달력을 숨김
// mouseout때 바로 닫히지 않고 약간의 텀을 두어 다시 마우스가 갔을때 달력 레이어를 유지하기 위함
function calendar_afterHide()
{
    if(calendar_tt)
        window.clearTimeout(calendar_tt);
    calendar_tt = window.setTimeout("calendar_hide()", 300);
}

// 달력 숨김 타이머를 삭제함.
function calendar_clearT()
{
    if(calendar_tt)
        window.clearTimeout(calendar_tt);

}

// 년도 클릭시 월선택 레이어를 표시/감춤
// on -> off
// off -> on
function calendar_years_toggle()
{
    var calendar_div = document.getElementById('calendar_div');
    var calendar_years = document.getElementById('calendar_years');
    var calendar_months = document.getElementById('calendar_months');
    
    calendar_months.style.visibility = "hidden";
    
    // 달력의 년,월,닫기 부분은 표시되도록 상단에서 20px 내려서 표시함.
    var top = parseInt(calendar_div.style.top) + 20;
    var left = parseInt(calendar_div.style.left);
    
    // position:absolute; 이지만 달력 레이어의 상대성 절대좌표로 인식함.
    calendar_years.style.top = '20px';
    calendar_years.style.left = '0px';
    
    // 월선택 레이어 토글
    if(calendar_years.style.visibility == "hidden")
        calendar_years.style.visibility = "visible";
    else
        calendar_years.style.visibility = "hidden";
}

// 월 클릭시 년도선택 레이어를 표시/감춤
// on -> off
// off -> on
function calendar_months_toggle()
{
    var calendar_div = document.getElementById('calendar_div');
    var calendar_months = document.getElementById('calendar_months');
    var calendar_years = document.getElementById('calendar_years');
    
    calendar_years.style.visibility = "hidden";
    
    // 달력의 년,월,닫기 부분은 표시되도록 상단에서 20px 내려서 표시함.
    var top = parseInt(calendar_div.style.top) + 20;
    var left = parseInt(calendar_div.style.left);
    
    // position:absolute; 이지만 달력 레이어의 상대성 절대좌표로 인식함.
    calendar_months.style.top = '20px';
    calendar_months.style.left = '0px';
    
    // 월선택 레이어 토글
    if(calendar_months.style.visibility == "hidden")
        calendar_months.style.visibility = "visible";
    else
        calendar_months.style.visibility = "hidden";
}

// 달력표시 호출함수 onClick="calendar(event, 'ID')"로 호출
function calendar(e, obj_name, fmt)
{
    if(!e) var e = window.event;
    calendar_obj = document.getElementById(obj_name);
    // input object의 값에서 숫자만 추출함.
    var default_date = calendar_obj.value.replace(/[^0-9]/g, '');
    
    // YYYYMM 혹은 YYYYMMDD 형식이 아니면 무시함.
    if(default_date.length != 6 && default_date.length != 8)
        default_date = '';
    
    // onClick="calendar(event, 'ID')"의 ID Object가 없으면 달력을 표시해도 넣을곳이 없으므로 오류처리
    if(!calendar_obj)
    {
        alert(obj_name + ' object undefined');
        return;
    }
    
    if(fmt)
        calendar_fmt = fmt;
    else
        calendar_fmt = "YYYY-MM-DD";
    
    // 달력 레이어 초기화
    calendar_set(e);
    // 달력 표시
    calendar_draw(default_date);
}

//2010-04-29 양민 추가
//달력의 위치를 조절해준다.
//type => 'U':개체의 위로 이동, 'D':개체의 아래로 이동
function pos_calendar( e, obj_name, fmt, type ){
		
		var calendar_div_wrapper = document.getElementById( "calendar_div_wrapper" );		
		if( !calendar_div_wrapper ){
			
			var calendar_div_wrapper_obj = document.createElement( "div" );
			calendar_div_wrapper_obj.id = "calendar_div_wrapper";
			
			var calendar_div_obj = document.createElement( "div" );
			calendar_div_obj.id = "calendar_div";
			
			calendar_div_wrapper_obj.appendChild( calendar_div_obj );
			document.body.appendChild( calendar_div_wrapper_obj );
			
		}
		
		document.getElementById("calendar_div_wrapper").style.cssText = " position:absolute; top:-5000px; left:-5000px";
				
		calendar( e, obj_name, fmt );
		
		document.getElementById("calendar_div").style.position = "relative";		
		document.getElementById("calendar_div").style.top = "0px";
		document.getElementById("calendar_div").style.left = "0px";
		
		var pos_y, pos_x, obj;
		pos_y = 0;
		pos_x = 0;
		
		obj = $id( obj_name );
				
		while( obj.offsetParent ) {
			
			pos_y += parseInt(obj.offsetTop);
      pos_x += parseInt(obj.offsetLeft);
      obj = obj.offsetParent;
      
    }
    
    pos_x += parseInt( obj.offsetLeft );
    pos_y += parseInt(obj.offsetTop);
    
    var c_height = parseInt( document.getElementById("calendar_div").offsetHeight );
    var c_width = parseInt( document.getElementById("calendar_div").offsetWidth );
    
    if( type == "U" ){
							
			document.getElementById("calendar_div_wrapper").style.top = (pos_y - c_height) + "px";
			document.getElementById("calendar_div_wrapper").style.left = pos_x + "px";
			
		}else if( type == "D" ){
			
			var obj_height = parseInt( $id( obj_name ).offsetHeight );
			
			document.getElementById("calendar_div_wrapper").style.top = (pos_y + obj_height ) + "px";
			document.getElementById("calendar_div_wrapper").style.left = pos_x + "px";
			
		}else{
			
			alert('타입을 정확히 입력해주세요.');
			
		}
		
	}