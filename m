Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FB71E9B35
	for <phone-devel@vger.kernel.org>; Sun, 20 Apr 2025 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745156507; cv=none; b=emQ2z6JpDz3kbeyVa6Af22HBULWS8okf+rqBaA0ZWcCdMmNo9e8deTc52n+ko4JSh6dRObL9awUTVte6v9WtIgeJewH4NFMOQYKUzVpQrsVYxgeCeOTGSjiS84dU5pn/SfWUm+8qjq420vMgo0kyK6+O2742DTEv+9gk5TI3BSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745156507; c=relaxed/simple;
	bh=aJVxZLhnhscu/C/D0RmSAUgyWjWlCjNVqgUHfAwWSag=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XJ2gOQoO3DjSvRFM/+2u9Eesepe/p1eF9JfagqB6qdU3s7gvlYgHcYe6Ib+lCWgpUBCGjMoLM7lrHKfsJqo66hme5jfj2wbjYCIb1xomUwfCV9QFb2KTaNlXiC5QBEpQL5I2lZaJtXhY0vMw1ptAGzXw8lcd409i1ZTUbaJKkCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=fUbH5dLg; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="fUbH5dLg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1745156495; x=1745415695;
	bh=aJVxZLhnhscu/C/D0RmSAUgyWjWlCjNVqgUHfAwWSag=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=fUbH5dLgApLtrcppGsTg/QDbQZUlPOCrfDpNESBieh9x2g72CCVIDj3yqhG+lUmoe
	 E96nWPGyNv/uYdk6al4qYtw9lKX0ENg00FlSHRw0Z8rjMYiL+8SOacVJLdyBMrilqu
	 kKjaFzhbxCJic9gkAwn/88oZGmupJHdXPTE1/6Ax35AoW8Y9+Hc8jcgOGt+iwi5o91
	 Xz4NMjRNdb+pZJYBp61CWfpCKMsaXupWuwh9+RjUfvtELu/GLdu6gz69ihZJokMNzf
	 Nzt/RUj9HarYoKpdKmJMYpa01rmJUO4FBB/Tw/Ni19uHopUmLIx/7dp0VK9N0bfkf5
	 mnm8Qmj7LdMSw==
Date: Sun, 20 Apr 2025 13:41:30 +0000
To: "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: How can I stop Singapore Government hackers from hacking into my Android (Linux) phone, and all my other devices as well?
Message-ID: <YXY8NSYikROrpBxVgc3PdRuxOAsdKqh_CtMT1RE3TfTHA_PC4FQRUBAAQ-Yd5w6R4HPzmc2sjd81MKeYsH8tY5FZICyxemC4MRn0HEepwsY=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: a9c97ec7ca8791cd97d3dcf00303009abbb80066
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: How can I stop Singapore Government hackers from hacking into my A=
ndroid (Linux) phone, and all my other devices as well?

Good day from Singapore,

On the early morning of 3rd April 2025 Thursday, Singapore Government hacke=
rs severely corrupted the Android (Linux) operating system on my vivo V25 P=
ro 5G Android phone.

As a result, I couldn't swipe up and down. I could only swipe left and righ=
t.

Many of the icons on the 1st screen of my Android (Linux) phone were delete=
d by Singapore Government hackers.

Thousands of files in the /Android/ folder were deleted by Singapore Govern=
ment hackers. I found out using File Manager Plus.

When I rebooted my Android (Linux) phone in the morning, it says my phone c=
ould not read data from device storage. The error message goes on to say th=
at the device storage could be damaged or corrupted.=20

When I reached my office at 8.30 AM (it happened to be my last day of servi=
ce at SBS Transit Ltd), my Android (Linux) phone managed to boot up, albeit=
 very slowly.

In the late afternoon on the same day, I decided to send my Android (Linux)=
 phone to Vivo Phone Service Center at International Plaza, Singapore for s=
ervicing. The technicians at Vivo Service Center agreed that my Android (Li=
nux) phone had been hacked and compromised. They decided to erase/format my=
 Android (Linux) phone and re-install the Android (Linux) operating system =
from scratch (rebuild the system).

In the evening on the same day, I managed to collect my vivo V25 Pro 5G And=
roid phone back from Vivo Service Center.

I went home and started installing back all the Android apps in the evening=
, on the same day. But alas! Within a short period of time after I started =
installing back all my Android apps, Singapore Government hackers managed t=
o hack into my Android (Linux) phone AGAIN!!!!!!!!!!!!!!

How can I stop Singapore Government hackers from hacking into my Android (L=
inux) phone, and all my other devices as well?

Are Android (Linux) phones so easy for Singapore Government hackers to hack=
 into??????????????

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals in Singapore
GIMP =3D Government-Induced Medical Problems
20 April 2025 Sunday 9.36 PM




