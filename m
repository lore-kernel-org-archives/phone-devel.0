Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67F945563A
	for <phone-devel@vger.kernel.org>; Mon,  5 Oct 2026 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193007; cv=none; b=rN5mo0VI11E/8KwExeqMttTXl8FphzQnP+XXjiEotqwbHPVh27p84/1LfJZ/s5r5pQaR0Hs06xHnpdFi9+AweLjPBcIJvnJKMjw7YGtoQdaiOiXclizLjxmQSMHG0X+Q7c8sRM0P4J/wwqDjQw/iwImOErSQp6mJJ1Qzm+MfAJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193007; c=relaxed/simple;
	bh=oNudNf9KGgKm6/8USlLHbXpH2Kr7BGPq6A+ZyfzohhA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=YR2rjT11GCVGnaxYY9D6MhY8yjv6eRA62fi32eRZdJwi0x4cOE9R95pfhqRQMxhWNNlqR12bUuOL+s9a9NK7S9k8MUCD9TsymXeS8LQE8S1ZDcSM9HWerm6+3YWvEyLNqBuhgs5bznSZuXzOgeCDwt97y7Lw556U9so1o89IvNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TiBJc0D8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TiBJc0D8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afe75f055so1266575f8f.2
        for <phone-devel@vger.kernel.org>; Mon, 05 Oct 2026 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791192997; x=1791797797; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BITV0xN/Wyix+y3zSS4utGAF8MX+E4pjWeLeeUY9W7s=;
        b=TiBJc0D8+P0GUQK1oTX2XjFtS4UUxChMNEjX9Nsxx2KNEcpBecAeGNjsrnp4JgSlof
         4vqu1YA6tsVd0RvyIVTfSYEX9gXofr6HpiKnw6B8kmZw970uqCyb0j1htSj8VaTVwAjI
         ZekqJyw14kfhlynPZI0QEQGb60J8F3e9mTeTugSSMXIZ18PIhb9A3mmMPe0251LaVsJb
         3GxfC/leL4LgJTeMxker1HwI+62jzYnP9TIr1j6NbFT2PdzuCMnvxPP/n35JSwac8p84
         2wcP4kGnEk34tL2Ug9zOi1QgaJ8M1flvJGyDY/EODaKjZ4WaNJHffZb1cKxmDDGMElMl
         Bpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192997; x=1791797797;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BITV0xN/Wyix+y3zSS4utGAF8MX+E4pjWeLeeUY9W7s=;
        b=jQrpUuAsmkVR3Q9ybgz8hPLNQ9ycx1EjoAYP6zrwj6gZGMA2m5H0aEQX8rreBA2sDR
         otTFXNOxRh9m0HFkvTu2ZsmBKmMLeOoV7cRwqw0Km0Zb/dhm30CZIvRp/oHbiw5RKvvF
         yY9eUIVNctkev2hLVjZO92nLzZBrdG3fnP8zEUKeagtscl7+R9iJ6c4R26trtMkMQGNu
         b26m0GroDEawSZSq52E5QmdOx0oMT63cg12+qid6hqRs8TZ8bpaX/uxepaAnv3HNlmY4
         44ALoAYhr+J5+FjybJ9P+KF/VEVm8OeFusEXITwc9oJXTTR9Y+k7B2CtCygyQGnehl8W
         9MUQ==
X-Forwarded-Encrypted: i=1; AKwUvByvFtaBRAKvWbP5Fw/7ZKlyEBeDNAArCvKGjTQD61ftkU7oCm15MPviS++QEaKqLXDZOoZ26ycqoDnSug==@vger.kernel.org
X-Gm-Message-State: AFq9FYJc13lgQa7Oi2DKNM4HGHvqcJo2B3hHDjfpArcf3rKkzmhGFtRY
	6Oo5O/cYEzaFtfDOY/RwFEgbm9+MKTAMWw2DjETyrjfRRkaSuoRlYXBNrYc4f3/3TFg=
X-Gm-Gg: AYBFou3EuQ+JQqwduDQaJHitJx69LWNEl3t5ayUqgkm0ZQL44ByHXdDsuNPQcCf+yKH
	EkSQ+Oj8DAt2CM1xYYLPoWjZ3qAXYVrlBNNKPbt5uZfmBGBds+UV2YQL1LMvAf4WJnuoN6aGd6r
	RWukTq4PBA5SL3cXTtLTYVEm+sZg+Q3L0QMD2/Io0hM6+0h/ZEOs2kK4RsTjEQhmrFxnvBPU25H
	bJubm4HdtDFhnMFLoh9MbiDmYeXf1atLcS3/LrHaklkI/GIS7+G2Hxp9tlcXOADX8awUHmaZvE1
	QvzZuYk0Vhtw0vMXzZ/AApzNl1nsbSmp30o4VnaQMPEg+anzfuhsFmtMnTLU9zU9Pg7Hdgdrfdt
	Doz66Q2Zrz2srlmcWSzum4q7RJD7xru5vFiyvG4UDDUCZ7MkITdxb+ltF4j+Uuf4YSolYXorcIJ
	x7qoD7fydu7wdf3pqdCQb0KBujyuV6WIhjN2v/gfDXO6qHKV42GeO4bzhhiyJ7RvdYIqhq
X-Received: by 2002:a05:6000:2212:b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48c47ffa3f3mr10798541f8f.44.1791192997141;
        Mon, 05 Oct 2026 02:36:37 -0700 (PDT)
Received: from localhost ([41.66.99.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ad2f9sm2391478f8f.38.2026.10.05.02.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 11:36:34 +0200
Message-Id: <DLWSX9ZHDC8K.1KXUAR8VSMNND@fairphone.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: panel: himax,hx83112b:
 Tighten compatible matching
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Luca Weiss" <luca@lucaweiss.eu>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com> <20261002-hx83112-compatible-contains-v1-2-d558635ab7fc@fairphone.com>
In-Reply-To: <20261002-hx83112-compatible-contains-v1-2-d558635ab7fc@fairphone.com>

On Fri Oct 2, 2026 at 4:49 PM CEST, Luca Weiss wrote:
> The compatible was defined too wide, we just want "djn,98-03057-6598b-i"
> and nothing else.

Fixes: 54bd1390e984 ("dt-bindings: display: panel: Add Himax HX83112B")

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml | 3 =
+--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8311=
2b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.ya=
ml
> index e58bb3d45331..34e97003d293 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> @@ -18,8 +18,7 @@ allOf:
> =20
>  properties:
>    compatible:
> -    contains:
> -      const: djn,98-03057-6598b-i
> +    const: djn,98-03057-6598b-i
> =20
>    reg:
>      maxItems: 1


