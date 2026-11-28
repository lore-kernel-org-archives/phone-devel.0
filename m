Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795840389;
	b=RI8oFWstf/CfIRJUHK1LvOLTvlDL5kKaK3PNmRQB0vDSIekNxGrBkVaXgzFqRP7doHwH
	 Fa3zNjoCgFBFTNt22te0gGUA7RTO0HtSrbvp2xxhKUQFKN7Duv7JfEg9uMqwuI6QlqVr5
	 8+sN0fr7r2mgomj/76vmN7gXbmpZ7yMXr/ajYkpQ7AlzZ+upUwOCxON/zTCoscNmW2Als
	 bSUe8mNLDbcu7y3452vYCRnNZKnon4MuqVmeevGKaZQgsnNyPJcfYOFzYM13qTNg3YtEW
	 ttwkNjr+6BsLp5NVT6EL56Q652fdzrz8hzE07mRcOcxMm8k053g/BZ4aifTI56DHmRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795840389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
	b=fYOKTstlWGCXw+Qean0CMarFSUQ93U5HH7MQBfwsVGPPG59LxYaT1EhM6Ex+nlgWYLKy
	 zyCKqkbnBKIprT9ErLgJ5W+j1DMK5TYYMS/SMU6693lMyTn3rkwu+Z5wBokqR3SwNS9nN
	 oiXeL09su8ZyJce2uMleq7zUIZlIwp//fjVZHFffEN1619kpNa/hWC82TgSUY09HwUVHG
	 VAUtCeGclpIYRB4zvsUun+XaYNcQvvd8HfLQHhNsTXJegDp0DZlbx4bG8xr9AdPKIvdn0
	 YvfEHWO9uxRV2Q7TV4M6ydOGgkeqqZ/WpjqoWkaDOKOGXv6NwRXrUB+pDIoxJhH4s6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwhFStPF;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF7E606A31C
	for <phone-devel@vger.kernel.org>; Sat, 28 Nov 2026 04:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF7E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwhFStPF
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b532f8a51eso630944a91.1
        for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795840388; x=1796445188; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
        b=uwhFStPFskqhXnoduK+N2QkfbdQ3l/s0yIwLSiv2B1bbsHnb1SuZ9x/ESxJ6Wyin0A
         U6o2K2RLng7rfq03UE/m0LuQQhtvOb4Z2IvZgicQY+NfwriHtPj9dBT/M4dQzccZClZe
         7LPfQXRKfjmJ2Xw8vijc5Zx6yQZAU9CcTt5m/Jxxk935hlUryaeUxec6KQCF7p5Ppmic
         mCMn3dBYhl/rJDrZN5TbuKnNeA6dc8lBcNOl/Hwu8cQ8YLzgeUmS/qhSHK2GOVmvA2QH
         AkJDK7H9T41lWqh7mt0x9hiJzliCJkpO+JdYxTfxMMjHdSlAswA9MiBc6UyTwsTuVoGX
         jHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795840388; x=1796445188;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
        b=YxH59m2iWWBoLlO6/d7OnVa1z+7vJb291FsdU+nPDVt+e+m0ou136By3vH+NkURP3q
         RRGPqdZ1ywBPZdqqcQKOT0pgmBHqngkeXAvHcItQc7S12rdzwvolxf1468isBxyRrY2p
         ve5ZnKds9ndE16zpCcBEuZ0F9eLYv+cQM0ubS1aJOXqGvFwOmRAM+azbJ2G8jIJgTJL3
         E/6by5GiXffEvOYq4ZYrJ7k8u3Br4Erx95Dl5KPvQjRavUzBqDIA6Xd79y8/40DanXbw
         AUjwqvD6eZtvkGxrhjEp3/+fv2uivYrvTmGVahXufSx3iouJ/zqjCwv5V1wqekOSUiy8
         9PyA==
X-Forwarded-Encrypted: i=1; AL+hErGRzaqlZwN2NnOuDRTn6TOZH/wR3j0bmC24JzFkZz2POa4WZ0Cj1OfWbNbLO3/EKEewPBfphBtvuhcxVA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8DtwlSqh4GC8F0xJPYmTKM9HGCkMUZlbk3FmaX3lJ39w2XPrC3
	0ed61ESBcwaCxRjf7McndrU9CEzZu+M+Derqs4EB5AUJqLivjgWJmOdw
X-Gm-Gg: AZFdTZd2YJDV5WipmFom4k5eX5iGE5lSmYsX6blr7kUemBYNV2o9vaLo1+DqgxVe8z2
	bdFcUausUTAOnC6V8lDrwmQbRRM318rZ9MreYR5A8CISjlq6uPpJCAE9hoSj5Tyx0gBoY7bOiE4
	6wVCoJks9/kLGzEml/srgB6Z/cXtGKTnXdoMmmfzmSib2ItB09mcGqi5p4sfUSENhH+s2rxuHAY
	qWM2EQiEM+qOccwAXZFQ/ZD3KMdCkrFXqvh7SZ3f3foU96paEXh4EsyzJsNHDAN+KehWNS3G8oQ
	lbiYDPH7xHQA5cpbxm72zpIopLXFQhOJVXCGy52Y4ipUdWOFv6HfPGoAVW0ogjx09/JGJRsI8dZ
	OiyMkHGfhMi0jkYYIPI2p6f4wSzvkL6TvH9vIga/sb5xEWfjWl49sxIzzmvWEzQbVg+66hgINoQ
	gPJO3BeKTqT2sSgTGfbHL/ctkj/ld4bEZKQ59aHDNCbiRCVi5FCEvKTkaXLBop3rBX6KsJ2mZSo
	vMB+jKPqZ4zrTNbSyeo8eWgmad7HzCWsfgmwJxwn1vx88zcRNEUrCrkPJffTOuFHBRzpl2ePDDg
	U6TJKxGGziYxZOS7MEOKzxowZDB5kcKQmOm5ol5B1pjW3g2ipgYSX8fLuMjFec0Ciuc9ixjlHIY
	=
X-Received: by 2002:a17:90b:2648:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3b41c952ebdmr24822169a91.39.1795840388460;
        Fri, 27 Nov 2026 20:33:08 -0800 (PST)
Received: from mac.lan (114-45-156-18.dynamic-ip.hinet.net. [114.45.156.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7d36bcsm17993882a91.3.2026.11.27.20.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 20:33:07 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
In-Reply-To: <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com>
 <20261127030009.10572-4-iasnezhkov@gmail.com> <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 12:33:01 +0800
Message-ID: <179584038151.67185.14057994923136112895@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list

Hi Roman,

On Fri, 27 Nov 2026 18:12:33 +0000, Roman Vivchar wrote:
> I don't see INT_FLG and INT_CLR in the 5.10 kernel [1]. Where did you
> find them?

They come from the MediaTek PMIF bank 3 interrupt register layout that
MT6789 shares with MT6833/MT6853/MT8195:

- In mainline drivers/spmi/spmi-mtk-pmif.c (mt8195_regs[]) and
  drivers/soc/mediatek/mtk-pmic-wrap.c (mt8195_regs[]), every PMIF
  offset matches MT6789 (INIT_DONE=0x0, TIMER_EN=0x3E4,
  WACS2=0x880..0x8A8, bank 3 IRQ enable=0x450), and bank 3's status
  and clear registers sit at +0x8 / +0xC:
    PMIF_IRQ_EVENT_EN_3 / PWRAP_INT1_EN  = 0x450
    PMIF_IRQ_FLAG_3     / PWRAP_INT1_FLG = 0x458
    PMIF_IRQ_CLR_3      / PWRAP_INT1_CLR = 0x45C
- The same 5.10 tree you linked also has this exact layout in
  drivers/spmi/spmi-mtk-pmif-core.c (mt6833_regs[] lines 167-169 and
  mt6xxx_regs[] lines 119-121, where mt6833_regs[] in mtk-pmic-wrap.c
  is identical to mt6789_regs[]).

Omitting PWRAP_INT_FLG and PWRAP_INT_CLR in the 5.10 BSP's mt6789_regs[]
leaves both entries zero-initialized (offset 0x0 = PWRAP_INIT_DONE2), so
if any interrupt enabled by PWRAP_INT_EN (0x450, mask 0x180000) fires,
pwrap_interrupt() reads/writes 0x0 instead of clearing bank 3 and leaves
the level-high IRQ asserted.

> Also, the series doesn't apply on next-20261125. It might be due to
> recent mt6572 changes. Please rebase.

Confirmed: the conflicts are from the mt6572 commits and the
dev_err_probe() conversion in pwrap_probe() on linux-next. I will rebase
the series onto linux-next, carry your Reviewed-by on patch 1/3, and
send v5.

Thanks for reviewing!

Best regards,
Ilia
