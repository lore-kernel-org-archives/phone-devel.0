Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2472D28E0B
	for <phone-devel@vger.kernel.org>; Mon, 18 Mar 2024 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710752951; cv=none; b=D/S+MtMwYWBPaLUy4uSGJDuK8zBZngy3aK7QyW4DrzdJ6LfClZ9POwaHh//S9sqOx6hnpnUpnp/5FdqFziwdxm2JdNdj+gb5n2WmU46wJOnHlh64Fc3oLbHsNI/ieg7ncyek6WfxdDDKpV5QozrruDmumjat1v3xChoYDnIjsV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710752951; c=relaxed/simple;
	bh=IVUpohtzR+EG1KfJKPwzKREt/qsTSP9YwSmRK7S/FPQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oz6Qwklq6++dRPFlePrHPjAwI0V/wm5+gUJa/Aaz/oYqFQofgHdDzTQJGnKNTAvqaG4st7oOOOxpdcznUxqKopdTmrVsDYXJuF+CbHeusejmtL0UnYBmQxb4IVJTJosLhKNfAUrvs2pX91lV6VNa9Tw5O9sDUb0Wyln6Ofk4bTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d/gmm4Ds; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d/gmm4Ds"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41400a9844aso13598145e9.0
        for <phone-devel@vger.kernel.org>; Mon, 18 Mar 2024 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710752948; x=1711357748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjcfkHxBxUl/qIQt/Ofx5WFnmYUZXoas2jOxK15tT+U=;
        b=d/gmm4DseuP3Xk+ijzpy6VhIkwUwssvpwcLNrYXt1EvUOXfYkBw2sln2QR9MIjHUst
         WOtLPS6tVFWRI1Le35R8vMWFgzejONuMAdOzbR00X9I+BiOixpliLXcIQEFhpmEUp3aY
         8qVztldnSzulMLqgA4Y1QHpl1wbhsQWGn9O3QrJkg3H6PFm+qARdUIAOOna7RXGRMnOJ
         Kc1FyZ/zWDHgsBK/WtRteia4Y36+MZ1Q9W8MLA1M/yKUTva/RW5cUhnELldnJQS+WCJX
         xNvSxlbIvmYH+qDmSRHOXGx/fJeWTQbmyCCOur77yReI+dykVByZcSBsRAZybaYcc89Q
         POqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710752948; x=1711357748;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjcfkHxBxUl/qIQt/Ofx5WFnmYUZXoas2jOxK15tT+U=;
        b=PLPsZ5/xj6c80gMO7U5NCqt3dR2LqLDvr38iP9FFRzDUhJXsNUUvMlHp6HYjwwnuAx
         NUNKxRoX7FVE3EUbF/Gkc5S130DxvzuoHMgVW1ugAVYhHGLNf9ETFhy/tBUTTpsFoLbA
         jzh6NOAwVEPrKiYzRh57f6l33d31t2/b0aREcVbizT8qdd5S8XCidjgJBAfQR468sOU5
         AN3N6P+7EVLgCnwYVmPH82jr29qOP1E2mOPv+R9448PkXpWqWyIMcGZYJmuaEg5ldbiS
         QKo8QskZDXurJf576eSdhoPTs6fPjzJ2D5LNnVIPcz0vRLl130KYtVoir9FkZaZFqEeM
         5Dmg==
X-Forwarded-Encrypted: i=1; AJvYcCXbqUvgeGNhOhPZBFj7oDK0o8x5skYagChZCZK0fuFMGhImSjsC8EEFpY2fDFMX9kuCrKU/atJjqjvDGplPikTIQALbicXm0EPG0pE=
X-Gm-Message-State: AOJu0YzjpxTpA8EfmOXDz74mc1lgdC2Xug9QAKuCV2GuXGLHyV+vDjbP
	Y6kqJ8WFZqCUbDBbdIdPRDpes6uZMzKF47GExS0CEk/ZAY1iuJCOmdZv1AueVw8=
X-Google-Smtp-Source: AGHT+IGu5diyfcVwRWLR4Yg7B7pmlWNzDuDfX75UM7cmY/NusuEIrSALQsCIn5bPVMuxM9z9I8g2Wg==
X-Received: by 2002:a05:600c:1d13:b0:414:1072:4b36 with SMTP id l19-20020a05600c1d1300b0041410724b36mr1564266wms.0.1710752948485;
        Mon, 18 Mar 2024 02:09:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c1d8500b00414109c66f7sm2491149wms.38.2024.03.18.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 02:09:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
Message-Id: <171075294759.1615603.8073986785380285265.b4-ty@linaro.org>
Date: Mon, 18 Mar 2024 10:09:07 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

Hi,

On Thu, 11 Jan 2024 13:38:04 +0100, Luca Weiss wrote:
> Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
> bridge/panel.o to drm_kms_helper object, we need to select
> DRM_KMS_HELPER to make sure the file is actually getting built.
> 
> Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will not
> be properly available:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e3f18b0dd1db242791afbc3bd173026163ce0ccc

-- 
Neil

