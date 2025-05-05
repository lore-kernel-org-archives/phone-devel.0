Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189631DEFD6
	for <phone-devel@vger.kernel.org>; Mon,  5 May 2025 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431764; cv=none; b=t0VOk5Sj25YkLNH58au8LOFeJ6fPYCGdERqUnNIe0hTPB7OgGlGj3QkgkJbJQglxmGj/NMsuo+lUHK0rZtR/5SDkQolSmAK+TZGT58vrYBCS4yW/rJilwoMZ9iF54aigUSVw3t2q0SHwGvAolghLCHbdLdFWoigig4TTGUVKZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431764; c=relaxed/simple;
	bh=JO/lo6fbhhCQ6ISylS8+UgbNS81maDYSvWyNwtITNcg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HOPbse/4aZm2OGOxLPwYTHNVDv6g7M33eb3u0j3+77VMS4rgqxdeqnlSsUY1VibbiW+1EJVqpi4kqjJ3J/8hq1Q9xnnzaVIXDu8rsbLydHLWCPgzK0fKyP7fEqbE0/+Oj6D3fqWJ5e6+ofmTguVuxBHo4Y3r6woIY77vQyxlxuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UqhIjSt0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UqhIjSt0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3021793f8f.1
        for <phone-devel@vger.kernel.org>; Mon, 05 May 2025 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746431761; x=1747036561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0+U68a2XGi/Gy+rKQXUVaZpntA8Xl9E4Z35KhAv5DU=;
        b=UqhIjSt0irIKqgXU7IgUNAxpwKKGklhz33buqX55yOiB00+N6JMt3AEKxfRRkiu340
         /EKC58VwXlGPadjSJODDaqNffs5iENk3cycUshM8pRESBEH7BSxGr9+TbUxAP4F6Spgh
         4+UexpE9ctiV32Msn3nYQ2qNM3R2FhtPfNCrwTO3kgHb1BSNWuWv1G4TYYHbblr7qppw
         sqsI+KnTmGU0iNjZHGXkpAwE+BioH6AtnG/LF+sIBdaJbR2i+oN76CpU7Ii4lW8RmiVe
         gL7Bc8DxrS0wm6l7tAJJx/+odjNNJ7enL9Mdbli60cGdeh1RkWRTZDxeG3Vg3HFGORyg
         Xxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431761; x=1747036561;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0+U68a2XGi/Gy+rKQXUVaZpntA8Xl9E4Z35KhAv5DU=;
        b=orJG0DxZK3DoowTToSKQgcp3zQaxdeeBsSrZx8guXpCNcsOJC67zBtqNYS4KL31B3w
         6Q3HvBO2GrRbKPDE7OY/Brrf4xwmKK8hRJhN2oSF/W17zy83cy4fufVFKiNXyh9du1DY
         rivCkr58PpCiSvGrdecpMgsNuPRI7zyGspJMeC0V1yI+U5wZIDP+3hModvMB7RVRd/b5
         GD7oAI4gbM4T6IRPNRtQtGMxDycNVyG3JrQMrylxr7r6w5z+O839sZnBFD37d3OywZ+p
         5xDbhiHbRCkMW1PNj2RhsE1HOFJhZXSewxLP3HvputghAVS3aSEpr2c3P9ON16MItr1W
         bj1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2MPGwRq9vlWsbcmmOevu4IT6sGjcuByI0V/opOVjrnS/lTdO/Z4GYMBC7OWc33icJFpzroEvX0RFwAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK20n4RcUXwbYbv+sEqjtnMZRbMgWI0DzbBsU1+P0edMSNHI8H
	irBnvV8HJ56nYPJiruOJvJ1RYEPjKZ6Ny2H+EfDKTFw0bdQw5find8ng2Drsdjo=
X-Gm-Gg: ASbGncuzOEarHrvWB8hclt9uf2p0UJJv8GsqQe26FhfElxb8FJZti4YoyK3c90x2tXy
	dFEBUAos0dZJ08Jz2O71xwdcf1C9Z9PxVnQd4QRZNCgdM+wV8FoJXZEkGpbk63kZRDnSLJ05ETG
	rvs4+tD/gGnFf+vpCDD6QipozSftAtoTkm+fUGVw5OMLno+jfj9hX7axM9ASdWaCOocnWpgH7e3
	DNDB/cRtKf9y2oiHNz7dfev5zRWzSqBUgVelhK/E1bXgT8wagzMhKi0qBIv2kx0yTHajzLPwXrl
	IQ8gVybK9zx8hfZwy8eLdkUlhBVZGYFCi+s4Y/X1is9QmHL6CFqfT3naA1fM8A==
X-Google-Smtp-Source: AGHT+IE1zsUZXtFLT8WhSEKKdrwAh5iufLxarm4El3WD5TPCKfmzBJVqSJnVfCgpEFuzgdcvwuvCGQ==
X-Received: by 2002:a5d:5f4f:0:b0:3a0:3d18:285 with SMTP id ffacd0b85a97d-3a09405d3efmr11171834f8f.25.1746431761360;
        Mon, 05 May 2025 00:56:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc480sm127209395e9.2.2025.05.05.00.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:56:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250430-lavender-panel-v3-0-7625e62d62b2@mainlining.org>
References: <20250430-lavender-panel-v3-0-7625e62d62b2@mainlining.org>
Subject: Re: [PATCH v3 0/2] BOE TD4320 panel
Message-Id: <174643176006.170941.1513188445177832800.b4-ty@linaro.org>
Date: Mon, 05 May 2025 09:56:00 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 30 Apr 2025 21:42:11 +0200, Barnabás Czémán wrote:
> Add driver for BOE TD4320 DSI panel, used in Xiaomi Redmi Note 7
> smartphones.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add BOE TD4320
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/af28dfc32bb4bffd9666ac20891db9d3bce8a742
[2/2] drivers: gpu: drm: panel: Add BOE TD4320
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7220a310b9fbe431951e31487f7ae92498420e52

-- 
Neil

