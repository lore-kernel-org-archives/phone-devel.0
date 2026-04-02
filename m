Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661773E022B
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132702; cv=none; b=IgS14AoDVT/CIb+iWU4xgqIHtyUQXdxxbCsAn61RyK+hM5BHoNE25TaWSJ2IGLGt0CaRb0eRBK5YXamq49Bqe44qz92dgyd/aRDOZRsiovFJ0aH4ACBkdFLcuG5PNZOuUOu+rzVun9OXlinBxPysJvdnDp4LMJWK+1v+17ZM/lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132702; c=relaxed/simple;
	bh=VFq9AWUrc9CcWHC7ojF6xOAibaAgS5IkinF3nAaUdvg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=PhaxsZRTNPoXDcMiSmBEeN3png8nSEMo/QcM6RMex38LAqFpZ+NB103IId9JgirwWEOROjmMS/iTUKnfA49kMMlx5dNdqCyGOIiDQ4WVSdOyMO1Yd7Ksor8BSOAajmd5oX8SHGuiKYf5aMo6Lu3Ezott9eFiSCPaQknfVINkvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fI58aKgq; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fI58aKgq"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66b2f6e983bso1359925a12.0
        for <phone-devel@vger.kernel.org>; Thu, 02 Apr 2026 05:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775132699; x=1775737499; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV57QUhm1LJKEL7ZZkpUHcm6gesGlh2s479uzYXuMeM=;
        b=fI58aKgq/aSY+7Z0jlFsYNSi0x5D4tu+9WTXceYNuambD3bAFsdlKg+qirj7dcEuts
         2v6YPKNa8OvP4Q7GCGxf1TuI4QzsFq80O3AaW6VRUSXcLv+fbSOX1mrYLq1I1n2OffSm
         LRO/YU1TqqOJH/j7lTGWNq3X1VFAE7eJdX+gYbcZT7u1iKu+PeWoeWkywwQor1wOf2Pa
         Cr9P09ugasZw5iSDqQbL3uNM9akYymOkgikzPomeRz7eP19/hAg/jeGdQLSXplIWEq+Z
         vLGF0FQMrG26vj1ZdGrZUHWBi3QhQRgaNZjHYftVLgAVAckyxfvkfX+XqpNcpjpD1rJP
         33Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132699; x=1775737499;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kV57QUhm1LJKEL7ZZkpUHcm6gesGlh2s479uzYXuMeM=;
        b=rYfIZGMzHN+Nqt5vzsyJv4I1b3dmCEgn9qI+YDjqZg2xBg9OlPRtZ9l+746k35r+8P
         LwgqgxiX9Bm6rcMfXFQa4df690gAwwx6KWtcMoZ4mvsSdo7cNMGJXbBIYY418a27RX4C
         uEZG2q7uGe9616ybPjlWSUYWSfv1GRmMsfXS4osteeeb+EN4tHdm0Vzj7Pf2+INjy2lv
         q4E8hWbauNsv5rw50dXrHAGvgRb74AEzZAigQ5UiCYUxqw0u1fPreC2V7USshdzjnINA
         pI0JAujN9rTrX3H32EdIibZIWbtfrbP5cQ/5caVyhvD53qTt5Ug+m6kDFzExIJ9HflQS
         6i1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/5vS6Tm63nYVZZUsAKIYCCXoGmExccRmjsonoUewK9tAxLw8puUebekiAujcSl7xJFQ+V/xgyOPLw1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXcC0Fbw77IIEjqVufXTaVWdGZMU/c1HQJDXzYBYwcLpD642Eh
	V29AQnGH0owq1OIfTBxbjINmybU5P/uY5vjrTnazLNGnFG0hi/0VXt6xPwmqDdG7gbU=
X-Gm-Gg: ATEYQzzrULzpTTQzCtHcsGdZSQZmx4Xp8avbYHxf2BLFFhJOOQnK5yK6sAFvxv2qbNL
	Yl/JNKHd/CVZQ3bQKN4cLeRLJ0J1xDJWFxSK+iAEdUXD7FyaBUvjnrma61Ig3HpYuPI49Mn7eK8
	ZVbN1RChY7V445O7dZKcJhwiQ4hP0wUDOEz9c2ZNGpuVu6dUYjfR0oElvpoh5XDArKP5ZxVokJy
	qRYEt79HgfIJ9AvPQQB26jCvsoDB5ejaN99BUfx2IN5V5eyQ78iCy0e5aBhRzi+2l3FECyWT5p5
	TaDUAEtT90E+zhjCuYkA29pzeZ6OG+hTJjG5S60q6HxqOWFj26MhDHWH0v1ntxnLZNfbABuUZ5i
	sZ5zhOCA+jnkWvPeBz5YqXTvupL7STSdU6E7PZZI56+jdOJKYOwIwMHvMyIpFbbHKS+mndo7UtL
	rT1/0LjC0wkBYyAxzztYRovi6QlW23CwBtAMgrqyOZozkD/eck00OK1jG6XM4DsanxXxjfujnyS
	OY8Pv9uktNdLsJd8lCXrmKcfUqzESC+MYNAHJGxGW8NkK8=
X-Received: by 2002:a17:907:3895:b0:b97:c968:d9ba with SMTP id a640c23a62f3a-b9c1378f46emr488650466b.5.1775132699170;
        Thu, 02 Apr 2026 05:24:59 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec6esm82792766b.16.2026.04.02.05.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 05:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 14:24:57 +0200
Message-Id: <DHIO0VFBOHNX.381P06A2CRHAZ@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-1-00b09ee159a7@fairphone.com>
 <20260307-inventive-stingray-of-pride-5c2216@quoll>
 <768180d0-bab6-466f-9f5f-54b36f353bd6@kernel.org>
In-Reply-To: <768180d0-bab6-466f-9f5f-54b36f353bd6@kernel.org>

On Thu Apr 2, 2026 at 10:23 AM CEST, Krzysztof Kozlowski wrote:
> On 07/03/2026 16:30, Krzysztof Kozlowski wrote:
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,milos-gxclkctl
>>> +
>>> +  power-domains:
>>> +    description:
>>> +      Power domains required for the clock controller to operate
>>> +    items:
>>> +      - description: GFX power domain
>>> +      - description: GPUCC(CX) power domain
>>> +
>>> +  '#power-domain-cells':
>>> +    const: 1
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>=20
>> reg should be the second property, like you have it in "required" part.
>> I guess you copied it from kaanapali-gxclkctl.yaml, so lesson - qcom
>> bindings have acceptable quality, but not good enough to take as correct
>> starting point.
>>=20
>
> OTOH, why this entire binding cannot be squashed in Kaanapali one?
> What's the difference?

There's no GMXC power domain on Milos. Apart from that they're
compatible from a bindings perspective.

However it can re-use include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
because the GX_CLKCTL_GX_GDSC definition would be identical.

And also the driver (which can be used as-is) would be identical. In
that driver qcom,kaanapali-gxclkctl.h is used so it makes sense to keep
with the kaanapali header, or not? Making a qcom,milos-gxclkctl.h with
the same definition is not wanted?

Regards
Luca
