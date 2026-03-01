Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E721D181334
	for <phone-devel@vger.kernel.org>; Sun,  1 Mar 2026 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772376098; cv=none; b=uSZOKAUmY+RR9iQ0gJBwvSUILDdAm9sOj0hbjVn4d1HDVdYm8mYGtmqt0zXe78Codh+DahCOU1+83zFz9uFCHpt0SFWvSe0MKRFwJRNPqwaRWWH5MhWSELMLeJqRW80OT9dDL5uPajG3266OtzKuZMNFaVSFKiM6DBgbH0g676A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772376098; c=relaxed/simple;
	bh=Ip2Y2hPFkdplAsDsFDfRfxYULFaqZQRyRktcZEyUbyM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sl2TqFYUJXmReuf71srAllLW6rBvkYbHhSh5u8NnSZ/vhhaQpXnZU0wIlRhrO4akLoPqrkpS/LLfS/j8bOw7FhCMcck8i0EPIdnjE1OeUg1xmA5HHvyMJK+v2S4DQaZeOxGmMey+h38G8QYeT92+KrKfSdBKEZRhQRZvVb4moaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=BjztBoeR; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="BjztBoeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1772376088; x=1772635288;
	bh=Ip2Y2hPFkdplAsDsFDfRfxYULFaqZQRyRktcZEyUbyM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BjztBoeRJbNxNftivLtd34IBJgUXNRE/kDi0uV98xgpj5s4mxbQQgC2sB8MWtj/mn
	 QkmYQroG1V9hOBA49XnQJsAnQZNkVWbNcWYT9qqH1URQvtTqBymgy753NbL8H9JfCj
	 eoZSxNw3oIPKhu+xXN3bX8tDllygVtydrhf+wf2HP0j158GGjo25OLFWe1sqqjkrS/
	 tn3U5azon+mRH+ybxC4n/dbs2xR+hwm6beWUpAXrJbjAb/HM7AlKOEF/Pu5Ympa/vD
	 9J8WnLbSMuiZSsl9uFx7ZWSULvjv6KhGk9kC3bwL2tzjk+DuUKbxXJSO2VXqwzPjRC
	 pPdEG6cLWCaDw==
Date: Sun, 01 Mar 2026 14:41:24 +0000
To: "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Government hackers changed my video title in my primary / main / master Youtube account recently
Message-ID: <W0-0IEGJdtBkIM11Ubk5TvGOPGu19EEEA06fFC_GIskHur2VfO5GhTCtMKzoN_R6lucqdIXwH6rwAsKbCrPnN3NQ_xtHOsTqb22-zLIOSW0=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: dab80a1fed187cc407f37879d48e9cc208388a6c
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Government hackers changed my video title in my primary / main / m=
aster Youtube account recently

Good day from Singapore,

My primary / main / master YouTube account is protected by two-factor secon=
d-factor authentication aka 2FA MFA. Yet government hackers were able to ch=
ange the title of my YouTube video easily.

My Youtube video title will usually match the video filename on my computer=
, 99.9% of the time.

On 4 Feb 2026 Wednesday, I had uploaded a video to Youtube.

The video filename on my computer is:

=E9=83=91=E5=B7=A7=E5=84=BF Jayner Teh Getai Performance 4 Feb 2026 Wednesd=
ay.mp4

However, a few days later, I noticed that my YouTube video title appeared t=
o have changed.

Government hackers had changed my Youtube video title to:

Jayner Teh Getai Performance, February 4, 2026, Wednesday

Yesterday 28 Feb 2026 Saturday at 6.14 PM, I made a verification check.

The Youtube video title does not match the video filename on my computer. I=
ndeed!

Immediately I know government hackers must have changed my Youtube video ti=
tle.

For the past 19 years since 2007, I know government hackers have control ov=
er my Android (Linux) phones, laptops, desktop computers, servers, and onli=
ne accounts.

This is because government hackers regularly love to purposely and delibera=
tely show off they can hack into my devices and accounts for the past 19 ye=
ars.

Recently, government hackers purposely and deliberately show off they are a=
ble to change my Youtube video title, when my primary / main / master Youtu=
be account is protected by 2FA MFA.

What are the motives and objectives of the government hackers in repeatedly=
 and regularly showing me they have access to my devices and accounts, purp=
osely and deliberately?

Government hackers could have chosen NOT to let me know they have hacked in=
to my devices and accounts for the past 19 years. They could have done it s=
ilently and stealthily. Why are they doing it so obviously?

Why? Is it to distract me from something else?

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
GIMP =3D Government-Induced Medical/Mental Problems/Poverty
1st March 2026 Sunday 10.31 PM Singapore Time








