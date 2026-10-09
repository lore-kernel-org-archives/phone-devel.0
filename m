Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CB43E6DC3
	for <phone-devel@vger.kernel.org>; Fri,  9 Oct 2026 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539760; cv=none; b=diXPFYkyp33JdmcWvB4BW13nWehV3vRrL0jMOnBye/rOe+21eLW2c3HajbU/IWAY04fZrkZoIEWIFyyY0cdsPM3YRFXaYbAaHcEvw9Xd/Jj5InbPvJdWZz+LyLSCl9CSHw3SMfa5NQkWbG7FQBPhCBStGET2vOe5wiS3MfApUNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539760; c=relaxed/simple;
	bh=QbQ2/AtCs501q7UDf1Jv6gkx1pyrMNlfW45xsO5RoQw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=huf3SDTv9Zak00GKid/wnZzJ47a7ZnkGv4/kRwo7rqkPLesRrI1RKxg/HtEzgJTFHAQc31WEECNjrVJypUNafLOR9Y84V8x/zfL/H0GmRSoBvqpKdIN9kujLQCeVN6TzoD5eHGYvzzJM84GhGsFg3yEhkweOKIapZNI/bqX/1+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iVA3e4/K; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iVA3e4/K"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2acc1e170cso641569266b.1
        for <phone-devel@vger.kernel.org>; Fri, 09 Oct 2026 02:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791539756; x=1792144556; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QbQ2/AtCs501q7UDf1Jv6gkx1pyrMNlfW45xsO5RoQw=;
        b=iVA3e4/KGcNGREd24E+mHwDu/qtLEHh4zil04bmUOmDn4eXHsO8XQiCAMiG48ZlG7D
         Rq1Pn6XrpKD3B83jjP0umt++aE8uVHDGNU4lB8AQagJs/dlLEmjxo8WopbWKnqbWdeb8
         lplDKNl+mwSPFIRUaHYqgjs/8fChu78ds73BAvXcQx8nxFCXxIEdZyNrKvPwQcD2SSmy
         vpNU7piITLvZ9p/3gNLVyaVV3fE/8OiGVoYv+MBWngpFY2TYO3D+hjEhx4L2yCKtDpDK
         xal1EjPl3V63VoRmsGnghGhbJ7GhCGTGYbSRjE1IV3f7pcjIubV6ZSIDmsw8yrV+aNDr
         XXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539756; x=1792144556;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbQ2/AtCs501q7UDf1Jv6gkx1pyrMNlfW45xsO5RoQw=;
        b=JCETwdqxBMqb5X8f7S/D8irY1i3MXxOYdcWLoOKj4Sf+PAhwNWnXMbVzMB0FwGQsV0
         uRvzI/G3pILwjZC9+JKLBIysTPHWTeVonUWk8KYNehcKrrNO2ToeCVxwls2CMsy36z3g
         cVgyI66oOHaIQC5HaaFk2JrtDBQDSwo4OBXWv4FC3IWz9GU3tw1Adhfrf98e1/zdVEzY
         U0nW+ik04lnReS6usyUzRarx58sU1PmayO2uq2T+JJmfekFuqSo5pXJableNAZT1pzwA
         xXfSchn8Ggp3RRuW9HTdCNVmUfbwd4JQ/w2oSfgfpbVjiu+2qk9+EmSB8IQV9ffqnZXl
         n8lQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5XntIloCYcP+Z1yfA9DQ/4hWxtqBQHnwKIZpDQVlQ6MDD2vJMZSYMo2sx4Map61D5KqPQz6AS8UQv/g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIGQXlZt2aHbjqFnoEzDzwqtL3d9nn35mlikmfFtHDft/1Gw5jH
	acspV56352ijVDOD1GkLamY0o+d12zC3vMLo3VbD5AHTghj9ZbJHanvNyzeOptxizWc=
X-Gm-Gg: AYBFou2dgUHRVywwetqAO6iFgEUFq56chnRItRmas6AJh3VBiN1+A4DuR0pP79SmGkw
	TtFzpVurBHLuzURJ18YZTQwIFBB7gQE6PAIzVhG6OSyjhsQY8dItOb+nY/BEfwB/pSCb1yb3a21
	Ly98U9zlhPSDI7+PvcTwz2JmBoQCUcvVac1LGz2rM5Sf5K+Aw/eLbQNS0yOEpJOQ2fcE/2DJViI
	5utcduvCs88jQO/jcboe1hBMzbRCWSCU6pRlBvEJYxk7C0IGZYV511nd9WFCrtNpb6/crmJVsyD
	u2Q0bP+f8KtGDOvjF86jJntvjpAibaC4pzbSJ0jJwxYlqAH/GMel+lKQhY/RBgaHPk43JhHuWj/
	4teOZdoVSN2QmgPOuYqxFOw9KSbNGoXzx7sDg9llJ+PlHkOaQCRgsxo/VZKrLYPhzl7geiAvuLU
	ZOk+QSjE9fLYFw8/6lF1Ksm6Ma028Rh/0q+7iAfgpYWPBtxulBjpTsvPCyNwZKnhdMx9lmoSzNc
	XCEcUNzUDYa5PoXfc8CIRy2+F59zSBgJd/kzRteDAY=
X-Received: by 2002:a17:906:6205:b0:c2e:4292:d27e with SMTP id a640c23a62f3a-c31aa017fb2mr131169466b.22.1791539755796;
        Fri, 09 Oct 2026 02:55:55 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9af103csm68942466b.87.2026.10.09.02.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 11:55:54 +0200
Message-Id: <DM07U9H4GK87.1NU4DXWEDZKAM@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 0/2] Correctly use TX macro v9.4 for SC7280 / Kodiak
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srini@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
 <96294c65-171e-48e4-9938-9f321b4c5e6c@kernel.org>
In-Reply-To: <96294c65-171e-48e4-9938-9f321b4c5e6c@kernel.org>

Hi Srini,

On Fri Sep 18, 2026 at 10:34 PM CEST, Srinivas Kandagatla wrote:
>
>
> On 5/26/26 4:29 PM, Luca Weiss wrote:
>> As a bit of a note where I'm coming from, I'm working on microphone
>> bringup for qcm6490-fairphone-fp5 where so far we've been using
>> qcom,sm8450-lpass-tx-macro to get the correct control names. I've tried
>> reverting to sc7280-lpass-tx-macro, updating audio-routing in dts and
>> UCM to the v9.0 names and it does seem that microphone (AMIC1) is
>> working with that, but I'm not particularly happy about leaving the
>> wrong control names everywhere, so I'm happy to try and untangle this
>> situation.
> Are you referring to the enum values that go into "TX SMIC MUX" mixer
> control?

Yep.

>
> if this is the problem, i think we could use values instead of enum in
> your setup. They do endup in the same register.

I mean technically we can also use the incorrect v9 names in dts & UCM,
and they resolve to the same register values in the end.

> However I do acknowledge the issue.
>
> pl let me know your thoughts.

My preferred solution would be cleaning this up completely, as in change
to v9.2 and update dts and upstream UCM configs to the 'correct' values.

I do understand that this will likely not be accepted due to
backwards/forwards compatibility issues that kernel people want to avoid.

The most straightforward path I see is add a new compatible which uses
&lpass_ver_9_2 and can be used by boards that have been added before,
while new boards can use the new compatible.
This is suggestion (2) in my original email.

>
>>=20
>> I'm also not sure where this v9.x actually comes from, maybe I'm lacking
>> some documentation, downstream kernel only refers to Bolero v1.x and
>> v2.x so these seems to be a completely different versioning system.
> Am not sure how we ended up using lpass versions instead of codec
> version in tx, this is a redundant to codec version. I want to clean
> that up at somepoint.

I don't understand this whole versioning anyways because there's afaik
no public reference what SoC has which versions, feels quite arbitrary
to me.

If you have some internal references and can sort this out, that'd be
appreciated.

Regards
Luca

>
> --srini
>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>


