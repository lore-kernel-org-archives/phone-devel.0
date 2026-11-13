Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537618;
	b=L+djNahqPwu6rUAznXOoyqN7W1Dehlq5C+pRuc+dCL8HB7ly1SPFL35cTDJduM/RpwH6
	 CEO7hfbeZkQrhv3JtFGsWxQhN5eR/aCkZC/fI8yPHt2xElqst7JEPo6PvtvVX5xH013ID
	 SSdi/pPhOkaerU50fd33MjQg2lw+ScCCB6VTxqkeINB9K9wVwMeQk2I2UoUTUZIQim3IG
	 yi1zk5lF94m7v8MAjpEOyz+N5cxGEHxCJKivRf5+dZ1anmMeNDYQxQrKQk3iSA8DUbLdB
	 U6WbXg+9/yMRnJSAIWqrU+ieYwfIjqdRstmhdfwpi5bTNV8tPaXFXYB43//3VnZpr3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=CPwtUJVd7keNZw6evxXk+bPw16MkL52vmivrbbfL9hc=;
	b=zzZ9jJjfOGTWAbi9Crb8XcSZ74RFIhIuRIAJCxa0gB1uS0D/GM8e8qUGHfZuSHczy31H
	 xJTKxj8nwakFCIywGald3jlUyXIlmhIjfDUtYnojBvlv5W16jf9HDCB4XD2KqsD+mUfdv
	 5/VGMIMYQtJRRBPgBxsgut8qr0LHGLPUBb5pAwHKT6YWYyUG4kpuxBp3LLL5vuGfFUtPI
	 1fYH8wDMxnUfL5bg1+FkBzqSDzLB+5ZVIjS4yQDRe3bVwfTyGrIlQCUsS9auZD9FN/kWf
	 dzcRova4OoLLkR/ieK6qe6JdPeb9Q+dNYO8Dow7nt35liTYLWAmtcTjVwcL9N9t0Ukw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0ityr8n;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541C0606A321
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 02:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 541C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0ityr8n
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1019021eec.0
        for <phone-devel@vger.kernel.org>; Thu, 12 Nov 2026 18:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537617; x=1795142417; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPwtUJVd7keNZw6evxXk+bPw16MkL52vmivrbbfL9hc=;
        b=y0ityr8nb+mOQyp4/fPEF9+zrJG6mgmdmpJv+Y93RzqZgid2J4tuXTgbIDQdJRgjiJ
         iETDR9u8/s60tJn6y6BcQlC3fAO5D1xyLBbqiXRNIYv6pEdc6PiYfSLXcgUJeRB0JLmk
         s789SYVpcm7+tqlu2p8MiJe0GmTEhIF6xEowEBYim5RlIEIIhlxXhwUW6MvYKp8XxJfO
         zZ9TrsY+3I4ltn5yxgxHQddQvAUtBPOLbVR0N0N3RoiLRa56cnSiXTTJUnR4DBe6H7vM
         YggFCmdVHMUZ5/NRTBbRwKBO6fQjp4+LNS6Ke3jkuC6E3TAX9ceVcdCF4KDiOgXgDkON
         P25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537617; x=1795142417;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CPwtUJVd7keNZw6evxXk+bPw16MkL52vmivrbbfL9hc=;
        b=eSKlebs5laBA6g2HknzA+gGwXsGm8gUru16WohXHFl+OdEf8hElH/y6P4s3Bcefx0v
         GfTEBBi39T0aMq3CkjSCDR6citjNpLHauV9RXeM9zulcMKXXkxF/WIvO6lNkYSPrNRUg
         tWK1ETIbpKxOGd58kYbeuRkdIBxTAn/Om7IhuO6dhmax5wqbZz/aurRkYS2DvPjjPh30
         NmsHTgRycqVcdG2JKNoAyQbar9/bDm/80fhN/hx55FMWBL7ls7aGCn70PYpKMp3sRT/H
         G1fJ1frVPNBlHRti3eR6zh7lVKwRq0W0sSgEYNybefr9NJVGpQ3X+8gFcoKYNGdWReo8
         MF3w==
X-Forwarded-Encrypted: i=1; AL+hErEww/pREWf522y7Q9sbUQQ7atxr0xbdVFaK5yguCzAQtLPQkpELR+hyro+peGzB0yGNp3BZzviLJM3OKw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5nByDYq7muudCVtAvcAcwGubLCrLKQGqJFMXPHCa4qcTewzRQ
	R87eiBMPDLOkXetY0lckm9DkMHeWRucUdpvjrcFbEdfzOBDunb9mHKOg
X-Gm-Gg: AYBFou0k/vLImtWWvg7CRuLkwge847t3T9dmV1Cj4f5ARDhqyhsYCKdN5AbJXxeTc0D
	4lpFuMCfKnXnxStSx7mfXJ2nlegvNoI9cVQaRf4mYzom7PRyYm/rly4WXBY0OcD3jm3/yvj+w7S
	lA3oC5Dvs62ExIrvAca4XMF9e5/TNVBGue+Ptuw5+obNXSQEDtvwyGC24b5SU0bJztf2LfkTti4
	NI+oWPPGT+r45PEAZ5OhByCih91uz41i9euNiZ5DqosqBwVOfUZi7kR194cZer6sk9Yc//nNqpp
	Nrmc0kKZq13/XlwaRd8FMNxz2M7Upneb6D9YkQrreHWXquA1POPebW/qdNiQBmSGGKL5WB4FwgO
	YeViNQOv+1hoive4J/UlmatxvLCzAQmZUtz8rn8Jg2cRQJJ+bQTiKkTQGn/6LTwK62qBtYuEGAT
	rHQS6kTdRxwwuIpn2iCVOPA51a1zdo/eNMotz/saNmPtlEpUlnUvN0udyvt6i3QjO2yWiuJvUvD
	LSRJ80aDkDI87rhwM/Mb8a2ucrmaopXZKPBM47TXb776VmamHZB6B5WDTJ6ADLilUHYEaOI/6SS
	Q/trEF0p1o6r7fNvcqRljDGRK1e17M1JqbG/8//9Yuj1hAt88KczV4ciJBfUr0bm62RPjQ==
X-Received: by 2002:a05:693c:835c:20b0:375:e4de:96d3 with SMTP id 5a478bee46e88-3796721dfb7mr971406eec.31.1794537617110;
        Thu, 12 Nov 2026 18:40:17 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm3949197eec.20.2026.11.12.18.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:40:16 -0800 (PST)
Date: Thu, 12 Nov 2026 18:40:15 -0800
Message-ID: <1222b26cfe220b4a9a77ccb8ce82fd35@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aelin Reidel <aelin@mainlining.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/3] dt-bindings: input: document Goodix GTX8 Touchscreen ICs
In-Reply-To: <20260228-gtx8-v2-1-3a408c365f6c@mainlining.org>
References: <20260228-gtx8-v2-0-3a408c365f6c@mainlining.org> <20260228-gtx8-v2-1-3a408c365f6c@mainlining.org>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Aelin,

On Sat, Feb 28, 2026 at 02:56:10AM +0100, Aelin Reidel wrote:
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6307495c2746313cfc32cdbb701455d1596be435
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml
> @@ -0,0 +1,71 @@
...
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - goodix,gt9886
> +      - goodix,gt9896
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply regulator on AVDD pin
> +
> +  vddio-supply:
> +    description: power supply regulator on VDDIO pin
> +
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-swapped-x-y: true
> +
> +additionalProperties: false

Could this use unevaluatedProperties: false instead of listing a subset
of touchscreen-* properties and setting additionalProperties: false?
That way other standard touchscreen.yaml properties supported by
touchscreen_parse_properties() (such as touchscreen-x-mm,
touchscreen-y-mm, touchscreen-fuzz-x, touchscreen-fuzz-y) can be used as
well.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - avdd-supply
> +  - touchscreen-size-x
> +  - touchscreen-size-y

Why is avdd-supply required while vddio-supply is optional (given that
the IC requires both rails and the driver calls devm_regulator_get() for
both)? Also, are touchscreen-size-x and touchscreen-size-y truly
required if the controller firmware already knows the panel resolution?

Thanks.

-- 
Dmitry
