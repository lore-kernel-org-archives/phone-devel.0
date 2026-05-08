Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0515E377020
	for <phone-devel@vger.kernel.org>; Fri,  8 May 2026 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226285; cv=none; b=YhWEkAsGOzF18Kuotdz2PnVeQEAvcBx1uQ4N42HtZSnwUWP5cFSCzAByr3XDRiwY9kMv+WjVlBags/GYwu6f6gyfk7fFCpYwwldCUoxpAWqlK1pppVdfcnkS0i3u8VmgtpjYBDd0UvpkPaK2uH45hJP+486vq3k1c9I8y/WDiYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226285; c=relaxed/simple;
	bh=o15c3ZjdEV9em/vqcb+hF02R+chYCPmBw+qeMWlaJQg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=A+aOsnFKWa/TjUfSIwDbUXdOqOJYC4w4qNtYcy1gRlY0KpJzZ04pw93QxLDGVhb0oONmgcGnEaZ0VzVhx2VBR3CrV/aldKeoeaQDmlwsxdp+Du0dS5JHp1kRaQL2lbyCH+1Z6I7VZ1Yml6srJUupkSQBCTvAqKYgilR7TVf6FwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=C7DmsEpC; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="C7DmsEpC"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba699316b42so280678066b.3
        for <phone-devel@vger.kernel.org>; Fri, 08 May 2026 00:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778226282; x=1778831082; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDjfGFQB/3KLdXokArqrjAXXqhWAtauRetXWKTzWGMw=;
        b=C7DmsEpC3ahphstpJ8EZ2kF1/Wg9T5KyigmO/ZMaEPmMmlD0AojXDRCP7x5uj/txq2
         laU50Lgn4qQ/xi+DOIzKnNTGFA8nL1baQONmNWho5SZmyNzpgwL/Vwotd6fQgPV8PVad
         l+XiYzHGlbC0MjhJKZrw4YtzQxHLOCRCszCRS+j2HTNFfwofdxbCG9wNbLRVPTdyKbXx
         solHBIQuUBG15YDjiHnN5uTjcOo3kgFTrFTStmeCz0B3Z1RcFdEZ0YneBrihlGs2PnWP
         2DTNkvYhrmR48P4/u1M4JZ/wNb+yEkbUO8xGcD6c46qTbhlBLxMqnfFfQnaIfmnkUlPs
         kmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226282; x=1778831082;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nDjfGFQB/3KLdXokArqrjAXXqhWAtauRetXWKTzWGMw=;
        b=hcwez2kYr2XbxuGkTqi5xrOZIDAi1V1FqHxHplkIH+GuH907rC4NYZpDFxmXJCrvlq
         f4pQQtUaB1PhR08Ca2DRQqXl+bUJE/+tlyXjrrmQOAZ4oMULZfn4QiUpPgQCFM0QTPtg
         NhR8UapB0rLJXsCWWFbPtcxyGF7qDHdrQj4Gpb18BAyhu5fsxB8sEWU/bNIxgYRBslwg
         U4CB3dJ0Xy7VEgvy/td4PhS9CQ++B8U3p8uJWj/ytkR7VQ9Bi6ctvTdochz9mk3kec4x
         24SKkMhP99/MZSGlYZzzm0t3dIjWMf45/FqxOzSyOFduz+Q/O1eMxsPso6bDP7SH7KCt
         KKmg==
X-Forwarded-Encrypted: i=1; AFNElJ/nz0Q8gXXjIeqtbicK+JwUKYLGOnai1X36Ayczs6wqgI1Fg8LNd59Dzw4dqKUUvFSxy4iPv59I+1/wUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQcNPYqMzPfu2MleXPyTJ91XR4oTTpeL1xSvhK4PM7BXj3cHV1
	gpKRfInFmZEjlrM+vq6K8ja+NHf0XZHUiPeBuQdZ4W4Vny8Hc9iCoBrey5gJ+06Y+FH8UknrvUX
	rRdJki1E=
X-Gm-Gg: Acq92OHPI9gMmA24I6i1Je+GkH1LTPFyxMlLqHqpeEfp0XI0IgmEZ2H0PhFPisgHSyB
	AOJuw7Trju1NDDEVOccmax4ifTOa8pYvNZW1lMnrziqsj0ZzXDI9/YRwg/vyc7MTdB21708TEfq
	PMYhFs9eyQqy3Cjg/Hv5k4qvGnockb9Goa3nZ1hN8PD7bJnVcvc+W9goqmUxTIl4YoR5Kgv/p8R
	SjI2j4P/P9bNSDK/GjvMP3feDl0Y0s4vy4Lick98fNAJuX5MkyvjyOotjOCsOKKf5VXLX+SJt6T
	b4fDqetXI33eE+4vGANEkmnl3xdWa2BPxAMMWw7v9Uuu6/87o4pqhPENwCEmbssXCHcK/zZLb19
	mPxGQ2RX4NEZ/tg8Zob22lktGscCUzbFsWzxDU8Ap3eSfiG6NJzPOfNRJux4emEGNI5p5mepDkS
	ML/IMCdbuURS4JwY3xDdf16uIvNZX0vSmcjmraJWfa8jIBvuBBIJ5KM3d00azHPmsT/0lr
X-Received: by 2002:a17:906:c394:b0:bc5:cff4:8e3c with SMTP id a640c23a62f3a-bc5cff4af34mr446060566b.40.1778226282237;
        Fri, 08 May 2026 00:44:42 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac43581bfsm42651566b.46.2026.05.08.00.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 09:44:41 +0200
Message-Id: <DID4LW3GMLDV.338VDV2L2IPL@fairphone.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Add Novatek NT37705
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Conor Dooley" <conor@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-1-e09cb05651cc@fairphone.com>
 <20260501-yogurt-wise-2a2884e3ec59@spud>
 <DI9XL1VYYTY7.19IRSM8VIDO53@fairphone.com>
 <a2444df4-abf1-4b56-8556-7efb238bc677@kernel.org>
 <DIAJCURQ37FA.1CNEKX6QM6ZO8@fairphone.com>
 <dd7ebb25-014c-4983-ae31-6a6cbd24e628@kernel.org>
In-Reply-To: <dd7ebb25-014c-4983-ae31-6a6cbd24e628@kernel.org>

Hi Krzysztof,

On Tue May 5, 2026 at 9:25 AM CEST, Krzysztof Kozlowski wrote:
> On 05/05/2026 08:40, Luca Weiss wrote:
>>>>>> +  compatible:
>>>>>> +    contains:
>>>>>> +      const: boe,bj631jhm-t71-d900
>>>>>
>>>>> Compatible doesn't match the filename, nor does the commit message ma=
tch
>>>>> what you've got here. Sounds like you're missing a fallback to
>>>>> $filename.
>>>>
>>>> The last times I was upstreaming panel drivers (Feb 2024 and June 2025=
),
>>>> this was the requested way of doing things.
>>>
>>> So this was requested that time and is requested now. What is here
>>> uncertain?
>>>
>>>>
>>>> Compatible being the company and model number making the actual panel
>>>> assembly (driver IC + touchscreen + glass etc), while the rest being
>>>> named after the driver IC manufacturer & number.
>>>
>>> So exactly what was asked for...
>>=20
>> I don't quite understand what is asked for now, that's my issue.
>>=20
>> 1. Change the filename to boe,bj631jhm-t71-d900.yaml and leave the rest
>>    as-is.
>>=20
>> 2. Add a fallback compatible for novatek,nt37705. IIRC last time it was
>>    argued that a "generic" nt37705 driver will never be correct for a
>>    specific panel since it's missing a bunch of panel-specific init. So
>>    that's why there should not be a fallback to nt37705.
>
> To my limited knowledge the (2) with fallback describing the specific IC
> is preferred, because that compatible although not currently usable is
> still specific and describes actual IC used. I imagine that such
> fallback still could be useful to some SW implementation to determine
> the IC and act based on that.
>
> If you have sources of other preference, please share, but I just gave
> same review to Neil for his ayaneo,wt0600-2k panels.

I found the discussion from 2024 for the Fairphone 4 panel:

https://lore.kernel.org/lkml/f9164049-6529-42c1-a35a-e91132c823b9@linaro.or=
g/

(quoting)

'''
  Not sure if "himax,hx83112a" is needed here, the "djn,9a-3r063-1102b"
  is enough to know the IC is hx83112a.

  I don't think you'll ever find a "djn,9a-3r063-1102b" with another
  controller IC ?

  And "himax,hx83112a" alone as fallback is not enough to describe the
  panel hardware, so I think it should be dropped.
'''

With Konrad replying "+1" to that.

Regards
Luca
