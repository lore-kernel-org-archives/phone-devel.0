Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626844;
	b=ERhjjZbu3bmnQgHu6cuRlvDIJv/Hd5N3hBYN+kJlaiTQY/n/gMEWOJn9iJvgIxB2SFQw
	 pRteMEOxlKHbvsXjvcFV34NWY1IAUvBg2oWN6+QiQ6bi/s0tWZ0bQhSChQDA5l6eEn4hv
	 nxbkYbwDZLgq40r83e6xCn4yF3AChy3dBwhB5cD7ZaTPcOlxPgUMubH9WbX6yZL8JjUnv
	 53pzzfpFGwDJ3XzA6FA1nFM+dF1b57ckF0rQUFCJghOTsQR822DnZWhdFgoT+n8l1rRj1
	 D6k7obIDRAkX8ktLx511SWlxhxHxle+tLGzavwrTkA81kASMjB0+b/gg/QgzzYM1y0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=RJboDKYLD5odXq2wMgxBJknNJQ9cln3HeP/apn+7A4Q=;
	b=4IhtJmf6vgXv0wTfH2oVu7+qqcVJ4hQx5bUq+BiNuczQ6H7NYJkrOQnfX7PkHTB/h6Is
	 EZ362MhCW32p0t7ISfErz+OjWjPoyK4D8THOcgYRTMWGtrVqZJBX7iy9cQs+Ai+mUNqOy
	 35/fBXqilOAKD8n+iH9DAX1FOOmoipFrQllpT1/N1dDtvO9tREpKe87qEnETAq/4qBJo3
	 zH/cBPv5xjC2GjWoErbl8CxCWl7AkzQzqlFt0AkRB+ZYrvGfMpg43xaITnDFTzbmZDwd9
	 TO+AQL3zB+VGWTla4uJDgjJtFlsLylK9dARLGLO514uHqysFJM/0cyx8YcY3FHREYCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kPZzPzyq;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467D0606A334
	for <phone-devel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467D0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kPZzPzyq
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so20160365e9.0
        for <phone-devel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626843; x=1794231643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJboDKYLD5odXq2wMgxBJknNJQ9cln3HeP/apn+7A4Q=;
        b=kPZzPzyqaANUNBzDybP51OmWarxIoLteKI5t21UbSk0DDXFRNg6qATrZAEMKgtvOwW
         IDcH1AX8ZL/CBONcGvqbPCnjqOHNUFTKImhUzCH4Jse7iRL6v7Ui1ODaYr6oPB/OzWO6
         sVaeyW7ZLljbnLeLwXoj6dYcmxwJdQ/GWk2+Deltqbd6006RIR6i+HbEH2D/He7lpjRq
         4qCrS+ip3brIlZs3QduOZdzFpthRXY98IdHrSCDHUEgEQcDdVEThAqiocbY7dDPgNVZE
         h26pov8n2KdPraIWYTn2hCFOjSSoQRcyZqPJo3Dywbj0M62FqU9rF9VQ5O4LRpHSkQhH
         i0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626843; x=1794231643;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJboDKYLD5odXq2wMgxBJknNJQ9cln3HeP/apn+7A4Q=;
        b=uDcTjy5JV+Hb2pL1P9Z4rJk1aMqd3uLg8t+vCfsOszSyVSJHa6AUV4f++zHwoJaskA
         cYGn3jJ+2CJMFFLqJgYLKdOTJIzzdQzysXOkB+kAi2pp39jEeKEPkifY/HJqtQLf+00n
         owHXOU1rNdUD+HYliuN6ywzeMl/9q4+IYCCSfX1GtNT/oddFN3MD2GWgNj9EkMogQb8Y
         WQu+Ow2dLBlhjOWR8l0l+3UMCP/wYyMlvDdlKhBgco9014UZr8uCO/wGWxxrCjBBemwY
         MaNYv0MwsAJpiOxAF1H9mT/2NnhRvy4HgCqftyDpKV8YKLC5b4uvrcy0ini4E/SN1fSx
         wgvg==
X-Forwarded-Encrypted: i=1; AKwUvBze7PZjNpJZf7KLY/ErsIRlZqcAMoHE4SoDP5262+75HTBPCGw6G/LlAwjg7v7LBKkz+smSTc6GWjs3ew==@vger.kernel.org
X-Gm-Message-State: AFq9FYLoTnZAcs1n7RfeWAXzrvU1dtqOdaDWRRkWj5TPJN8zUYT5LRDR
	qEAp3MaN89VGfFaw38kdY5CVzZt4NeS5c7n5wPhdqEwn3UeyLQBlIgdBr+LEyCCuJuI=
X-Gm-Gg: AYBFou3MN3IQqBpBBqV2Xm3uuL2SW4awq6PdGA8me9ICt6NcFYUzPDptKig+++CoKTR
	s0rWKN2DsTmsVRF0m+UB5AnE8elxeDIujOf+CtYdlp0ZG54mFUhuLzRO/t/CiEDIrq1cFQNE2qi
	M+AZSWLlqO5nDFoDQd/y0Rib+GaBvG6qIQhhXFGWYuY/S6WsW7r4sFYpVWXvx9MXWXa/nDb5/1I
	NCqGBQiLCprr3WTMkItrqoMueaAmbVQwAXoUlyk6/LvwtB+9Hr2uKPYJdZbDXkSxMj9F/e3i6d5
	d0CplgGz2h2L5Rd4KRS3X2TFs0GWPENoz3LDK06VjK4yXhMYCHbjZBdGKUMM09nJt0ir/sruXuc
	M0EjdV6XiLEkNtdKGW/hT44sPsGEIKRH6pLsvGMD9aWUTxFlyWPvG5rwkTTygY67/O/XIJlTw+x
	qv4YDaA85jULP7O0wRccvEle26idMJf/9f/SCued5oRx0B+b9nfgfohk5yREDiU5/JAEiopWazg
	BBNDyqMJFYbjo+h4rUUunzLlrcwHkuydJu9rpZOhgueAla1yeWJT0SDg/zNdmPL5VQM4VWof2Je
	Tvy7QICpLXsjiuKGEXPfx5qvvcmYFOqWEfIKdgHQs/YGz0XSvA==
X-Received: by 2002:a05:600c:4708:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4ac19234ad8mr231192185e9.30.1793626841264;
        Mon, 02 Nov 2026 05:40:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 Aboothahir U <aboothahirpkd@gmail.com>
In-Reply-To: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
Subject: Re: [PATCH v3 0/9] drm/panel: novatek-nt36672a: Extend with 5 new
 panels
Message-Id: <179362684012.3310106.12925421623133714405.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:40 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Sun, 11 Oct 2026 14:54:01 +0300, Alexey Minnekhanov wrote:
> These series make the driver for novatek-nt36672-based panels more
> easily extensible and add support for 5 new panels to it, used in
> 4 different smartphones, all based on NT36672A:
> 
>  * Shenchao panel used in Xiaomi Redmi Note 7 (xiaomi-lavender), the
>   exact model string is unknown
>  * Tianma TL063FVMCA01-00 for Xiaomi Redmi Note 7 (xiaomi-lavender)
>  * Tianma TL063FVMC43-02 for Xiaomi Redmi Note 6 Pro (xiaomi-tulip)
>  * Tianma TL060FVXS16-00 for Xiaomi Mi A2 smartphone (xiaomi-jasmine)
>  * TXD TXDI600YANPA-43V3 Asus Zenfone Max Pro M1 (asus-x00td).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/9] dt-bindings: vendor-prefixes: Add Shenzhen TXD Technology Co., Ltd.
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9f6142a00d86df12120562c27e82c73cc6d30862
[2/9] dt-bindings: vendor-prefixes: Add Shen Chao Optoelectronics
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b55dbe9011975146527b8d371f5cd9a36f03a446
[3/9] dt-bindings: display: novatek,nt36672a: Add 5 new panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1123a125fbdff4e220be9d7e1613ddac2a32f4c0
[4/9] drm/panel: novatek-nt36672a: Set driver name to novatek for consistency
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/109516c683991707a4880ed26680c45f0ce4cce7
[5/9] drm/panel: novatek-nt36672a: Combine two init callbacks into one
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8a834378028bf53a7bba729681afdd350a1169a2
[6/9] drm/panel: novatek-nt36672a: Add 3 panels used in Xiaomi phones
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/df9c727a0895f3f27d8cf8f577a32f5d4620bb63
[7/9] drm/panel: novatek-nt36672a: Add Tianma panel for Xiaomi Mi A2
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c13368a4f3f9206034ad89dc979935b0226c48db
[8/9] drm/panel: novatek-nt36672a: Add panel for Asus Zenfone Max Pro M1
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b6b23fa0fa46140c56cbd3886f4c4065b6fec761
[9/9] MAINTAINERS: Add Alexey Minnekhanov as maintainer for NT36672A panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/46c59e358a47afe5f3de9df39d37f588c5f6dab9

-- 
Neil

