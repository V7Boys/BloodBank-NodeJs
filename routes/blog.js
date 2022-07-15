const express = require('express')
const path = require("path")
const { domainToUnicode } = require('url')
const blogs = require('../data/bloggs.js')
const db = require('../db') //connect to mysql db (db.js) file


const router = express.Router()


router.get('/', (req, res) => {
    // res.sendFile(path.join(__dirname, '../templates/index.html'));
    res.render('home')
})
router.get('/blog', (req, res) => {
    // blogs.forEach(element => {
    //     console.log(element.title);
    // });
    // res.sendFile(path.join(__dirname, '../templates/blogHome.html'))
    res.render('blogHome', {
        bloggs: blogs
    });
})
router.get('/blogpage/:slug', (req, res) => {
    const Myblog = blogs.filter(element => {
        return element.slug == req.params.slug
    });
    // console.log(Myblog)
    // res.sendFile(path.join(__dirname, '../templates/blogpage.html'))
    // res.send("Blogpage");
    res.render('blogpage', {
        title: Myblog[0].title,
        content: Myblog[0].content
    });

})
router.post('/donate', (req, res) => {
    console.log(req.body);
    let data = req.body;
    let sql = `INSERT INTO Donation SET ?`;
    db.query(sql, data, (err, result) => {
        if (err) {
            console.log('Error', err)
        }else{
            res.render("success", {
                success: true,
                data: data
            });
        }
    })
})
router.get('/donateUs', (req, res) => { //form store to db
    res.render('donate');
})
router.get('/bloodavailable', (req, res) => { // fetch data (place,availabilty) from db
    let sql = `SELECT * FROM Hospital`;
    db.query(sql, (err, result) => {
        if (err) {
            console.log('Error =>', err);
        } 
        else {
            res.render('bloodavailable', {
                data: result
            });
        }
    })

})


router.get('/campschedule', (req, res) => { //fetch data and provide form
    let sql = `SELECT * FROM campschedule`;
    db.query(sql, (err, result) => {
        if (err) {
            console.log('Error');
        } else {
            res.render('campschedule', {
                camp: result
            });
        }
    })
})





router.get('/Enroll', (req, res) => {
    res.render('Enroll');
})
router.get('/Enroll/:date/:Address/:campname', (req, res) => { //form from campschedule store @ db
    res.render('Enroll', {
        date: req.params.date,
        place: req.params.Address,
        campname: req.params.campname
    });
})
router.post('/Enroll', (req, res) => {
    console.log(req.body);
    let data = req.body;
    let sql = `INSERT INTO campEnroll SET ?`;
    db.query(sql, data, (err, result) => {
        if (err) {
            console.log('Error', err)
        } else {
            res.render("success", {
                success: false,
                data: data
            });
        }
    })
    res.render("success", {
        success: false,
        data: data
    });

})



router.get('/emergency', (req, res) => { //fetch data (place,email,phone,availability)
    let sql = `SELECT * FROM BloodBanks`
    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.render('emergency');
        }
    })
})
router.post('/emergency', (req, res) => {
    console.log(req.body);
    let data = req.body;
    let sql = `SELECT * FROM BloodBanks WHERE state = "${data.state}" or district = "${data.district}"`;
    db.query(sql, (err, result) => {
        if (err) {
            console.log('Error', err);
        } else {
            console.log(result)
            res.render('emergency', {
                Data: result
            })
        }
    })
})

//404 page
router.get('*', (req, res) => {
    res.status(404).render('404');
});



module.exports = router