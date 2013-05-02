module.exports = {
	index : {
        GET: _indexGET,
        POST: _indexPOST
    }
};

var Timeout = 500;

function _indexGET(req,res) {

    function genBigRandNum() {

        function genRandNum() {
            return Math.floor(Math.random() * 900000000000) + 100000000000;
        }

        var top = genRandNum();
        var bot = genRandNum();
        var ret = top.toString() + bot.toString();
        return ret;
    }

    if(!req.session)
        req.session = null;
    var date = new Date();
    req.session.val1 = genBigRandNum();
    req.session.val2 = genBigRandNum();
    req.session.time = date.getTime();

    res.render("index", {
        val1:req.session.val1,
        val2:req.session.val2,
        timeout:Timeout
    });
}

function _indexPOST(req,res) {
    var now = new Date().getTime();

    function checkValue(val1, val2) {

        var top1 = parseInt(val1.substring(0,12),10);
        var bot1 = parseInt(val1.substring(12),10);
        var top2 = parseInt(val2.substring(0,12),10);
        var bot2 = parseInt(val2.substring(12),10);

        var top3 = top1 + top2;
        var bot3 = bot1 + bot2;

        if(bot3.toString().length > bot1.toString().length) {
            bot3 = bot3.toString().substring(1);
            top3+=1;
        }

        return top3.toString() + bot3.toString();
    }

    if(!req.session)
        res.render("human");
    else if(now > (req.session.time+Timeout))
        res.render("human");
    else if(checkValue(req.session.val1,req.session.val2) == req.body.val3)
        res.render("key", {key:"e76VB81W2IT6xA696CDH54WqHPuVxqvn"});
    else
        res.render("human");
}
