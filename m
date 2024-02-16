Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9972258AD7
	for <phone-devel@vger.kernel.org>; Fri, 16 Feb 2024 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708082089; cv=none; b=oKEzleEwGSKhuKVdgP1iZ73h3VVbxqxAftQfXd02DzdZ5GMtLN96knm3/Cjmjjy7rDgrcb6DlG0AfaMd/helZsqyTRxn38nulmQGsgDS/HNEWNJjhUEOrjA8NNIwbTvUBps+LPdX/wh4QJYEIeFybwU9/iZxNKhJpZ/ggvOhDcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708082089; c=relaxed/simple;
	bh=Mb3O0r/ZDgnL5SsOM5Kxo3u/DkpD2rGMsl6RgDvEUvs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WpWo0puoKm7q4j7/VR6wPfFMNmS6SGqhPv9X3reTtq6GWeCk4FfYLZENY5cnvIobWA9bou+19Y7PbPYSFGXbpAIJCDJJCrwYKZVgWNdDY9z4IgKU65oPf4mmKYkuFIBhNXe96Y5CiIWHcgKlFlBja9e+ew7BVbhZrGRvyTrQCJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ny1bGW5B; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ny1bGW5B"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-410e820a4feso16773685e9.1
        for <phone-devel@vger.kernel.org>; Fri, 16 Feb 2024 03:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708082086; x=1708686886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4ZT8wxOTMEaNAlp2WhGQd6HjKItKsveZMf5lqO1FcA=;
        b=ny1bGW5BU6N2a5c+Q+vWBaQsQdxN6KsbAKEHYh2VkcJEDmmeGLy31y2Oc+uGF+sDfa
         7PQLg2OnyGr/BGjlFNgkDMYEMAQqDC+PWd3gpiymaUPI1LmSKZZvfpz7YGz6SgGmwq4z
         R33noZhMton1+2zI9ojT3H3U3GOY0qRjXA564OvNzXb27/zGmxOaPAr6D1rcocnsKAgW
         4P8nhHmFCc3DYTQBCfr3fw6MRhug/j7dF/WH42UQDBWvT1p7gtPYUxi1c3fe8XlRxlyP
         2qBBoa7qiYtm1Uq6hPASxeMdAoehYnv1nO2hXdB6+D+Xn2ldZH+Ob9TugAdIJM5oMVO1
         ABug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708082086; x=1708686886;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4ZT8wxOTMEaNAlp2WhGQd6HjKItKsveZMf5lqO1FcA=;
        b=IlqXhXRPv1MUh7YmzjHPDeKn8G3iNcJt5fGjrnPteDmUSUqXH6toCDck9gaCTjsCza
         eCrsRgObMjwBqXnAsqxZr39oAdXl3fT6zEESfu8jMNjGwBwqEVoUQlMqBIi9Z+4bSQms
         gf7/daW8224Uq0WW3Fl0o0ript19GPafF2nrWre4hiRmWfEtMFWPBphU8waIAXh6Rc78
         0yyKoEWgrk6l9KW/zfgNvAExkWlg4RFEuxdWOnfUL/rKWbKxuoSBG6w6m1GbFSQHNj4j
         ScM/CbnZtRbHf9C/cIjogBYp9zyWHUXqzJjCsM3z7mrQQEzpLGAp1+ZS0bVe+pv8m5qM
         AH2A==
X-Forwarded-Encrypted: i=1; AJvYcCXhtRT7/QPGePc3+3ZWUc5o1RuJfjOquehKTKnpyXs6E74MFuZ+ITz5fgF1OKEujHJKaPr61KgTS8dLzQCKb5zeFMaKMG6WJ3ZfzPA=
X-Gm-Message-State: AOJu0YyHaJaw+KQbtDVxb5WPR1hemyDq/86TzB//wugphVDoIUKDQzg6
	S8DiKUBjRzLECsceJEgM1EImVihTG9t2t5PskGTYGcLpZnzjfvqQ/YcEqFBj8RM=
X-Google-Smtp-Source: AGHT+IHMW9EOiDBogGRBEw6/c9KN9vSHehtmGG0Sqpr8h98BQtKaE9M8TzBhHR4IQo9aOa3UMDmQKA==
X-Received: by 2002:a05:600c:4f8a:b0:412:4731:a5e9 with SMTP id n10-20020a05600c4f8a00b004124731a5e9mr1055108wmq.4.1708082085778;
        Fri, 16 Feb 2024 03:14:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id fc13-20020a05600c524d00b00412157dc70bsm2050270wmb.30.2024.02.16.03.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:14:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
References: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
Subject: Re: (subset) [PATCH v3 0/4] Add display support for Fairphone 4
Message-Id: <170808208477.3157813.2988071781833358555.b4-ty@linaro.org>
Date: Fri, 16 Feb 2024 12:14:44 +0100
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

On Fri, 16 Feb 2024 11:10:47 +0100, Luca Weiss wrote:
> Introduce the bindings and panel driver for the LCD panel with the model
> number 9A-3R063-1102B from DJN which is using the HX83112A driver IC. It
> is used on the Fairphone 4 smartphone.
> 
> Then we can add the panel to the device dts and also enable the GPU.
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Add Himax HX83112A
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3b59787a5170e12beb636cf1a66e481526f293cc
[2/4] drm/panel: Add driver for DJN HX83112A LCD panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=654f26a0f43cfd35a5ebd19e008b6f065f2a1f92

-- 
Neil

