/* create tables */
CREATE TABLE test_persons (test_person_id INT AUTO_INCREMENT PRIMARY KEY,
                           user_id VARCHAR(36),
                           completion_code VARCHAR(36),
                           os VARCHAR(100),
                           browser VARCHAR(100),
                           version VARCHAR(100),
                           is_mobile BOOLEAN,
                           finished_step1 BOOLEAN,
                           finished_step2 BOOLEAN,
                           finished_step3 BOOLEAN,
                           finished_step4 BOOLEAN,
                           finished_step5 BOOLEAN,
                           finished_questionnaire BOOLEAN,
                           experiment_start_time VARCHAR(15),
                           experiment_end_time VARCHAR(15),
                           step1_start_time VARCHAR(15),
                           step1_end_time VARCHAR(15),
                           step2_start_time VARCHAR(15),
                           step2_end_time VARCHAR(15),
                           step3_start_time VARCHAR(15),
                           step3_end_time VARCHAR(15),
                           step4_start_time VARCHAR(15),
                           step4_end_time VARCHAR(15),
                           step5_start_time VARCHAR(15),
                           step5_end_time VARCHAR(15),
                           questionnaire_start_time VARCHAR(15),
                           questionnaire_end_time VARCHAR(15),
                           feedback VARCHAR(500));
CREATE TABLE test_domains (test_domain_id INT AUTO_INCREMENT PRIMARY KEY,
                           domain VARCHAR(250),
                           classification BOOLEAN);
CREATE TABLE reference_domains (reference_domain_id INT AUTO_INCREMENT PRIMARY KEY,
                                domain VARCHAR(250));
CREATE TABLE created_domains (created_domain_id INT AUTO_INCREMENT PRIMARY KEY,
                              reference_domain_id INT,
                              FOREIGN KEY(reference_domain_id) REFERENCES reference_domains(reference_domain_id),
                              domain VARCHAR(250),
                              number_of_ratings INT);
CREATE TABLE step1 (step1_id INT AUTO_INCREMENT PRIMARY KEY,
                    test_person_id INT,
                    FOREIGN KEY(test_person_id) REFERENCES test_persons(test_person_id),
                    created_domain_id INT,
                    FOREIGN KEY(created_domain_id) REFERENCES created_domains(created_domain_id),
                    elapsed_time INT,
                    domain_position INT);
CREATE TABLE step2 (step2_id INT AUTO_INCREMENT PRIMARY KEY,
                    test_person_id INT,
                    FOREIGN KEY(test_person_id) REFERENCES test_persons(test_person_id),
                    reference_domain_id INT,
                    FOREIGN KEY(reference_domain_id) REFERENCES reference_domains(reference_domain_id),
                    squatting_technique VARCHAR(100),
                    squatting_technique_infos VARCHAR(100),
                    domain VARCHAR(250),
                    elapsed_time INT,
                    domain_position INT,
                    squatting_techniques_order VARCHAR(80));
CREATE TABLE step3_step1_created_domains (step3_step1_created_domains_id INT AUTO_INCREMENT PRIMARY KEY,
                                          test_person_id INT,
                                          FOREIGN KEY(test_person_id) REFERENCES test_persons(test_person_id),
                                          created_domain_id INT,
                                          FOREIGN KEY(created_domain_id) REFERENCES created_domains(created_domain_id),
                                          elapsed_time INT,
                                          rating INT,
                                          domain_position INT);
CREATE TABLE step3_ref_domains (step3_ref_domains_id INT AUTO_INCREMENT PRIMARY KEY,
                                test_person_id INT,
                                FOREIGN KEY(test_person_id) REFERENCES test_persons(test_person_id),
                                reference_domain_id INT,
                                FOREIGN KEY(reference_domain_id) REFERENCES reference_domains(reference_domain_id),
                                elapsed_time INT,
                                rating INT,
                                domain_position INT);
CREATE TABLE step3_phishing_domains (step3_phishing_domains_id INT AUTO_INCREMENT PRIMARY KEY,
                                     test_person_id INT,
                                     FOREIGN KEY(test_person_id) REFERENCES test_persons(test_person_id),
                                     test_domain_id INT,
                                     FOREIGN KEY(test_domain_id) REFERENCES test_domains(test_domain_id),
                                     elapsed_time INT,
                                     rating INT,
                                     domain_position INT);
CREATE TABLE step4 (step4_id INT AUTO_INCREMENT PRIMARY KEY,
                    test_person_id INT,
                    FOREIGN KEY(test_person_id) REFERENCES test_persons(test_person_id),
                    domain VARCHAR(250),
                    elapsed_time INT,
                    domain_position INT);
CREATE TABLE step5_domains (step5_domain_id INT AUTO_INCREMENT PRIMARY KEY,
                            test_person_id INT,
                            FOREIGN KEY(test_person_id) REFERENCES test_persons(test_person_id),    
                            selected VARCHAR(5),
                            domain_position INT,
                            counter INT);
CREATE TABLE step5_step1_created_domains (step5_step1_created_domains_id INT AUTO_INCREMENT PRIMARY KEY,
                                          step5_domain_id INT,
                                          FOREIGN KEY(step5_domain_id) REFERENCES step5_domains(step5_domain_id),
                                          created_domain_id INT,
                                          FOREIGN KEY(created_domain_id) REFERENCES created_domains(created_domain_id));
CREATE TABLE step5_legitimate_domains (step5_legitimate_domains_id INT AUTO_INCREMENT PRIMARY KEY,
                                       step5_domain_id INT,
                                       FOREIGN KEY(step5_domain_id) REFERENCES step5_domains(step5_domain_id),
                                       test_domain_id INT,
                                       FOREIGN KEY(test_domain_id) REFERENCES test_domains(test_domain_id));
CREATE TABLE step5_phishing_domains (step5_phishing_domains_id INT AUTO_INCREMENT PRIMARY KEY,
                                     step5_domain_id INT,
                                     FOREIGN KEY(step5_domain_id) REFERENCES step5_domains(step5_domain_id),
                                     test_domain_id INT,
                                     FOREIGN KEY(test_domain_id) REFERENCES test_domains(test_domain_id));
CREATE TABLE step5 (step5_id INT AUTO_INCREMENT PRIMARY KEY,
                    test_person_id INT,
                    FOREIGN KEY(test_person_id) REFERENCES test_persons(test_person_id),
                    domain1 INT,
                    FOREIGN KEY(domain1) REFERENCES step5_domains(step5_domain_id),
                    domain2 INT,
                    FOREIGN KEY(domain2) REFERENCES step5_domains(step5_domain_id),
                    domain3 INT,
                    FOREIGN KEY(domain3) REFERENCES step5_domains(step5_domain_id),
                    domain4 INT,
                    FOREIGN KEY(domain4) REFERENCES step5_domains(step5_domain_id),
                    domain5 INT,
                    FOREIGN KEY(domain5) REFERENCES step5_domains(step5_domain_id),
                    domain6 INT,
                    FOREIGN KEY(domain6) REFERENCES step5_domains(step5_domain_id),
                    domain7 INT,
                    FOREIGN KEY(domain7) REFERENCES step5_domains(step5_domain_id),
                    domain8 INT,
                    FOREIGN KEY(domain8) REFERENCES step5_domains(step5_domain_id),
                    domain9 INT,
                    FOREIGN KEY(domain9) REFERENCES step5_domains(step5_domain_id),
                    domain10 INT,
                    FOREIGN KEY(domain10) REFERENCES step5_domains(step5_domain_id),
                    elapsed_time INT,
                    counter INT);
CREATE TABLE countries (country_id INT AUTO_INCREMENT PRIMARY KEY,
                        country VARCHAR(250));
CREATE TABLE questionnaire (questionnaire_id INT AUTO_INCREMENT PRIMARY KEY,
                            test_person_id INT,
                            FOREIGN KEY(test_person_id) REFERENCES test_persons(test_person_id),
                            age VARCHAR(10),
                            gender_current VARCHAR(11),
                            education VARCHAR(16),
                            origin_id INT,
                            FOREIGN KEY(origin_id) REFERENCES countries(country_id),
                            f1 VARCHAR(9),
                            f2 VARCHAR(9),
                            f3 VARCHAR(9),
                            f4 VARCHAR(9),
                            f5 VARCHAR(9),
                            f6 VARCHAR(9),
                            f7 VARCHAR(9),
                            f8 VARCHAR(9),
                            f9 VARCHAR(9),
                            f10 VARCHAR(9),
                            f11 VARCHAR(9),
                            f12 VARCHAR(9),
                            f13 VARCHAR(9),
                            f14 VARCHAR(9),
                            f15 VARCHAR(9),
                            f16 VARCHAR(9),
                            attention_test1 VARCHAR(9),
                            attention_test2 VARCHAR(9));

/* add test domains */
INSERT INTO test_domains (domain, classification)
VALUES
/* malicious domains => 225 domains */
/* microsoft */
("microsoftupgrade-net.ml", true),
("microsoft-openings-security-alert-errorpage111.online", true),
("match.microsoftexceldoc.com", true),
("microsoft-outlook.355service.com", true),
("microsoft-outlook.037fx.com", true),
("outlook-microsoft.xv4567.net", true),
("microsoftdrop.com", true),
("login-microsoft-us.com", true),
("login.microsoftonline.the-angel-network.com", true),
("login.microsoftonline.com.l--6.us", true),
("micrsoftomline.com", true),
/* netflix */
("mail.netflix-pym.com", true),
("netflix-pending.com", true),
("wwwnetflixmobile.com", true),
("accnetflixdate.com", true),
("netflix-memservice.com", true),
("netflixmaster.com", true),
("premieraccount-netflix.com", true),
("premium.billing.netflix.premier.login.premieraccount-netflix.com", true),
("verify.netflix-alerts.com", true),
("login-account-netfliix.com", true),
("netflixptt.com", true),
("netflixonlineverification.com", true),
/* paypal */
("paypal-resolve-now.sign-in-customer.info", true),
("paypal.com.information.uaecorp.gq", true),
("mail.paypal-account-limitied.ml", true),
("paypal.verif-serv.info", true),
("security-paypal.com", true),
("paypal.support.webmpps-service.tk", true),
("suport-secur.com-paypall.ga", true),
("account-secure-paypql.ga", true),
("paypal-myaccounts.com", true),
("paypal.com-webapps.safeauth-key.me", true),
("secure.paypal.com.serviceaccount-loginpage.privycy.info", true),
("update-info-data-paypal.usa.cc", true),
/* bank of america */
("onlinebanking-bankofamerica-com.tk", true),
("bankofamerica-com.ml", true),
("secure-bankofamerica.com", true),
("enbankofamerica.ngjm.info", true),
("www.secure.bankofamerica.spirotechkk.ml", true),
("bankofamerica-online-reconnect.ga", true),
("bankofamericar.miwomensconference.org", true),
("bankofamerica.com.signinv2.es", true),
("bankofamerica.online.dhadetailing.com", true),
("login.bankofamerica-service.com", true),
("email-bank0famerica.ga", true),
/* chase */
("jpmorganchaase.mzf.cz", true),
("jpmorganchaseorganizer.com", true),
("chase.com.checkingaccounts-creditcards.online.confirm.id-find.support-user-mail.data.unitam.edu.mx", true),
("chaseonline.chase.com.billsyst-paypal.com", true),
("myjpmorganchaseupdate.hpage.co.in", true),
("chasecomcredit-cards-rtbl-account-access-rtbl.000webhostapp.com", true),
("jpmorganchaseonlinebankingverification.typeform.com", true),
("chasebank.scotibanks.com", true),
("chasesbanks.com", true),
("jpmorganchaseauthe.ghaffarigroup.com", true),
/* dhl */
("www.dhl.info.pl", true),
("dhltrackid.com", true),
("dhl-tracking.bkth-bkk.com", true),
("dhlexpress.cf", true),
("dhlexp.cf", true),
("dhlexpress.gq", true),
("dhl.ogistics-files.us", true),
("shipment-dhl-notification.000webhostapp.com", true),
("delivery-shipment-dhl.000webhostapp.com", true),
("dhlexpress.delivery.recordcorrection.net", true),
("dhlship.tk", true),
("dhl.deliveryinprogress.com", true),
("dhlservices.deliveryinprogress.com", true),
/* facebook */
("facebookbeta.ga", true),
("vrf-facebook-account-com.cf", true),
("www.facebook.ellom.in", true),
("faceboksecurty.com", true),
("facebooke.info", true),
("facebookbr.net", true),
("facebook1.co", true),
("facebook.lbyts.com", true),
("facebook-login.mywire.org", true),
("www.facebook.getoffer.info", true),
("login-facebook.hkdaily02.one", true),
("www.facebook.com.bckiwanis.org", true),
/* docusign */
("docusign-docs.tk", true),
("docusignfile.com", true),
("docusignn.com", true),
("docusign.serviceim.com", true),
("document-share-docusign-mess.classicalschoolathome.com", true),
("docusignfolder.com", true),
("docusign.signedcopy.online", true),
("secureserver.docusign.completeddocs.com", true),
("in-docusigns-files.com", true),
("secureserver.docusign.confidentialfolder.com", true),
("login.docusign.securedfolder.net", true),
("login.docusign.encryptfolder.net", true),
("www.docusigner.org", true),
/* linkedin */
("linkedin.n-koei-jp.com", true),
("linkedinverification.eu", true),
("www.login-linkedin.com", true),
("linkediin.internetdatingstories.com", true),
("linkedinn2.weebly.com", true),
("linkedinvalidation.eu", true),
("linkedin.com.marinyaki.com.au", true),
("linkedn.altervista.org", true),
("www.update-linkedin.com", true),
("accounts-linkedin.gq", true),
("linkedinsecurity.athenafinance.com.au", true),
("refresh.linkedin.com.cgibin3302asuas.login-submit.cgibinsq435.memberrefresh301231.delcos.org", true),
/* dropbox */
("dropbox.reddirtbbq.com", true),
("www.securedropbox.file.godaddi.win", true),
("dropbox.verification-wellsfargo.com", true),
("dl-dropbox.github.io", true),
("www.dropbox.com.secure.index-upload.files8h2s.com.yashmatiitc.org", true),
("www.dropbox-en.ml", true),
("w3dropbox.com", true),
("dropbox.com.businesss.upload-documents78shh.com.steelmarineservice.com", true),
("dropbox.org.mx", true),
("webdropbox.net", true),
("dropbox-documents.us", true),
/* wells fargo */
("myprofile2001.id3-440-wellsfargo.com", true),
("servicewellsfargocom.ga", true),
("wellsfargo.com.aandagruoupbd.net", true),
("my.profile49394-wellsfargo.com", true),
("wellsfargo.pekur.sk", true),
("myprofile4001.9432948-wellsfargo.com", true),
("welsfargo-fund.com", true),
("updatebankingwells.acc-wellsfargo-info.xyz", true),
("1https.connect.secure.wellsfargo.com.tropfsteinhoehle.com", true),
("wellsfargo.users.personalsecurity.findmybooks.in", true),
("vnotice1001.wellsfargo3032030102.com", true),
("disabled.3692832935.cipd.wellsfarg0.one-it.net", true),
/* orange */
("www.orange.infoclientrsst.com", true),
("www.orange.fr.facturation74589.site", true),
("id.orange.fr.authuser2.bin.waltermarquez.com.ve", true),
("www.orange.ne", true),
("id.orange.fr.piggyhawk.net", true),
("id.orange.service-orange-check.com", true),
("idauthweb.orange.fr.bodrumsatilikemlak.net", true),
("remboursement.orange.fr.indulgencehbs.com.au", true),
/* amazon */
("secure.amazon.com.achiverscs.com", true),
("amazonorigin.com", true),
("amazon.com.a4b.it", true),
("secure.amazon.com.best-effectresources.com", true),
("center-amazon-services.com", true),
("www.amazon-bestsellers.net", true),
("amazon-co-uk-ssl-mail.co.uk", true),
("amazon.update.com.sonsofsamhorn.com", true),
("www.amazon.com.paulowanderley.com.br", true),
("amazon.com.update.nochelatinaclub.com", true),
("www.amazonecard.com", true),
("amazon-ssl-login.co.uk", true),
("amazon.com-welcome-amazon-login.update-cgi954745-002.tkladders.ie", true),
("amazon.com-log-service.himanshusabharwal.com", true),
/* apple */
("itunes.apple.verification.compte.id.admiral-placements.co.za", true),
("id-apple.store.update.cmd-pool.data.bullamakanka.com.au", true),
("apple-id.com.update.slavna-plus.com.ua", true),
("itunes-appleid.com", true),
("verifcation.itunees.applee.uk.id.login.divulga-se.info", true),
("applesupdate.com", true),
("secure.store.apple.com.next-sign-up.com", true),
("ssl.allegro.fi-apple.com", true),
("www.userid-apple.net", true),
("appleid.apple.com.idapple-dk.tk", true),
("id.apple.moodylake.com", true),
("apple-updates.cloudapp.net", true),
/* yahoo */
("yahoo.update.azadari.co.uk", true),
("mg15-yahoo.com", true),
("account-yahoo.mooo.com", true),
("www.yahoo.accountservices.ververoom.com", true),
("www.access.logon.online.yahoo.ververoom.com", true),
("yahooppn.tk", true),
("www.deletion.account.yahoo.ververoom.com", true),
("yahooupdatingprogram.cnc-cs.com", true),
("login-yahoo-com.wisci.us", true),
("yahoo.com.verifyuser.account.catpellet.com.tr", true),
("login.mail.yahoo.verify2.enerqy.co.uk", true),
("yahoo-mailverification.com", true),
/* xfinity */
("xfinity.comcast.net.gupzi.com", true),
("xfinity-redirect.hj.cx", true),
("account-xfinity-update.hmm-wood.com", true),
("xfinity-update.jordanstyles.gq", true),
("login.comcast.net-xfinity-securelogin-validateaccount.x009.net", true),
("connect.xfinity.com.free-flash-games-online.com", true),
("upgradexfinitynow.com", true),
("xfinity-signup.knottsapp.com", true),
("www.xfinity-serviceupdates.com", true),
("login.xfinity.com.hastyfreights.com", true),
("xfinitysignin.from-va.com", true),
/* AT&T */
("secureonline.att.homephoneandinternet.actlap.org", true),
("login.att.net.issue-authentication.ml", true),
("admin.att.mobiliariostore.com", true),
("www.online.att.net.homephone.uverse.admasonry.ca", true),
/* google */
("ssl-google-com-secured.spiritualscholars.com", true),
("google.drive.chileboats.cl", true),
("drive.google.cnc-style.de", true),
("googlefile.comli.com", true),
("googleuploader.com", true),
("ssl-google-com-seured.strengthgrind.com", true),
("drive.google.com.continue.mrstu.net", true),
("drive.google.com.yaho.ml", true),
("google.drive.amazonascde.com", true),
("drive.google.com.continue.cqr4.biz", true),
("ssl.gstatic.google.com.ventura.co.zm", true),
("login.drive.google.avdihd.tk", true),
/* americanexpress */
("online.americaexpress.moracom.co.uk", true),
("www.americanexpress-sx89gox03gqn.com", true),
("online-americaexpress.depilab.cl", true),
("srv5-americanexpress.com", true),
("americanexpress-tvbg.com", true),
("global-americanexpress.com", true),
("americanexpressbeta.com", true),
("americanexpress-secure.com", true),
("americanexpressverify.com", true),
("welcomeamericanexpress.com", true),
("americanexpress-fraud.com", true),
("verifybyamericanexpress.com", true),
/* instagram */
("instagram.com-accounts-login.frozenfoodsehat.com", true),
("instagram.helpverifycation.com", true),
("instagramn.co.nf", true),
("www.instagramn.co.nf", true),
("instagram.rezaee.ir", true),
("insttagram.hol.es", true),
("instgram.besaba.com", true),
("instagram-verif.cf", true),
("www-instagram.com-account-login.googlequest.gq", true),
("www.instagram-verified.com", true),
("instagram.com.userig.gq", true),
/* benign domains => 78 domains */
/* microsoft */
("microsoft.com", false),
("onedrive.live.com", false),
("office.live.com", false),
("support.microsoft.com", false),
("products.office.com", false),
("windowscentral.com", false),
/* netflix */
("netflix.com", false),
("help.netflix.com", false),
("dvd.netflix.com", false),
("media.netflix.com", false),
/* paypal */
("paypal.com", false),
("paypal-prepaid.com", false),
("paypal.me", false),
("paypal-community.com", false),
/* bank of america */
("bankofamerica.com", false),
("secure.bankofamerica.com", false),
("myhealth.bankofamerica.com", false),
("prepaid.bankofamerica.com", false),
/* chase */
("chase.com", false),
("jpmorganchase.com", false),
("access.jpmorgan.com", false),
("paymentnet.jpmorgan.com", false),
/* dhl */
("dhl.com", false),
("sso.dhl-usa.com", false),
("mydhl.dhl.com", false),
("logistics.dhl", false),
("mydhl.express.dhl", false),
/* facebook */
("facebook.com", false),
("mtouch.facebook.com", false),
("newsroom.fb.com", false),
/* docusign */
("docusign.com", false),
("account.docusign.com", false),
("support.docusign.com", false),
("docusign.net", false),
("docusign.utexas.edu", false),
/* linkedin */
("linkedin.com", false),
("mobile.linkedin.com", false),
("business.linkedin.com", false),
/* dropbox */
("dropbox.com", false),
("help.dropbox.com", false),
("dropboxforum.com", false),
/* wells fargo */
("wellsfargo.com", false),
("connect.secure.wellsfargo.com", false),
("wellsfargofinancialcards.com", false),
("ebpp3.wellsfargo.com", false),
/* orange */
("orange.com", false),
("topup.orange.com", false),
("boutique.orange.fr", false),
/* amazon */
("amazon.com", false),
("account.amazon.jobs", false),
("aws.amazon.com", false),
("docs.aws.amazon.com", false),
/* apple */
("apple.com", false),
("apps.apple.com", false),
("support.apple.com", false),
("secure1.store.apple.com", false),
/* yahoo */
("yahoo.com", false),
("mail.yahoo.com", false),
("login.yahoo.com", false),
("compose.mail.yahoo.com", false),
("my.yahoo.com", false),
/* xfinity */
("xfinity.com", false),
("login.xfinity.com", false),
("customer.xfinity.com", false),
("xfinityprepaid.net", false),
/* AT&T */
("att.com", false),
("paygonline.com", false),
/* google */
("google.com", false),
("accounts.google.com", false),
("play.google.com", false),
("support.google.com", false),
/* americanexpress */
("americanexpress.com", false),
("online.americanexpress.com", false),
("global.americanexpress.com", false),
/* instagram */
("instagram.com", false),
("help.instagram.com", false),
("instagramers.com", false),
("instagram-press.com", false);

/* add reference domains */
INSERT INTO reference_domains (domain)
VALUES
("google.com"),
("facebook.com"),
("youtube.com"),
("amazon.com"),
("yahoo.com"),
("duckduckgo.com"),
("reddit.com"),
("wikipedia.org"),
("github.com"),
("ebay.com"),
("twitter.com"),
("live.com"),
("bing.com"),
("amazon.co.uk"),
("paypal.com"),
("microsoftonline.com"),
("stackoverflow.com"),
("microsoft.com"),
("bbc.co.uk"),
("ebay.co.uk"),
("pornhub.com"),
("craigslist.org"),
("linkedin.com"),
("google.co.in"),
("office.com"),
("imdb.com"),
("msn.com"),
("netflix.com"),
("xvideos.com"),
("fandom.com"),
("aliexpress.com"),
("instagram.com"),
("onlinesbi.com"),
("google.co.uk"),
("bankofamerica.com"),
("amazon.in"),
("aol.com"),
("whatsapp.com"),
("sharepoint.com"),
("nytimes.com"),
("ancestry.com"),
("twitch.tv"),
("imgur.com"),
("t.co"),
("amazon.ca"),
("cnn.com"),
("tumblr.com"),
("xhamster.com"),
("booking.com"),
("theguardian.com"),
("amazon.de"),
("bbc.com"),
("incometaxindiaefiling.gov.in"),
("roblox.com"),
("chase.com"),
("salesforce.com"),
("instructure.com"),
("xfinity.com"),
("gamepedia.com"),
("wellsfargo.com"),
("foxnews.com"),
("xnxx.com"),
("dropbox.com"),
("quora.com"),
("indeed.com"),
("ycombinator.com"),
("pinterest.com"),
("drudgereport.com"),
("thepiratebay.org"),
("myway.com"),
("citi.com"),
("adobe.com"),
("google.ca"),
("getpocket.com"),
("walmart.com"),
("force.com"),
("stackexchange.com"),
("mozilla.org"),
("pch.com"),
("wordpress.com"),
("slack.com"),
("hdfcbank.com"),
("apple.com"),
("etsy.com"),
("washingtonpost.com"),
("gitlab.com"),
("digikala.com"),
("ecosia.org"),
("steamcommunity.com"),
("yandex.ru"),
("google.co.id"),
("firefox.com"),
("chaturbate.com"),
("1337x.to"),
("detik.com"),
("nexusmods.com"),
("baidu.com"),
("atlassian.net"),
("yts.lt"),
("usaa.com");

/* Add countries for origin in questionnaire */
INSERT INTO countries (country)
VALUES
("Afghanistan"),
("Aland Islands"),
("Albania"),
("Algeria"),
("American Samoa"),
("Andorra"),
("Angola"),
("Anguilla"),
("Antarctica"),
("Antigua and Barbuda"),
("Argentina"),
("Armenia"),
("Aruba"),
("Australia"),
("Austria"),
("Azerbaijan"),
("Bahamas"),
("Bahrain"),
("Bangladesh"),
("Barbados"),
("Belarus"),
("Belgium"),
("Belize"),
("Benin"),
("Bermuda"),
("Bhutan"),
("Bolivia"),
("Bosnia and Herzegovina"),
("Botswana"),
("Bouvet Island"),
("Brazil"),
("British Indian Ocean Territory"),
("British Virgin Islands"),
("Brunei"),
("Bulgaria"),
("Burkina Faso"),
("Burundi"),
("Cambodia"),
("Cameroon"),
("Canada"),
("Cape Verde"),
("Caribbean Netherlands"),
("Cayman Islands"),
("Central African Republic"),
("Chad"),
("Chile"),
("China"),
("Christmas Island"),
("Cocos Keeling Islands"),
("Colombia"),
("Comoros"),
("Congo Brazzaville"),
("Congo Kinshasa"),
("Cook Islands"),
("Costa Rica"),
("Cote d\’Ivoire"),
("Croatia"),
("Cuba"),
("Curacao"),
("Cyprus"),
("Czechia"),
("Denmark"),
("Djibouti"),
("Dominica"),
("Dominican Republic"),
("Ecuador"),
("Egypt"),
("El Salvador"),
("Equatorial Guinea"),
("Eritrea"),
("Estonia"),
("Eswatini"),
("Ethiopia"),
("Falkland Islands"),
("Faroe Islands"),
("Fiji"),
("Finland"),
("France"),
("French Guiana"),
("French Polynesia"),
("French Southern Territories"),
("Gabon"),
("Gambia"),
("Georgia"),
("Germany"),
("Ghana"),
("Gibraltar"),
("Greece"),
("Greenland"),
("Grenada"),
("Guadeloupe"),
("Guam"),
("Guatemala"),
("Guernsey"),
("Guinea"),
("Guinea-Bissau"),
("Guyana"),
("Haiti"),
("Heard and McDonald Islands"),
("Honduras"),
("Hong Kong SAR China"),
("Hungary"),
("Iceland"),
("India"),
("Indonesia"),
("Iran"),
("Iraq"),
("Ireland"),
("Isle of Man"),
("Israel"),
("Italy"),
("Jamaica"),
("Japan"),
("Jersey"),
("Jordan"),
("Kazakhstan"),
("Kenya"),
("Kiribati"),
("Kuwait"),
("Kyrgyzstan"),
("Laos"),
("Latvia"),
("Lebanon"),
("Lesotho"),
("Liberia"),
("Libya"),
("Liechtenstein"),
("Lithuania"),
("Luxembourg"),
("Macao SAR China"),
("Madagascar"),
("Malawi"),
("Malaysia"),
("Maldives"),
("Mali"),
("Malta"),
("Marshall Islands"),
("Martinique"),
("Mauritania"),
("Mauritius"),
("Mayotte"),
("Mexico"),
("Micronesia"),
("Moldova"),
("Monaco"),
("Mongolia"),
("Montenegro"),
("Montserrat"),
("Morocco"),
("Mozambique"),
("Myanmar"),
("Namibia"),
("Nauru"),
("Nepal"),
("Netherlands"),
("New Caledonia"),
("New Zealand"),
("Nicaragua"),
("Niger"),
("Nigeria"),
("Niue"),
("Norfolk Island"),
("North Korea"),
("North Macedonia"),
("Northern Mariana Islands"),
("Norway"),
("Oman"),
("Pakistan"),
("Palau"),
("Palestinian Territories"),
("Panama"),
("Papua New Guinea"),
("Paraguay"),
("Peru"),
("Philippines"),
("Pitcairn Islands"),
("Poland"),
("Portugal"),
("Puerto Rico"),
("Qatar"),
("Reunion"),
("Romania"),
("Russia"),
("Rwanda"),
("Samoa"),
("San Marino"),
("Sao Tome and Príncipe"),
("Saudi Arabia"),
("Senegal"),
("Serbia"),
("Seychelles"),
("Sierra Leone"),
("Singapore"),
("Sint Maarten"),
("Slovakia"),
("Slovenia"),
("Solomon Islands"),
("Somalia"),
("South Africa"),
("South Georgia and South Sandwich Islands"),
("South Korea"),
("South Sudan"),
("Spain"),
("Sri Lanka"),
("St. Barthelemy"),
("St. Helena"),
("St. Kitts and Nevis"),
("St. Lucia"),
("St. Martin"),
("St. Pierre and Miquelon"),
("St. Vincent and Grenadines"),
("Sudan"),
("Suriname"),
("Svalbard and Jan Mayen"),
("Sweden"),
("Switzerland"),
("Syria"),
("Taiwan"),
("Tajikistan"),
("Tanzania"),
("Thailand"),
("Timor-Leste"),
("Togo"),
("Tokelau"),
("Tonga"),
("Trinidad and Tobago"),
("Tunisia"),
("Turkey"),
("Turkmenistan"),
("Turks and Caicos Islands"),
("Tuvalu"),
("U.S. Outlying Islands"),
("U.S. Virgin Islands"),
("Uganda"),
("Ukraine"),
("United Arab Emirates"),
("United Kingdom"),
("United States"),
("Uruguay"),
("Uzbekistan"),
("Vanuatu"),
("Vatican City"),
("Venezuela"),
("Vietnam"),
("Wallis and Futuna"),
("Western Sahara"),
("Yemen"),
("Zambia"),
("Zimbabwe");