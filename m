Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C9E3D47C1
	for <phone-devel@vger.kernel.org>; Mon,  4 May 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777901794; cv=none; b=E/+fAnqK41cSLh8ABGeROIGZFJL3PrHbLO1vTkrRWeEIBWqGHMdcVV1G6e4iJzYtF63vNHj2phalpsFGd2gHzbXfGpFYozySxVCQP0oWtiU5isnxWDy3V6r8nCPiMEit4TuwCgTRAyqs24BYuJaguRboOsVwWX3TQDbnhj/68ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777901794; c=relaxed/simple;
	bh=VzGeyGQbSF70bdcGHoU4CptP9q5WGSOi8Lk1b8r4k/A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JRj5XLBtqb00FQIv7mAkcF4wvBhPZvw6G4VHd798opZl1fUP5TfAuxo2O2nVq4MNNgb7MWZTcxBHI3wRJxok60HT8Y0EUajz7vj5a+r14XoSRY5k1vEU/htN+wyjcLvAKQQscO84r15f8o2i6BEB2IBV2RDBV3tCxC1WCfRX5wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vIdT+Ttd; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vIdT+Ttd"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b93698bb57aso769932766b.0
        for <phone-devel@vger.kernel.org>; Mon, 04 May 2026 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777901791; x=1778506591; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxl8aaXII9jrd89JJtrtzoxkaO727e2zu5aa5KJCGNY=;
        b=vIdT+Ttdt5EYlT8ppELuFyQ2sl/9vxh6NMwRBSGDTQvQMPN8YXCspgPbv9Zq0zCt/t
         fPOSaDFjhlM6R/PJd1V0vXGmflgdXOv4j7rJW+cCXdpm0mSvuq77mfsG6CDSy2QG/ixQ
         TVP7Z4lAKkdtzETLL7J2lQCZvrXj4gTzTMiz8sbQsbiIRjgIkVKiZAaPRO0HajWil65i
         +CAxpeqmB7mqv0fZOzNZMxcMPry85un+WwkkOyktEOz2hegL+6hRyYrB6Ju/FexfbI10
         2drf5HrQ6ccMfbMsj3nr/VmX5UAfD7pYm3nh1LT+5Q/QpdgA9XnkUQ/EqGBzj5rIif9l
         bkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777901791; x=1778506591;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zxl8aaXII9jrd89JJtrtzoxkaO727e2zu5aa5KJCGNY=;
        b=M0cdj1iFAHwov7fHGLAmPyUMhd+P9Zw6KCTJj5tdhZHu+d7+owJ3UxOkFU1+98r645
         J695In/Lj/LbrAUi5R0eo0Ja0ppMGFYUhntZG0ZHioNioariBJPrLSR3NYV24HigfXss
         z4/2btRYsZR+eOMcw+y1HMkn4mSNhUHRvfjeiEWR/ts5noweu/Dq7yofCyX1LnyI7Y58
         baVGwrvvucVrA7r29pDaLIWMKV6dZZK32fT8RX3r8zppBb1x3ayBktG5c0l++Bdi2o47
         7EhP2xRwWrYzP+B/1ix8NlZpzmt3AawVOeIuD134RXez7VNuLHCok+2X8maUQ4JXfHLr
         5Wbg==
X-Forwarded-Encrypted: i=1; AFNElJ8q2+T1XrfHCyJ/rqJA8fpCa0l9l8BYYmtMUX5GC1Ubzbb6KpxOEBvqPMyTbLtlMT5nkmabf8qJ5QiwOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSbSyIwteRQofsRscS1PgKTXNDRIyMFzKZB6CN2oZejJe8n87W
	pE+yQNPokX98TqsgPZJebGEKgMkKptVTA+fCGEduWLukuFVaqJdnO7DziNrCkBpxgkY=
X-Gm-Gg: AeBDiesXlQGWJQt07B768k6NJGojF17V+KtC9ZtUDEND9lZoj7WOn2/uyyhxjNlMX9g
	1hcpvR5w3nM3LIziMlxIc6EET6WZepYIbDMgLX+QmHB3i3SgUUbELOe3LDOODogLHcIGAIuMmbb
	srbN8aa8rqzxOsKqhtb3TD0MKLYhpupYOf64tq8jlprLf0uyCwobZ0Z195nYMzgGdDifDSK77X9
	7+sGQHIbCzx0U/aO5xKwYwaXthHpA+gAYqHGY8gwoU+PKDcSasEZdjmqXW+5td+zOm20cF47Quz
	CDZgrHlsqdYgk2oFZKPkQPkBiQUNIiKWJU7lOx2lSdxob895tum/8S4WHTVLuTlo2d0cdMmzR3t
	0ptghSUCW3wRMjVoPE8ld4O1Cf1utXtT9c+HFcRHjioCY6TCHH+TzXqR9MNgoagxZbLP/MbEEV6
	8g2v+sijxB13ctwNm0D0AwfKeZAdwvV1j4Vvc2/z4UAZeJiFGyIOfOkD1GNIKBu58L8eBx3OZJd
	ezDLu0=
X-Received: by 2002:a17:907:1c9c:b0:bc3:5f51:7a3 with SMTP id a640c23a62f3a-bc35f5107f2mr72609466b.16.1777901790709;
        Mon, 04 May 2026 06:36:30 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1ad2d59fcsm151369766b.45.2026.05.04.06.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 15:36:27 +0200
Message-Id: <DI9XL1VYYTY7.19IRSM8VIDO53@fairphone.com>
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
To: "Conor Dooley" <conor@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-1-e09cb05651cc@fairphone.com>
 <20260501-yogurt-wise-2a2884e3ec59@spud>
In-Reply-To: <20260501-yogurt-wise-2a2884e3ec59@spud>

Hi Conor,

On Fri May 1, 2026 at 5:51 PM CEST, Conor Dooley wrote:
> On Fri, May 01, 2026 at 03:52:45PM +0200, Luca Weiss wrote:
>> Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.
>>=20
>> Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
>> from BOE) using it.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../bindings/display/panel/novatek,nt37705.yaml    | 72 +++++++++++++++=
+++++++
>>  1 file changed, 72 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt3=
7705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705=
.yaml
>> new file mode 100644
>> index 000000000000..1c796599f6fc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.ya=
ml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Novatek NT37705-based DSI display panels
>> +
>> +maintainers:
>> +  - Luca Weiss <luca.weiss@fairphone.com>
>> +
>> +description:
>> +  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED =
panels.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: boe,bj631jhm-t71-d900
>
> Compatible doesn't match the filename, nor does the commit message match
> what you've got here. Sounds like you're missing a fallback to
> $filename.

The last times I was upstreaming panel drivers (Feb 2024 and June 2025),
this was the requested way of doing things.

Compatible being the company and model number making the actual panel
assembly (driver IC + touchscreen + glass etc), while the rest being
named after the driver IC manufacturer & number.

As seen in
* himax,hx83112b + djn,98-03057-6598b-i (Fairphone 3)
* himax,hx83112a + djn,9a-3r063-1102b (Fairphone 4)

Fairphone 5 panel (raydium,rm692e5) was upstreamed earlier and follows
different naming.

Has the way of doing things changed since then?

Regards
Luca
