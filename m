Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581661;
	b=HuN4Q2XdM4yUohmcoOAqxCrnvdCMqYpIyBBpLs5uJTzGMMNTdLYKLL1FtlMtUyRqAB5E
	 84TFmmc84V+Wvr4OmLJFjDN8pzpKAlTBboeuC3JAcluNbvhfwE3rNZlnzTqcAQS1aKOMN
	 rwEa+VbPJzAzdGH91RSO0EABgJs28/TdxxzQKjR4FKJTwUFilPLosgUTD6w4lLRUa8F8y
	 j2RbDiHsiU28DoB7DbYSNtxPGMZ0SSehNlBLwTiKmgBDxVeuDQX1GC5lxDLQu3ezW0mTD
	 KPfeoRPEQ8bUazITQQ1H11PGAyMyxq8XiwiEbFHXxdMIywjDs1rIN85dEpKSWaJ4sSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
	b=JCVU0MC86NbZAG9TwEBScqqFqHf40LeBVOr6SBSGULbPozkAneww6Lqc/u5+ikfb/AYA
	 dDgxEq+3LT5d8xMbBwguWwLa8DCUDNFcOMY2ls+slk7ptEID8kQcA+Z5LAMmmKePZs6QP
	 BwtSRku01bgDmNF7AuvhMh1pkOBq7su4pABaJ+JyNmwNx00ulnvPDKmsrxxBhyOZt4vZZ
	 ny1izVu/bOHkLD9Chwp90qyyw4IjMBO2jSMSvqQZa63/CAofPtm992LzrybmnWOEGO+hQ
	 QkIiUZmuACfqS+ROEbziQOxWcunuwyVFjiP2499opd8STDOgMHbEVZYoYmnGrvI2KlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=DtUb2MSs;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D561606A338
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 14:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D561606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=DtUb2MSs
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5067a2411bso204130766b.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 06:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794581659; x=1795186459; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
        b=DtUb2MSsTrLlshbb82Qrnc7nt2mk7Di/3LVlJvL+a+hyBCjKmoyE0a3v6Lz0I7liwB
         R3K2EeLS5F7QYb0Nz5bXmUSDqnPOI1WSnzrKMViW88wuGkzfF+xl/UBdQXCablxE4Wan
         Y3ZhfYDrLnPIDnTZ7hSk62AG5/+tmmjCTrQFKjC/EOCY09k/1bY0RZnFNcq+zsKk4XZi
         eIs87xMiMyXOwCK1T7zuhkfN6s6nb5Gd7Y00aJuq+UExYKM3NuGb6dAtWan9VpQjLkPz
         jwX9oVYTvUmuB9MY+5dXaTOTRWj676J+TyeoH7V3rmUu/c1SJkaK3aSRaOy6OP/HP4CT
         HdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581659; x=1795186459;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
        b=Oq++w4ilud/kRVNzctpprVSllAh9+hQzXJq4h7WPggFsE8tBWkVx1HlaaGHz7DHXSs
         eNs9lgfGxvRARQfmz3VdQn0jhbypH/VFPtxk/ecVhXNP2xztEyPDCPF1LDr9N2RyhCow
         nUtbs5lpwcuXvKsJxPS3TQUfDHLiBnOb/c3U3icGDFnp7L4ATlqVEru9lOC4G6VA+iri
         DOWDzQ7V3+dJX+RPQ+LKLyyNwwi/Jf+adITwKnbpdpwJmMqGeXzYM425+2S1LbmHjmAU
         PUgLalsvfRUuoczgibqXLcgn1O194bmL44to4rRZBz19NOzbb+uM6L2CxeUEQrDBKwdJ
         gOPQ==
X-Forwarded-Encrypted: i=1; AL+hErEP5oMk5FGnTobkyYCgZ0oQNf7K0KfoZd9sJoW2iDcgCrpsnbNFuEFi1GVzHShegwLHCSR6npYk/R7w2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8LW12XVEAUfZ7otTc+WBNi8aLHMCHeb0RX1vJ3VFIAfv6O9xlo
	ZLa/Uminztdp92kagt7Q28aU2HNL7dMupwgfTnMGMc8QRRzuiR3/LIvcheo0b2yTJOe6vB6MiaW
	WeE1cvBU=
X-Gm-Gg: AYBFou2G/DA8UxmYccwo50/IdxarAwmyUpjX7iS2HjWPaTCHp2UPgi3a/dQEPTIFZ2u
	nkez2KxoOtGSQFNqDE342wP1HVVbHdSUsxvjfvrvKDI1YGO4PvfbSS9fQ4yaexX8ibOmb68Mcyc
	/FhjeCPxV3lvP8JO8AF73nNmgsCksqGdunJcH63IJ0to3DBJdzbNAn7yE5AlR1A8arujBcUA/Bc
	FD7wQwohpIlfsjOizxJqYjJnFR0p1N2b5fdUJ5K+4HX8YQ7jLlAanu0hiwSJV3s6R3g1dpZKhhM
	u4+2AbFpxSNfYXSiZ03wFh/sioy7AFYDC/3uMTHiL+/1L3UpMYQUY1uPkLIuYkx9wvlwi0Hlv21
	zVGcYcp4FgUPE64BJydW6enpKx42D9RX7lj3DrNW2I32QvdxVwDlF0PeMp1hbRBSulYshonRCga
	LFUXEtM//w7FhuMC4ZeJoJubv2b1+7+HUq1zVRzDEISMA0BE0URT52PL3S3FfUFy5pV0dcfR56m
	R5JG8ZL+CXhQTXiMwDka1kjHJ3b3Vu6c5y33lqZoioY8ZQfOxCVEeDRkyQJa72QsBiJNCqFf9of
	BF14yjFhw38XKrDeS+gciZvXq9I5/CW0J0wp1veLx0FL+l27e0xCCkdbhmEZAyeX4Ho+8tartUo
	=
X-Received: by 2002:a17:907:a089:b0:c46:9876:e9b1 with SMTP id a640c23a62f3a-c509664a09fmr236807866b.43.1794581658937;
        Fri, 13 Nov 2026 06:54:18 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c78asm112075866b.10.2026.11.13.06.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:54:18 -0800 (PST)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 15:54:18 +0100
Message-Id: <DMU63SK443BB.1CQ2KXXP5PNW4@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
 <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
 <DJFFMB9BO7GF.3CIRW26SHUSD@fairphone.com>
 <DLIISWYS60TX.BBXK30H05VRL@fairphone.com>
In-Reply-To: <DLIISWYS60TX.BBXK30H05VRL@fairphone.com>

Hi all,

On Fri Sep 18, 2026 at 4:43 PM CEST, Luca Weiss wrote:
> Hi Konrad,
>
> On Mon Jun 22, 2026 at 10:23 AM CEST, Luca Weiss wrote:
>> On Wed Jun 17, 2026 at 12:05 PM CEST, Konrad Dybcio wrote:
>>> On 5/22/26 4:46 PM, Luca Weiss wrote:
>>>> Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
>>>> some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
>>>> and power-domains for the LPASS RX/TX/WSA/VA macros.
>>>>=20
>>>> Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
>>>> equivalents in its place. The qcs6490-audioreach.dtsi file can also dr=
op
>>>> deletion of power-domains properties then.
>>>>=20
>>>> This follows previous commits moving Chrome-specific configuration to
>>>> the correct file, leaving kodiak.dtsi for Elite and
>>>> qcs6490-audioreach.dtsi for AudioReach.
>>>>=20
>>>> No functional change intended. The clock-output-names property will no=
w
>>>> exist for both Chrome and AudioReach devices but this shouldn't have a=
ny
>>>> relevant effect. And WSA macro clocks weren't added to Chrome because =
I
>>>> don't believe this would've ever worked given it already referenced
>>>> q6afecc and the nodes were originally added during AudioReach bringup.
>>>
>>> I think it's better to keep them, if only to make sure that the result
>>> of dtx_diff isn't outside the expectation of a commit that claims to
>>> only reshuffle data for these platforms
>>
>> I documented this in the commit message for this purpose.
>>
>> But I'd argue not putting (likely incorrect) wsa_macro overrides there
>> is the better thing to do. Probably somebody should've taken care of the
>> Chrome platforms when adding the wsa nodes in the first place.
>
> Is that okay, or do you want me to change this? I'm still of the opinion
> that adding a very-likely-broken WSA macro to chrome is not great.
>
> Anything else to note? R-b would be nice :)

Any further comment or review? I can also resend if that's helpful.

Regards
Luca

>
> Regards
> Luca
>
>>
>>>
>>> It looks OK as-is for Elite and Audioreach platforms (for the record, I
>>> checked rb3gen2 and FP5)
>>
>> Thanks!
>>
>> Regards
>> Luca


