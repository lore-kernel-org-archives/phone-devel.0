Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AC227780C
	for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753257017; cv=none; b=pE9vHstqYyUMqbJlokl9hXIsXrlE8oMKsHg9E9ZrFOHMwtCttr55xDbt2+m0fiwqUqUtLKnziVFnTxZ1ICfiRyRLrJ4Gl2Dr4O/MntYx2PaBTAx08yEAHNAN6Uw7WXShsMII9yA4QAQ+G+jh/fPRpSh/XauKtU7mxMY3joM3u44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753257017; c=relaxed/simple;
	bh=s2qj4W5nR9VUDrxKDMTXYV/rhF67N9Fs+yw/DNr1OSo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Mw12IYPrC+BvZScoyrF/PDhdk/8tUuEOyJi1k2ZVXn1dwTFtSBgBy/amwaOcdEFUgqDLfpmBhCPFmw3nSqPd2N46UkEA2b0+41c1o7LOrq0ujfvAGp+7ukid94C0S1rzXrgv9GCQS1+yNJv/iAgGzeYVV0oUdRBvMuBNczSUj2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=S6Gj6Muf; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="S6Gj6Muf"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-612b34ef0c2so10996762a12.0
        for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 00:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753257012; x=1753861812; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXbXFwg+K/BsGGE3U/llO+SOTqkjirp29B31EDd6IJk=;
        b=S6Gj6MufZogpDpLD6OLyGKZX/hTJuAUAJNpsUDAc8SjitpcO7ixApOaV/R6FMUvHST
         xdEfFa7EWx7RzmWJUSUvk25MKqph6eFmU9HuZeaBTdJ19+3/e0h6eG4SWwCJDdGEvMUx
         waiirmurZmFKL0axF8ccNzWmfgeLCuYXpB6SyuMDtEPR2EgE4mWn42dIOnV8V8+AA3ub
         Up3HcipiK5+uiprTVbJma/b4cYsc6QpfGyX2lg9nmOPWc2SY6HLSl660UM8rlVCHTRaL
         NkYe6ttE+iAidnzJLsHG3rTmravT3xMAgeW2ngDEOlGiCHvsVnGcqhHfW4Gy2+jlBaB0
         SoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753257012; x=1753861812;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yXbXFwg+K/BsGGE3U/llO+SOTqkjirp29B31EDd6IJk=;
        b=s50Jp5QwEX5YdUnypps8UPVQtwb47BIMT4MGbQo6VAQBSVKd6KeszQhKz4w+Pqy9JI
         vnmXTh8KQ3ydVWtPFoY1YjIfF3r8ms4hweGEd5fxJnKASakjQwopcGoqb7vi5Dp7Ntyw
         p6KlSq03xj3cOyZD+bQ3ArrbqPaKOtmlcVtjkShO4+4P2hSLeKV4OkEV0oY4llKx16nC
         duh+TO/0vo5E2e00xee2I3NJXrRjL1pfn+hUTpKafWlibcWCO7PZm6d/su582E4znpVC
         n+zPrKAik43zBCzHbKQBEu+fB7H42JFkJ3PH6kwc6fTPbHsDxDsEWT8vNmDvm1C+3vJa
         8efg==
X-Forwarded-Encrypted: i=1; AJvYcCW7auI20D/YvHU9Veaz4TdIWSObZKGq1jkUWUWkMfhMi4EKLf3fgmpNzwJeUmXUX4srZOGY+kxFSYm1FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyXxd2eEB1RabHMyAVDNpeWoDm1af4i2tJ9J0PTQZAN4/VvkdB
	M5RoQWimp3thI+5kFCNAyuXMQMfzqa7EANrK+Vnh3nP662Xe5XAZKgi+++U/VGYGkkY=
X-Gm-Gg: ASbGnct5AiFD4RAOItoZ9Z64EDeMmQSaW7P9/kwfiYWvJaKfd9SpHPL8EgyicVXYACE
	vm9nRGGCOj2bxdv6bo6KKusiQ6QoAljBDpORLo2Mac7nNY4aLyJUO5YptUkxT1BYaZ6bg2ro3Ha
	V7RQUO5ESvhcx3cupSc9SMh2JE4TOKO6vJehhVUXhH7TaVYPJe2iX00uF0R9TCND7Zl6uNWS1vZ
	zQgpr8DWa5aFmcd1XsVef392/bpkstJko9c731E0y1dc7wc6wLsA/Mczckr7ABPFlFR0S3oC8mP
	dsx8b4h+iexCAm0QEQ7EV7h+/MI840RvLvpUF1tciilTZ9hUJtzvukGB+pvYFfk/YzqetlcoyGx
	nM6sBRJk/EfJGTyW17wKBLnECRurmg96GCTwWQUeU4kWt9d6iAVQco97ZICYh72YsWaY=
X-Google-Smtp-Source: AGHT+IHwBbnn1eUxlgv795d4NlYs1iTsVyOVnuelCygX33CjO30R0OB3cx1QUaH2Utrn1rESZ1YrZQ==
X-Received: by 2002:a17:907:986:b0:ad8:9e80:6bc3 with SMTP id a640c23a62f3a-af2f66c2165mr184740066b.1.1753257011912;
        Wed, 23 Jul 2025 00:50:11 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2ee01sm1007709266b.81.2025.07.23.00.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 00:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 09:50:10 +0200
Message-Id: <DBJ9QNML12CU.1RONWUJAZHQK7@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Georgi Djakov"
 <djakov@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add Milos interconnect
 provider driver
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250709-sm7635-icc-v3-0-c446203c3b3a@fairphone.com>
 <20250709-sm7635-icc-v3-2-c446203c3b3a@fairphone.com>
 <d8955532-9a3b-451f-b5c7-549cee7d749e@kernel.org>
 <DBHKBSK14XHM.E3ZUQMEJKEOJ@fairphone.com>
In-Reply-To: <DBHKBSK14XHM.E3ZUQMEJKEOJ@fairphone.com>

Hi Georgi,

On Mon Jul 21, 2025 at 9:42 AM CEST, Luca Weiss wrote:
> Hi Georgi,
>
> On Mon Jul 21, 2025 at 9:36 AM CEST, Georgi Djakov wrote:
>> Hi Luca,
>>
>> On 7/9/25 4:14 PM, Luca Weiss wrote:
>>> Add driver for the Qualcomm interconnect buses found in Milos based
>>> platforms. The topology consists of several NoCs that are controlled by
>>> a remote processor that collects the aggregated bandwidth for each
>>> master-slave pairs.
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>   drivers/interconnect/qcom/Kconfig  |    9 +
>>>   drivers/interconnect/qcom/Makefile |    2 +
>>>   drivers/interconnect/qcom/milos.c  | 1837 +++++++++++++++++++++++++++=
+++++++++
>>>   3 files changed, 1848 insertions(+)
>>>=20
>> [..]
>>> +
>>> +static struct qcom_icc_node qhm_qup1 =3D {
>>> +	.name =3D "qhm_qup1",
>>> +	.channels =3D 1,
>>> +	.buswidth =3D 4,
>>> +	.qosbox =3D &qhm_qup1_qos,
>>> +	.link_nodes =3D { &qns_a1noc_snoc, NULL },
>>> +};
>>
>> It's very nice that you switched to the dynamic IDs, but please use the
>> current style of links (like in v1), as the the NULL terminated lists
>> are not merged yet. All the rest looks good!
>
> Is what's in todays linux-next a good base? Or what branch should I base
> this on? But correct, I currently have v2 of dynamic ID patches in the
> base for this.
>
> Also If I send the next revision by e.g. Wednesday can it still go into
> 6.17? Just wondering how quick I need to work on this.

In case you didn't receive my message on IRC, your icc-milos branch plus
the following patch works fine:
https://public.lucaweiss.eu/tmp/0001-fixup-interconnect-qcom-Add-Milos-inte=
rconnect-provi.patch

One num_nodes was wrong, and alloc_dyn_id needs to still be set without
the extra patches from the mailing list.

Regards
Luca

>
> Regards
> Luca
>
>>
>> Thanks,
>> Georgi

