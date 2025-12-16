Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14473246F4
	for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880591; cv=none; b=VAY/P9TN/EJhdeMGEjSBBj5BmJhGynbKImQkDaEBym8aCCf+0Z6/DB4CRlHcy41qDfvYoU+vTDtlgWrMzqCKIiO3EhCe/uHyWtM5xyHMkTDgL2SlB+2CqB8DRD/UZwrWsUPobUFWYYtkAcpBb9DLiRvcQC1bOjlthKSh1a7nXNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880591; c=relaxed/simple;
	bh=Dvmr/QNqhE/E0wa6WZQHpZU3lnvizMSDqcgLKup3gdQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GIzTEcnt1hg6hR3OcTcoywu0iJrC+LlLy8afTlL1A1PGCoRqB/IRJ35SkLsPvyFaPAqSU3PBcZlEguBfIITOHXFkyE6n8+YK7pTiBLFY9+AYnPOzUTqlZYgfYJJoRfko2LEVWm+yVc1ZUEcN7Ym+7cmQMRmFg/T5/tNtjiNijRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d9i9zfq6; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d9i9zfq6"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47789cd2083so23177195e9.2
        for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 02:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765880588; x=1766485388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX/BjIYz9x7aAJdudv3dAY9wtSDhtVkvwARFOcwrepA=;
        b=d9i9zfq6+0twgQ4LIkOBRJz9vEZTE2BpVfy5CNviFiAd8REoiU9dhUBfpwgBqCehqE
         6MVjrNafpJsQ7IWLDZXzfkcJI1cMz/7414Her7r+JeWe4IQYWCWdnoRKrZHv1nCw/OY9
         wG/+ErKwyWKFMmYNIpSAdEAPxllK5VIXOb4+pHOnWBoXIAPZr/hUxKSV250mHuBHYhce
         UY5VMVt/E9ujlu4AFBKLbziFIElDrOjtj6wawx/ZAH4VabXhq6qaF6EsFhX/04M5kzsR
         4ed8NMj/ZCMWCSEWcXLWXniW40QMBWTvSmxRtTsWF0GeK48kRUdSe5fsedCbwb3/L8De
         Rxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765880588; x=1766485388;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NX/BjIYz9x7aAJdudv3dAY9wtSDhtVkvwARFOcwrepA=;
        b=qAp6b35WHsWZA7TLFnAiEydStOkf+27SSbANV3DvreU8wmrwLSA0dUt04nVfiWbUB4
         FumY3Bqp+qzJZ3lMoIKKUWhmQdbM8BaQwqmCifEPDQ1t3FetbHtGNry1YdHbq3bT2mCa
         +OcKdccPO8wAbVzc5OkJsmbOcz8Vjh9xj26nvDWNZ1prj9UbHbyUKW9v0Sq63Otcwtpg
         soJbq4KgUMYDMDZJJ5sLfqeLJzf1QzghEJih01ZrK4R5wOp76sh4Smv5L82cQkcVGyMa
         x7zox4nvMR89MTTeXRia/eFqUMsBlRvi9iW+aeBPUHdz16y4X5ALxbNCXrQUm4eNUltu
         HTLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWENqYe0ALR4cX0VBzboHeaKsXwzdRWHZOHBVaiMkYqxmfzqpOqGpORULqymAGQ5QaA8BMDl2WUly4A7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYjSh1ICXHkHL6IpHEhpx7vm50lQ+z/HDGjZf9imp3jx2Y9X5d
	IQFB/JXIVYDJ8zht6A9A2Ge2MyE2mdr/X9/pXuSakvhXq5MRdhyLZ1WmZ/kLgulFrDM=
X-Gm-Gg: AY/fxX6gzgqiDHBV1TjQUgbeV8CizZ82DCwDvIEgvPEx/Eyq8LbJQkGT6b7blw/Y1NO
	ipboGUFbSdD/8uaTop5JDflSCgf+d+qdiiFdGMqby28jmwInPn8e7EVuHRDJY843Nyzi52aauGi
	zLj8ZN0y6K5ubMpJiya9o6feH773ZhIooCF07bp9cdEQqWSLy0jZcLyOQW8fET5gqwRi/EbN6nr
	FwLM4XW9Z+H8qEXNoA1T8DFTiTCg5r0jcC4DmktYhMWkRCgx9oCeJRh+ZGMmR66/qEjhRq3bWCW
	0eilkNfS/JQRKEiy2xvb+eP/CPX8j4hJTRQdEAJbTO7rGlTlmAbBptpAzqefZJachJtTWtKJ0yH
	qy1Bepto/N9+/rZQVhsFHX11N0wsFMnwX77C4qBv4PZoLHn1aqm0tQFP0LS2RwaeTvVqotgQ61S
	N+c6v7C8IvmTPNw15K4oC5iRfpVP0cv+A=
X-Google-Smtp-Source: AGHT+IGiEubYcTgOYBi8mqSAy1isygDjzTiDJgnd7uGUl77AkoVoZN4wTT6z/CWXEpGiH8gd5MBpTg==
X-Received: by 2002:a05:600c:6290:b0:477:55ce:f3c2 with SMTP id 5b1f17b1804b1-47a8f8cdc9dmr134843895e9.14.1765880587826;
        Tue, 16 Dec 2025 02:23:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f984a268sm14996292f8f.1.2025.12.16.02.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 02:23:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251106-dt-s6e3fc2x01-v2-1-deb87727152e@ixit.cz>
References: <20251106-dt-s6e3fc2x01-v2-1-deb87727152e@ixit.cz>
Subject: Re: [PATCH v2] dt-bindings: panel: s6e3fc2x01: Sort and remove
 unnecessary properties
Message-Id: <176588058666.2230787.17118306826413529829.b4-ty@linaro.org>
Date: Tue, 16 Dec 2025 11:23:06 +0100
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

On Thu, 06 Nov 2025 11:53:40 +0100, David Heidelberg wrote:
> Properties are now sorted, reset-gpio and port property dropped because
> they are already accepted here as part of panel-common and usage of
> unevaluatedProperties.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: panel: s6e3fc2x01: Sort and remove unnecessary properties
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2c96689038aeea99c18a95b66dd5a171a07eaab2

-- 
Neil

