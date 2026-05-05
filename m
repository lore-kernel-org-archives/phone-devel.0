Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C57D3AEF51
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 06:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963222; cv=none; b=RmqLz6XRrw1DtQkeeZyFc5mOa8yN5QTg5wextYmi8t62BR9d71VxEctdBm/cPHeFzrK0plZQs2u4s/6tQCj8Zfdw2i+ozOGWdq6kbprwH7EmW6VAWzt00/qhtaLjdU9TJdvuz9wBdL12e9UNhs4DfhoTA1RkiWyTxvNdX82LjoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963222; c=relaxed/simple;
	bh=Oisny6SnkrUNZeLcjZJ1jSrF2FlNzVUV1uHu+sxvunw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Fy5yVX5DYRLuBX3r5Kpc6pgJ53ItDt2cZY2Z1fO6cDzySzBakmYNj7Q6hFuSGOR2E4vg6pOgWHSkKGo/l56i4lG+PDCYO+p0qG5bbagvYtX7GAI41WAy9+2ek/mns8LKEY7adVaHg0kXOxOTM9sW02Vf+uESjnCIgcs/7KAfcGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QYBWBLdT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QYBWBLdT"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a044cb827so3322094f8f.0
        for <phone-devel@vger.kernel.org>; Mon, 04 May 2026 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777963219; x=1778568019; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6FO20EYGAs2fwB6e1zerXDAb7NyQnTU9vNFbNdbR+I=;
        b=QYBWBLdTfedPzOyEpb+4TsW561mAJnZ5UzZ5i4FuxC6CgwddN3Qmx0ot+cQEw1R4Qo
         8k9VeoQz6CPIGqwwzGwk7fMrNzANKz0Plffrx/np+Wkq7xXFCVIPhX9SC+WrflrhHgog
         hjyz6D/i4loWZn02h3APfjl7nQ69lchXmP5XAwAiwbLQBZQpOCXvEkh8+zU+mYmx8Nhf
         d5MA4fbgUTkyhbpgLQUDgOnb0LzBacDGVTBmTMbSyo5qhBHhhpR9rs/06YgXOiM3s4ZE
         c4GuKHzp1RGacN9/c7ryfyd9jVreRFqnK8pSRB7Y3wtxoE07my5gqi6k59nYP9T8hdMr
         mv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777963219; x=1778568019;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6FO20EYGAs2fwB6e1zerXDAb7NyQnTU9vNFbNdbR+I=;
        b=qyuEt+Wme/MpXAIP7bz9Jq64kYWj334kj8jr1Y1URkMEz2Tj5RBNx0tKSzMNEHOIiQ
         /fx4KMbMj/5PfvTpnj17wrWOaVrXfLJU0n7dIzu15WnYRApJTX48TNkb3xSbYknNm2mU
         K/W4F/qz/CbKUSrbJAynlxjcKoMJ21cA8H7yYZ4PiVIlL9JzIuz3kcL2yg9FPRyty4rn
         OLGCczHzinyJKq5h5Yvd2MyqgKZZU/ucBnZadSBbbCfNXO4WpM3A8q/Tu++GacoDR6pJ
         86Gfu0Kz2/q73R3d6maYmvz/KUDDjZyRMCEgyR5rdaXf+ZCPPOzF6Zu7fHd9D5YVoLet
         Y5HQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JPHQ336sTrUs8/mUD5lwvEFdURb8IIxcTxqbsj/OQHorLNwX2UwD0v2mAaTgae52VJ0y0C1wcDdEaMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVB1qS1tyv+TJm/Ov7dp6U3Bny28VfNRFYi745fZJZGSRYs6Pi
	JLrV1segSIFpLPXfBO4G3JHEAqBXAXEgGPGHcTqxCTpurcHgHOKvr2NNOuZ/qtQGlXQ=
X-Gm-Gg: AeBDietO9M8CK+BbMJm6pzlCQ1lnN/M9yU5IMezEfM2/sLsz7iK+IA8s/D1NZBc6LnJ
	glOcH23VTACtR5uOTUU/2Iul3F7dkG8H6FafX7baNULc/idaSzNHvCrC0LWgSq4LB+nIYyijDoe
	xI1UL0G/LDFk5e5E1o0/YpCgtfq5sinPkg5qOpAqQ9Wo21AB4xmIRWqzV9mdzy5bRwt2epJZ8a2
	nP3oE6dyToYQ8D4dCONlwb9p+dlN5lO1LshIhMT6EDGwTRyxWuT7VHmc7yswEGYs+7GQksW9k/+
	uJaT5k12SrMCty/VrIBNNrDDXH0mu6PMdfkQg2Z3LvLVkYLOSkTqmwDyV/6xG8WvFBEC+5qLzH+
	QIQ1x2hSzppJAuaFCZ+2XtHew8V854bn0LKpUcgmHJjF0nci/ucZTyh+NRx+s+3oRke79RAXMyN
	r14uOrNfKP8dA2MXO7DjgEPDGcNm+ZMyEQzedEOeY=
X-Received: by 2002:a05:6000:2001:b0:441:377f:82a7 with SMTP id ffacd0b85a97d-44bb6d95a09mr22079695f8f.32.1777963218742;
        Mon, 04 May 2026 23:40:18 -0700 (PDT)
Received: from localhost ([213.208.155.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm2083055f8f.32.2026.05.04.23.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 23:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 08:40:09 +0200
Message-Id: <DIAJCURQ37FA.1CNEKX6QM6ZO8@fairphone.com>
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
In-Reply-To: <a2444df4-abf1-4b56-8556-7efb238bc677@kernel.org>

Hi Krzysztof,

On Mon May 4, 2026 at 10:45 PM CEST, Krzysztof Kozlowski wrote:
> On 04/05/2026 15:36, Luca Weiss wrote:
>> Hi Conor,
>>=20
>> On Fri May 1, 2026 at 5:51 PM CEST, Conor Dooley wrote:
>>> On Fri, May 01, 2026 at 03:52:45PM +0200, Luca Weiss wrote:
>>>> Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels=
.
>>>>
>>>> Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
>>>> from BOE) using it.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  .../bindings/display/panel/novatek,nt37705.yaml    | 72 +++++++++++++=
+++++++++
>>>>  1 file changed, 72 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,n=
t37705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt377=
05.yaml
>>>> new file mode 100644
>>>> index 000000000000..1c796599f6fc
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.=
yaml
>>>> @@ -0,0 +1,72 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml=
#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Novatek NT37705-based DSI display panels
>>>> +
>>>> +maintainers:
>>>> +  - Luca Weiss <luca.weiss@fairphone.com>
>>>> +
>>>> +description:
>>>> +  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLE=
D panels.
>>>> +
>>>> +allOf:
>>>> +  - $ref: panel-common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    contains:
>>>> +      const: boe,bj631jhm-t71-d900
>>>
>>> Compatible doesn't match the filename, nor does the commit message matc=
h
>>> what you've got here. Sounds like you're missing a fallback to
>>> $filename.
>>=20
>> The last times I was upstreaming panel drivers (Feb 2024 and June 2025),
>> this was the requested way of doing things.
>
> So this was requested that time and is requested now. What is here
> uncertain?
>
>>=20
>> Compatible being the company and model number making the actual panel
>> assembly (driver IC + touchscreen + glass etc), while the rest being
>> named after the driver IC manufacturer & number.
>
> So exactly what was asked for...

I don't quite understand what is asked for now, that's my issue.

1. Change the filename to boe,bj631jhm-t71-d900.yaml and leave the rest
   as-is.

2. Add a fallback compatible for novatek,nt37705. IIRC last time it was
   argued that a "generic" nt37705 driver will never be correct for a
   specific panel since it's missing a bunch of panel-specific init. So
   that's why there should not be a fallback to nt37705.

Either way, it's different to what I was working on with the two
examples I gave. Please help to clarify.

Regards
Luca

>> As seen in
>> * himax,hx83112b + djn,98-03057-6598b-i (Fairphone 3)
>> * himax,hx83112a + djn,9a-3r063-1102b (Fairphone 4)
>>=20
>> Fairphone 5 panel (raydium,rm692e5) was upstreamed earlier and follows
>> different naming.
