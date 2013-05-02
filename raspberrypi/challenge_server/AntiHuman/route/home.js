module.exports = {
	index : {
        GET: _indexGET,
        POST: _indexPOST
    }
};

var Timeout = 500;

function _indexGET(req,res) {
    if(!req.session)
        req.session = null;
    var date = new Date();
    req.session.val1 = genRandNum();
    req.session.val2 = genRandNum();
    req.session.time = date.getTime();

    res.render("index", {
        val1:req.session.val1,
        val2:req.session.val2,
        timeout:Timeout
    });
}

function _indexPOST(req,res) {
    var now = new Date().getTime();

    if(!req.session)
        res.render("human");
    else if(now > (req.session.time+Timeout))
        res.render("human");
    else if(req.body.val3 == (req.session.val1 + req.session.val2))
        res.render("key", {key:"jHBhbfoY1UEHQuRMwzt7Yr8xkCiCvfbS"});
    else
        res.render("human");
}

function genRandNum() {
    return Math.floor(Math.random() * 90000) + 10000
}