Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114823BE164
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515764; cv=none; b=UHdziFot2rMI7N/fx6Gn0K62L9PeNVmi/eabnEQwk8+7zoQdayW09R9auxLW/kYGclG3O4iC7GbJYCOPwKhMygGSzzyl4ERwqWNk3QnX7L2Bva0i2rSHj9pTtGK8X5J+akjUPkkhIuvMU+Uqvq0tBxI8kHjUiXRCZNfuuFrpaME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515764; c=relaxed/simple;
	bh=J+rhQyRTfoZzJ0GI7GG9EXyupU3nMVnHvjxZxGN6brQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Njkw91frwuWgLEMv3yACiowyCAYcf9Alznh4EoYCufOOIMFlNc1GlUm0N97SG2CiQ04MGXVlC1L31ZxfjXdH7rWj8qABXf6K6jvNBVgoCf1/rKLaEQuYC/iFPaz8UQpqgemDdbAO5m7tAICpG5zvnb/E3gq/PX1bMrOatb9171g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L52QhdVO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L52QhdVO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b886fc047d5so106449166b.3
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515761; x=1775120561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXPKOAWpcR9xHk9hAzrUFCp6rLb1/uw3dh+uChYT9mc=;
        b=L52QhdVOzz/ndoThLufo6fEDjpf1zvoBSHkgmCa5IF+23bPvzJADXmj8QRy9WlXtd7
         wqtLnUWwHBGHlJMAsW/bKdKJabVWK64vBAqyi+Fh/f2IhVO0fh1wsY8ZWT4B/aTh23pD
         k3OaYxPcH4QYnGr4498LAF8Sy/atplEWcs7vyItje2XfiCFdvww981ie9BSCooyiClS5
         WAEqapKtwaJKZcI86lRymWWVSwAnVjS+l3EH6o1eQNDmofDJvMvnjfdavb6AEPNA8z/3
         K3IzjxdqxJUG5olCozkQ+9OStPr/yuh8IHTPuSeTCyZ4pp/flYmpyEbo3ID0SeGli+UL
         YDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515761; x=1775120561;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NXPKOAWpcR9xHk9hAzrUFCp6rLb1/uw3dh+uChYT9mc=;
        b=ZUEabIcj9JqhbrJjQ2bHTs9R3xOcb/WmayHTTXy62A5Emjf+cWN1lWg5JNP351TYgr
         /KDSUV6gWLj1PCUtGtlF3/+XTpNSSHkYr7jcSKJ/j0fldeYFc4pb77rDCp4TTQfK2lVA
         cs7Ba8pTcJsRGnB/QBOB9tCO6j2U35DZU0ynmWm/UXz/9sJ8DBYTXOm0qShqU9OMkQv0
         8ZaGr5QYWYzzSoEnoQ+IihwGfY8fR9QFlExi1CQxDGC1pCFqFFF+g4VV4XBN1T0B9d4+
         0zIpUzSK/r+GrksNZURh5oEcxz/jQSRy/SDahpJze5EAPqJWmULLwVyJIx2k1J9vJHZi
         FAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL4PD8HNhqgxxdoMCtDn5NXbl0mkgAoW+JbDk143//mTUDYkXY91DphkCKUS0grsR5PsyWA/Gyw1/haw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJWVm0g3ijN0opIdemG1rypN5mgJx5kKH+mINFfwXceAL1pC/G
	Lr9UVTekuNbtmeiZtNkp9SoHf7XIXNejy3MUYm5J7eSmJjs3hiwpVm0/8EsxeUWESOM=
X-Gm-Gg: ATEYQzwdjEF9Efpvm6hWPGviy9TMrLiK4xrlRzs0as5bTABnBtEBp4fnmj8wB188nXt
	hykLynOWeJU30hKkkIOr5N5SIc/WdARElBPPRh0lNk7whUyIlXGNOjDZXoJ4bnI8NrFP4bNQlYm
	UeH9LIwTYc8FBrkEYoyC0Hz6xlPNxln6Hm+ox+8UpeWRFaq3mN8mlOMD3fFgemAEhAyJ20Qsvyg
	4d4DErEwBasaXH5kony5ZHNbqPfebO17qcoCIfw5pkZPIPgN/vkel6kik7O2DBgR1U8/0g7TfKo
	XUdmnpXrPwfjDkPdNKVJyCrUlyHPa8lkYE9NnDmqiYuMbUBv7rQh/b6rJ/yrc7ljgPZRd2EDuyW
	D4y7+8o9lQM+vWG482fkRh/0a1N57BuT6niFlcAzjzv1rbDc6T1h24udR4+bbQquhwZ3PKL04ay
	xSsyMsNyYtTgS9nte66W9x/0d5OaClqO/fBRpSJBIUnmlg
X-Received: by 2002:a17:906:e097:b0:b97:ba90:edb2 with SMTP id a640c23a62f3a-b9a599a5322mr343969666b.50.1774515760204;
        Thu, 26 Mar 2026 02:02:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Yedaya Katsman <yedaya.ka@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
References: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
Subject: Re: (subset) [PATCH v7 0/3] Add support for the Samsung S6E8FC0
 DSI and M1906F9 display panel
Message-Id: <177451575929.103892.7506565955077481700.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:39 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Fri, 20 Mar 2026 16:41:37 +0200, Yedaya Katsman wrote:
> This adds a driver to support the Samsung S6E8FC0 DSI controller with the
> M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
> generated using linux-mdss-dsi-panel-driver-generator[0].
> 
> The mdss reset dependency makes the screen work more reliably.
> 
> [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: panel: Add Samsung S6E8FC0-M1906F9
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f4693b88bc730cddc6d69f6f11b64e6d93a8e373
[2/3] drm: panel: Add Samsung S6E8FC0 DSI controller for M1906F9 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/49837b6babe71fac84cda2a0d3cf9c085bf3a2f9

-- 
Neil

