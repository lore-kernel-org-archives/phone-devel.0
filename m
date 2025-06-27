Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC80D1DE2C9
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018712; cv=none; b=FrecftILfmYDxdB884PfNcl4sLgZo1j3GkF4tNs3jjHN12eYR5ovkRv0+7sVanRHAMI1Jz/nAVknZIHbJJkEPASDUtSIuz9g1RLpxT7PgMTOyJ10eWMjURKOTfHDpo9XKo/IdSdVSaP9z3OWcdMk0UBZ9/o0DZjVuaKC9jF6Ygo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018712; c=relaxed/simple;
	bh=PzodW/i76HLnJ/LNXOIZcjxrEUiZHsILg7HZqKuQym0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=qhBGh9f2QC67/5mtYfxLrgT12WlOJfs0YNEO1UDPbGFQFSqtmhHmCq6bpyBaIwGiYCIIH+GUQPZsd/ql90czKbU4fD0Mp0nEuulzpb6dS4EC7UKaXUlp/Kj7nd+EVVth6O+mAGTTFKLW0IIC/Y4FzbeDR5WkD2pgWl/O3aFBLYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IMYu/edv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IMYu/edv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0dd62f2adso299951066b.2
        for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751018709; x=1751623509; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anf81smqJchGsOVnXL8fS0CnM4B+sUev4ipz3NBZjL0=;
        b=IMYu/edvz6R/wTiowuSLY7bajTgBUW6dIUbFr21K2rZsozX0X8MI3GEaj1y5tskZPg
         J3dtKSBNh/ClN1IjKS0Iz8SGe98n4vQuu9GGsWt6BPQ6nKldsl1NkbqVvANXo035qqKf
         lXVB8FK6XRcg36jo+XsUP9eTfRBNhHluLrvN86Xk7MJ7fgI/wQKN3fNwCgHUfZbQ1y9a
         9cmL4/AoKZKoIxGrIYU3s1pml3BnnxGdOjxlBzP8qmaNk/S3wQnYu1OAGV2XJqEoDNZW
         X7xEJex3PsfApdsPLEiqhxerwQbMZg4HnHnlAFYbQDmNYVB+KvVsNvkKh4Fpup8ZXafy
         cemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751018709; x=1751623509;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=anf81smqJchGsOVnXL8fS0CnM4B+sUev4ipz3NBZjL0=;
        b=A6pjq0zNiTIwMtipG2BgW+KZ1dcRpRDMwqEpALiUePSHUUtM5h9wyT1XLanQIm2j15
         EM9gM7lyQTtVhsW9nURhm6egYUMD0QrufSDaRbHHTl1b/YssYqXjT69k10Ldz/diQfyl
         P62Me/3wLRHGkFqC/BA7eMuQCs6R6CNU1O7LJbKsFXNW2HY6Q9sc2gQIsmRU3nBNfccs
         VfVVhKr1EQQqJEFYxUsA/nyiQbSwe1CCxyNqUsqmYc9ivdqIo7GJo33ZMdidyENFWIwk
         9yEG6QXfmMiXmNnAnVY47wmyXeriPeTcFtqrT7e9i7KADvBLtYVHQ9rljYOpZeOvvC8p
         HNAA==
X-Forwarded-Encrypted: i=1; AJvYcCWvTmh7GV95Phpyjd4owOWQKHAPhSb3/gewEysArCeEkTxYtb/EcHmelxA01YLioY6wyiVwuIhvscDSfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDVq8nv78kxYRhymGAE6TcKmwv97PKM5Ed3GQs54EL8Dp0Fxmy
	rw6Hrh9dch0M4QzEXmrbnGXuJeneiHQZq/wIMw51jBAxDVx7vJAOKN+XxpJq1saJ4ak=
X-Gm-Gg: ASbGncvWQWxkvC+uw9Dw2vqECAvn5aoBPpqbA8PGzuoQoTiFRTGtuLH0p2diLoMAoH7
	a621NAf/JqI5l2h9BpkYX3guaLlq1Ti8LqGRwOCRU8xZsF5s4yfeHte3j7r2y/VWlkYHrh3k9is
	ylsbVlYteJN1XcPyM84ooURAPztBJ+BQct/9OHMcn2P65uVoPPVvez8c0X/uSG5YG1X79R2RKCy
	TY8e/CVd89PxZjdMStGL4bSCzK/GIq/8qNV7We27Zsfi7KVcODX2+sFygADBAN+1uYDk4C1KKjU
	Bpsi+d5N/E0vTb08HkkQbxZOyiPOb05TpbRRHhUtq9lXwKwMDZH1YmzVLXGaE6bM8ZL/7Gx/xAC
	BLm4wzAqSjdYoN4cLwKUjpxTFCxvB7KU=
X-Google-Smtp-Source: AGHT+IFwWC1PMDQhvOXj2QsK6RpzwF856rVEhA2uY1DKJrMoYsifyAHyLePMov9FHDkbpt1Ej/CUTg==
X-Received: by 2002:a17:907:d24:b0:ae0:a1c2:262e with SMTP id a640c23a62f3a-ae35018f138mr209250666b.50.1751018709055;
        Fri, 27 Jun 2025 03:05:09 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca217asm94148666b.161.2025.06.27.03.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 03:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 12:05:08 +0200
Message-Id: <DAX8BTNMDC8Z.182KEGJF2XRDF@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Fenglin Wu"
 <quic_fenglinw@quicinc.com>, "Stephen Boyd" <sboyd@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
 <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
 <6zut6hiwig4qanrmloqvibx4tmpb6iv23s3hp7bb4ja6jzzia3@wnre6i3mukbp>
In-Reply-To: <6zut6hiwig4qanrmloqvibx4tmpb6iv23s3hp7bb4ja6jzzia3@wnre6i3mukbp>

On Wed Jun 25, 2025 at 11:03 PM CEST, Dmitry Baryshkov wrote:
> On Wed, Jun 25, 2025 at 05:01:29PM +0200, Luca Weiss wrote:
>> On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
>> > On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
>> >> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
>> >> and the devicetree description for it.
>> >
>> >
>> > Please use PM7550 instead.
>>=20
>> I'm happy to not follow downstream naming conventions if being told, but
>> do you have any details whether PMXR2230 =3D=3D PM7550, or PM7550 is jus=
t
>> another SW-compatible PMIC as PMXR2230.
>
> It is PM7550.

Ok, will update in v2.

>
>>=20
>> Also we already have qcom,pmxr2230-gpio upstream, so that would need to
>> get updated for the PM7550 name.
>
> No, leave it be. We should not change existing compats for no reason.

The compatible is not used in upstream dts though, and cleaning up some
old naming for the PMIC would be good, no?

But I can leave it for now, and we can potentially take care of it
later.

Regards
Luca

>
>>=20
>> Regards
>> Luca
>>=20
>> >
>> >>=20
>> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> >> ---
>> >> Luca Weiss (3):
>> >>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
>> >>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
>> >>       arm64: dts: qcom: Add PMXR2230 PMIC
>> >>=20
>> >>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
>> >>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
>> >>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++=
++++++++++
>> >>  3 files changed, 65 insertions(+)
>> >> ---
>> >> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> >> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
>> >>=20
>> >> Best regards,
>> >> --=20
>> >> Luca Weiss <luca.weiss@fairphone.com>
>> >>=20
>>=20

