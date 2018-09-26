$(function () {
    setInterval(function () {
        var a = new Date().getTime() / 1e3,
            b = new Date,
            c = b.getHours(),
            d = b.getMinutes(),
            e = b.getSeconds(),
            f = b.getMilliseconds(),
            g = f.toString().slice(0, -2),
            h = b.getDay(),
            i = 12 <= c ? 'PM' : 'AM',
            j = b.getMonth(),
            k = b.getDate(),
            l = b.getFullYear();
        $('#ampm').text(i), 12 < c && (c %= 12), 0 == c && (c = 12), 9 >= e && (e = '0' + e), 9 >= d && (d = '0' + d), $('#hours').text(c), $('#min').text(':' + d + ':'), $('#sec').text(e), $('.days:nth-child(' + (h + 1) + ')').addClass('active'), $('#month').text(['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][j]), $('#date').text(k), $('#year').text(l)
    }, 100)
});