Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C15F23763
	for <phone-devel@vger.kernel.org>; Tue, 16 Jan 2024 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705437225; cv=none; b=iDZOc4tEzJaMAjL+YXBEc/R/V9HsYWmCza+kg4hBOZlByez5I3oQc4gxr6edGePkpaSPYg4W7tZr9ZAOGDJMNfUL/YAIXAJHWjvKtAdo4G7tKD5Y//vSCwXCWfqu5EMeIUUTaFRw86wpaTLNU9R6CJ8hJ/oUj94UANTNDYVL72k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705437225; c=relaxed/simple;
	bh=bLvtU9GmP+z3YD1A3ZSf6pfME0rmcdFX3MOu+3u5WlA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=WYu3/gbH8DJdMbthONuW5aQviwSG0XeAE+wkioGs60iGfmGshFzTd8c8kONzdb7MwGRhditbqPEaRZ4uxYtVbgnpl3JgQeDe5NWK7C55XmFzvL5+kzoKh+LomxMJzUDQHm2TjIxCcALExoNCl+/yyjf4tuLRmFyVm/T//7jEdjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brixit.nl; spf=none smtp.mailfrom=brixit.nl; dkim=pass (2048-bit key) header.d=brixit-nl.20230601.gappssmtp.com header.i=@brixit-nl.20230601.gappssmtp.com header.b=HaJi9bkU; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brixit.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brixit.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brixit-nl.20230601.gappssmtp.com header.i=@brixit-nl.20230601.gappssmtp.com header.b="HaJi9bkU"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a28f66dc7ffso2049014966b.0
        for <phone-devel@vger.kernel.org>; Tue, 16 Jan 2024 12:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brixit-nl.20230601.gappssmtp.com; s=20230601; t=1705437222; x=1706042022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQYnK8r0WDlOVQgRQTtnzryqB0Bw85aD3A/rnJ3JfSQ=;
        b=HaJi9bkU89BQWav8nHAuTEv04F3xVmf6sNxp/Gcyhdhx86CeFSciPbMzcp5pz6kU0O
         M0Qkhy5TAJBznAzSFoOlNdZFlHqyNtrAp93uzeHsGZ/i2NtRXzRS8wfe5RKrTbwN3jj2
         lbLgwhVp+2ghu9qVLDNV3Zx3XYgIIP5NScYktEo0hdQBwfxgfVkZ0bWF+vzihoipTsvA
         jc4TPZwWkOw4kB9bFoFlLPKbBGPs4U/600AX3cKibnV9Mwo6bKxq9fFegFXPVxw6aEi1
         8VwFj/R3hNWOHzTT+jeoee1ap82qL06DhuT+QWGqStvrF9wdFVfnicQ02frQeBETasmH
         xxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705437222; x=1706042022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQYnK8r0WDlOVQgRQTtnzryqB0Bw85aD3A/rnJ3JfSQ=;
        b=qTlq9tAYdnLD217kOl7Qy2LBVD83GibsBP8NLErLvGD6MjNAVPEZGy6I/xuxtA8S0U
         Ayf6NFbd2sRIx2KbCxEhMumC1qhsh/zVzSqVbWgoa3bjHCr9mvujVuAdoZJSBhNvvDb2
         h8Q6JhazumK5/C0osFoAECF3ZB/JYzOaMzJZwhMrvU5Am1gaE4NZTHwYWM2D+7uqRyqh
         X4K48hNM6fMgoaXT6My0NLX65yyL6MKXmPhrLupVtIFWQdHN8xZB55FVYUXqtIm9mSYM
         N7z0Jrh9MxnQYKgen8X7EDmbdLf/xYCGRSp7AQP6atWBAEXBH8nrFdqL9Wqf2h9U95pL
         dlCQ==
X-Gm-Message-State: AOJu0YzlHPpbVDHbMH/ieQVBc3ovyQvvXxuSVkPEmm9Ihpy0ygwZZRRs
	KNnX9vXqcEemIbCwI9++KX31mrcgMrUSBQ==
X-Google-Smtp-Source: AGHT+IE12HSEaKeyl74HOOYo0/OE9qhE2gVtfoIGnqU6mjdQlJwdOiIyXwH/t6fV/FSI+oC+jzCwbQ==
X-Received: by 2002:a17:907:a704:b0:a2e:7f37:8301 with SMTP id vw4-20020a170907a70400b00a2e7f378301mr1567285ejc.27.1705437221625;
        Tue, 16 Jan 2024 12:33:41 -0800 (PST)
Received: from ?IPV6:2a00:bba0:120c:9f00:7a8e:8795:650f:7c4e? (2a00-bba0-120c-9f00-7a8e-8795-650f-7c4e.static6.cust.trined.nl. [2a00:bba0:120c:9f00:7a8e:8795:650f:7c4e])
        by smtp.gmail.com with ESMTPSA id gu18-20020a170906f29200b00a28aba1f56fsm6917997ejb.210.2024.01.16.12.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 12:33:41 -0800 (PST)
Message-ID: <2c720f2e-3c73-4a77-92e0-5da8fce86b3f@brixit.nl>
Date: Tue, 16 Jan 2024 21:33:40 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Front camera on pinephone
To: Pavel Machek <pavel@ucw.cz>, fiona.klute@gmx.de,
 phone-devel@vger.kernel.org, icenowy@aosc.xyz, megous@megous.com,
 kernel list <linux-kernel@vger.kernel.org>
Cc: alain.volmat@foss.st.com, sakari.ailus@linux.intel.com,
 linux-media@vger.kernel.org
References: <ZaY44AHISMIh8fHM@duo.ucw.cz>
Content-Language: en-US
From: Martijn Braam <martijn@brixit.nl>
In-Reply-To: <ZaY44AHISMIh8fHM@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Pavel,

Isn't this simply the case of picking the gc2145 bits from Megis tree?

https://megous.com/git/linux/tree/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi?h=orange-pi-5.10#n410

[For the pinephone kernel development there's the option of building the 
kernel using envkernel.sh in postmarketOS with 
https://wiki.postmarketos.org/wiki/Compiling_kernels_with_envkernel.sh 
which has some automation for building a kernel and pushing it to a 
connected device. Ethernet and keyboard are replaced by ssh and 
usb-networking in this case]

Greetings,
Martijn

On 1/16/24 09:05, Pavel Machek wrote:
> Hi!
>
> In 6.8-rc0, driver for gc2145 (front camera on pinephone) was merged,
> but we don't have corresponding dts entries. Does anyone have setup
> where they can fix it easily?
>
> [If you have hints how to set-up pinephone for kernel development,
> that would be welcome. Currently I have mobian with rather old 6.1
> kernel on it, and lack of keyboard/ethernet makes things tricky.]
>
> Best regards,
> 								Pavel
