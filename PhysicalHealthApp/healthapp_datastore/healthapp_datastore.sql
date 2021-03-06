CREATE  EXTENSION pgcrypto;

CREATE  EXTENSION "uuid-ossp";

-- DROP TABLE public.app_organisation;
CREATE TABLE public.app_organisation
(
    _createddate timestamp with time zone NOT NULL DEFAULT now(),
    _updateddate timestamp with time zone NOT NULL DEFAULT now(),
    _updatedby character varying(255) COLLATE pg_catalog."default",
    _createdby character varying(255) COLLATE pg_catalog."default",
    _recordstatus smallint NOT NULL DEFAULT 1,
    organisationid serial NOT NULL,
    organisationname character varying(255) COLLATE pg_catalog."default",
    organisationimageurl character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT app_organisation_pkey PRIMARY KEY (organisationid)
);


-- DROP TABLE public.app_organisationadmin;

CREATE TABLE public.app_organisationadmin
(
    _createddate timestamp with time zone NOT NULL DEFAULT now(),
    _createdby character varying(255) COLLATE pg_catalog."default",
    _updateddate timestamp with time zone NOT NULL DEFAULT now(),
    _updatedby character varying(255) COLLATE pg_catalog."default",
    _recordstatus smallint NOT NULL DEFAULT 1,
    organisationadminid serial,
    organisationid integer,
    userid integer,
    CONSTRAINT app_organisationadmin_pkey PRIMARY KEY (organisationadminid)
);

-- DROP TABLE public.app_organisationemaildomain;

CREATE TABLE public.app_organisationemaildomain
(
    _createddate timestamp with time zone NOT NULL DEFAULT now(),
    _createdby character varying(255) COLLATE pg_catalog."default",
    _updateddate timestamp with time zone NOT NULL DEFAULT now(),
    _updatedby character varying(255) COLLATE pg_catalog."default",
    _recordstatus smallint NOT NULL DEFAULT 1,
    organisationemaildomainid serial,
    organisationid integer,
    emaildomain character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT app_organisationemaildomain_pkey PRIMARY KEY (organisationemaildomainid)
);

CREATE TABLE public.app_test
(
    _createddate timestamp with time zone NOT NULL DEFAULT now(),
    _createdby character varying(255) COLLATE pg_catalog."default",
    _updateddate timestamp with time zone NOT NULL DEFAULT now(),
    _updatedby character varying(255) COLLATE pg_catalog."default",
    _recordstatus smallint NOT NULL DEFAULT 1,
    testid serial,
    testtypeid integer,
    testnumericresult double precision,
    lowerreferencerange double precision,
    upperreferencerange double precision,
    unitstext character varying(255) COLLATE pg_catalog."default",
    testtextualresult character varying(255) COLLATE pg_catalog."default",
    userid integer,
    patientid integer,
    clinicianhasapproved boolean DEFAULT false,
    clinianhasapproveddate timestamp with time zone,
    clinicianmessage text COLLATE pg_catalog."default",
    nexttestdate timestamp without time zone,
    testtypename character varying(555) COLLATE pg_catalog."default",
    patienthasviewed boolean,
    patientvieweddate timestamp with time zone,
    CONSTRAINT app_test_pkey PRIMARY KEY (testid)
);

-- DROP TABLE public.app_testtype;

CREATE TABLE public.app_testtype
(
    _createddate timestamp with time zone NOT NULL DEFAULT now(),
    _createdby character varying(255) COLLATE pg_catalog."default",
    _updateddate timestamp with time zone NOT NULL DEFAULT now(),
    _updatedby character varying(255) COLLATE pg_catalog."default",
    _recordstatus smallint NOT NULL DEFAULT 1,
    testtypeid serial,
    testtypename character varying(255) COLLATE pg_catalog."default",
    lowerreferencerange double precision,
    upperreferencerange double precision,
    unitstext character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT app_testtype_pkey PRIMARY KEY (testtypeid)
);


-- DROP TABLE public.app_user;

CREATE TABLE public.app_user
(
    _createddate timestamp with time zone NOT NULL DEFAULT now(),
    _createdby character varying(255) COLLATE pg_catalog."default",
    _updateddate timestamp with time zone NOT NULL DEFAULT now(),
    _updatedby character varying(255) COLLATE pg_catalog."default",
    _recordstatus smallint NOT NULL DEFAULT 1,
    userid serial,
    usertype character varying(255) COLLATE pg_catalog."default",
    userpassword character varying(255) COLLATE pg_catalog."default",
    profileimageurl character varying(500) COLLATE pg_catalog."default",
    gmccode character varying(255) COLLATE pg_catalog."default",
    matchedorganisationid integer,
    matchedclinicianid integer,
    nhsnumber character varying(255) COLLATE pg_catalog."default",
    emailaddress character varying(255) COLLATE pg_catalog."default",
    firstname character varying(255) COLLATE pg_catalog."default",
    lastname character varying(255) COLLATE pg_catalog."default",
    dateofbirth timestamp without time zone,
    gender character varying(255) COLLATE pg_catalog."default",
    displayname character varying(255) COLLATE pg_catalog."default",
    organisationid integer,
    isactive boolean DEFAULT true,
    isclinician boolean DEFAULT false,
    issysadmin boolean DEFAULT false,
    isanonymous boolean DEFAULT false,
    isauthorised boolean DEFAULT false,
    authorisedtimestamp timestamp with time zone,
    authorisedby character varying(255) COLLATE pg_catalog."default",
    isrejected boolean DEFAULT false,
    rejectedtimestamp timestamp with time zone,
    rejectedby character varying(255) COLLATE pg_catalog."default",
    emailconfirmed boolean DEFAULT false,
    emailconfirmedtimestamp timestamp with time zone,
    title character varying(255) COLLATE pg_catalog."default",
    emailvalidationstring character varying(255) COLLATE pg_catalog."default" DEFAULT uuid_generate_v4(),
    acceptedtermsandconditions boolean,
    emailresetstring character varying(255) COLLATE pg_catalog."default" DEFAULT uuid_generate_v4(),
    CONSTRAINT app_user_pkey PRIMARY KEY (userid)
);

-- DROP TABLE public.failedlogin;

CREATE TABLE public.failedlogin
(
    _createddate timestamp with time zone NOT NULL DEFAULT now(),
    _createdby character varying(255) COLLATE pg_catalog."default",
    _updateddate timestamp with time zone NOT NULL DEFAULT now(),
    _updatedby character varying(255) COLLATE pg_catalog."default",
    _recordstatus smallint NOT NULL DEFAULT 1,
    failedloginid serial,
    emailaddress character varying(255) COLLATE pg_catalog."default",
    logintimestamp timestamp with time zone DEFAULT now(),
    ipaddress character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT failedlogin_pkey PRIMARY KEY (failedloginid)
);

-- DROP TABLE public.loginhistory;

CREATE TABLE public.loginhistory
(
    _createddate timestamp with time zone NOT NULL DEFAULT now(),
    _createdby character varying(255) COLLATE pg_catalog."default",
    _updateddate timestamp with time zone NOT NULL DEFAULT now(),
    _updatedby character varying(255) COLLATE pg_catalog."default",
    _recordstatus smallint NOT NULL DEFAULT 1,
    loginhistoryid serial,
    userid integer,
    emailaddress character varying(255) COLLATE pg_catalog."default",
    logintimestamp timestamp with time zone DEFAULT now(),
    ipaddress character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT loginhistory_pkey PRIMARY KEY (loginhistoryid)
);

-- DROP TABLE public.systemsetup;

CREATE TABLE public.systemsetup
(
    _createddate timestamp with time zone NOT NULL DEFAULT now(),
    _createdby character varying(255) COLLATE pg_catalog."default",
    _updateddate timestamp with time zone NOT NULL DEFAULT now(),
    _updatedby character varying(255) COLLATE pg_catalog."default",
    _recordstatus smallint NOT NULL DEFAULT 1,
    systemsetupid integer NOT NULL,
    databaseconnectionmade boolean DEFAULT false,
    databasecreated boolean DEFAULT false,
    organisationcreated boolean DEFAULT false,
    cliniciancreated boolean DEFAULT false,
    superusercreated boolean DEFAULT false,
    setuplockedwithoutlogin boolean DEFAULT false,
    siteurlconfigured boolean DEFAULT false,
    emailconfigured boolean DEFAULT false,
    siteurl character varying(555) COLLATE pg_catalog."default",
    emailhost character varying(555) COLLATE pg_catalog."default",
    emailuser character varying(255) COLLATE pg_catalog."default",
    emailpassword character varying(255) COLLATE pg_catalog."default",
    emailport character varying(255) COLLATE pg_catalog."default",
    emailusetls boolean DEFAULT false,
    emailfromaddress character varying(555) COLLATE pg_catalog."default",
    emailfromname character varying(255) COLLATE pg_catalog."default",
    cliniciantermsandconditions text COLLATE pg_catalog."default",
    patienttermsandconditions text COLLATE pg_catalog."default",
    CONSTRAINT systemsetup_pkey PRIMARY KEY (systemsetupid)
);

-- DROP VIEW public.activeclinician;

CREATE OR REPLACE VIEW public.activeclinician AS
 SELECT a.userid,
    a.firstname,
    a.lastname,
    (('Dr '::text || a.firstname::text) || ' '::text) || a.lastname::text AS clinicianname,
    a.organisationid,
    o.organisationname,
    a.matchedorganisationid
   FROM app_user a
     JOIN app_organisation o ON a.organisationid = o.organisationid
  WHERE a.isclinician = true AND a.isactive = true AND a.emailconfirmed = true AND a.isauthorised = true;
  
  
  INSERT INTO public.systemsetup(
	systemsetupid, siteurl, emailhost, emailuser, emailpassword, emailport, emailusetls, emailfromaddress, emailfromname, cliniciantermsandconditions, patienttermsandconditions)
	VALUES (1, 'siteurl', 'emailhost', 'emailuser', 'emailpassword', 'emailport', false, 'emailfromaddress', 'emailfromname','cliniciantermsandconditions', 'patienttermsandconditions');
	

	
	
	
	
