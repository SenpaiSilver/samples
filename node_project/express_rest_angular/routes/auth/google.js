var express = require('express');
var jsonfile = require('jsonfile');
var google = require('../../config/auth.json').googleAuth || null;
var passport = require('passport');
var	GoogleStrategy = require('passport-google-oauth').OAuth2Strategy;
var router = express.Router();

if (google != null) {
	passport.serializeUser(function(user, done) {
		done(null, user);
	});

	passport.deserializeUser(function(obj, done) {
		done(null, obj);
	});
		
	passport.use(new GoogleStrategy({
		"clientID": google.clientID,
		"clientSecret": google.clientSecret,
		"callbackURL": google.callbackURL,
		"passReqToCallback": true
	},
		function(request, accessToken, refreshToken, profile, done) {
			console.log("Google ID: " + profile.id);
			console.log("Access Token: " + accessToken);
			return (done(null, profile));
		}
	));

	router.get('/google/', passport.authenticate('google', {scope: [
		'https://www.googleapis.com/auth/plus.login'
	]}));

	router.get('/google/callback', passport.authenticate('google', {successRedirect: '/', failureRedirect: '/login.html'}));

	module.exports = {router: router};
}