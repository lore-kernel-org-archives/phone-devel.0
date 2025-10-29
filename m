Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048B7314B7A
	for <phone-devel@vger.kernel.org>; Wed, 29 Oct 2025 21:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761771941; cv=none; b=INBi/hPKXli4hOue/GskNeOWI+fy3YIUDt/jGfV5ejdh5zgVF7Da3n4Nnbzri8VCrV/f0QNKj1l7EWMD+FNLiSaautszP/DNOOFWqTLZShb2mZngFPG19C4zGBw/thDAUW8doPVDJXRPnv7AAKjjNNDFiaSLdrv+dwVI47pK9RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761771941; c=relaxed/simple;
	bh=9KmAI6n3EJ3DEXVuJsKSffz4cZaU2oJ/Pm5z8amdxno=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kOuDNs3yCdnda8cPZF6j8zXuayvCUTbxMqK2vmg2VSHvVquFNLH/hCscrwp/hfvS6c5VHuK/8lnMpfyxKo+gV1MLwr4yO30WyezdJgzXvnVkcV+MsCvY2X/qIIF2yEITe9vgqenKiORKvfdGcvImHz6cqg6eo9fJQwBKc3u7ZU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZEfa04lD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZEfa04lD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-427007b1fe5so243573f8f.1
        for <phone-devel@vger.kernel.org>; Wed, 29 Oct 2025 14:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761771938; x=1762376738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svITpYAx9yweNnxVjT+0+O3geT9huO9jW855FUX+XhA=;
        b=ZEfa04lDwLR7okbgCUlzWQOoB+ywIMqo4XLVUiFR20HwJtH1uw2Qpf3F18sCvzE4qu
         lJyrbIGnYSHOND1LrbY70AwWqzElUhj3G7SLf43k3PQ9WwrGjgGOjKjSBPpqEJN4Ik1o
         n1G8fmKCXsLKYEK/Z9UODgypfNiY78h/5E58BHUls2IVvg5SvAzxxWAK9kLyNqSHkyzY
         r99G40JAdan/w28VMAQk0kVmb765lhBULiaXQ3N/sDAubtAygZ1qUxrmLrDM0sdxKr7/
         K7voduBQDQTvPgr73iyxX5doo/sMcEKTzRVP1Ts4v6PeBwwwsIAQBspl48VxeSLjMEOP
         403A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761771938; x=1762376738;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svITpYAx9yweNnxVjT+0+O3geT9huO9jW855FUX+XhA=;
        b=iJtv0/+Dh2kIbgiIGyVYIKrLweZ4iCl6cy57sy2HbWONJpJ6CsTKeMrPvbNcHl/x0l
         pNDUwaZfs9YYrBBnGddNcbMNdUgrlqCq84RRKXXd+G+0l8A8Ffq+t2UIaHJfwIdLQsSh
         fnboTAQWZ448TuC1AHxqWphb0+Yv82r1r0R9ZUldOwXMb5Z3eu9RPF0jGWnFxccoKTFh
         JwUS5/M+ZukQmImn5zGynaKGbtpk0rL9meRaoQhP9kjqRYOTHLA67Md7yFl+9OWceD/6
         lL8VSj7qhlsDfrEv4/Fg99IzTyNeqrbkYVGQpdM3ZnWxpoqa/xn/VZL4CP0QtFxiBoeX
         +o6g==
X-Forwarded-Encrypted: i=1; AJvYcCVkt2QO3jQlQIyrZshsnHv4wGn+oU8Jgb5E336zL+AWArePm/sv0tPPb+gAaE4FbFCWSVMVga4V8zw7GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgFdbkIRHXtcewABGkbqSZqkz4zW62nYRlxPI4GIeYS8Qq9DU3
	p/vgpJuYYfHBICAN7JMZDayrVkr+K80/+OQ9EzYQllNXxKI1meTgxRFGpm+SdwmM1s8=
X-Gm-Gg: ASbGnct9P81C7xGHcKApuprArHvhzoQAKlS+p0wS5mMHC4oV4pgtmCN66L3fPJAXX+j
	ONTyOewbM+QgV1+6ce73nkkekBybHx8GFKmf9sOGTw8MFI4Y6FgJ+KbNd2fbuXx/Mk4prQ3TXSK
	zBEqTvjXiBVQ8uCfi3hbMPbGI3XlF+2p7Nop09TtD8pgiTprqL0PcObHRbylZQLgIAIfao2LZSh
	cGK0IyS4Yih2I+CH0RUKUJQSWcFH60qHMTKrHm1lSWaJS1Zrz+0gR853hHSRZIlGTRjYhY7O9xU
	nqf/QUUtsML/nlwEGY16BKBZmvBdKRC6nIZc41ILylKKHIiyf4AWoDvT4fipe6xNNXo081cyhKm
	iM2FVj2/NrWf38X2TDCwmPWwYebtoqae+iCBFZgzeiMVUpe/+rH6Z7ItY4vP/5+UdeegofG/vA2
	CMKajVzmHXKqdV8pP75FcE
X-Google-Smtp-Source: AGHT+IGjUyoyzO/jtzz8hqH4iMiJKrG0QJvlJqguCgOC62nY4tjJMHbN2DvHDlUADKcH7/pRsAHM2Q==
X-Received: by 2002:a5d:64e8:0:b0:405:3028:1be2 with SMTP id ffacd0b85a97d-429aef7358dmr3777675f8f.11.1761771938241;
        Wed, 29 Oct 2025 14:05:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de971sm27815109f8f.39.2025.10.29.14.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:05:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
Subject: Re: (subset) [PATCH v5 0/6] Add OnePlus 6T display (Samsung
 S6E3FC2X01 DDIC with AMS641RW panel)
Message-Id: <176177193744.2073083.518976981687833729.b4-ty@linaro.org>
Date: Wed, 29 Oct 2025 22:05:37 +0100
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

On Thu, 23 Oct 2025 22:24:24 +0200, David Heidelberg wrote:
> This patchset enables the display on the OnePlus 6T smartphone.
> 
> Patches 1-2 add the bindings and the panel driver.
> Patches 3-6 document the panel, pinctrls, and GPIOs.
> 
> Since the display node is shared between the OnePlus 6 and 6T,
> the following warning appears:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/6] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/986f28f3a71e44ebd984ee45c4f75c09109ae7ee
[2/6] drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/88148c30ef26593e239ee65284126541b11e0726

-- 
Neil

