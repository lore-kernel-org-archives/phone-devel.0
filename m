Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001885;
	b=Lp/czmKq62KNoOIQ3Wb5aGLTGnWIfPldwRFe84PZ1H0r0G2kYn9nP4u8JarhdarILkzw
	 4gDcsXc47PRIz+iibXDjsOHvsNRrf5DOu+qORQfmB3dFNlQEWHC1T3vLUay/DeXz3lFbH
	 zD4roIy9A+TJiN/vavtDgI8xK2wq4zWS7MuIEj9wg9thgnZpn2r5KTo4gnPC42f4u5Y/k
	 2K85UTFzJErTx7hoOxD8utVAT5A7P7PxwmTI5iH5oJ2OOJT2Yqrmust72JfD4GbFvwpQg
	 J+antxcah+BHotwncPGDTGZx3bJsTPqPwg11iXob/48x1/eR0cG1Wfu/3d/m4bhdvyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
	b=BUGUEGEsFFoc1YYtxUGGy7YIrkeyEtEdBeqO62+58LGCksT4nkpByEFhZE4lKcW7X8e1
	 0zgyzQyZzZb4yYmte7IieclhCU1Maml7qsKhrKFZx52O05EoNttSteK2u8u4YzVSEcnJh
	 UVJKp7hdUf6ugzgE3+rcpcuBenQuWD6K607vx9PVDHBIGeVl8EkppkRMPW6r3lu0wZtNN
	 B8fHvUx8Woa23QsV8xAyMSHrt4PJ1/3KWus/VJHAzfb4CZ7TeD67W2CZznHRUAXTE0QDs
	 WRUKFW/5xBaa6sGE0ij+5du1p1evcoGLUUmRwFub9unGsv2H5qNJQQHnhxfOv2olD4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+7og4LC;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E099360A2610
	for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 11:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E099360A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+7og4LC
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b3b75aae4cso674923a91.2
        for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 03:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001884; x=1795606684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
        b=v+7og4LCpbgt8zqV0qGj5L5k9LpgFcD0H0EJlsFDgNHGtKS0F9k3naOHe+9i/2bWeK
         fPnCiGrJ1oREJ2+h9P6ZKwmoSXSZwgkiENGzo78/EZxbAgOUuY7qaBdPUhqxxdZAdfMn
         PINW7m5SL8HOai4MWvu+6qrQ3a3gdYcAWvU+dqtYCKFjQTTY/LjyJEp9BT2ogV+kY6jV
         wQwSCQwUH1MCU09yI/qoVnTqk+MsQEBxxK++4yao1W4KqJSdklyQ1POSzEjEu3h4QkPN
         R0NvlLmgEt57FkDf2isa3IkqaEuFkxQCgoorgkuw6Irqm5R4d5NvSZmko/MjOATcgF/l
         X1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001884; x=1795606684;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
        b=dyS+177k9OGJ6RQ0wgLKRdCafWaWkkF1ck2y0l7FjqYTR9by9SOarJ5CRyokmcH9zx
         cDqSuJbWIC3Z6698HGhV91Rw13jjvdUZD3Yiz3Qcs+YQHO14I69FIk/EW5D/I5L5Ik+2
         B20CDNo/VO4Z4127t/VDZAf/8Jp1uhgjFpNanEF9cTFtrpauP5wmJWLFqNRrWa+8tUIl
         NLncs0CcKcpZlQsDW0x64w5kIVvkQGqTQTB7gP5QBaJIPAUY3khrHFkIDqfRyBM7kAb8
         wJ11/uY3qYrO4noYkkWSV0uJV2FEX2AMpP8loh2kLP5kDE+N8BzRofkRi32LazAEcPq/
         1N+w==
X-Forwarded-Encrypted: i=1; AL+hErFBCID+g1e137y+90hUb1Iex0for+US7WOWAfdAmijR7jnr+TQmiTVg1mUL1W+P8dXYiIHfAm8SCapTzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8L5EvaYeYhAsQY5Au7//cwTgMraMAKgwRzST+IH4SdmlL7E+Wo
	cm47Y6du7rqpEhgmOpaMNu46wA2vDyOPsidACrVDd6Mc5x6jvOC56QwS
X-Gm-Gg: AZFdTZcDIIVtXPiphtiLcSmOBAIq6ODuNKIijPDBhTqb8vJFGJWRUKp1ztELkT4Wg8v
	8nfPjZIjZlSUNf7HDVkqonaQzBTTGP2q3NyOWDILtgJpELQxypphWvN5HLg+IwvC/ut3nZj8vJ3
	x6/nZNssbILvoC2XQzIGLEZPKUvh3tE9BQVLQIdye/VyNsgYkhfFMYXZl8dg+gT9jvXP2eTH19e
	4UIcSMxLuOKi4DS/fnd3R+2u7o42mS0UzhPVGjtGoRatQEuk5IgXfInruHD7nfqs6wGupI81NfX
	1N6iO6ZDNuJ9EhYAZaYpoh6OSgwYioqM3dMbZILMEPBTFySvmuCliOU10Lpw8MGv5oRyfB5wojf
	GlMpbyJSm2G1YqJkDkvQF6T0fRe1cLCvCEnKD09EbwiweQIAlOB6SjHpafPn2HhgN1zO/bv8OFv
	LQmTaXH1aMZb+CAfj0Uhu6Y4wRS2oc9KCwJ8KZc1jOrPgp7JdvsrpKETSsxYnb5q9lTTv/gykpS
	CtJaON4+NR2547m9qwSY2sOoceCN960tubBdayYWgsbicMHr2OH77GzLQJALf+bUw9vE4N6ArZX
	g7BC09QufWn5hFCmSqr7Q3u2IfjKZ5GpHXN5+2zEp8Rg5w4pDDF0RAJ8IXWbMF2HrKMj2Ainmx6
	R7MKIYxjc3XU=
X-Received: by 2002:a17:90b:5407:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b3d074d841mr2303560a91.15.1795001884103;
        Wed, 18 Nov 2026 03:38:04 -0800 (PST)
Received: from 1.tailnet.ftu ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac254ba6sm8950084a91.4.2026.11.18.03.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:38:03 -0800 (PST)
From: =?UTF-8?q?Tr=E1=BA=A7n=20Trung=20Nh=C3=A2n?= <nhan.094.vn@gmail.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy Note8
Date: Wed, 18 Nov 2026 18:37:19 +0700
Message-ID: <20261118113756.304373-1-nhan.094.vn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com> <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com> <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Peter,

On Wed, 18 Nov 2026 at 10:51, Peter Griffin <peter.griffin@linaro.org> wrote:
> Does the Samsung bootloader not pass a correctly populated memory node
> for the device? Or is this required because UniLoader doesn't pass
> along the memory node it received from the previous stage bootloader?

From what I can check here, it's a bit of both. S-Boot doesn't build
the memory node itself. It loads the DTB from the boot image it boots
(BOOT, or RECOVERY as in my test); it checks that a /memory node
exists, and only fills in the bank at 0x900000000
(reg = <0x9 0x0 0x80000000>) when it detects 6GB of DRAM. The other
three banks have to be in the DTB already. Samsung's own device tree
for this phone lists them and leaves the size of the fourth bank as 0
for S-Boot to fill in. From
arch/arm64/boot/dts/exynos/exynos8895-greatlte_common.dtsi in
Samsung's kernel source release for the Note8 (SM-N950F_PP_Opensource,
N950FXXSGDUG6, on opensource.samsung.com):

	memory@80000000 {
		device_type = "memory";
		reg = <0x0 0x80000000 0x3C800000>;
	};

	memory@C0000000 {
		device_type = "memory";
		reg = <0x0 0xC0000000 0x40000000>;
	};

	memory@880000000 {
		device_type = "memory";
		reg = <0x00000008 0x80000000 0x80000000>;
	};

	memory@900000000 {
		device_type = "memory";
		reg = <0x00000009 0x00000000 0x0>;
	};

The DTB in the stock SM-N950N BOOT image (N950NKSU5DZE2) has the same
four nodes.

S-Boot does the same on SM-N950F: the device tree fixups in its
N950FXXSGDUG6 bootloader are the same code as in the SM-N950N
N950NKSU5DZE2 one. Every Exynos Note8 ships with 6GB of RAM, so the
fourth bank is always filled in and the DTS doesn't need to differ
between them.

uniLoader then doesn't pass that DTB on. It boots the kernel with the
DTB linked into it and only adds the initrd properties to /chosen, so
nothing S-Boot wrote reaches the kernel and the memory node has to be in
the DTS. dreamlte and starlte do the same for the same reason.

btw, the name's Nhân; Trần is the family name, and if the convention is
to write first name first, I'd be pleased to adjust!

Thanks,
Nhân
