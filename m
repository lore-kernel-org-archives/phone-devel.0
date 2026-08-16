Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch [109.224.244.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7470D2D5925
	for <phone-devel@vger.kernel.org>; Sun, 16 Aug 2026 08:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786867237; cv=none; b=k/x1zpATkH70aS1GdT2YjlQhYNoVS1X9zTb+4rNz+JGQmO7RPmeSiPHn6cMJWBUo58yd7iI+/y+wvoH9ZJRbESwP1Hs+jVXUe2T9wLTsnj8BCTpwSHGtLZX8nYnyLqsInYbQJivPSvuJs/AYqZt4YN3ablvObrs9lxD/UmYQ0QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786867237; c=relaxed/simple;
	bh=fubqhtANfOtIaMr2870BoS0MbygHnXIUuUberjdahNw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LLfmh4+r6E7Ddlyyxua+4xxGo9KFMnKrdvWx3bLl6ohH3/RB7/11ozQ5D9dITpaNHEQvJ3aNzUlb/IHPuHi/7y0+L3Ef3ipCekvtjcGZdm2Jv2NhRn3gg1IcAcccOFTbo26Xrh4NJFTLww0zwUZSeEeZJ2yAhXMyPR77rw85H4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=rQCgekgN; arc=none smtp.client-ip=109.224.244.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="rQCgekgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786867233; x=1787126433;
	bh=fubqhtANfOtIaMr2870BoS0MbygHnXIUuUberjdahNw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rQCgekgNdvmV8FvvfIs5AQLk3GDfmLlyPAavY6h1MFtgjrHsjZ+Ja9fBIuimdGWMP
	 qJW4k6fPAYTSw+CFgwuoxjeALLGgRLHuK26qT3BeA7N7jr2nfBXu5sSOJDKfCcsQur
	 15eUUvF40GnfkFzr5vsiaBFDNM5HzeBmCKdlQAFJ5Fmaq7BqxJoeO/Vxqrf4W1KTF9
	 7krM7BGP+YV/oUmhC7dwyyMN3iiGTPQTLTomYRaGEu+J+IElp8+B/QG0VgBMho4PEt
	 FMoHUDYMX7jT/PzFYZa5uqPaq+vD9jNg2nvEsLmc5T0hGGbMz3ljfh4jYsUU0ym8Z5
	 I6dRUFMajXPBA==
Date: Sun, 16 Aug 2026 08:00:31 +0000
To: "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: How to do AI rotoscoping subject isolation in CapCut Pro for Windows Desktop version 9.2.0.3931
Message-ID: <RbBUK4uhbTZjhL88n1SfG0AoCy_kfUpgPJsqYzK1FrSs4AxbfINj7HO9Ow4Uwt_mMU4sD9GLphOscHYzBGGHdVvBX1r-XMJGhkgRCST9DcM=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 582a456ac9b046cf258f29f8fa427d244ed2d629
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: How to do AI rotoscoping subject isolation in CapCut Pro for Windo=
ws Desktop version 9.2.0.3931

Good day from Singapore,

On the CapCut Pro home page, click "Create project".

On the upper left panel, on the Media tab, on the left hand menu Import, Cl=
ick Import.

Import ALL of your 4K video clips.

Slowly drag video clips one by one to the timeline.

On the timeline, click the individual video clip you want to edit. You cann=
ot select all of the video clips all at once.=20
That's why you have to drag video clips to the timeline one by one.

You need to CLICK on the individual video clip.

Then on the upper right panel, click Video > Remove BG > Custom removal. Yo=
u need to click on Custom removal.

For brush size, you can keep at 20 or change accordingly.

Click Brush and paint all over the female model you want to KEEP in the 4K =
video.

Click Eraser and paint all over the subject you want to DELETE or REMOVE in=
 the 4K video.

Click Apply. You need to click Apply.

After the AI Magic Mask finishes processing, you can watch your video clip =
from start to finish to see if the mask is applied correctly.

After you have processed ALL of your video clips, you can click Export on t=
he top right hand corner to export to MP4 video file.

That's all.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Diehard hardcore PAP government supporter
16 Aug 2026 Sunday 3.57 PM Singapore Time












