Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771F8C433FE
	for <phone-devel@archiver.kernel.org>; Tue,  8 Dec 2020 11:53:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F7CC23A9D
	for <phone-devel@archiver.kernel.org>; Tue,  8 Dec 2020 11:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbgLHLxL (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 8 Dec 2020 06:53:11 -0500
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:45056 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726120AbgLHLxL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 8 Dec 2020 06:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
        References:Cc:To:Subject:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
        :List-Post:List-Owner:List-Archive;
        bh=KKtmw0QteB2vSJWYwG4BiS5BWj9yNRVu1oiWwNBBwcQ=; b=oC2yRBk3fKFT8TcUxGIfZPGgyn
        7PtmtbZ/Ww1FW3LbHwtp8OhPhpyCio1YKJ9rZFVVR3XFbMNKkkQziyuD3px85QloanHzSLxJkdipd
        tH015JN9cmuuxXP+yQJfXb3Efq715QVbw5ft5oMGRWYdgdWbOf6Q0SZECa3D5yiP8NAewHJSi+bpC
        Dg4kDdFeRmfM3cCeMdgE4rqUGoXPvfriU5cQXQ216wZWbat722SzLBtJ7HxV7/3WeU/tz05A2IK/N
        2/4GAcgcyR30viveqfqO90OKhmHn4v4I+AWwtNlyRdv+3jR/EOcvSWWrVgXrIfS9kclJyRKLK7DHE
        UPQIsYYQ==;
Received: from deepwater.fritz.box ([192.168.178.25] helo=[0.0.0.0])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1kmbXe-0002VP-4Z; Tue, 08 Dec 2020 11:52:26 +0000
Subject: Re: [maemo-leste] D4 after leste update: rotated touchscreen
To:     Pavel Machek <pavel@ucw.cz>
Cc:     tony@atomide.com, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org
References: <20201207223323.GA322@amd> <20201207224953.GA596@amd>
 <e5d7848f-2fdb-929f-f7b5-53687ba65685@wizzup.org> <20201207230849.GA1400@amd>
 <ebbd1c5a-71d1-f48b-78f0-f14ed7db435b@wizzup.org>
 <20201208114435.GA5294@duo.ucw.cz>
From:   Merlijn Wajer <merlijn@wizzup.org>
Autocrypt: addr=merlijn@wizzup.org; prefer-encrypt=mutual; keydata=
 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
 /XslHw==
Message-ID: <297cb389-6740-b2af-9f9a-159e03fe3fb6@wizzup.org>
Date:   Tue, 8 Dec 2020 12:53:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20201208114435.GA5294@duo.ucw.cz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Tnm8XUI6Xb6rjNVM299RcVGjXTQ86SH5y"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Tnm8XUI6Xb6rjNVM299RcVGjXTQ86SH5y
Content-Type: multipart/mixed; boundary="uDDHgt6B8rufgub4jFOOn3WYkPAhrfxfV"

--uDDHgt6B8rufgub4jFOOn3WYkPAhrfxfV
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi,

On 08/12/2020 12:44, Pavel Machek wrote:
> Hi!
>=20
>>>>> Aha, I only had partial update. elogind held some packages
>>>>> back. I did explicit install of elogind and rebooted. Now I have bl=
ack
>>>>> screen in portrait mode, which has top overlayed with one icon. Not=

>>>>> good.
>>>>
>>>> Definitely not good.
>>>>
>>>> Do you have usbnet access? You might just need to remove a few lefto=
ver
>>>> configuration files.
>>>
>>> Do you have idea what files to remove? That might be easiest. I'm not=

>>> sure if I have usbnet, but I should be able to move sdcard to
>>> different machine and modify it there.
>>
>> Make sure that this directory is empty:
>>
>> /etc/X11/xorg.conf.d/
>>
>> And check that these directories have their .leste and more importantl=
y
>> their non- .leste files:
>>
>> # ls /usr/share/X11/xorg.conf.d/*.leste
>> /usr/share/X11/xorg.conf.d/40-ts.conf.leste
>> /usr/share/X11/xorg.conf.d/99-omap.conf.leste
>>
>> That would be my first guess.
>=20
> Thanks for the help. I reflashed from the latest image, and things are
> back to the working order.

Good to know.


> I found default screen vibration way too annoying. I turned it
> off... after reboot, it seems to have helped. But it still clicks
> after touch, and I believe it "clicks" with the vibration motor.

There are "click" sounds for mouse click/touch and for keyboard key
press. You can change the vibration in Settings -> Display -> Touch
screen vibration, as you found out, and if you change to the silent
profile, you should no longer hear the clicks from the keyboard and mouse=
=2E

There should be a profile manager application in the Application
Manager, which you can use to edit each profile and turn off those sounds=
=2E

"Control Panel ProfilesX" is the name - install it and then go to:

Settings -> Control Panel ProfilesX -> General -> Edit -> Key Sounds -> O=
ff
and do the same for "Touch screen sounds".

I think we have a less awkward program than "Control Panel ProfilesX"
now, which should also be available by default, but I don't remember, I
will dig into that and see.

Cheers,
Merlijn


--uDDHgt6B8rufgub4jFOOn3WYkPAhrfxfV--

--Tnm8XUI6Xb6rjNVM299RcVGjXTQ86SH5y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRM5LT7NbLF9yb6a/UGN09rynK8WgUCX89pPgAKCRAGN09rynK8
WpMqAQDF1xFvq7YSeaol+8cPtZEmnRnj+94BzOHbumINTSEpSwD9H6X+XEWAgebW
SUrqJLyy4BU8vMsAjpT9RwbTgDoJzwI=
=xIQM
-----END PGP SIGNATURE-----

--Tnm8XUI6Xb6rjNVM299RcVGjXTQ86SH5y--
